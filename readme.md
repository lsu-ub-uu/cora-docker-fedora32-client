# Docker for Fedora Commons Client 3.2.1
This is intended to be used in conjunction with the docker based eclipe environment for Cora.

## How to use
* Start the dev dockers for DiVA, including fedora and its supporting postgresql docker.
* Start the client with the startscript "divaStartFedora32Client.sh", there should be a menuitem under
divaStartFedora32Client  in external tools
* Connect the client to your fedoraServer using:

fedora server: diva-docker-fedora:8443<br>
protocol: https<br>
context: fedora<br>
username: fedoraAdmin<br>
password: changeit<br>


#Adding more files to person (2021-03-09)
could be exported from Classic using webgui http://localhost:8088/fedora/search<br>
search for: authority-person*<br>
open some person, click: "View the Item Index for this Object"<br>
click "XML metadata"<br>



### Create a new data object from the client:

create new data object:
Label: Authority person 60566
custom pid: authority-person:60566
!create!

on datastreams tab:
new: 
id: METADATA
Internal XML Metadata
Label: Authority person 60566
checksum: SHA-512

import from file, file containing person  (/home/client/records/persons/METADATA.0.xml)
!Save datastream!

### export newly created data from dockers to dockerprojects in eclipse
run the script "divaExportFedoraDataToProjects.sh", there should be a menuitem under
divaExportFedoraDataToProjects in external tools

Check that **data.tar.gz** is updated in **diva-cora-docker-fedora** project<br>
Check that **fedora32.sql** is updated in **diva-cora-docker-fcrepo-postgresql** project

### Export and import certificates from/into a keystore
If you want to get access to e.g. DiVA classic's fedora with this client, you will first have to export the matching certificate from classic's keystore used for fedora and then import the certificate into the keystore used by this client. Below you'll find commands to help you with this. You will have to know and enter the keystore's password.

##### Check which certificates are in a keystore

    keytool -list -v -keystore /path/to/keystore
    
Make a note of the alias of the certificate you want to export.
  
##### Export a certificate from a keystore

    keytool -export -alias alias-of-the-certificate-you-want-to-export -file file/to/export/to -keystore /path/to/source/keystore
  
##### Import a certificate into a keystore
  
    keytool -import -trustcacerts -file /path/to/certificate -alias alias-of-the-certificate-in-target-keystore -keystore /path/to/target/keystore


