#!/bin/sh

if [ $# -eq 0 ]; then
  echo "Usage: $0 <release | pre-relase>"
  exit 1
fi

VERSION_BUMP_TYPE=$1

# 要求されたモードに移行する
# 既にそのモードの場合はエラーになるが後続の実行には影響しない
if [ "$VERSION_BUMP_TYPE" = "release" ]; then
  pnpm exec changeset pre exit || true
else
  pnpm exec changeset pre enter rc || true
fi
pnpm exec changeset version
pnpm install --lockfile-only