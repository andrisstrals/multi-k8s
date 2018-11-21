docker build -t astrals63/multi-client:latest -t astrals63/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t astrals63/multi-server:latest -t astrals63/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t astrals63/multi-worker:latest -t astrals63/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push astrals63/multi-client:latest
docker push astrals63/multi-server:latest
docker push astrals63/multi-worker:latest

docker push astrals63/multi-client:$GIT_SHA
docker push astrals63/multi-server:$GIT_SHA
docker push astrals63/multi-worker:$GIT_SHA

kubectl -f k8s

kubectl set image deployments/client-deployment client=astrals63/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=astrals63/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=astrals63/multi-worker:$GIT_SHA
