pipeline {
    agent any    
    
    stages {
        
        stage('clone'){
            steps{
                git credentialsId: 'id-gitlab', url: 'https://repo-dev.efi-academy.com/Louda/myapp-j2e-g33.git'
            }
        }
        stage('build'){
            steps{
                
                withMaven(jdk: 'java', maven: 'maven', traceability: true) {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Deploy'){
            steps{
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'id-tomcat', path: '', url: 'http://172.16.33.104:8080')], contextPath: 'appg33', war: '**/*.war'
            }
        }
    }

}