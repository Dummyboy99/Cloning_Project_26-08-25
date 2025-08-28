pipeline {
    agent any
    stages {
        stage('github validation') {
            steps {
                // Always specify branch, since GitHub repos default to 'main' now
                git branch: 'main', url: 'https://github.com/Dummyboy99/Cloning_Project_26-08-25.git'
            }
        }

        stage('compiling the code') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('testing the code') {
            steps {
                sh 'mvn test'
            }
        }

        stage('qa of the code') {
            steps {
                sh 'mvn pmd:pmd'
            }
        }

        stage('package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('deploy the project on tomcat') {
            steps {
                // Adjust path: your workspace is "Rohank-pipeline", not "pipeline"
                sh 'sudo mv target/addressbook.war /home/ubuntu/apache-tomcat-8.5.100/webapps/'
            }
        }
    }
}
