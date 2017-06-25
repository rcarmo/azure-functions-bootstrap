export SOLUTION_NAME?=hal-faas
export RESOURCE_GROUP?=faas-template
export LOCATION?=westeurope
export REDIS_DNS?=$(SOLUTION_NAME)
TEMPLATE_FILE:=template.json
PARAMETERS_FILE:=parameters.json

# Generate template parameters
params:
	node genparams.js

# Perform template deployment
deploy:
	-az group create --name $(RESOURCE_GROUP) --location $(LOCATION) --output table 
	az group deployment create --template-file $(TEMPLATE_FILE) --parameters @$(PARAMETERS_FILE) --resource-group $(RESOURCE_GROUP) --name cli-deployment-$(LOCATION) --output table --no-wait

# View deployment details
view-deployment:
	az group deployment operation list --resource-group $(RESOURCE_GROUP) --name cli-deployment-$(LOCATION) \
	--query "[].{OperationID:operationId,Name:properties.targetResource.resourceName,Type:properties.targetResource.resourceType,State:properties.provisioningState,Status:properties.statusCode}" --output table

