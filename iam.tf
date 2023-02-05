data "aws_iam_policy_document" "policy" {
    statement {
        actions = [
            "appsync:GraphQL",
        ]
        resources = [
            "${module.appsync.api_arn}/*",
        ]
    }
}

resource "aws_iam_policy" "this" {
    name = "${local.project_name}-policy"
    policy = data.aws_iam_policy_document.policy.json
}