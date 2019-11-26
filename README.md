# Docker

# Install docker 
	https://docs.docker.com/install/linux/docker-ce/ubuntu/

--------------------------------------------------------------------

# Check images: 
	docker images -> check images
---------------------------------------------------------------------

# Work a image
	docker run -ti ubuntu:latest bash
	pwd --> check current location
	cat /etc/lsb-release --> check info OS running images  
	docker ps  --> check container running
	touch "namefile"  --> create a file.
--------------------------------------------------------------------

# Loop Docker 
	1. Run image
		docker run -ti ubuntu bash
	2. custom components
		touch README.txt
	3. exit image
		exit
	4. Check container run last (get container ID)
		docker ps -l
	5. Commit container
		docker commit "ID" "set name repository"
	<!-- 6. Check images
		docker images
	7. Change name repository 
		docker tag "ID" "name need change" -->
	8. Check again and run .
--------------------------------------------------------------------

# Process in Container
	docker run -ti --rm ubuntu sleep 3 
		Note: "rm": container will remove after when stop.

	docker run -ti ubuntu bash -c "sleep 3; echo job finished" --rm 
	
	docker run -ti -d "name of images" 
		Note: run in the backgroud.

	docker attach "name or id of container" 
		Note: access into container ruuning in the backgroud.
			  use " Ctrl + p" or "Ctrl + q" --> exit container but it running in the backgroud.
	

	docker exec -ti "name of container running"  
			Note: multi access into a container. 
--------------------------------------------------------------------

# Command line Docker container.
	docker create -ti ubuntu bash 

	docker ps -a  
		Note: check docker created.

	docker start -ai "container ID". 
		Note: run a container created.

	docker stop "ID container" 

	docker restart "ID container"

	docker cp "name file" "patch" 
		ex: docker cp ebook.txt sharp_bell:/root/ebook.txt
	
	docker inspect "ID container"  
		Note: get all info of container. 

	docker inspect "ID container" | grep IPAddr   
		Note: "IPAddr" is keywork find in all info of container.

	docker rm "ID or name of container" 
		Note: Must stop container before remove.
		
	docker rm -f "ID or name of container" 
		Note: remove container and not need stop container.

	docker kill "ID or name of container" 
--------------------------------------------------------------------

# Manage container.
	docker run --name "name for container" -d ubuntu bash -c "cat /etc/sysctl.conf"
		
	docker logs "name or ID of container"

	docker run --memory "memory limit" ubuntu bash   
		Note:limit memory for a container.

	docker run --cpu-shares=" % CPU" ubuntu bash

	docker run --cpu-period=4000 --cpu-quota=20000 ubuntu bash
		Note: If 1 CPU, container occupy 50% CPU each 40ms.
--------------------------------------------------------------------

# Network in container.
	docker run --rm -ti -p 111:111 -p 222:222 --name reply ubuntu:14.04 bash
		Note: Open port internal 111 and external 111 ( -p "internal":"external")
			  when receiver data forward data form port 222 in container and port 222 out container.
	nc -l 111 | nc -l 111

	docker run -p 111:222/upd 
		. Open port UDP.
--------------------------------------------------------------------

# Communcation container
	docker run -ti --rm --name server ubuntu:14.04 bash	
		Note: not port.
	
	nc -l 111
	----------------------------------------------------------------------------
	docker run --rm -ti --link server --name client ubuntu:14.04 bash
		Note: "--link" connect from server.

	nc server 111

	=> High risk because if a container change name or stop -> connect fail. 
--------------------------------------------------------------------

# Communication dynamic in container.
	docker network create "name network"  
		Note: create a network.
		ex: docker network create xfinty

	docker run --rm -ti --net=xfinty --name server ubuntu:14.04 bash
	
	nc -l 111
	nc -vlkp 8080
		Note: Open port listen is 111 or 8080.
	--------------------------------------------------------------------------------------

	docker run --rm -ti --link server --net=xfinty --name client ubuntu:14.04 bash

	nc server 111
--------------------------------------------------------------------

# Docker registry
	docker search "option" 
		ex: docker search ubuntu  
	docker login 
	docker pull "name images"
	docker push caduong/image-1:v1.0
--------------------------------------------------------------------

# Manage image
	docker images 
		Note: List all images have in PC.

	docker commit "ID container" "name need change"
		Note: Change name when commit  
			  Can add tag for container when commit, here is EX: docker commit d5388hhjdf8 ubuntu-custom-1:v1.0	
	Rull when set name
		registry.repo.com:port/organization/image-name:version-tag

	4.Tag for images
		docker tag "ID images" "Tag change"
			EX: docker tag 5ff9ded2fd93 caduong/php-custom:v1.0
	
	5.Push images
		docker push "name repository"
			EX: docker push caduong/php-custom
--------------------------------------------------------------------

# import and export images
	1.Compress images
		docker save -o backup-images.tar.gz fedora:latest debian hello-world
			Note: "-o": output 

	2.Decompress images
		docker load -i backup-images.tar.gz
			Note: "-i": input
--------------------------------------------------------------------

# Volume 
	1.Host <-> container    
		docker run -ti -v "Path on HOST":"path on container" ubuntu bash
			EX: docker run -ti -v /home/caduong/Documents/Learning_Web/Docker/host_data:/container_data ubuntu bash

	2.Container <-> container 
		docker run -ti --name pc1 -v /share ubuntu bash  --> PC pub

		docker run -ti --name pc2 --volumes-from pc1 ubuntu bash  --> PC sub
--------------------------------------------------------------------

# Build Dockerfile
	1.Build images form dockerfile.
		docker build -t "name image after build" .
			Note: "." find file dockerfile at folder current. 
				  "-t" tag.

# Command in Dockerfile
	1. from
		Note: commnad the first in file dockerfile. 

	2. maintainer 
		Note: define infor of author 
		EX: MAINTAINER "name author" <"gmail author"> 	

	3.RUN
		Note:
		EX: RUN mkdir/folder

	4. ADD
		4.1. add local file
			NOTE:
			EX: ADD data.txt/data.txt
		4.2. add content of file .tar
			NOTE: compress file .tar into folder nominated
			EX: ADD source-code.tar.gz/src/
		4.3. add file form path 
			NOTE: 
			EX: ADD http://web......../data/

	5. ENV	
		NOTE: 
		EX: ENV LOG_FOLDER=/app_dirs/logs/
			ENV HTTPS_PORT=99

	6. ENTRYPOINT and CMD

	7. EXPOSE
		NOTE: open port
		EX: EXPOSE 2000

	8. VOLUME
		NOTE: limit share folder or file between host and container because it can true on my PC but not true on pc other. 
		EX: VOLUME ["/host/path" "/container/path/"] --> share folder host and container.
			VOLUME ["/folder/"] --> share folder between container.

	9. WORKDIR
		NOTE: nominate folder when container run same as command "cd"
		EX: WORKDIR /temp/ 

	10. USER
		NOTE: determined account container will run. 
		EX: USER bob 
