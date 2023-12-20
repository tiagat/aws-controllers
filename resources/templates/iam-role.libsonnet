local environment = std.extVar('environment');
local awsAccountId = std.extVar('awsAccountId');

local iamPolicy = import 'templates/iam-policy.libsonnet';

local iamRoleName = 'poc-ack-' + environment + '-role';

local iamPolicyJson = std.toString({
  Version: '2012-10-17',
  Statement: [
    {
      Effect: 'Allow',
      Principal: {
        Service: 'sns.amazonaws.com',
      },
      Action: 'sts:AssumeRole',
    },
  ],
});

{
  apiVersion: 'iam.services.k8s.aws/v1alpha1',
  kind: 'Role',
  metadata: {
    name: iamRoleName,
  },
  spec: {
    name: iamRoleName,
    assumeRolePolicyDocument: iamPolicyJson,
    policies: [
      'arn:aws:iam::aws:policy/service-role/AmazonSNSRole',
      'arn:aws:iam::' + awsAccountId + ':policy/' + iamPolicy.metadata.name,
    ]
  },
}
