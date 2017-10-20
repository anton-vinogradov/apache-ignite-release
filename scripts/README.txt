0) In case you're on Windows, please install WSL
See https://msdn.microsoft.com/en-us/commandline/wsl/install_guide for details

1) Software required to perform release:
- Maven 3.x
- Java 7.x or 8.x
- Svn command line client
- Git command line client
- GPG (already installed at most of *Nix)

2) Configuration required to perform release:
- Import your pgp secret key.

  gpg --import private.key
  Perform this operation at bash console in case you're on Windows and using WSL.

  Don't forget to add your public pgp key here to https://dist.apache.org/repos/dist/release/ignite/KEYS.txt

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

3) Perform vote steps and start Vote.
    Run all vote*.sh scripts or ...
    Just perform double click on each vote*.sh in case you're on Windows and using WSL.

3.1) Perform Release Verification and send Release For Vote
    See https://cwiki.apache.org/confluence/display/IGNITE/Release+Process for details

4) Once Vote accepted, perform release steps.
    Run all release*.sh scripts or ...
    Just perform double click on each release*.sh in case you're on Windows and using WSL.

4.1) Close Vote
    See https://cwiki.apache.org/confluence/display/IGNITE/Release+Process for details
    Don't forget about Post-release steps


