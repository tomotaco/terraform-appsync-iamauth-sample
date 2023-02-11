# Sample terraform configuration for AWS Appsync with IAM Authentication

This project is a modified version of [tsubasaogawa/terraform-appsync-graphql-test](https://github.com/tsubasaogawa/terraform-appsync-graphql-test).
This creates AWS Appsync to create/update/delete/get/list records and subscriptions to all mutations, with IAM authentication.
It also creates IAM policy to permit GraphQL action to that.

## Usage

- Modify the following variables in `config.tf` to satisfy your aws configuration.

```
bucket = "your-aws-s3-bucket-name"
region = "your-aws-region"
profile = "your-aws-profile-name"
```

- Execute terraform.

```
> terraform init
> terraform plan
> terraform apply
       :
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

appsync_api_policy_name = "appsync-iamauth-test-policy"
appsync_api_uris = tomap({
  "GRAPHQL" = "[your-appsync-domain].appsync-api.[your-aws-region].amazonaws.com"
  "REALTIME" = "wss://[your-appsync-domain].appsync-realtime-api.[your-aws-region].amazonaws.com/graphql"
})
```

- Create IAM user on AWS Management Console with the generated policy `appsync-iamauth-test-policy` attached.
- Now you can send any request:

```
> curl -s "https://[your-appsync-domain].appsync-api.[your-aws-region].amazonaws.com/graphql" -H "Content-Type: application/graphql" --aws-sigv4 "aws:amz:ap-northeast-1:appsync" --user "[YourIAMUserAccessKey]:[YourIAMUserSecretKey]" -d ' {"query": "query MyQuery{listText{items{id text}}}", "variables": "{}"}'
{"data":{"listText":{"items":[]}}}
```

## Schema

```
schema {
  query: Query
  mutation: Mutation
  subscription: Subscription
}

type Query {
  text(id: ID!): Text
  listText(nextToken: String): TextConnection
}

type Mutation {
  createText(text: String!): Text
  updateText(id: ID!, text: String): Text
  deleteText(id: ID!): Text
}

type Subscription {
  onCreateText: Text @aws_subscribe(mutations: ["createText"])
  onUpdateText(id: ID): Text @aws_subscribe(mutations: ["updateText"])
  onDeleteText(id: ID): Text @aws_subscribe(mutations: ["deleteText"])
}

type TextConnection {
  items: [Text]
  nextToken: String
}

type Text {
  id: ID!
  text: String!
}
```
