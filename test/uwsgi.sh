#!/usr/bin/env bash


uwsgi -s :9090 -w myapp -M -p 4 -t 30 --limit-as 128 -R 10000 -d uwsgi.log

/usr/local/bin/uwsgi --master --emperor /etc/uwsgi/vassals --die-on-term --uid centos --gid centos --logto /var/log/uwsgi/emperor.log

/usr/local/bin/uwsgi --master --emperor /etc/uwsgi/vassals --die-on-term --uid centos --gid centos --logto /var/log/uwsgi/emperor.log

uwsgi --http :9090 --wsgi-file foobar.py --master --processes 4 --threads 2 --stats 127.0.0.1:9191


uwsgi --gevent 100 --gevent-monkey-patch --http :9090 -M  --processes 4 --wsgi-file wsgi.py