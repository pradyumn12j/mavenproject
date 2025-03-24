pipeline
{
  agent any
  stages
  {
    stage("Git checkout")
    {
    steps{git 'https://github.com/pradyumn12j/mavenproject.git' }}

    stage ("Compile")
    {
      steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JAVA', maven: 'HOME_MVN', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn compile'
}}
    }
    
    stage ("build")
    {
      steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JAVA', maven: 'HOME_MVN', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn package'
}}
    }
    stage ("validation")
    {
      steps{
    
        sh 'mvn -f pom.xml -v'
        
      
}}
    
    stage ("verify")
    {
      steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JAVA', maven: 'HOME_MVN', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn verify'
}}
    }
    stage ("package")
    {
      steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JAVA', maven: 'HOME_MVN', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn package'
}}
    }
  }
}
