pipeline {
	agent any

	stages {
		stage('Preparation') {
			def mvnHome
			mvnHome = tool 'M3'
		}
		stage('Build') {
			steps {
				if (isUnix()) {
					sh "'${mvnHome}/bin/mvn' -DpackageType=${params.packageType} clean package spring-boot:repackage"
				} else {
					bat(/"${mvnHome}\bin\mvn" -DpackageType=${params.packageType} clean package spring-boot:repackage/)
				}
			}
		}
	}
}
