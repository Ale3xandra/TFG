# monitoring-as-code
Deploy Grafana and manage your dashboards and datasources as ConfigMaps
De cara al Tfg hacer un script de bash para lanzar de golpe todos los ficheros que necesitamos para construir la monitorización con grafana

aqui hay un ejemplo de fichero .sh: https://github.com/cookcodeblog/k8s-deploy/blob/master/k8s_dashboard/01_create_k8s_dashboard.sh




---------------------------------------------------------------------
https://kubernetes.github.io/ingress-nginx/deploy/

he instalado nginx con helm con 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml

Acabo de crear unos pods en el nginx-ingress
kubectl get pods --namespace=ingress-nginx

After a while, they should all be running. The following command will wait for the ingress controller pod to be up, running, and ready:

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s


Local testing¶
Let's create a simple web server and the associated service:

kubectl create deployment demo --image=httpd --port=80
kubectl expose deployment demo

Then create an ingress resource. The following example uses an host that maps to localhost:
kubectl create ingress demo-localhost --class=nginx \
  --rule=demo.localdev.me/*=demo:80
--> ingress.networking.k8s.io/demo-localhost created

Now, forward a local port to the ingress controller:
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80

At this point, if you access http://demo.localdev.me:8080/, you should see an HTML page telling you "It works!".