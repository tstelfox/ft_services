Red='\033[0;31m'          # Red
Blue='\033[0;34m'         # Blue
Color_Off='\033[0m'       # Text Reset


rm -rf ~/.minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube ~/.minikube

minikube start --vm-driver=virtualbox \
				--addons metalldb \
				--addons dashboard \
				--disk-size='10000mb'

# Install metallb by manifest
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Connecting the local docker environment into kubernetes
eval $(minikube docker-env)
# Apply the metallb config file
kubectl apply -f srcs/metallb-system.yaml


# Building the local nginx image god beast
docker build -t myftps srcs/ftps/
docker build -t mynginx srcs/nginx/
docker build -t mysql srcs/mysql/
docker build -t myphp srcs/phpmyadmin/
docker build -t mywordpress srcs/wordpress/
docker build -t myinfluxdb srcs/influxdb/
docker build -t mygrafana srcs/grafana/
docker build -t mytelegraf srcs/telegraf/

# Create an nginx deployment and then expose the service via the loadbalancer
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/telegraf.yaml
kubectl apply -f srcs/grafana.yaml




echo -e "${Red}WAIT FOR IT LADS	\n\n${Color_Off}"
sleep 8
echo -e "${Blue}ALMOST THERE	\n\n${Color_Off}"
sleep 9
kubectl get all
