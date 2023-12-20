local application = 'poc-ack';

local environment = std.extVar('environment');
local awsAccountId = std.extVar('awsAccountId');
local awsRegion =  std.extVar('awsRegion');

local iamPolicyName = application + '-' + environment + "-policy";
local iamRoleName = application + '-' + environment + "-role";
local snsTopicName = 'topic-' + application + '-' + environment;

[
//   {

//     apiVersion: 'iam.services.k8s.aws/v1alpha1',
//     kind: 'Policy',
//     metadata: {
//       name: iamPolicyName,
//     },
//     spec: {
//       name: iamPolicyName,
//       policyDocument: {
//         Version: '2012-10-17',
//         Statement: [
//           {
//             Effect: 'Allow',
//             Action: [
//               'sns:Publish',
//               'sns:Subscribe',
//             ],
//             Resource: "arn:aws:sns:" + awsRegion + ":" + awsAccountId + ":*",
//           },
//           {
//             Effect: 'Allow',
//             Action: [
//               'sns:ListTopics',
//               'sns:Unsubscribe',
//               'sns:ListSubscriptions',
//             ],
//             Resource: '*',
//           },
//         ],
//       },
//     },
//   },

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
