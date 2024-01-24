scp 10.36.81.139:/mail/source/build/email/VERSION .
version=`cat VERSION`
rm -rf *
echo $version
#scp -r 10.36.81.201:/home/product/code/firmware/firmware_$version.tgz .
scp -r 10.36.81.139:/home/product/code/firmware/firmware_$version.tgz .
json_file="firmware_$version.tgz.json"
json_content='{
  "job":"esg",
  "token":"b267a27a-5519-4364-9aab-8caa90651991",
  "firmware_version": "'"$version"'",
  "link_name": "daily921",
  "platform": "2",
  "prereq_version": ""
}'
echo "$json_content" > "$json_file"
aws s3 cp firmware_$version.tgz s3://jenkins-incoming-esg/
aws s3 cp firmware_$version.tgz.json s3://jenkins-incoming-esg/
