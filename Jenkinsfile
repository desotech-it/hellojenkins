pipeline {
	agent any
	environment {
		DOCKER_IMAGE_NAME = 'brainplot/hellojenkins'
		DOCKER_IMAGE_TAG = 'latest'
		DOCKER_REGISTRY = 'https://registry.hub.docker.com'
		DOCKER_NODE_IP = '10.10.190.10'
		TARGET_PORT = 8080
		EXTERNAL_PORT = 9000
	}
	stages {
		stage('Build Docker Image') {
			steps {
				script {
					app = docker.build("${DOCKER_IMAGE_NAME}")
				}
			}
		}
		stage('Push Docker Image') {
			steps {
				script {
					docker.withRegistry("${DOCKER_REGISTRY}", 'docker_hub_login') {
						app.push("${env.BUILD_NUMBER}")
						app.push("${DOCKER_IMAGE_TAG}")
					}
				}
			}
		}
		stage('DeployToProduction') {
			steps {
				input 'Deploy to Production?'
				milestone(1)
				script {
					sh("docker pull ${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
					try {
						sh("docker stop hellojenkins")
						sh("docker rm hellojenkins")
					} catch (err) {
						echo: 'caught error: $err'
					}
					sh("docker run --restart always --name hellojenkins -p $EXTERNAL_PORT:$TARGET_PORT -d ${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
				}
			}
		}
	}
}
