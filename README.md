# Инициализация системы. Systemd и SysV 

Запуск стенда:
```
vagrant up
vagrant ssh
```
### monitor
Проверка статуса сервиса _monitor_:
```
systemctl status monitor.timer
```
Проверка работоспосбоности сервиса _monitor_:
```
tail -f /var/log/messages
```
```
[root@sysd vagrant]#  tail -f /var/log/messages
Jun 21 11:25:04 sysd su: (to root) vagrant on pts/0
Jun 21 11:25:19 sysd systemd: Starting My watchlog service...
Jun 21 11:25:19 sysd root: Sun Jun 21 11:25:19 UTC 2020: I found word, Master!
Jun 21 11:25:19 sysd systemd: Started My watchlog service.
Jun 21 11:25:49 sysd systemd: Starting My watchlog service...
Jun 21 11:25:49 sysd root: Sun Jun 21 11:25:49 UTC 2020: I found word, Master!
Jun 21 11:25:49 sysd systemd: Started My watchlog service.
Jun 21 11:26:19 sysd systemd: Starting My watchlog service...
Jun 21 11:26:19 sysd root: Sun Jun 21 11:26:19 UTC 2020: I found word, Master!
Jun 21 11:26:19 sysd systemd: Started My watchlog service.
Jun 21 11:26:49 sysd systemd: Starting My watchlog service...
Jun 21 11:26:49 sysd root: Sun Jun 21 11:26:49 UTC 2020: I found word, Master!
Jun 21 11:26:49 sysd systemd: Started My watchlog service.
Jun 21 11:27:19 sysd systemd: Starting My watchlog service...
Jun 21 11:27:19 sysd root: Sun Jun 21 11:27:19 UTC 2020: I found word, Master!
Jun 21 11:27:19 sysd systemd: Started My watchlog service.
Jun 21 11:27:49 sysd systemd: Starting My watchlog service...
Jun 21 11:27:49 sysd root: Sun Jun 21 11:27:49 UTC 2020: I found word, Master!
Jun 21 11:27:49 sysd systemd: Started My watchlog service.
Jun 21 11:28:19 sysd systemd: Starting My watchlog service...
Jun 21 11:28:19 sysd root: Sun Jun 21 11:28:19 UTC 2020: I found word, Master!
Jun 21 11:28:19 sysd systemd: Started My watchlog service.
Jun 21 11:28:49 sysd systemd: Starting My watchlog service...
Jun 21 11:28:49 sysd root: Sun Jun 21 11:28:49 UTC 2020: I found word, Master!
```
### httpd

Проверка статуса сервиса _httpd@first, httpd@second_:
```
systemctl status httpd@first
systemctl status httpd@second
```
Проверка работоспособности с помощью:

```
ss -tnulp | grep httpd
```

```
tcp    LISTEN     0      128    [::]:8001               [::]:*                   users:(("httpd",pid=30477,fd=4),("httpd",pid=30476,fd=4),("httpd",pid=30475,fd=4),("httpd",pid=30474,fd=4),("httpd",pid=30473,fd=4),("httpd",pid=30472,fd=4))
tcp    LISTEN     0      128    [::]:8002               [::]:*                   users:(("httpd",pid=30484,fd=4),("httpd",pid=30483,fd=4),("httpd",pid=30482,fd=4),("httpd",pid=30481,fd=4),("httpd",pid=30480,fd=4),("httpd",pid=30479,fd=4))
```


или с помощью _curl_: 
```
curl localhost:8000
curl localhost:8001
```
