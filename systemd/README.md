# Rocky Linux 8(systemd)

```
docker buildx create --use
```
```
docker buildx build --platform linux/amd64,linux/arm64 --tag anti1346/rocky8:systemd --no-cache --push .
```
```
docker pull anti1346/rocky8:systemd
```
```
docker inspect anti1346/rocky8:systemd --format='{{.Architecture}}'
```
```
docker run -d --privileged --name rocky8-systemd anti1346/rocky8:systemd
```
```
docker exec -it rocky8-systemd bash
```
