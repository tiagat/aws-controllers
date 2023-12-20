local application = 'poc-ack';

local environment = std.extVar('environment');
local accountId = std.extVar('accountId');

local snsTopicName = 'topic-' + application + '-' + environment;

[
  {
    apiVersion: 'iam.services.k8s.aws/v1alpha1',
    kind: 'Policy',
    metadata: {
      name: 'poc-ack-policy',
    },
    spec: {
      name: 'poc-ack-policy',
      policyDocument: {
        Version: '2012-10-17',
        Statement: [
          {
            Effect: 'Allow',
            Action: [
              'sns:Publish',
              'sns:Subscribe',
            ],
            Resource: 'arn:aws:sns:us-east-1:343315438995:*',
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
      },
    },
  },

  {
    apiVersion: 'sns.services.k8s.aws/v1alpha1',
    kind: 'Topic',
    metadata: {
      name: snsTopicName,
    },
    spec: {
      name: snsTopicName,
      displayName: snsTopicName,
      tags: [
        {
          key: 'environment',
          value: environment,
        },
      ],
    },

  },
]
