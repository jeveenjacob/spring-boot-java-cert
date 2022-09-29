pipeline {
    agent none
  environment {
       DOCKER_TOKEN = credentials('jjdocker')
   }
  stages {
    stage('Build and Push Spring Boot App Images ') {
            agent {
                kubernetes {
                    cloud 'kubernetes'
                    label 'kubeagent'
                    defaultContainer 'docker-agent'
                }
            }
            steps {
                script {
                    sh 'pwd'
                    sh 'docker login -u=jeveenj -p=$DOCKER_TOKEN && docker compose -f java-cert-docker-compose.yaml build && docker compose -f java-cert-docker-compose.yaml push'
                    
                }
            }
        }
    stage('Spring Boot Sample Deployment') {
     agent {
            kubernetes {
                cloud 'kubernetes'
                label 'kubeagent'
                defaultContainer 'jnlp'
              }
           }
      steps {
               echo "Deployment started"
               sh(
                  script:
                         """\
                        kubectl delete --ignore-not-found=true -f ./java-cert.yaml
                        kubectl apply -f ./java-cert.yaml
                         """,
                      )
                echo "Deployment done"      
            }
        }
    }
}
