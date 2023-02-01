GREEN=$'\e[0;32m'
ENV_ARG=${1:-dev}

set -e
ROOT=`pwd`

echo "${GREEN}"
echo ===============================
echo ==========READY TO BUILD FOR ENV: $ENV_ARG============
echo ===============================

echo "${GREEN}"
echo  
echo  
echo ===============================
echo ==========APPLY ENV============
echo ===============================

cd apps/mobile/android && ./gradlew clean && cd ....

bash scripts/prepare-env.sh "$ENV_ARG"

echo "${GREEN}"
echo  
echo  
echo ===============================
echo ==========BUILD===============
echo ===============================

melos run app:android:release

echo "${GREEN}"
echo  
echo  
echo =====================================================
echo ==========DISTRIBUTE RELEASE APPCENTER===============
echo =====================================================

# if [[ $ENV_ARG == *"dev"* ]]
# then 
#     appcenter distribute release \
#         --mandatory \
#         --app Zodinet-Org/Fruit-Map-Android-Dev \
#         --file $ROOT/build/app/outputs/apk/release/app-release.apk \
#         --group "Collaborators,fruitmap-tester-group"
# elif [[ $ENV_ARG == *"prod"* ]]
# then 
#     appcenter distribute release \
#         --mandatory \
#         --app Zodinet-Org/FruitMap-Android-Prod \
#         --file $ROOT/build/app/outputs/apk/release/app-release.apk \
#         --group "Collaborators,fruitmap-tester-group"
# fi
