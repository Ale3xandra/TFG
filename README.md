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

3.Acceder al panel web de Grafana
______
Felicitaciones! Ahora podemos usar el enlace http://[Public IP]:[PORT] para acceder al servicio de la instacia de Grafana en nuestro Clúster de Kubernetes.

Para este ejemplo, la URL es: http://169.57.53.40:32309. Esto abre la página inicial de Grafana que requeire acceso. El usuario y contraseña por defecto es admin/admin. En el primer ingreso es necesario cambiar la contraseña.