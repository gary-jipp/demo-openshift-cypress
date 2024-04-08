# demo-openshift-cypress

Minimal Node Express example of OpenShift Cypress Testing.  Cypress runs in a container in "watch" mode with a mounted "fixtures" volume. If any fixture changes, the tests will run again.

---
### Build and Run in OpenShift
See README in `_openshift`

---
### Building Locally using Podman (or Docker)

#### Create a pod for both containers to share localhost
```bash
podman pod create --name=demo --infra-name=demo-cypress -p 8080:8080
```

#### Build & Run App Container Image in pod
```bash
podman build -t demo-app -f Dockerfile
podman run --name demo-app --rm -d demo-app --pod=demo
```

#### Build and Run Cypress Test Image in pod
```bash
podman run --name demo --rm -d -p 8080:8080 --pod=demo-cypress demo-express
```

#### Verify Running App Container
`http://localhost:8080/`
