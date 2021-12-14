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
  	post {
        	always {
            		archiveArtifacts artifacts: 'target/hellojenkins-1.0.0.jar', fingerprint: true
		} 
        	success {
      			step([$class: 'MinioUploader',
                    		sourceFile: '**/target/*.jar',
                    		bucketName: 'desobucket']) 	
        	}
  	}
}
