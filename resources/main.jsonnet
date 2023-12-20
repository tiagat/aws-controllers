local environment = std.extVar('environment');
local awsAccountId = std.extVar('awsAccountId');
local awsRegion = std.extVar('awsRegion');

local iamPolicy = import 'templates/iam-policy.libsonnet';
local iamRole = import 'templates/iam-role.libsonnet';
local snsTopic = import 'templates/sns-topic.libsonnet';

[
  iamPolicy,
  iamRole,
  snsTopic
]
