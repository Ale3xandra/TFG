como no tengo un dns para mi host, sino que es un host inventado que solo reconoce mi local, no puedo generarle un certificado válido, 
para ello lo que voy a hacer es generar un certificado autofirmado apra cada uno de mis dominios

para ello genero un issuer y un certificado, ambos estan en el .yaml
prometheus-cert.yaml
grafana-cert.yaml

en el ingress de cada uno de ellos añado el secreto del certificado que he generado


aún así, mi navegador me va a decir que el certificado no es de confianza, debo añadirlo en "entidades de certificación raiz de confianza" tanto el .crt como el .key, sino el .p12 generado
para llegar ahí, nos vamos a chrome (por ejemplo)
- tres puntitos
- configuracion
- seguridad y privacidad
- seguridad
- gestionar certificados

y ahi lo añadimos a los certificados en lo que confia nuestro equipo


para descargar el ca.crt, tls.crt y tls.key
kubectl get secret prometheus-cert-tls -n monitoring -o jsonpath="{.data.ca\.crt}" | base64 -d
kubectl get secret prometheus-cert-tls -n monitoring -o jsonpath="{.data.tls\.crt}" | base64 -d
kubectl get secret prometheus-cert-tls -n monitoring -o jsonpath="{.data.tls\.key}" | base64 -d

y para generar el .p12
openssl pkcs12 -export -out server-prometheus.p12 -inkey tls.key -in tls.crt -certfile ca.crt


openssl pkcs12 -export -out server-prometheus.p12 -inkey pro-tls.key -in pro-tls.crt -certfile pro-ca.crt
openssl pkcs12 -export -out server-grafana.p12 -inkey gra-tls.key -in gra-tls.crt -certfile gra-ca.crt
---

pra cuando si tenemos un dns, podemos generar un issuer con lets encrypt


