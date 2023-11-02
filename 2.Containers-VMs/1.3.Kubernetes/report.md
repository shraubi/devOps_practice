minikube start
created pod manifest
kubectl cluster-info >> Kubernetes control plane is running at ... CoreDNS is running at ...
kubectl create -f my-pod.yaml
kubectl get pods >> my-pod   1/1     Running   0          70s
kubectl get services >>>
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP        9m38s
my-service   NodePort    10.111.189.224   <none>        80:31111/TCP   3m45s
kubectl logs my-pod >>> 2023/11/02 10:39:25 [notice] 1#1: start worker process 14

deleted all and stopped the minicube
I liked the ingo in the logs and the logic of commands in this service