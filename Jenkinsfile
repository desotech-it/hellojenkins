pipeline {
	agent any
	tools {
		maven 'M3'
	}
	stages {
		stage('Build') {
			steps {
				sh "'${M2_HOME}/bin/mvn' clean package spring-boot:repackage"
			}
		}
	}
}
