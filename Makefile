all: update

update:
	git pull -v
	docker pull jenkins/jenkins:lts

run:
	docker build -t jenkins-practice -f Dockerfile ./
	docker run -i -p 8080:8080 -p 50000:50000 -v $(CURDIR)/jenkins_home:/var/jenkins_home jenkins-practice
