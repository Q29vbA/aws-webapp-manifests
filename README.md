# aws-webapp-manifests
Part of my small aws base project. ([aws-webapp-app](https://github.com/Q29vbA/aws-webapp-app/), [aws-webapp-manifests](https://github.com/Q29vbA/aws-webapp-manifests/) (this repo), [aws-webapp-infra](https://github.com/Q29vbA/aws-webapp-infra/))

helm chart for the python flask app. argocd tracks this repo and applies changes.

image tag in `helm/values.yaml` gets bumped by the app repo CI after a successful build+push (opens a PR for manual approve).

## usage

manual deploy via argocd if you want to poke:

```bash
argocd app create aws-webapp \
  --repo https://github.com/Q29vbA/aws-webapp-manifests.git \
  --path helm \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default
# or regular helm install
```

## future tweaks
- break values into env-specific files
- pin image tag source of truth to a release instead of sha
- add resource limits, simple hpa
