# Openshift Commands

Perform the initial OpenShift Pipeline setup

#### List imageStreams in namespace
```bash
oc get imagestreams
```

#### Import node.js image if not there already
```bash
oc import-image node:16-alpine --from=node:16-alpine --confirm
```

#### Import cypresss image if not there already
```bash
# slash in dockerhub name breaks template. Need a local imagestream
oc import-image cypress-local --from=cypress/included:latest --confirm

# allow local pulls of this image
oc set image-lookup imagestream/cypress-docker
```

#### Create imageStream to hold app image
```bash
oc create imagestream demo-app
```

#### Create imageStream to hold cypress test image
```bash
oc create imagestream demo-cypress
```

#### Process template to create app
```bash
 oc process -f _openshift/demo-app.yaml  |  oc apply -f -
 ```

#### Process template to create cypress test app
```bash
 oc process -f _openshift/demo-cypress.yaml  |  oc apply -f -
 ```

## Manually add redeploy trigger for image changes (if not already  in deployment yaml)
```bash
oc set triggers deploy/demo-app --from-image=demo-app:latest -c demo-app
```
