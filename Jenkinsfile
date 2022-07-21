pipeline {
    agent any

    stages {
  

        stage('Build') {
            steps {
                sh "mvn package"
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
