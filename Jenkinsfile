node{
  stage('Checout code'){
    git "https://github.com/vidurinda/devopsbasis"
  }
  
  stage('Build package'){
    def mvnHome=tool name: 'maven-3', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
  
  stage('SonarQube analysis') {
    def mvnHome=tool name: 'maven-3', type: 'maven'
    withSonarQubeEnv('sonar-6') { 
      sh "${mvnHome}/bin/mvn sonar:sonar"
    }
  }
  
  stage("Quality Gate"){
          timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
      }
  
  sshagent (credentials: ['tomcat-dev']) {
    sh 'scp -o StrictHostKeyChecking=no target/*.war az-user@23.99.213.164:/opt/apache-tomcat-9.0.60/webapps/'
  }
  
}
