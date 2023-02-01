GREEN=$'\e[0;32m'
ENV_ARG=${1:-dev}

set -e
ROOT=`pwd`

rm -rf $ROOT/app/mobile/ios/build

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

bash scripts/prepare-env.sh "$ENV_ARG"

echo "${GREEN}"
echo  
echo  
echo ===============================
echo ==========BUILD================
echo ===============================


if [[ $ENV_ARG == *"dev"* ]]
then 
    cd apps/mobile/ios && fastlane release
elif [[ $ENV_ARG == *"prod"* ]]
then 
    cd apps/mobile/ios && fastlane prodrelease
fi

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
#         --app Zodinet-Org/Fruit-Map-iOS-Dev \
#         --file $ROOT/ios/build/Runner.ipa \
#         --group "Collaborators,fruitmap-tester-group"
# elif [[ $ENV_ARG == *"prod"* ]]
# then 
#     appcenter distribute release \
#         --mandatory \
#         --app Zodinet-Org/FruitMap-Prod \
#         --file $ROOT/ios/build/Runner.ipa \
#         --group "Collaborators,fruitmap-tester-group"
# fi

