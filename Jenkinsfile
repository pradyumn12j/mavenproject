pipeline
{
  agent any 
  stages
  {
    stage("GIT checkout")
    steps{git 'https://github.com/pradyumn12j/mavenproject.git'}
  }
  {
    stage("validattion step")
    withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JDK', maven: 'HOME_MAVEN', mavenSettingsConfig: '', traceability: true) {
    sh('mvn test')
}
  }
}
