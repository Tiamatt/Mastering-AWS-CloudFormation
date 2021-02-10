# Deny resource updation
File: 1-deny-resource-update.json
Description: Deny stack update if MySecurityGroup resource should be updated. In other words, if ACTION in CloudFormation 'Change set preview' for MySecurityGroup resource is MODIFY, then deny stack updation.

# Deny resource type updation
File: 1-deny-resource-update.json
Description: Deny stack update if at least one 'SecurityGroup' resource type should be updated. In other words, if ACTION in CloudFormation 'Change set preview' for at least one 'SecurityGroup' resource type is MODIFY, then deny stack updation.

# Deny updation if resource should be replaced
File: 3-deny-replacement-updates.json
Description: Deny stack update if MyEc2Instance resource should be replaced by CloudFormation (e.g. when you add a new SecurityGroup to an existing EC2 instance, CloudFormation terminated this instance and create a new one). In other words, if REPLACEMENT in CloudFormation 'Change set preview' for MyEc2Instance resource is TRUE, then deny stack updation.

# Deny updation if resource should be removed
File: 4-not-action.json
Description: Allow modify and replace but don't allow to delete resource. In other words, if ACTION in CloudFormation 'Change set preview' for any resource is REMOVE, then deny stack updation.