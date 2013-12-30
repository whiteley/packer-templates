#!/bin/bash

PATCH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd lib/modules/source
if [[ ! -f vmhgfs.tar.orig ]]
then
  cp vmhgfs.tar vmhgfs.tar.orig
fi
rm -rf vmhgfs-only
tar xf vmhgfs.tar
pushd vmhgfs-only
patch -p1 < $PATCH_DIR/vmhgfs-uid-gid-kernel-3.12-tools-9.6.1.patch
popd
tar cf vmhgfs.tar vmhgfs-only
rm -rf vmhgfs-only
popd
