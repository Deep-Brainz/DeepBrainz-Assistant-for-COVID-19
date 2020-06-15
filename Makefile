BASEDIR = $(shell pwd)
PROJECTAPPENGINE=[project name that has public App Engine App in it]
PROJECTDIALOGFLOW=[project name that has dialogflow agent in it]


PROJECTNUMBER=$(shell gcloud projects list --filter="$(PROJECTAPPENGINE)" --format="value(PROJECT_NUMBER)")


env:
	gcloud config set project $(PROJECTAPPENGINE)

clean:
	-rm -rf server/dist		

frontend: clean
	cd chat-interface && ng build --prod


deploy: env clean frontend
	cd server && gcloud app deploy -q

deploy-stage: env clean
	cd chat-interface && ng build --configuration stage
	cd server && gcloud app deploy -q --version stage --no-promote	

build: env clean 
	gcloud builds submit --config cloudbuild.yaml .	

init: env
	@echo ~~~~~~~~~~~~~ Enable API access on $(PROJECTAPPENGINE)
	-gcloud services enable cloudbuild.googleapis.com
	-gcloud services enable appengine.googleapis.com 
	-gcloud services enable dialogflow.googleapis.com
	@echo ~~~~~~~~~~~~~ Intialize AppEngine on $(PROJECTAPPENGINE)
	-gcloud app create --region us-central
	@echo ~~~~~~~~~~~~~ Enable Cloud Run service account to deploy to AppEngine on $(PROJECTAPPENGINE)
	-gcloud projects add-iam-policy-binding $(PROJECTAPPENGINE) \
  	--member serviceAccount:$(PROJECTNUMBER)@cloudbuild.gserviceaccount.com \
  	--role roles/appengine.appAdmin
	@echo ~~~~~~~~~~~~~ Enable AppEngine on $(PROJECTAPPENGINE) service account to call Dialogflow on $(PROJECTDIALOGFLOW)	  
	-gcloud projects add-iam-policy-binding $(PROJECTDIALOGFLOW) \
  	--member serviceAccount:$(PROJECTAPPENGINE)@appspot.gserviceaccount.com \
  	--role roles/dialogflow.client 
	@echo ~~~~~~~~~~~~~ Create service account for Dialogflow   
	-gcloud iam service-accounts create dialogflow-chat-interface \
    --description "A service account for development of frontend of a Dialogflow agent" \
    --display-name "Dialogflow Chat Bot" --project $(PROJECTDIALOGFLOW)
	@echo ~~~~~~~~~~~~~ Grant service account access to $(PROJECTDIALOGFLOW)
	-gcloud projects add-iam-policy-binding $(PROJECTDIALOGFLOW) \
  	--member serviceAccount:dialogflow-chat-interface@$(PROJECTDIALOGFLOW).iam.gserviceaccount.com \
  	--role roles/dialogflow.client
	@echo ~~~~~~~~~~~~~ Download key for service account. 
	-gcloud iam service-accounts keys create creds/creds.json \
  	--iam-account dialogflow-chat-interface@$(PROJECTDIALOGFLOW).iam.gserviceaccount.com   
	@echo ~~~~~~~~~~~~~ Install node_modules. 
	-cd chat-interface && npm install
	@echo ~~~~~~~~~~~~~Install Go vendor dependencies
	-cd server && go mod vendor
	@echo ~~~~~~~~~~~~~ Create Angular builder for Cloud Build 
	-cd builder && make build
	

dev:
	(trap 'kill 0' SIGINT; \
	cd server && \
	export PROJECTDIALOGFLOW=$(PROJECTDIALOGFLOW) && \
	export GOOGLE_APPLICATION_CREDENTIALS=$(BASEDIR)/creds/creds.json && \
	go run main.go & \
	cd $(BASEDIR)/chat-interface && ng serve --open )

	
