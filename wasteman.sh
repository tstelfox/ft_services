kubectl delete svc --all

kubectl delete deployments --all

kubectl delete secrets --all

kubectl delete configmap --all

# kubectl delete pods --all

# docker rmi mynginx
docker rmi myphp
docker rmi mysql
# docker build -t mynginx srcs/nginx/
# docker build -t myphp srcs/phpmyadmin/
docker build -t mysql srcs/mysql/

# The deployments
# kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
# kubectl apply -f srcs/wordpress.yaml

# kubectl apply -f srcs/ftps.yaml
# kubectl apply -f srcs/grafana.yaml
# kubectl apply -f srcs/influxdb.yaml
# kubectl apply -f srcs/telegraf.yaml
