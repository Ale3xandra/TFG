# TFG
Resumen
En este artículo he explicado los pasos necesarios para publicar una aplicación en un clúster de Kubernetes:

Crear un Deployment
Crear un Service

El deployment crea los diferentes pods que componen la aplicación. El service los agrupa de manera funcional y los expone para que sean accesibles desde el exterior del clúster.

-----------------------------------------------
Para saber la ip externa de mi cluster 
kubectl get nodes -o wide

en este caso no me devuelve nada porque estoy trabajando en local

En este ejemplo he creado un namespace, un deployment y un service para conectarme a grafana, y exponer el puerto 3000 y conectarme a traves de él con mi cluster

