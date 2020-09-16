FROM mcr.microsoft.com/windows/servercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]


COPY jre1.8.0_45.zip c:\\jre1.8.0_45.zip
COPY jboss-eap-7.0.zip c:\\jboss-eap-7.0.zip

RUN powershell Expand-Archive -Force c:\\jre1.8.0_45.zip c:
RUN powershell Expand-Archive -Force c:\\jboss-eap-7.0.zip c:
 
ENV JAVA_HOME "c:\jre1.8.0_45"
ENV JBOSS_HOME "c:\jboss-eap-7.0" 
ENV JAVA_OPTS "-Xmx2048m -XX:CompressedClassSpaceSize=256m"
ENV _JAVA_OPTIONS "-Xmx2048m -XX:CompressedClassSpaceSize=256m"



ENV path "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Users\ContainerAdministrator\AppData\Local\Microsoft\WindowsApps;C:\jre1.8.0_45\bin;C:\jboss-eap-7.0\bin"
#RUN setx PATH "C:\jre1.8.0_45\bin;C:\jboss-eap-7.0\bin;%PATH%"
#RUN setx /M PATH "c:\jre1.8.0_45\bin;%PATH%"

CMD java -version

EXPOSE 8080
#EXPOSE 9990/tcp
#CMD standalone.bat



#for running the please use these commands
#docker build -t oraclejdk:8-windowsservercore  .
#docker run -p 8080:8080 oraclejdk:8-windowsservercore
#tomcat username =tomcat/tomcat or admin/admin

#docker run -p 8080:8080 -p 9990:9990 -it oraclejava:jboss standalone.bat -b 0.0.0.0 -bmanagement 0.0.0.0

#docker run --memory 4096m --cpus 2 -p 8080:8080 -p 9990:9990 -bind 0.0.0.0 -bmanagement 0.0.0.0 -it oraclejava:jboss
#docker run -p 8080:8080 -p 9990:9990 -it oraclejava:jboss C:\jboss-eap-7.0\bin\standalone.bat -b 0.0.0.0 -bmanagement 0.0.0.0
#jboss/@Oracle38
