local environment = std.extVar('environment');
local snsTopicName = 'topic-poc-ack-' + environment;

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

  }
