pipeline {
    agent any

    stages {
  

        stage('Compile') {
            steps {
                sh "mvn compile"
            }
        }

    


        stage('Testing') {
            steps {
                sh "mvn test"
            }
        }

    

 
        stage('Sonar') {
            steps {
                sh "mvn sonar:sonar -Dsonar.host.url=http://13.41.77.92:9000 -Dsonar.login=3f93384c6a8b7d9f9e321dbe416407f2357e8656"
            }
        }

    


        stage('Nexus') {
            steps {
                sh "mvn clean deploy"
            }
        }
        
           stage('Deploy') {
            steps {
                sshagent(['deploy_user']) {
                    
                 sh "scp -o StrictHostKeyChecking=no  **/*.war ec2-user@172.31.36.232:/home/ec2-user/apache-tomcat-8.5.81/webapps" 
    
                }
            }
        }

    }    
}
