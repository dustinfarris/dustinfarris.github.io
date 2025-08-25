#!/bin/bash
# Usage: ./add-image.sh post-slug image-path

POST_SLUG=$1
IMAGE_PATH=$2
IMAGE_NAME=$(basename "$IMAGE_PATH")

# Create bundle directory if it doesn't exist
mkdir -p "images/$POST_SLUG"

# Copy image to bundle directory
cp "$IMAGE_PATH" "images/$POST_SLUG/$IMAGE_NAME"

echo "Image copied to: images/$POST_SLUG/$IMAGE_NAME"
echo "Use in org: [[file:images/$POST_SLUG/$IMAGE_NAME]]"
