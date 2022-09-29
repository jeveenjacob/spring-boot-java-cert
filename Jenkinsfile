pipeline {
    agent none
  stages {
    stage('Spring boot sample Deployment') {
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
                        kubectl apply -f ./java-cert.yaml
                         """,
                      )
                echo "Deployment done"      
            }
        }
    }
}