# Redis Docker image

[![Docker Hub](https://img.shields.io/badge/docker-redis.dockerfile-blue.svg)](https://hub.docker.com/r/chusiang/redis.dockerfile/) [![microbadger](https://images.microbadger.com/badges/image/chusiang/redis.dockerfile.svg)](https://microbadger.com/images/chusiang/redis.dockerfile "Get your own image badge on microbadger.com")

Redis is an open source key-value store that functions as a data structure server. [» more](https://hub.docker.com/r/library/redis/)


## Configure

1. Modify the `redis.conf` (I get it from [here](https://raw.githubusercontent.com/antirez/redis/3.0/redis.conf)).
    
    * `requirepass`: AUTH password, not setting yet.
    * `logfile`: log path, I modify to `/data/redis-server.log`.

## Run

Run Redis server with my docker.

    $ docker run --name some-redis -p 6379:6379 -d chusiang/redis

    
or
    
    $ make run

## Testing with telnet.

Check the service with `telnet` and 6379 port.

    $ telnet 127.0.0.1 6379
    Trying 127.0.0.1...
    Connected to 127.0.0.1.
    Escape character is '^]'.
    MONITOR
    +OK (<Ctrl>+])
    telnet>

## Usage

This is a sample with redis-cli.

    $ redis-cli -h 127.0.0.1
    127.0.0.1:6379> get 1
    (nil)
    127.0.0.1:6379>

more the redis-cli.

    $ redis-cli --help
    redis-cli 2.8.4
    
    Usage: redis-cli [OPTIONS] [cmd [arg [arg ...]]]
      -h <hostname>      Server hostname (default: 127.0.0.1)
      -p <port>          Server port (default: 6379)
      -s <socket>        Server socket (overrides hostname and port)
      -a <password>      Password to use when connecting to the server
      -r <repeat>        Execute specified command N times
      -i <interval>      When -r is used, waits <interval> seconds per command.
                         It is possible to specify sub-second times like -i 0.1
      -n <db>            Database number
      -x                 Read last argument from STDIN
      -d <delimiter>     Multi-bulk delimiter in for raw formatting (default: \n)
      -c                 Enable cluster mode (follow -ASK and -MOVED redirections)
      --raw              Use raw formatting for replies (default when STDOUT is
                         not a tty)
      --csv              Output in CSV format
      --latency          Enter a special mode continuously sampling latency
      --latency-history  Like --latency but tracking latency changes over time.
                         Default time interval is 15 sec. Change it using -i.
      --slave            Simulate a slave showing commands received from the master
      --rdb <filename>   Transfer an RDB dump from remote server to local file.
      --pipe             Transfer raw Redis protocol from stdin to server
      --pipe-timeout <n> In --pipe mode, abort with error if after sending all data
                         no reply is received within <n> seconds.
                         Default timeout: 30. Use 0 to wait forever.
      --bigkeys          Sample Redis keys looking for big keys
      --eval <file>      Send an EVAL command using the Lua script at <file>
      --help             Output this help and exit
      --version          Output version and exit
    
    Examples:
      cat /etc/passwd | redis-cli -x set mypasswd
      redis-cli get mypasswd
      redis-cli -r 100 lpush mylist x
      redis-cli -r 100 -i 1 info | grep used_memory_human:
      redis-cli --eval myscript.lua key1 key2 , arg1 arg2 arg3
      (Note: when using --eval the comma separates KEYS[] from ARGV[] items)
    
    When no command is given, redis-cli starts in interactive mode.
    Type "help" in interactive mode for information on available commands.

## License

View [license information](http://redis.io/topics/license) for the software contained in this image.

