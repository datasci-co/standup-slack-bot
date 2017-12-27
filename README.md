# Slackup standup-bot

A Slack bot to streamline team standup without disturbing the overall flow of conversation.

# Deployment steps

1. Download [ecs-cli](https://github.com/aws/amazon-ecs-cli)
2. Configure your shell for prod vault access
  ```shell 
  export VAULT_ADDR=https://consul.prd.int.dynoquant.com:8200
  export VAULT_AUTH_GITHUB_TOKEN=$github_api_token
  vault auth -method github
  ```
3. `consul-template -once -template=.env.ctmpl:.env`
4. `ecs-cli compose up --launch-type FARGATE --cluster ECS-Production`

## Documentation links:

- [Installation](app/documentation/installation.md)
- [Admin](app/documentation/admin.md)
- [Usage](app/documentation/interaction.md)
- [Reports](app/documentation/reports.md)
