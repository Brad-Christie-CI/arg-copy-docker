#escape=`
FROM microsoft/windowsservercore
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ARG COPY_SRC=./files/hello-world.txt

# trailing slash is important on dest otherwise you're renaming the file
COPY ${COPY_SRC} /files/

RUN Get-ChildItem "c:\files\*" -Recurse | Format-Table -AutoSize
