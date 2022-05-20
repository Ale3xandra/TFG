PASOS A SEGUIR parea desplegar todos los servicios  que se tienen:

1. Insatalamos nginx
helm upgrade --install nginx ingress-nginx/ingress-nginx -n infrastructure --create-namespace

para comprobar que se ha instalado correctamente en el namespace que le hemos indicado hacemos
helm list -n infrastructure
nginx   infrastructure  1               2022-05-20 19:02:39.2623978 +0200 CEST  deployed        ingress-nginx-4.0.18    1.1.2


2. instalamos los juegos de prueba
kubectl apply -f apps/games-namespace.yaml -f apps/2048.yaml -f apps/hello-app.yaml -f apps/hello-app-ingress.yaml -f apps/ingress-games.yaml -f apps/tetris.yaml

3. instalamos Wordpress con MySQL


