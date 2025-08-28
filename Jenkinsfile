pipeline {
    agent any
    stages {
        stage('github validation') {
            steps {
            
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
                
                stage('Deploy to Tomcat') {
    steps {
        sh '''
            scp -i /path/to/rohank.ppk target/addressbook.war ec2-user@10.0.1.224:/home/ec2-user/apache-tomcat-8.5.100/webapps/
        '''
    }
}

            }
        }
    }
}
