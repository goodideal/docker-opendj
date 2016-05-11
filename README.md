# docker-opendj
Basic Docker image to run Opendj-Server

You need edit (add) this env:
- **LDAPORT**: ldap port (default 389)
- **LDAPSPORT**: ldaps port (default 636)
- **ADMINPORT**: admin port (default 4444)
- **BASEDN**: basedn (default dc=example,dc=com)
- **HOST**: hostname (default localhost)
- **PASSWORD**: password for master user (default admin123)


- **INIT_LDAP**: this should be set only once to configure ldap instance
- **LOAD_DUMP**: provide full path to dump file that should be imported

Usage:
```
docker run -d -e BASEDN="dc=test -e HOST=localhost -e PASSWORD=password oberthur/docker-opendj
```
or
```
docker run -d -p 389:389 -p 636:636 -e LDAPORT=389 -e LDAPSPORT=636 -e BASEDN="dc=test" -e HOST=localhost -e PASSWORD=password -e LOAD_DUMP=/tmp/test.ldif oberthur/docker-opendj

```
