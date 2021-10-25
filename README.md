#WELCOME#:
=======

This is an API template based on mule-4 tset to provide uniform structure across the organization and enforce some of the best practices. 
It provides the necessary structure to extend or customize as per project requirement in a standard way. Here is the overview of what was created.

#PROJECT STRUCTURE#:
==================

By default project name is mentioned as "api-project-template". Rename the project name as per your need by maintaining the same naming convention, for eg. s-primavera-assettypes-api.
a. Create separate xml file for implementation. For eg. s-primavera-assettypes-api_assettypes-get-1.00.00.xml. Note to use a version number for an implementation file. We can use this as a feature toggle mechanism.
b. global-config.xml: All resource configuration or setting should be placed in the global-config.xml file
c. global-error-handler.xml: Generic global-error-handler is created by default. You can add or remove any error type to meet the project requirement.
d. Remove/customize default created api-template.xml file.
e. Make sure [JSON-logger](https://blogs.mulesoft.com/dev/anypoint-platform-dev/json-logging-mule-4/) is published in Anypoint platform Org/Business Group
e. Keep your project modular.

#POM XML#:
========

A maven project descriptor that describes how to build this project. This is based on the parent-child pom model where child pom inherits the parent POM configuration.
By default following plugins are added:
a. maven-release-plugin : This plugin is used to perform maven release feature.
b. mule-maven-plugin : This plugin is used to perform mule goals like deployment, un-deployment.
c. munit-maven-plugin : This plugin is used to run munit test cases and generate coverage report.

scm connection: scm connection detail is used during the maven release. Please change it if repository url get changed.

dependency: following dependencies are inherited from the parent POM .
d. munit-runner
e. munit-tools

IMPORTANT!: Make sure parent POM is installed(mvn clean install) in your local .m2 repository or your setting.xml should contains the external remote repository where parent POM is available.

#CONFIG FOLDER#:
=============

The config folder contains the 4 environment related yaml files and a common configuration file. All configurable information should be present in the yaml file.
Sensitive information should be encrypted by strong master key and key should *not* be hardcoded in the project. Provide key in the studio argument section while running your project.
Add sensitive property into the mule-artifact.json (secure::...) so that property value can be updated directly in cloudhub platform.

#CERTIFICATES FOLDER#:
===================

certificates folder is created which contains by default local certificates. Keep any other certificates in the same folder.
If your project doesn't need certificate or not require the https listner then certificate folder can be removed.