#/bin/bash

release=$1
if [ -z "$release" ]; then
       echo "Usage: $0 <new version number>"
       exit
fi       

# Set up paths
scriptpath=$(realpath "$0")
scriptdir=$(dirname $scriptpath)
basedir=$(dirname $scriptdir)

npm run build
# Update/minify CSS and JS
$scriptdir/update_css.sh
$scriptdir/ftable_minify.sh

# Update version file, JS header, and package.json
echo $release >$basedir/VERSION

# --- NPM: update version and publish ---
if [ -f "$basedir/package.json" ]; then
    # Update package.json version (no git tag, since we'll handle it manually)
    npm version $release --no-git-tag-version

    # Publish to npm (scoped package, so --access public)
    npm publish --access public
fi

# --- GitHub release steps as before ---
# Create a zip of the new release for GitHub (but not for npm)
cd $basedir/..
pwd
zip -r ftable.zip ftable -x '*.git*' '*.less' -x 'ftable/dist*' -x 'ftable/script*' -x 'ftable/*json' -x 'ftable/.npmignore' -x 'ftable/themes/update_css.sh' -x 'ftable/build.mjs' -x 'ftable/src*'
mv ftable.zip $basedir/dist/

cd $basedir
git add VERSION ftable.min.js package.json
git commit -m "release $release" -a
git push
gh release create "v${release}" --generate-notes ./dist/*.zip
