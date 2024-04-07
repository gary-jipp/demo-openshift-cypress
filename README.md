# demo-openshift-pipelibe

Minimal Node Express example of OpenShift Cypress Testing.  Cypress runs in a container in "watch" mode with a mounted "fixtures" volume. If any fixture changes, the tests will run again.

### Build & Run App Container Image on localhost: Local
```bash
podman build -t demo-app -f Dockerfile
podman run --name demo --rm -d -p 8080:8080 demo-app
```

#### Verify Running App Container
`http://localhost:8080/`


### OpenShift Commands
See README in `_openshift` dir