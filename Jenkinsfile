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

   
        
    stage('Login to AWS ECR') {
            steps {withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'awskey', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {

                    // Authenticate Docker to ECR using AWS CLI
                    sh 'aws ecr get-login-password --region ap-southeast-1  | docker login --username AWS --password-stdin 127214163347.dkr.ecr.ap-southeast-1.amazonaws.com'
                }
            }
        }
    stage('docker build'){
      steps {
        sh('docker build -t pradyumnjawale/test_maven:10.15 .')}
    }
    stage('Tag Docker Image') {
            steps {
                script {
                    // Tag the Docker image with the ECR repository URI
                    sh 'docker tag pradyumnjawale/test_maven:10.15 127214163347.dkr.ecr.ap-southeast-1.amazonaws.com/pradyumnjawale:maven:10.15'}
            }
        }
    stage('docker push'){
      steps{
        sh 'docker push 127214163347.dkr.ecr.ap-southeast-1.amazonaws.com/pradyumnjawale:maven:10.15'
      }
    }
  }
}
