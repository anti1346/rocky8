# rocky8
Rocky Linux 8


#### Rocky Linux 8(systemd)
##### docker build
```
docker build -t anti1346/rocky8:systemd -f Dockerfile.systemd .
```

##### Privileged 모드로 컨테이너 실행
```
docker run -d --privileged --name rocky-systemd anti1346/rocky8:systemd
```
##### 컨테이너에 액세스(접속)
```
docker exec -it rocky-systemd bash

```
##### Privileged 모드로 컨테이너 실행 후 컨테이너에 액세스(접속)
```
docker run -it --rm --privileged --name rocky-systemd anti1346/rocky8:systemd bash
```
