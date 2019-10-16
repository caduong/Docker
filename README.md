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
	docker run -ti --rm ubuntu sleep 3 --> "rm": container will remove after when stop.

	docker run -ti ubuntu bash -c "sleep 3; echo job finished" --rm 
	
	docker run -ti -d "name of images"  -->  run in the backgroud

	docker attach "name or id of container" --> access into container ruuning in the backgroud.

	use " Ctrl + p" or "Ctrl + q" --> exit container but it running in the backgroud.

	docker exec -ti "name of container running" --> multi access into a container. 
--------------------------------------------------------------------

# Command line Docker container.
	docker create -ti ubuntu bash 

	docker ps -a  --> check docker created.

	docker start -ai "container ID". --> run a container created.

	docker stop "ID container" 

	docker restart "ID container"

	docker cp "name file" "patch" 
		ex: docker cp ebook.txt sharp_bell:/root/ebook.txt
	
	docker inspect "ID container" --> all info of container. 

	docker inspect "ID container" | grep IPAddr  --> "IPAddr" is keywork find in all info of container.

	docker rm "ID or name of container" 
		. Note: Must stop container before remove. 

	docker kill "ID or name of container" 
--------------------------------------------------------------------

# Manage container.
	docker run --name "name for container" -d ubuntu bash -c "cat /etc/sysctl.conf"
		
	docker logs "name or ID of container"

	docker run --memory "memory limit" ubuntu bash  --> limit memory for a container.

	docker run --cpu-shares=" % CPU" ubuntu bash

	docker run --cpu-period=4000 --cpu-quota=20000 ubuntu bash
		. If 1 CPU, container occupy 50% CPU each 40ms.
--------------------------------------------------------------------

# Network in container.
	docker run --rm -ti -p 111:111 -p 222:222 --name reply ubuntu:14.04 bash
		. Open port internal 111 and external 111 ( -p "internal":"external")
		. when receiver data forward data form port 222 in container and port 222 out container.
	nc -l 111 | nc -l 111

	docker run -p 111:222/upd 
		. Open port UDP.
--------------------------------------------------------------------

# Communcation container
	docker run -ti --rm --name server ubuntu:14.04 bash	
		. not port.
	
	nc -l 111
	----------------------------------------------------------------------------
	docker run --rm -ti --link server --name client ubuntu:14.04 bash
		. "--link" connect from server.

	nc server 111
	=> High risk because if a container change name or stop -> connect fail. 
--------------------------------------------------------------------

# Communication dynamic in container.
	docker network create "name network" --> create a network
		. docker network create xfinty

	docker run --rm -ti --net=xfinty --name server ubuntu:14.04 bash
	
	nc -l 111
	nc -vlkp 8080

	--------------------------------------------------------------------------------------

	docker run --rm -ti --link server --net=xfinty --name client ubuntu:14.04 bash

	nc server 111