#!/bin/sh

# apollo config db info
apollo_config_db_url=jdbc:mysql://39.104.102.91:3306/ApolloConfigDB?characterEncoding=utf8
apollo_config_db_username=root
apollo_config_db_password=123456

# apollo portal db info
apollo_portal_db_url=jdbc:mysql://39.104.102.91:3306/ApolloPortalDB?characterEncoding=utf8
apollo_portal_db_username=root
apollo_portal_db_password=123456

# meta server url, different environments should have different meta server addresses
dev_meta=http://172.31.36.107:8081
fat_meta=http://172.31.36.107:8081
uat_meta=http://172.31.36.107:8081
pro_meta=http://172.31.36.107:8081

META_SERVERS_OPTS="-Ddev_meta=$dev_meta -Dfat_meta=$fat_meta -Duat_meta=$uat_meta -Dpro_meta=$pro_meta"

# =============== Please do not modify the following content =============== #
# go to script directory
cd "${0%/*}"

cd ..

# package config-service and admin-service
echo "==== starting to build config-service and admin-service ===="

mvn clean package -DskipTests -pl apollo-configservice,apollo-adminservice -am -Dapollo_profile=github -Dspring_datasource_url=$apollo_config_db_url -Dspring_datasource_username=$apollo_config_db_username -Dspring_datasource_password=$apollo_config_db_password -Dlogging.file=/opt/logs/apollo-assembly.log -Dip=172.31.36.107

echo "==== building config-service and admin-service finished ===="

echo "==== starting to build portal ===="

mvn clean package -DskipTests -pl apollo-portal -am -Dapollo_profile=github,auth -Dspring_datasource_url=$apollo_portal_db_url -Dspring_datasource_username=$apollo_portal_db_username -Dspring_datasource_password=$apollo_portal_db_password -Dlogging.file=/opt/logs/apollo-assembly.log $META_SERVERS_OPTS -Dip=172.31.36.107

echo "==== building portal finished ===="

echo "==== starting to build client ===="

mvn clean install -DskipTests -pl apollo-client -am $META_SERVERS_OPTS -Dlogging.file=/opt/logs/apollo-assembly.log

echo "==== building client finished ===="

rm -f apollo-docker/apollo-configservice-0.11.0-SNAPSHOT-github.zip
rm -f apollo-docker/apollo-adminservice-0.11.0-SNAPSHOT-github.zip
rm -f apollo-docker/apollo-portal-0.11.0-SNAPSHOT-github.zip

cp apollo-configservice/target/apollo-configservice-0.11.0-SNAPSHOT-github.zip apollo-docker
cp apollo-adminservice/target/apollo-adminservice-0.11.0-SNAPSHOT-github.zip apollo-docker
cp apollo-portal/target/apollo-portal-0.11.0-SNAPSHOT-github.zip apollo-docker

cp apollo-configservice/target/apollo-configservice-0.11.0-SNAPSHOT-github.zip /Users/lihongjun/deploy/apollo-config
cp apollo-adminservice/target/apollo-adminservice-0.11.0-SNAPSHOT-github.zip /Users/lihongjun/deploy/apollo-admin
cp apollo-portal/target/apollo-portal-0.11.0-SNAPSHOT-github.zip /Users/lihongjun/deploy/apollo-portal