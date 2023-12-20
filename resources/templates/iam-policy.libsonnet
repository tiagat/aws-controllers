local environment = std.extVar('environment');
local awsAccountId = std.extVar('awsAccountId');
local awsRegion = std.extVar('awsRegion');

local iamPolicyName = 'poc-ack-' + environment + '-policy';

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

{
  apiVersion: 'iam.services.k8s.aws/v1alpha1',
  kind: 'Policy',
  metadata: {
    name: iamPolicyName,
  },
  spec: {
    name: iamPolicyName,
    policyDocument: iamPolicyJson,
  },
}
