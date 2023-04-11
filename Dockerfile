FROM soulteary/flare
EXPOSE 80

WORKDIR /app

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN set -ex \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

RUN apk add --no-cache bash curl && \
    chmod 777 /usr/local/bin/entrypoint.sh && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man

ENTRYPOINT ["entrypoint.sh"]
