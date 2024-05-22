# Rocky Linux 8(systemd)

#####  Docker Buildx 빌더를 만들고 활성화
```
docker buildx create --use
```
##### Buildx를 사용하여 지정된 플랫폼에 대한 이미지를 빌드하고 레포지토리에 푸시
```
docker buildx build --platform linux/amd64,linux/arm64 --tag anti1346/rocky8:systemd --no-cache --push .
```
##### 빌드된 이미지 PULL
```
docker pull anti1346/rocky8:systemd
```
##### 이미지의 아키텍처를 확인
```
docker inspect anti1346/rocky8:systemd --format='{{.Architecture}}'
```
##### Docker 컨테이너를 백그라운드에서 실행
```
docker run -d --privileged --name rocky8-systemd anti1346/rocky8:systemd
```
##### Docker 컨테이너에 대한 대화형 bash 쉘 세션을 시작
```
docker exec -it rocky8-systemd bash
```
