#!/bin/bash
#
# Iterate over the bundles in ~/.vim/bundles and update them.
#
echo "Updating the vim setup"
git pull
cp vimrc ~/.vimrc
cp muedark.vim ~/.vim/colors
echo "Updating vim bundles ..."
for path in ~/.vim/bundle/*; do
	# Check for directory.
	[ -d "${path}" ] || continue
	# Update bundle.
	bundle="$(basename "${path}")"
	echo "Updating bundle: ${bundle}"
	cd ${path}
	git pull
done
echo "Done!"
#
# EOF
#
