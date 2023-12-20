local environment = std.extVar('environment');
local awsAccountId = std.extVar('awsAccountId');

local iamRoleName = 'poc-ack-' + environment + '-role';

{
  apiVersion: 'iam.services.k8s.aws/v1alpha1',
  kind: 'Role',
  metadata: {
    name: 'poc-ack-role',
  },
  spec: {
    name: 'poc-ack-role',
  },
  tags: [
    {
      key: 'environment',
      value: environment,
    },
  ],
  assumeRolePolicyDocument: std.toString({
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
  }),
  policies: [
    'arn:aws:iam::aws:policy/service-role/AmazonSNSRole',
    'arn:aws:iam::343315438995:policy/poc-ack-policy',
  ],
  policyRefs: null,
}
