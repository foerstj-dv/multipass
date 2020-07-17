# make sure to read up on the sub-projects
subs=(react-app express-server redis-worker)
for sub in $subs; do (
  pushd $sub
  ./readme.sh
  popd
); done

# kubernetes configs are in k8s folder
kubectl apply -f k8s

# how to deploy
./deploy.sh
# uses same script as Travis CI.
