pipeline {
    agent any
    
    stages {
        
      stage('Clone'){
          steps {
              git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/houcem/myapp-j2e-g32.git'
          }
          
      }        
        stage ('Build'){
            steps {
                withMaven(jdk: 'java', maven: 'maven', traceability: true) {
                       sh 'mvn clean package'
               }
                
            }
        }
        
        stage ('Deploy'){
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'id_tomcat', path: '', url: 'http://172.16.32.100:8080')], contextPath: 'newapp', war: '**/*.war'
            }
        }
        
        
        
        
    }
}