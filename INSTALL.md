#Source
https://www.indellient.com/blog/how-to-dockerize-an-angular-application-with-nginx/#Writing-a-Dockerfile

#1. Create Build
docker build -t angular-nginx-image:v1  .

#2. Create Container
docker run --name angular-nginx-container -v ${PWD}:/usr/share/nginx/html -d -p 8081:80 angular-nginx-image:v1

#3. NPM install
- docker exec -it angular-nginx-container bash
- execute `./dev_install.sh`

##4. Run Container
- docker start angular-nginx-container && docker exec -it angular-nginx-container bash

## IMAGES
#Show all images
docker images -a

#Remove image
docker rmi Image Image

#Remove all images
docker rmi $(docker images -a -q)

## CONTAINERS
#Show all containers
docker ps -a

#Remove container
docker rm ID_or_Name ID_or_Name

#Remove all containers
docker rm $(docker ps -a -f status=exited -q)
