local environment = std.extVar('environment');
local awsFirehoseArn = std.extVar('awsFirehoseArn');
local awsAccountId = std.extVar('awsAccountId');

local iamRole = import 'templates/iam-role.libsonnet';
local snsTopic = import 'templates/sns-topic.libsonnet';

{
    apiVersion: "sns.services.k8s.aws/v1alpha1",
    kind: "Subscription",
    metadata: {
        name: "poc-ack-" + environment + "-subscription"
    },
    spec: {
        protocol: "firehose",
        endpoint: awsFirehoseArn,
        topicARN: "arn:aws:sns:us-east-1:" + awsAccountId + ":" + snsTopic.metadata.name,
        subscriptionRoleARN: "arn:aws:iam::" + awsAccountId + ":role/" + iamRole.metadata.name,
    }
}
