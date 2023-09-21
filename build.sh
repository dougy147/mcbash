#!/bin/sh

set -xe

# Set CONFIGURATION directory (/etc & ~/.config/mcbash)
CONF_DEST="\${HOME}/.config/mcbash"
ALT_CONF_DEST="/etc"

# Pre-processing the build
if [[ -d ./build ]]; then
	rm -r ./build 2>/dev/null && mkdir ./build 2>/dev/null
else
	mkdir ./build 2>/dev/null
fi

# Create the monolithic program mcbash
touch ./build/mcbash
echo "#!/bin/sh" >> ./build/mcbash
echo "CONF_DEST=\"${CONF_DEST}\"" >> ./build/mcbash
echo "ALT_CONF_DEST=\"${ALT_CONF_DEST}\"" >> ./build/mcbash

# Append all OPTIONAL configuration files to mcbash
for conf_file in ./misc/*.conf; do cat "${conf_file}" | sed '/^#!\/bin\/sh/d ; /^#.*/d' >> ./build/mcbash; done

# Concatenate all functions into mcbash
for function in ./func/*; do
	if [[ $(grep mcbash << "${function}") ]]; then
		continue;
	else
		cat "${function}" | sed '/^#!\/bin\/sh/d ; /^#.*/d' >> ./build/mcbash;
	fi;
done
cat ./func/mcbash  | sed '/^#!\/bin\/sh/d ; /^#.*/d' >> ./build/mcbash

# Append infos to the end of the program
while read -r lines; do
	if [[ "${lines}" == "" ]]; then
		echo -e "\n" >> ./build/mcbash;
	fi;
	echo -e "# ${lines}" >> ./build/mcbash;
done < <(cat ./misc/infos.txt)

# Read version of mcbash to insert it in program
# TODO

# Finalize program building
chmod +x ./build/mcbash
mv ./build/mcbash ./bin/mcbash
rm -r ./build 2>/dev/null
