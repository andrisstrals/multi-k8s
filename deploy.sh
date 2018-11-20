docker build -t astrals63/multi-client -f ./client/Dockerfile ./client
docker build -t astrals63/multi-server -f ./server/Dockerfile ./server
docker build -t astrals63/multi-worker -f ./worker/Dockerfile ./worker

docker push astrals63/multi-client
docker push astrals63/multi-server
docker push astrals63/multi-worker

kubectl -f k8s

kubectl set image deployments/server-deployment server=astrals63/multi-server
