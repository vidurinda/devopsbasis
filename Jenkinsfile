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
  
}
