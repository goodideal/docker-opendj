#!/bin/bash
set -e

##ENV
echo ${CLUSTER}
echo ${LDAPORT}
echo ${LDAPSPORT}
echo ${ADMINPORT}
echo ${BASEDN}
echo ${HOST}
echo ${CLUSTER_NODE}
echo ${PASSWORD}
echo ${DUMPLDAP}

install_LDAP(){
  /opt/opendj/setup --cli --ldapPort ${LDAPORT:-389} --ldapsPort ${LDAPSPORT:-636} --adminConnectorPort ${ADMINPORT:-4444} --enableStartTLS --generateSelfSignedCertificate --baseDN ${BASEDN} -h ${HOST:-localhost} --rootUserPassword "${PASSWORD:-admin123}" --acceptLicense --no-prompt
}

stopServer(){
  /opt/opendj/bin/stop-ds
}

loadFile(){
  /opt/opendj/bin/import-ldif --includeBranch "${BASEDN}" --backendID userRoot --ldifFile /tmp/"${DUMPLDAP}"
}

#start server in foreground
startServer(){
  exec /opt/opendj/bin/start-ds --nodetach
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
