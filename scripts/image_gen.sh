icons_dir="apps/mobile/assets/icons"
images_dir="apps/mobile/assets/images"
jsons_dir="apps/mobile/assets/jsons"
currentPackage=`basename "$PWD"`
output="apps/mobile/lib/common/constants/images.dart"
touch "$output"
: > $output

echo "part of '../constants.dart';" >> $output

if [ "$(ls -A $icons_dir)" ]; then
    
    echo "class Ic {" >> $output
    for entry in "$icons_dir"/*
        do
        fname=`basename $entry`
        name="${fname%%.*}"
        lowercase=$(echo "$name" | awk '{print tolower($0)}')
        camelCase=$(echo "$lowercase" | perl -pe 's/_([a-z])/uc($1)/ge')
        if [[ $camelCase != "2" ]]; then
        if [[ $camelCase != "3" ]]; then
        echo "  static const $camelCase = '$entry';" >> $output
        fi
        fi
    done
    echo "}
" >> $output
else
    echo ''
fi

if [ "$(ls -A $images_dir)" ]; then
    echo "class Img {" >> $output
    for entry in "$images_dir"/*
        do
        fname=`basename $entry`
        name="${fname%%.*}"
        lowercase=$(echo "$name" | awk '{print tolower($0)}')
        camelCase=$(echo "$lowercase" | perl -pe 's/_([a-z])/uc($1)/ge')
        if [[ $camelCase != "2" ]]; then
        if [[ $camelCase != "3" ]]; then
        echo "  static const $camelCase = '$entry';" >> $output
        fi
        fi
    done
    echo "}
" >> $output
else
    echo ''
fi

if [ "$(ls -A $jsons_dir)" ]; then
    echo "class Js {" >> $output
    for entry in "$jsons_dir"/*
        do
        fname=`basename $entry`
        name="${fname%%.*}"
        lowercase=$(echo "$name" | awk '{print tolower($0)}')
        camelCase=$(echo "$lowercase" | perl -pe 's/_([a-z])/uc($1)/ge')
        if [[ $camelCase != "2" ]]; then
        if [[ $camelCase != "3" ]]; then
        echo "  static const $camelCase = '$entry';" >> $output
        fi
        fi
    done
    echo "}
" >> $output
else
    echo ''
fi

