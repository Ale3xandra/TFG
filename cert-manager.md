pasos a seguir para la instalación:

1. kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.2/cert-manager.crds.yaml
2. ## Add the Jetstack Helm repository
$ helm repo add jetstack https://charts.jetstack.io
 
3. ## Install the cert-manager helm chart
$ helm install my-release --namespace cert-manager --version v1.7.2 jetstack/cert-manager 

-----------------------
-------------------
instalacion cert-manager

Install the CustomResourceDefinitions and cert-manager itself:
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.1.1/cert-manager.yaml


4. Uninstalling the Chart
To uninstall/delete the my-release deployment:

$ helm delete my-release


kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/v1.7.2/cert-manager.crds.yaml