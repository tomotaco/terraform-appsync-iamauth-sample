variable name {
    description = "API name"
    default = "appsync-iamauth-test"
}

variable datasource_name {
    description = "Datasource name"
    default = "appsync-iamauth-test"
}

variable dynamo_table_arn {
    description = "DynamoDB table arn"
}

variable dynamo_table_name {
    description = "DynamoDB table name"
    default = "appsync-iamauth-test"
}

variable resolvers {
    description = "Object for resolvers"
    default = {
        # resolver name = { field = "...", type = "...", data_source = "..." }
        # resourver name = { ... }
    }
}
