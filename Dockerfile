FROM redis
COPY redis.conf /data/redis.conf
EXPOSE 6379
CMD [ "redis-server", "/data/redis.conf" ]
