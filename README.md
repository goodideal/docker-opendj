# docker-opendj
Basic Docker image to run Opendj-Server

You need edit (add) this env:
- **LDAPORT**: port of ldap default:389
- **LDAPSPORT**: port of ldap default:636
- **BASEDN**: basedn
- **HOST**: host
- **PASSWORD**: password for master user
- **DUMPLDAP**: if you want import ldif file, you need write the name of the file and mount directory to tmp with R-W option



Usage:
```
docker run -d -p 389:389 -p 636:636 -e LDAPORT=389 -e LDAPSPORT=636 -e BASEDN="dc=test -e HOST=localhost -e PASSWORD=password -e DUMPLDAP=test.ldif -v PATHTOLDIFF:/tmp/ oberthur/docker-opendj

```
