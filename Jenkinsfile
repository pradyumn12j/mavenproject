pipeline
{
  agent any 
  stages
  {
    stage("validattion step")
    steps{withMaven(globalMavenSettingsConfig: '', jdk: 'JAVA_HOME', maven: 'MAVEN_HOME', mavenSettingsConfig: '', traceability: true) {
      sh 'mvn validate'
     
}}
  }
}
