# image variables
DOCKER_USERNAME="agungfazrulhaq"
IMAGE_NAME="item-app"
IMAGE_TAG="v1"

# build the docker image
docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

if [ $? -eq 0 ]; then
    echo "Docker build successful."

    # show all images
    docker images

    # tag existing image
    docker tag "$IMAGE_NAME:$IMAGE_TAG" "ghcr.io/$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
    echo "docker tagged '$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG' "

    # login to docker with DOCKER_PASSWORD already set
    echo "$DOCKER_PASSWORD" | docker login ghcr.io -u agungfazrulhaq --password-stdin

    # pushing docker to docker registry
    docker push "ghcr.io/$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

else
    echo "Docker build failed. Image not pushed to the registry."
    exit 1
fi