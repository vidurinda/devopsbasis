node{
  stage('Checout code'){
    git "https://github.com/vidurinda/devopsbasis"
  }
  
  stage('Build package'){
    def mvnHome=tool name: 'maven-3', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
}
