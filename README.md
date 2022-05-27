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

## Upgrade

### From v8 to v10

*Note that Redash v10 requires more resources:*

- The Web Service now uses the **Standard Plus** plan instead of the **Standard** plan because it needs more RAM.
- An additional **Background Worker** service, `redash-default-worker`, is deployed bringing the total Background Worker count up to three.

Please see https://render.com/pricing to determine how these changes will affect your Render charges.

**Steps to upgrade:**

1. Make sure you have performed a backup of your existing Redash database. You can [manually trigger a database backup](https://render.com/docs/databases#backups) from the Render Dashboard.
2. Review the **Redash Dashboard URL Changes** section in the [v10.0.0 release notes](https://github.com/getredash/redash/releases/tag/v10.0.0). Note that you do *not* need to follow the **How to Upgrade** steps. Those are specific to deploying Redash with Docker Compose. The updates we've made to this repository have taken care of those steps for you.
3. Review the **Impact** section at [this link](https://github.com/getredash/redash/security/advisories/GHSA-g8xr-f424-h2rv) discussing the security vulnerabilities fixed in v10.1.0 to understand if they affect your previous deploy.
4. Go to **Render Dashboard** --> **Blueprints** --> your existing Redash Blueprint, and then click **Manual Sync**. This will deploy a v10 version of Redash for the Web Service and your Background Workers.
5. Run database migrations required for v10 from the **Shell** of your Web Service: `render-redash manage db upgrade`.
6. Clean-up resources that are no longer needed:
   1. Delete the `QUEUES`, `WORKERS_COUNT`, and `REDIS_HOSTPORT` environment variables in the `redash-scheduler` service.
   2. Delete the `REDIS_HOSTPORT` environment variable in the `redash-worker` service.
   3. Delete the `redash-redis` **Private Service**. Ensure you do not delete the newly created **Managed Redis** service. You can differentiate between the two using the **Type** column in the Dashboard.
