#!/usr/bin/env -S bash -e

#set -x

BUILD_DIR=./build
TARGET="$BUILD_DIR/mcbash"

# Set CONFIGURATION directory (/etc & ~/.config/mcbash)
CONF_DEST="\${HOME}/.config/mcbash"
ALT_CONF_DEST="/etc"

# Pre-processing the build
if [ -d $BUILD_DIR ]
then
	rm -r $BUILD_DIR 2>/dev/null && mkdir $BUILD_DIR 2>/dev/null
else
	mkdir $BUILD_DIR 2>/dev/null
fi

# Create the monolithic program mcbash
touch $TARGET
{ echo "#!/bin/bash"; echo "CONF_DEST=\"${CONF_DEST}\""; echo "ALT_CONF_DEST=\"${ALT_CONF_DEST}\""; } >> $TARGET

# Append all OPTIONAL configuration files to mcbash
for conf_file in ./misc/*.conf; do sed '/^#!\/bin\/\(ba\)\?sh/d ; /^#.*/d' "${conf_file}" >> $TARGET; done

# Concatenate all functions into mcbash (filename must be in correct order)
for fun in ./func/*; do sed '/^#!\/bin\/\(ba\)\?sh/d ; /^#.*/d' "${fun}" >> $TARGET; done

# Append infos to the end of the program
while read -r lines; do
	if [ "${lines}" = "" ]
	then
		echo "" >> $TARGET;
	fi;
	echo "# ${lines}" >> $TARGET;
done < ./misc/infos.txt

# Read version of mcbash to insert it in program
# TODO

# Finalize program building
chmod +x $TARGET
mv $TARGET ./bin/mcbash
rm -r $BUILD_DIR 2>/dev/null

echo "[DONE] mcbash was built successfully"
