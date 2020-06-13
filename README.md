<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
# DeepBrainz Assistant for COVID-19 (Powered by Verily & Google Cloud)
Verily, in partnership with Google Cloud, has launched a curated Dialogflow 
template for health systems and hospitals, enabling chat or voice bots to 
answer questions about COVID-19 symptoms and provide the latest guidance from 
public health authorities like the Centers for Disease Control and Prevention 
and World Health Organization (WHO). 

It can:
* Automatically answer frequently asked questions about COVID-19 
* Help users understand possible symptoms and severity
* Guide users to relevant information from public health authorities

You can:
* Launch your bot faster with curated content
* Customize to match your website and add content to address your organization 
and community needs  
* Provide up-to-date information about COVID-19 to your community, which is 
updated regularly by Verily 

Information on COVID-19 changes frequently. Check release dates and review 
content before launching your bot.

#### Requirements
* A GCP Project with existing Dialogflow Agent setup in a project we'll refer 
to as `PROJECTDIALOGFLOW`
* A second GCP project that will host this application using AppEngine we'll 
refer to as `PROJECTAPPENGINE`
* You must login to gcloud as a user that has access to both projects.
* Install gcloud SDK
* Install node.js
* Install make

##### Requirements for development
* run `npm install -g @angular/cli`

### Interaction with Dialogflow API
You can follow this [quick start](https://cloud.google.com/dialogflow/docs/quick/api) to interact with your agent using Dialogflow API.
 
### Integrate Your Agent with Text-based Third-Party Conversation Platform
Dialogflow has integrated with various text-based conversation platforms such 
as Facebook, Telegram, Line, Slack, etc. You can follow instructions at 
[Integration Page](https://cloud.google.com/dialogflow/docs/integrations) to 
set up an integration for each platform.

### Integrate with Dialogflow phone Gateway
Dialogflow provides a one-click integration for a telephone interface to your 
agent by selecting a phone number hosted by Google. See our 
[documentation](https://cloud.google.com/dialogflow/docs/integrations/phone-gateway) 
for detailed instructions. Please note that if you expect your virtual agent to 
have a high call volume, request a toll-free phone number during the set up.


## Verily COVID-19 Pathfinder virtual agent template
### Terms of Use 
The Verily COVID-19 Pathfinder virtual agent template (this "Template") and 
accompanying integration guide is provided by Verily Life Sciences LLC 
(in "/agent-template/" of this repository). By downloading, accessing or using 
the Verily COVID-19 Pathfinder virtual agent template you acknowledge and agree 
that you are authorized to accept these terms and conditions applicable to the 
Template on behalf of the individual or entity that will be using this Template 
and will communicate these terms and conditions to all users of the Template for 
compliance. You acknowledge and agree that the information in the Template does 
not contain or constitute medical advice and only contains guidance from 
publicly accepted, publicly available sources, such as the Centers for Disease 
Control and Prevention, the World Health Organization, Johns Hopkins, the 
American Heart Association, the American Diabetes Association, and the American 
Lung Association.  The Template was designed for U.S. audiences. Prior to using 
the content of the Template, you are responsible for reviewing and approving 
each of the responses within the Template and will only provide the content to 
your web service users if you approve of the content. The Template by Verily 
Life Sciences LLC is subject to copyright and licensed to you under the [CC-BY 
4.0 License](/agent-template/LICENSE) (a.k.a., the "Creative Commons Attribution 
4.0 International Public License") including the disclaimer of warranties 
therein. Your use of this Template indicates your acceptance of all of the above 
stated and referenced terms and conditions. If you have a concern related to the 
content of the Template you can contact the Verily Life Sciences LLC support 
team via the following email address: 
[covid19pathfinder@verily.com](mailto:covid19pathfinder@verily.com)

Verily COVID-19 Pathfinder virtual agent template ("Template") versions:
* Version 2.0.0 is available at commit 1d61e4672fa24eb2cec1083c69b00fba255dd6f9, 
released on April 7, 2020 based on information locked on April 4, 2020. 
* Version 3.0.0 is available at commit a9019b290c9d5f9cb006d3422f87a8dfdf4dfb10, 
released on April 10, 2020 based on information locked on April 4, 2020. 
* Version 3.1.0 is available at commit cd4738b899644ee4643a67c07dcd461d308a4ed1,
released on April 11, 2020 based on information locked on April 7, 2020.
* Version 3.2.0 is available at commit 1713158df677c34cb5adc200cc1bc9aa9cdf23af,
released on April 17, 2020 based on information locked on April 14, 2020.
* Version 4.0.0 is available at commit d99e6e28e543dd557846dd89a40b5893a6102523,
released on April 28, 2020 based on information locked on April 20, 2020.
* Version 4.1.0 is available at commit da7989b37bd38703248f2dd6f815402805d8201b,
released on May 7, 2020 based on information locked on April 27, 2020.
* Version 4.2.0 is available at commit ee049824a12ed9f1bca1b1008bc3b31c5b8ee9ef
released on May 13, 2020 based on information locked on May 8, 2020.
* Version 4.3.0 is available at commit 7ea18963a54271e697b4c484bb3bfacb332219b2
released on Jun 5, 2020 based on information locked on May 26, 2020.



### User Guide
[USER_GUIDE.pdf](/agent-template/USER_GUIDE.pdf)

### Release Notes
[RELEASE_NOTES.pdf](/agent-template/RELEASE_NOTES.pdf)

## Google Cloud Disclaimer: 
The contents of this GitHub directory (except for Verily's directory 
/agent-template/ as referenced above) are provided under the Apache 2.0 license. 
The information in these files is for information use only and does not contain 
or constitute medical advice; it contains references to and integration guidance 
for the Verily COVID-19 Pathfinder virtual agent template.  Any implementation 
of Verily COVID-19 Pathfinder virtual agent template and the information 
contained therein may not be accurate, consistent and/or up-to-date. 
