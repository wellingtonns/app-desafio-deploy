echo " Criando Imagens ......."

docker build -t welignton/projeto-back:1.0 backend/.
docker build -t welignton/db-mysql:1.0 database/.

echo " Subindo imagens...."

docker push welignton/projeto-back:1.0
docker push welignton/db-mysql:1.0

echo "Criando Serviços no cluster Kubernetes..."

kubectl apply -f ./services.yaml

echo "Criando Deployments no cluster Kubernetes..."

kubectl apply -f ./deployment.yaml