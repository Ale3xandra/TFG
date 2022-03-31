comandos basicos , que  luego se me olvidan

#para saber las release y namespaces que hay 
helm list -A

#para borrar una release (hay que indicar el namespace al que pertenece)
helm delete certmanager-1.7.0 -n cert-manager
