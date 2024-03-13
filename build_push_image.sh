# image variables
DOCKER_USERNAME="agungfazrulhaq"
IMAGE_NAME="shipping-service-async"
IMAGE_TAG="latest"
GHCR_IMAGE="ghcr.io/$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

docker build -t "$GHCR_IMAGE" .

if [ $? -eq 0 ]; then
    echo docker build successful

    # login to github packages
    echo "$GHCR_TOKEN" | docker login ghcr.io -u "$DOCKER_USERNAME" --password-stdin

    docker push "$GHCR_IMAGE"

else
    echo "Docker build failed. Image not pushed to the registry."
    exit 1
fi    