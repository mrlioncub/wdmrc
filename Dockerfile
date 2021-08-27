FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine

LABEL maintainer="mr.lioncub"

ARG WDMRC_VERSION=1.13.4.3

WORKDIR /wdmrc

ADD https://github.com/yar229/WebDavMailRuCloud/releases/download/$WDMRC_VERSION/WebDAVCloudMailRu-$WDMRC_VERSION-dotNet5.zip /wdmrc

RUN addgroup -g 2000 -S wdmrc \
  && adduser -u 2000 -H -D -S -s /sbin/nologin -G wdmrc wdmrc \
  && unzip /wdmrc/WebDAVCloudMailRu-$WDMRC_VERSION-dotNet5.zip -d /wdmrc \
  && rm /wdmrc/WebDAVCloudMailRu-$WDMRC_VERSION-dotNet5.zip

USER wdmrc

ENTRYPOINT ["dotnet","wdmrc.dll","-h","http://*"]

CMD ["-p","8888"]
