FROM busybox

MAINTAINER caduong <anhduongtk97@gmail.com>

EXPOSE 5000

ENV IMG_FOLDER=/data/images/

RUN mkdir -p /data/image

VOLUME ["/home/caduong/Documents/Docker/SyntaxContainer.png" "/data/image/SyntaxContainer.png" ]

RUN touch /data/stats.txt

RUN ls -l /data/image/SyntaxContainer.png > /data/stats.txt

RUN touch /data/log.txt

RUN echo "Images was download successfully" > /data/log.txt
