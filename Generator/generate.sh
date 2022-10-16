#/bin/bash

# Compile generator
swift build -c release

# Run generator and generate Awesome enums
location=""
output="./Output"
moveAssets=false

while getopts 'ml:o:' flag; do
  case "${flag}" in
    l) location="${OPTARG}";;
    o) output="${OPTARG}";;
    m) moveAssets=true;;
    *) exit;
  esac
done

if [[ -n "$location" ]]; then
    ./.build/release/Generator --location "$location" -o output
else
    ./.build/release/Generator -o output
fi


get_latest_release() {
  curl --silent "https://api.github.com/repos/FortAwesome/Font-Awesome/releases/latest" |
  grep '"browser_download_url":' |
  grep 'web' |
  sed -E 's/.*"([^"]+)".*/\1/'
}

# Copy assets and enums to target directories
cp "$output/Awesome.swift" "../Classes/Enums"
cp "$output/AwesomePro.swift" "../Classes/Enums"

cp "$output/Awesome+Extension.swift" "../Classes/Extensions"
cp "$output/AwesomePro+Extension.swift" "../Classes/Extensions"

echo "Generating assets"
rm -rf "../Assets"
mkdir "../Assets"

if $moveAssets; then
    url="$(get_latest_release)"
    echo "\nRequesting data from '$url'"
    curl -L "$url" --output fontawesome-free.zip
    unzip -joq ./fontawesome-free.zip -d FontAwesome

    if [ "$(find "./FontAwesome" -maxdepth 1 -type f | grep -i '.*\.ttf$')" ]; then
        echo "Loading Free Fonts"
        find "./FontAwesome" -type f -name '*.ttf' -exec cp {} "../Assets"/ \;
    fi

    if [[ -n "$location" ]]; then
        echo "Loading Pro Fonts"
        if [ "$(find "$location" -type f | grep -i '.*\.ttf$')" ]; then
            find "$location" -type f -name '*.ttf' -exec cp {} "../Assets"/ \;
        fi
        if [ "$(find "$location" -type f | grep -i '.*\.otf$')" ]; then
            find "$location" -type f -name '*.otf' -exec cp {} "../Assets"/ \;
        fi
    fi

fi
