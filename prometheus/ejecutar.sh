
#1. antes de nada creamos el namespace sobre el que vamos a trabajar
kubectl create -f prometeo-ns.yaml

#2. asignamos permisos a prometheus para que acceda al contenedor de kubernetes
kubectl apply -f prometheus-rbac.yaml 

#3. creamos el configmap que va a consumir el deployment de prometheus
kubectl apply -f prometheus-configmap.yaml

#4. creamos el servicio de prometheus
kubectl apply -f prometheus-deploy.yaml 
kubectl apply -f prometheus-svc.yaml 

# Ejecute kubectl create -f prometheus-svc.yaml para crear el servicio, asigne el puerto 9090 del contenedor al puerto 30003 del host a través del método NodePort 
# y visite http://localhost:30003/ a través del navegador. (que es lo mismo que http://127.0.0.1:30003/)
# Debería ver la página web de prometheus. Ya Si el formato del archivo de configuración es incorrecto, 
# puede ver los errores de análisis específicos a través del podId de registros de kubectl.

#5. implementamos el servicio de grafana
kubectl apply -f grafana-deploy.yaml 
#Parte de su configuración relacionada se puede inyectar a través de las variables de entorno. 
#A continuación, cree un nuevo grafana-svc.yaml para crear el servicio correspondiente y asigne el puerto 3000 del contenedor al puerto 30002 del host.
kubectl apply -f grafana-svc.yaml 
#puede acceder al servicio web de grafana a través de http: // ip: 30002 /. 
#Las anotaciones en la configuración anterior se utilizan para controlar la recopilación de prometeo. 
#Prometheus recopilará la etiqueta __meta_kubernetes_service_annotation_prometheus_io_scrape = true. 
#Con esta etiqueta, puede controlar qué objetivos deben recopilarse y evitar la recopilación innecesaria de objetivos, que pueden servir como filtro.

#6.implementar exportador de nodos
# Esto no es necesario. 
# El nodo-exportador es un recopilador de datos oficial que viene con él. En la actualidad, muchos componentes tienen recopiladores de terceros correspondientes. El exportador de nodos inicia un servidor http_server y recopila continuamente diversos datos, como CPU, memoria, disco y red IO de servicios de Linux. Los datos de índice que proporciona son mucho mayores de lo que cree. Proporciona una interfaz de datos que se ajusta al formato prometeo. Prometheus viene periódicamente a esta interfaz para solicitar datos de los diversos indicadores de la máquina. Como supervisa la información del host, en Kubernetes es mejor ejecutar en cada nodo en modo DaemonSet. Nuevo nodo-exportador-ds.yaml
kubectl apply -f node-exporter-ds.yaml 
#creamos su servicio correspondiente
kubectl apply -f node-exporter-svc.yaml
#El puerto del contenedor se ha asignado a 31672 en la máquina host. 
# Después de que el servicio se inicia correctamente, puede ver los datos de destino recopilados 
# por el exportador de nodos ejecutando curl http: // ip: 31672 / metrics en la máquina host. 
# En este punto, se implementan todos los servicios monitoreados.

seguir leyendo en https://programmerclick.com/article/4077256270/


#7.

#8.
