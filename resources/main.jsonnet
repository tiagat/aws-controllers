local application = 'poc-ack';

local environment = std.extVar('environment');
local awsAccountId = std.extVar('awsAccountId');
local awsRegion = std.extVar('awsRegion');


local iamRoleName = application + '-' + environment + '-role';

local iamPolicy = import 'templates/iam-policy.libsonnet';
local snsTopic = import 'templates/sns-topic.libsonnet';

local iamPolicyJson = std.toString({
  Version: '2012-10-17',
  Statement: [
    {
      Effect: 'Allow',
      Action: [
        'sns:Publish',
        'sns:Subscribe',
      ],
      Resource: 'arn:aws:sns:' + awsRegion + ':' + awsAccountId + ':*',
    },
    {
      Effect: 'Allow',
      Action: [
        'sns:ListTopics',
        'sns:Unsubscribe',
        'sns:ListSubscriptions',
      ],
      Resource: '*',
    },
  ],
});

[
  iamPolicy,
  snsTopic
]
