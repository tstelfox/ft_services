kubectl delete svc --all

kubectl delete deployments --all


kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml

kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/influxdb.yaml
# kubectl apply -f srcs/telegraf.yaml
