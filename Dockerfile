FROM debian:buster

RUN apt-get update && apt-get install texlive-xetex imagemagick -y

# https://stackoverflow.com/a/69535567/2899073
RUN sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml

COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh

RUN mkdir -p /usr/share/fonts/opentype
# COPY fonts/*.ttf /usr/local/share/fonts/
COPY fonts/*.ttf /usr/share/fonts/
COPY fonts/opentype/* /usr/share/fonts/opentype/

ENTRYPOINT /usr/bin/docker-entrypoint.sh