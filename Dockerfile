FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine

LABEL maintainer="mt.lioncub" \
    release-date="2020–08–09"

WORKDIR /wdmrc

ADD https://github.com/yar229/WebDavMailRuCloud/releases/download/1.11.0.28/WebDAVCloudMailRu-1.11.0.28-dotNetCore30.zip /wdmrc

RUN addgroup -g 2000 -S wdmrc \
  && adduser -u 2000 -H -D -S -s /sbin/nologin -G wdmrc wdmrc \
  && unzip /wdmrc/WebDAVCloudMailRu-1.11.0.28-dotNetCore30.zip -d /wdmrc \
  && rm /wdmrc/WebDAVCloudMailRu-1.11.0.28-dotNetCore30.zip

USER wdmrc

ENTRYPOINT ["dotnet","wdmrc.dll","-h","http://*"]

CMD ["-p","8888"]
