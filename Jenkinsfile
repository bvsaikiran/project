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
                sh "mvn sonar:sonar -Dsonar.host.url=http://13.41.222.67:9000 -Dsonar.login=3f93384c6a8b7d9f9e321dbe416407f2357e8656"
            }
        }

    


        stage('Nexus') {
            steps {
                sh "mvn clean deploy"
            }
        }
        
           stage('Deploy') {
            steps {
                
                sh "sudo wget --user=admin --password=admin123 http://18.133.28.224:8081/repository/maven-releases/com/web/cal/WebAppCal/1.2.7/WebAppCal-1.2.7.war -P /home/ec2-user"
      
                //sshagent(['deploy_user']) {
                    
                 // sh "scp -o StrictHostKeyChecking=no  **/*.war ec2-user@172.31.36.232:/home/ec2-user/apache-tomcat-8.5.81/webapps" 
    
               // }
            }
        }
        
                stage('Docker') {
                 steps {
                     sh "docker build -t bvsaikiran/tomcatapp ."
            }
        }
        
        stage("Docker Login"){
        withCredentials([string(credentialsId: 'Docker_Hub', variable: 'PASSWORD')]) {
            sh 'docker login -u bvsaikiran -p $PASSWORD'
        }
    } 
        
        stage("Push Image to Docker Hub"){
        sh 'docker push  bvsaikiran/tomcatapp'
    }

    }    
}
