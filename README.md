# docker-opendj
Basic Docker image to run Opendj-Server

You need edit (add) this env:
- **LDAPORT**: ldap port default:389
- **LDAPSPORT**: ldaps port default:636
- **ADMINPORT**: admin default:4444
- **BASEDN**: basedn
- **HOST**: hostname
- **PASSWORD**: password for master user
- **DUMPLDAP**: if you want import ldif file, you need write the name of the file and mount directory to tmp with R-W option


Usage:
```
docker run -d -e BASEDN="dc=test -e HOST=localhost -e PASSWORD=password oberthur/docker-opendj
```
or
```
docker run -d -p 389:389 -p 636:636 -e LDAPORT=389 -e LDAPSPORT=636 -e BASEDN="dc=test" -e HOST=localhost -e PASSWORD=password -e DUMPLDAP=test.ldif -v PATHTOLDIFF:/tmp/ oberthur/docker-opendj

```
