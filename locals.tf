locals {
    project_name = "appsync-iamauth-test"
     project_name_for_uri = replace(local.project_name, "-", "_")
    datasource_name = "datasource_${local.project_name_for_uri}"

    dynamodb = {
        table_name = local.project_name
    }

    appsync = {
        name = "appsync-${local.project_name}"
        datasource_name = local.datasource_name
        resolvers = {
            text = {
                field = "text"
                type = "Query"
                data_source = local.datasource_name
            }
            list_text = {
                field = "listText"
                type = "Query"
                data_source = local.datasource_name
            }
            create_text = {
                field = "createText"
                type = "Mutation"
                data_source = local.datasource_name
            }
            update_text = {
                field = "updateText"
                type = "Mutation"
                data_source = local.datasource_name
            }
            delete_text = {
                field = "deleteText"
                type = "Mutation"
                data_source = local.datasource_name
            }
        }
    }
}