
This template deploys:

* An Azure Functions App (Consuption/on-demand plan) with:
  * A supporting storage account (for WebJob storage and your own queues)
  * An Application Insights account

## Post-Deployment Checklist:

* Activate Application Insights

## Requirements

* [Azure CLI 2.0][az]
* [NodeJS][n] for generating the parameters file (my utmost apologies)

## To Do:

* [x] Deploy Redis
* [x] Deploy Azure Function environment
* [x] Deploy Storage Account for queues (already part of webjob requirements)
* [x] Configure Azure Function deployment settings
* [ ] Deploy Cognitive Services Account

## References:

* https://github.com/Azure-Samples/Cognitive-Speech-STT-JavaScript


[az]:
[n]: 