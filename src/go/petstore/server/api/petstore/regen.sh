#!/bin/bash
set -eufo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GIT_ROOT="$(git rev-parse --show-toplevel)"
SCRIPT_REL_DIR="$(python3 -c "import os.path; print(os.path.relpath('$SCRIPT_DIR', '$GIT_ROOT'))")"

echo "SCRIPT_DIR=${SCRIPT_DIR}" >&2
echo "GIT_ROOT=${GIT_ROOT}" >&2
echo "SCRIPT_REL_DIR=${SCRIPT_REL_DIR}" >&2

FIXIMPORT="$(bazel cquery --output=files "//src/go/fiximport")"
OUTPUT_DIR="$(bazel cquery --output=files "//${SCRIPT_REL_DIR}:v1_sources")"
bazel build "//${SCRIPT_REL_DIR}:v1_sources" "//src/go/fiximport"

generated_files=(
    api.go
    api_pet.go
    api_store.go
    api_user.go
    error.go
    helpers.go
    impl.go
    logger.go
    model_address.go
    model_api_response.go
    model_category.go
    model_customer.go
    model_order.go
    model_pet.go
    model_tag.go
    model_user.go
    routers.go
)

V1_DIR="${SCRIPT_REL_DIR}/v1"
rm -rf "$V1_DIR"
mkdir -p "$V1_DIR"
for generated_file in "${generated_files[@]}"; do
    cp "${OUTPUT_DIR}/go/${generated_file}" "${V1_DIR}/${generated_file}"
    chmod 644 "${V1_DIR}/${generated_file}"
done

# The generated code does not to compile, due to missing imports "io" and "errors".
# https://github.com/OpenAPITools/openapi-generator/issues/19237
"$FIXIMPORT" -file "${V1_DIR}/api.go" -remove reflect
"$FIXIMPORT" -file "${V1_DIR}/api_pet.go" -add errors,io -remove reflect
"$FIXIMPORT" -file "${V1_DIR}/api_store.go" -add errors,io
"$FIXIMPORT" -file "${V1_DIR}/api_user.go" -add errors,io

bazel run gazelle -- "${SCRIPT_REL_DIR}"
