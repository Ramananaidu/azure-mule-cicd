# Overview of Azure pipeline yaml file 
This yaml file will be embedded in the mule project template so that each project will have automatically azure pipeline yaml file available and hence developer doesn't need to configure the pipeline setting or create pipeline yaml file.

## Build and Deploy to DEV environment : 
- Trigger Point : When pull request is approved to merge to develop branch then it trigger the azure pipeline and perform following tasks:
- Get the source code and run munit test cases
- On successful passing of test cases , build the package and deploy to the development environment of cloudhub using a connected app.
- Using connected app clientId and secret , get the token and use it to deploy to the cloudhub environment.
Optionally additional steps can be added to send an email on failure to the developer.

## Create Release artifact and upload to the Azure artifact feed using Maven Release: 
- Trigger Point : When the develop branch is merged to the main/master branch once pull request is approved , then perform the following tasks:
- Release Clean: Remove any existing artifacts used in previous releases (e.g. old release.properties
- Release Prepare: Performs the following functions:
Checks that no dependencies are using SNAPSHOT versions
Updates the application version to a release version (drops the -SNAPSHOT suffix)
Tags the repository with a new Release Candidate tag (e.g. rc1.0.0)
Updates the application version to the next development version – e.g. 1.0.1-SNAPSHOT
- Release Perform:
Deploys the release code (based on the tag created in release:prepare) to Azure Artifacts. This release artifact from feed will be used by the release pipelines to deploy to the higher environments(Eg. ACC ,PROD). 

## Release Pipeline
For each project a separate release pipeline will be cloned from the Release pipeline template in the Azure devops.
Deployment of artifact to the ACC environment from azure artifact feed is currently designed to be manual but can be configured to automatically(If Needed) deploy to ACC once release artifact is created using Maven release plugin.
Promotion to the production environment(PROD) is designed to to be manual approval , meaning manual trigger of release pipeline.

### Release Pipeline Variable
It is used to set variable at stage or release level in the release pipeline

Following tasks are performed by Release Pipeline
- Download maven settings.xml file  – Download the secure settings.xml file which is used to store credential and other maven related information.
- Get Artifact and the pom xml file – Get the latest version of artifact(default get the latest one)  and corresponding pom xml file from azure feed .
- Get the access token for connected app(ACC/PRD)
- Deploy to Cloudhub – Deploys the artifact to CloudHub using the Mule Maven plugin command. These artifacts use a combination of pipeline variables, and variable groups to derive the required values needed to deploy artifacts to Cloudhub.
