pipeline {
	agent any
	tools {
		maven 'M3'
	}
	stages {
		stage('Build') {
			steps {
				script {
					if (isUnix()) {
						sh "'${M2_HOME}/bin/mvn' -DpackageType=${params.packageType} clean package spring-boot:repackage"
					} else {
						bat(/"${M2_HOME}\bin\mvn" -DpackageType=${params.packageType} clean package spring-boot:repackage/)
					}
				}
			}
		}
	}
}
