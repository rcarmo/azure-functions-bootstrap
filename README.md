# azure-functions-bootstrap

This template deploys:

* An Azure Functions App (Consumption/on-demand plan) with:
  * A supporting storage account (for WebJob storage and your own queues)
  * An Application Insights account
* A Redis instance (C0) for managing live function state

## Usage

Unlike typical Azure templates, this one's completely CLI centric, so there are no "click to deploy" links (sorry Windows folk!)

Grab `bash`, check out the `Makefile` and you'll be all set

## Post-Deployment Checklist:

* Check Application Insights activation
* Get Git credentials from app

## Requirements

* [Azure CLI 2.0][az]
* [NodeJS][n] for generating the parameters file (my utmost apologies)

## To Do:

* [x] Deploy Azure Function environment
* [x] Deploy Storage Account for queues (already part of webjob requirements)
* [x] Configure Azure Function deployment settings
* [x] Deploy Redis
* [ ] Retrieve/Set AppService local Git credentials programmatically
* [ ] Provision default queues for my apps
* [ ] Deploy Cognitive Services Account

[az]: https://github.com/Azure/azure-cli
[n]: https://nodejs.org
