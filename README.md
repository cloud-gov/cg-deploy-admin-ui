## 18F Bosh Admin-UI Deployment Manifests and Concourse pipeline

This repo contains the source for the Bosh deployment manifest and deployment pipeline for the 18F admin-ui deployment.

### UAA Setup

To set up the UAA client and groups, add the following to the CF secrets:

```yaml

properties:
  uaa:
    clients:
      admin-ui:
        secret: CHANGEME
        scope: admin_ui.user,admin_ui.admin,openid
        authorized-grant-types: refresh_token,client_credentials,authorization_code
        authorities: cloud_controller.read,cloud_controller.write,cloud_controller.admin,clients.write,dopper.firehose,openid,scim.read,scim.write
        autoapprove: true
    scim:
      groups:
        admin_ui.user: "Admin UI users"
        admin_ui.admin: "Admin UI admins"
```
