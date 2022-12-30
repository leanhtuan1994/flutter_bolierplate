
GREEN=$'\e[0;32m'

ENV_ARG=${1:-dev}

APP="apps/mobile"

$(test $ENV_ARG != "uat") && SRC="local/dev" || SRC="local/uat"
$(test $ENV_ARG == 'prod') && SRC="local/prod"


echo "${GREEN}"
echo branch $ENV_ARG -src $SRC


export $(cat $SRC/.env | xargs)


# copy env file to app folder
rm $APP/.env
cp $SRC/.env $APP

