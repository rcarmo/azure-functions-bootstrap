export SOLUTION_NAME?=faas-template
export RESOURCE_GROUP?=faas-template
# Keep in mind that App Insights is only available in a few locations
export LOCATION?=westeurope
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

# Destroy solution
destroy:
	az group delete --name $(RESOURCE_GROUP) --no-wait

# WIP: handle local Git setup (already covered in ARM template)
scm:
	az appservice web deployment list-site-credentials --query scmUri -otsv -n $(SOLUTION_NAME) -g $(RESOURCE_GROUP)
	#az appservice web deployment user set
	#az appservice web source-control config-local-git

