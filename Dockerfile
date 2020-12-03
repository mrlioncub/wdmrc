FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine

LABEL maintainer="mr.lioncub"

ARG WDMRC_VERSION=1.13.1.1

WORKDIR /wdmrc

ADD https://github.com/yar229/WebDavMailRuCloud/releases/download/$WDMRC_VERSION/WebDAVCloudMailRu-$WDMRC_VERSION-dotNetCore31.zip /wdmrc

RUN addgroup -g 2000 -S wdmrc \
  && adduser -u 2000 -H -D -S -s /sbin/nologin -G wdmrc wdmrc \
  && unzip /wdmrc/WebDAVCloudMailRu-$WDMRC_VERSION-dotNetCore31.zip -d /wdmrc \
  && rm /wdmrc/WebDAVCloudMailRu-$WDMRC_VERSION-dotNetCore31.zip

USER wdmrc

ENTRYPOINT ["dotnet","wdmrc.dll","-h","http://*"]

CMD ["-p","8888"]
