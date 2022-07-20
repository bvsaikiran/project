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
                sh "mvn sonar:sonar -Dsonar.host.url=http://18.135.45.158:9000 -Dsonar.login=3f93384c6a8b7d9f9e321dbe416407f2357e8656"
            }
        }

    


        stage('Nexus') {
            steps {
                sh "mvn clean deploy"
            }
        }

    


        stage('Deploy') {
            steps {
                sh "sudo wget --user=admin --password=admin123 http://13.41.162.196:8081/repository/maven-releases/com/web/cal/WebAppCal/1.3.7/WebAppCal-1.3.7.war -P /home/ansible"
                
                sh "sudo cd /home/ansible"
                
                
            }
        }
    }    
}
