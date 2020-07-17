docker build -t jfdv/multipass-react-app:latest -t jfdv/multipass-react-app:$GIT_SHA -f ./react-app/Dockerfile ./react-app
docker build -t jfdv/multipass-express-server:latest -t jfdv/multipass-express-server:$GIT_SHA -f ./express-server/Dockerfile ./express-server
docker build -t jfdv/multipass-redis-worker:latest -t jfdv/multipass-redis-worker:$GIT_SHA -f ./redis-worker/Dockerfile ./redis-worker
docker push jfdv/multipass-react-app:latest
docker push jfdv/multipass-express-server:latest
docker push jfdv/multipass-redis-worker:latest
docker push jfdv/multipass-react-app:$GIT_SHA
docker push jfdv/multipass-express-server:$GIT_SHA
docker push jfdv/multipass-redis-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=jfdv/multipass-react-app:$GIT_SHA
kubectl set image deployments/server-deployment server=jfdv/multipass-express-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=jfdv/multipass-redis-worker:$GIT_SHA
