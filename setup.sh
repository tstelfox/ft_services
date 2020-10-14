rm -rf ~/.minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube ~/.minikube

minikube start --vm-driver=virtualbox \
				--addons metalldb \
				--addons dashboard \
				# --addons metrics-server\
				# --cpus=2 --memory 3000

# Install metallb by manifest
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Apply the metallb config file
kubectl apply -f srcs/metallb-system.yaml

# Connecting the local docker environment into kubernetes
# eval $(minikube docker-env)

# Building the local nginx image god beast
# docker system prune -a -y
# docker build -t mynginx srcs/nginx/

# Create an nginx deployment and then expose the service via the loadbalancer
# kubectl apply -f srcs/nginx.yaml
kubectl create deployment mynginx --image=nginx --replicas=1
kubectl expose deployment mynginx --port 80 --type LoadBalancer





