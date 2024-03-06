# image variables
DOCKER_USERNAME="agungfazrulhaq"
IMAGE_NAME="karsajobs-ui"
IMAGE_TAG="latest"
GHCR_IMAGE="ghcr.io/$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

# building image
docker build -t "$GHCR_IMAGE" .

# check image building state
if [ $? -eq 0 ]; then
    echo docker build successful

    # login to github packages
    echo "$GHCR_TOKEN" | docker login ghcr.io -u "$DOCKER_USERNAME" --password-stdin

    # push builded image
    docker push "$GHCR_IMAGE"

else
    echo "Docker build failed. Image not pushed to the registry."
    exit 1
fi