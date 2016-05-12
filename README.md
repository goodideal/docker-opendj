# docker-opendj
Basic Docker image to run Opendj-Server

First run to initialize ldap
```
docker run --rm -it \
    -v /var/ldap/db:/opt/opendj/db:rw \
    -v /var/ldap/logs:/opt/opendj/logs:rw \
    -v /var/ldap/config:/opt/opendj/config:rw \
    --entrypoint bash \
    oberthur/docker-opendj:2.6.2
```

```
/opt/opendj/setup --cli \
    --ldapPort 389 --ldapsPort 636 --adminConnectorPort 4444 \
    --enableStartTLS --generateSelfSignedCertificate \
    --baseDN dc=example,dc=com \
    -h hostname \
    --rootUserPassword "password" \
    --acceptLicense --no-prompt
```

Usage:
```
docker run --rm -it \
    -p 389:389 -p 636:636 -p 4444:4444 \
    -v /var/ldap/db:/opt/opendj/db:rw \
    -v /var/ldap/logs:/opt/opendj/logs:rw \
    -v /var/ldap/config:/opt/opendj/config:rw \
    oberthur/docker-opendj:2.6.2
```
