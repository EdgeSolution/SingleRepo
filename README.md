# Introduction In English
## 1. Login your Linux Enviroment, Suppoort On-premise Linux server， VM or cloud VM ，for Example, VM on Alibaba cloud or Microsoft zure
Requirement for AppHub：
CPU >= 1vCPU
Memory >= 2G
Storage >= 20G
Image: Ubuntu 18.04 64-bit or new（Other Linux have not test and verification）

## 2.Open the following port: 
 8080, 30001, 30002, 1883, 5432, 5500, 5901, 9191, 9000 

## 3.login VM, install package: git, docker and docker-compose
Install git 
$ sudo apt update && apt install git 

Install docker-compose
$ curl  -sSL  https://get.daocloud.io/docker | sh                 
$ apt  install  docker-compose                               

Check docker and docker-compose version
$ docker version  			
$ docker-compose  version  	

## 4. dowonload AppHub install file:
$ git clone https://github.com/EdgeSolution/SingleRepo.git

## 5. Install AppHub Server and run server
$ cd SingleRepo/              
$ chmod +x  start.sh                 
$./start.sh   

| Release version  | DockerHub |    docker tag    |
| :------------------- | :-------------- | :----------|
|     V1.0.2         | edgesolution/single-repo:v1.0.2<br />edgesolution/apphub-postgres:v1.0<br />edgesolution/apphub-minio:v1.0 | eidevice/apphub-repo-single-dev:v1.1.1 <br />eidevice/androiddm-postgres-dev:v1.1<br />eidevice/androiddm-minio-dev:v1.1<br /> |
