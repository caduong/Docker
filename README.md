# Docker

*
----------------------------------

* Check images: 
	docker images -> check images
-----------------------------------
* Work a image
	docker run -ti ubuntu:latest bash
	pwd --> check current location
	cat /etc/lsb-release --> check info OS running images  
	docker ps  --> check container running
	touch "namefile"  --> create a file.
----------------------------------

* loop Docker 
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
----------------------------------
