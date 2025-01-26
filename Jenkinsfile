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
   stage('Compile step')
   {
    steps{withMaven(globalMavenSettingsConfig: '', jdk: 'HOME_JDK', maven: 'HOME_MAVEN', mavenSettingsConfig: '', traceability: true) {
    sh('mvn test')
}}
   }

  
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

    stage('docker build'){
      steps {
        sh('docker build -t pradyumnjawale/test_maven:10.15 .')}
    }
    stage('dockoer push') {
            steps {withDockerRegistry(credentialsId: 'DOCKER', url: 'https://index.docker.io/v1/') {
    // some block

                
                    // Tag the Docker image with the ECR repository URI
                   // sh 'docker tag pradyumnjawale/test_maven:10.15 127214163347.dkr.ecr.ap-southeast-1.amazonaws.com/pradyumnjawale:maven_10.16'
                  sh 'docker push pradyumnjawale/test_maven:10.15'    
            }}
        }
   
  }
}
