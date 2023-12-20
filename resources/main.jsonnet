local application = "poc-ack";
local environment = "test";

{
    'sns-topic.yaml': std.manifestYamlDoc({
        apiVersion: "sns.services.k8s.aws/v1alpha1",
        kind: "Topic",
        metadata: {
            name: application + "-" + environment
        },
        spec: {
            name: application + "-" + environment,
            displayName: application + "-" + environment,
            tags: [
                { 
                    key: "environment", 
                    value: "development"
                }
            ]
        }
    }),
}
