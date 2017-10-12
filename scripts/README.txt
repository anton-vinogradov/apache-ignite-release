1) Software required to perform release:
- Maven 3.x
- Java 7.x or 8.x
- Svn client
- Git client
- GPG

2) Configuration required to perform release:
- Install your pgp certificate.
- Configure maven setting.xml:

Add following and fill <username>, <password> and <gpg.*>

<servers>
   <server>
       <id>apache.releases.https</id>
       <username>*</username> <!-- your apache username -->
       <password>*</password> <!-- your apache password -->
   </server>
</servers>

<profiles>
   <profile>
       <id>gpg</id>
       <properties>
           <gpg.keyname>*</gpg.keyname> <!-- pgp keyname, eg. E38286D5 -->
           <gpg.passphrase>*</gpg.passphrase> <!-- pgp passphrase -->
           <gpg.useagent>false</gpg.useagent>
       </properties>
   </profile>
</profiles>

3) Perform vote steps 1-3 and start Vote.

4) Once Vote accepted, perform release steps 1-3.


