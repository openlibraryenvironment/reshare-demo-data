file=$1
url=$2
creds=$3
entitytype=$4

id=$(grep -oEm 1 '<id>[^<]+' $file | grep -oE '[0-9]+')  # get value of <id></id>

if curl --output /dev/null --silent --fail $url/$id -u $creds; then
  echo "$entitytype $id already exists. Skipping"
else
  echo POSTing $file with id $id to $url
  curl -H "Content-Type: application/xml" -d @$file $url -u $creds
fi
