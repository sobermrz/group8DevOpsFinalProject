#configure kubectl
aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)

#metric server
#wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz
kubectl apply -f metrics-server-0.3.6/deploy/1.8+/

#Deploy k8s dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

#Deploy LinkedUs Web App
kubectl apply -f todolist-middle-redis.yaml
kubectl apply -f linkus-front-deployment.yaml
kubectl apply -f linkus-back-deployment.yaml

#Deploy Service
kubectl create -f todolist-middle-redis-lb.yaml
kubectl create -f service-linkus-front-lb.yaml
kubectl create -f service-linkus-back-lb.yaml
kubectl create -f linkus-front-hpa.yaml


#Get All Service
kubectl get svc

#Run Proxy Server
#kubectl proxy

