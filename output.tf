#output "appsync_api_key" {
#    value = nonsensitive(module.appsync.api_key)
#}

output "appsync_api_uris" {
    value = module.appsync.api_uris
}

output "appsync_api_policy_name" {
    value = aws_iam_policy.this.name
}