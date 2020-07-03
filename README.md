# Deploy Redash on Render

This repo can be used to deploy [Redash] on Render.

- It uses the [official Redash Docker image](https://hub.docker.com/r/redash/redash) with an entrypoint script that customizes Redash for Render.
- It creates a Web Service on **Standard** plan for Redash and two [Background Workers](https://render.com/docs/background-workers) for job processing.
- [Render Databases](https://render.com/docs/databases) are used to spin up a fully managed PostgreSQL instance.
- It uses [Redis](https://render.com/docs/deploy-redis) for asynchronous jobs.
- It provides a template [environment group](https://render.com/docs/yaml-spec#environment-groups) for optionally setting up mailing in Redash.

## Deployment

### One Click

Use the button below to deploy Redash on Render.

[![Deploy to Render](http://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

Then, in Render Shell of the `redash` web service execute following statement:

```shell
$ render-redash create_db
```

### Manual

See the guide at https://render.com/docs/deploy-redash.

If you need help, chat with us at https://render.com/chat.

[Redash]: https://redash.io
