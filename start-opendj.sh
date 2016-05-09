#!/bin/bash
##HOW TO START docker
# docker run davka/opendj -p 389:389 -p 636:636 -e LDAPORT=389 -e LDAPSPORT=636 -e BASEDN="dc=otlabs -e HOST=localhost -e PASSWORD=password -e DUMPLDAP=otlabs.ldif-v PATHTOLDIFF:/tmp/
set -e

##ENV
echo ${CLUSTER}
echo ${LDAPORT}
echo ${LDAPSPORT}
echo ${BASEDN}
echo ${HOST}
echo ${CLUSTER_NODE}
echo ${PASSWORD}
echo ${DUMPLDAP}

install_LDAP(){
/opt/opendj/setup --cli -p ${LDAPORT} --ldapsPort ${LDAPSPORT} --enableStartTLS --generateSelfSignedCertificate --baseDN ${BASEDN} -h ${HOST} --rootUserPassword "${PASSWORD}" --acceptLicense --no-prompt
}

stopServer(){
  /opt/opendj/bin/stop-ds
}

loadFile(){
/opt/opendj/bin/import-ldif --includeBranch "${BASEDN}" --backendID userRoot --ldifFile /tmp/"${DUMPLDAP}"
}

#start server in foreground
startServer(){
  /opt/opendj/bin/start-ds --nodetach
}


if [ "${DUMPLDAP}" != "" ];then
    install_LDAP
    stopServer
    loadFile
    startServer
else
    echo "Configuring LDAP"
    install_LDAP
    stopServer
    startServer
fi
