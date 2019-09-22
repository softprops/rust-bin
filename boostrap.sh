#!/usr/bin/env bash

# Note: This file should only be used in GitHub template contexts
# it will not be included in cargo generate output

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_NAME=$(basename $DIR)
AUTHORS="$(git config user.name) <$(git config user.email)>"

replace() {
  sed "s/{{$1}}/$2/g"
}

cat "$DIR/Cargo.toml" \
	| replace project-name "$PROJECT_NAME" \
	| replace authors "$AUTHORS" \
	> $DIR/Cargo.toml

cat "$DIR/.github/workflows/main.yml" \
	| replace project-name "$PROJECT_NAME" \
	> $DIR/Cargo.toml

rm .genignore 2>/dev/null || true