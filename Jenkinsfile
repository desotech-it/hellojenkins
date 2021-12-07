pipeline {
	agent any

	stages {
		def mvnHome
		stage('Preparation') {
			mvnHome = tool 'M3'
		}
		stage('Build') {
			if (isUnix()) {
				sh "'${mvnHome}/bin/mvn' -DpackageType=${params.packageType} clean package spring-boot:repackage"
			} else {
				bat(/"${mvnHome}\bin\mvn" -DpackageType=${params.packageType} clean package spring-boot:repackage/)
			}
		}
	}
}
