FROM maven:3.5-jdk-8-alpine AS build
LABEL Author="zkyd <r2d@zkyda.com>"
#ARG version=0.10.2
ARG version=0.11.0
ARG package_name=apollo-${version}.tar.gz
COPY build.sh /scripts/ 
WORKDIR /src

ADD apollo-configservice-${version}-SNAPSHOT-github.zip .
ADD apollo-adminservice-${version}-SNAPSHOT-github.zip .
ADD apollo-portal-${version}-SNAPSHOT-github.zip .
#RUN wget -c https://github.com/ctripcorp/apollo/archive/v${version}.tar.gz -O ${package_name} \
#    && tar zxf ${package_name} --strip-components=1 \
#    && cp /scripts/build.sh scripts/ \
#    && chmod 777 scripts/build.sh
#RUN scripts/build.sh
RUN mkdir /app \
    && mkdir /apollo-configservice \
    && mkdir /apollo-adminservice \
    && mkdir /apollo-portal \
    && chmod 777 * \
#    && cp apollo-configservice/target/apollo-configservice-${version}.jar /app/configservice.jar \
#    && cp apollo-adminservice/target/apollo-adminservice-${version}.jar /app/adminservice.jar \
#    && cp apollo-portal/target/apollo-portal-${version}.jar /app/portal.jar
# added by lihj start
    && unzip apollo-configservice-${version}-SNAPSHOT-github.zip -d "/apollo-configservice" \
    && unzip apollo-adminservice-${version}-SNAPSHOT-github.zip -d "/apollo-adminservice" \
    && unzip apollo-portal-${version}-SNAPSHOT-github.zip -d /apollo-portal \
    && cp /apollo-configservice/apollo-configservice-${version}-SNAPSHOT.jar /app/configservice.jar \
    && cp /apollo-adminservice/apollo-adminservice-${version}-SNAPSHOT.jar /app/adminservice.jar \
    && cp /apollo-portal/apollo-portal-${version}-SNAPSHOT.jar /app/portal.jar

# added by lihj end
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

FROM java:8-jre-alpine
WORKDIR /app
COPY --from=build /app .
COPY --from=build /etc/localtime /etc/localtime
ENTRYPOINT [ "java", "-jar" ]
CMD [ "configservice.jar" ]
#CMD [ "adminservice.jar" ]
#CMD [ "portal.jar" ]