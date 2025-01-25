pipeline
{
  agent any 
  stages
  {
    stage("GIT checkout")
    {
    steps{git 'https://github.com/pradyumn12j/mavenproject.git'}}
  

    stage("validattion step")
    {
    steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JDK', maven: 'HOME_MAVEN', mavenSettingsConfig: '', traceability: true) {
    sh('mvn test')
}
  }}

  
    stage("package step")
    {
    steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JDK', maven: 'HOME_MAVEN', mavenSettingsConfig: '', traceability: true) {
    sh('mvn package')
}
  }}

    stage("install step")
    {
    steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JDK', maven: 'HOME_MAVEN', mavenSettingsConfig: '', traceability: true) {
    sh('mvn install')
}
  }}

   
    stage("docker build:")
    {
      steps{sh 'docker build -t pradyumnjawale/test_maven:15.15 .'}}
   
    stage("Docker build")
    {
      steps{withDockerRegistry(credentialsId: 'DOCKER', url: 'https://index.docker.io/v1/') {
     sh ' docker push pradyumnjawale/test_maven:15.15'
}

      }
    }
   }
}

