PASOS A SEGUIR parea desplegar todos los servicios  que se tienen:

1. Insatalamos nginx
helm upgrade --install nginx ingress-nginx/ingress-nginx -n infrastructure --create-namespace

para comprobar que se ha instalado correctamente en el namespace que le hemos indicado hacemos
helm list -n infrastructure
nginx   infrastructure  1               2022-05-20 19:02:39.2623978 +0200 CEST  deployed        ingress-nginx-4.0.18    1.1.2

para ver que se nos ha creado correctamente el servicio de nginx
kubectl get svc -n infrastruture
infrastructure   nginx-ingress-nginx-controller             LoadBalancer   10.101.15.135    localhost     80:32420/TCP,443:30260/TCP   2m3s
infrastructure   nginx-ingress-nginx-controller-admission   ClusterIP      10.100.199.182   <none>        443/TCP                      2m3s


2. instalamos los juegos de prueba
kubectl apply -f apps/games-namespace.yaml -f apps/2048.yaml -f apps/hello-app.yaml -f apps/hello-app-ingress.yaml -f apps/ingress-games.yaml -f apps/tetris.yaml

como hemos instalado antes nginx, vamos a poder ver los juegos desplegados en los host que les hemos asociado, solo tenemos que trucar nuestro etc/hosts
como estamos en Windows este se encuentra en la siguiente ruta: /c/Windows/System32/drivers/etc
hacemos un cat del fichero hosts
image.png




3. instalamos Wordpress con MySQL


