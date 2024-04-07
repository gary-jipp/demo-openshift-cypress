# Openshift Commands

Perform the initial OpenShift Pipeline setup

#### List imageStreams in namespace
```bash
oc get imagestreams
```

#### Import node.js image if not there already
```bash
oc import-image node:16-alpine --from=docker.io/library/node:16-alpine --confirm
```

#### Create imageStream to hold build image
```bash
oc create imagestream demo-app
```

#### Process template to create build, deployment service & route
```bash
 oc process -f _openshift/demo-app.yaml  |  oc apply -f -
 ```

## Manually add redeploy trigger for image changes (if not already  in deployment yaml)
```bash
oc set triggers deploy/demo-app --from-image=demo-app:latest -c demo-app
```
