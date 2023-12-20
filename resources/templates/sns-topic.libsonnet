local environment = std.extVar('environment');
local snsTopicName = 'poc-ack-' + environment + "-topic";

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
