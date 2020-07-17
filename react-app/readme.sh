# welcome to react-app!

# a) barebones
# install deps
npm install
# start dummy server
npm run start
# run tests
npm run test
# build prod dist
npm run build

# b) docker
# build & run dev
t=jfdv/multipass-react-app
docker build -t $t-dev -f Dockerfile.dev .
docker run $t-dev
docker run -e CI=true $t-dev npm run test
# build & push prod
docker build -t $t .
docker push $t
