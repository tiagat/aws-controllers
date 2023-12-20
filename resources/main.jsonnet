local application = "poc-ack";
local environment = "test";

[
    {
        apiVersion: "sns.services.k8s.aws/v1alpha1",
        kind: "Topic",
        metadata: {
            name: "poc-ack-test"
        },
        spec: {
            name: "poc-ack-test",
            displayName: "poc-ack-test"
        }

    }
]
