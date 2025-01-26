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
   


    
    stage('Login to AWS ECR') {
            steps {
                script {
                    // Authenticate Docker to ECR using AWS CLI
                    sh """
                    aws ecr get-login-password --region ${ap-southeast-1}  | docker login --username AWS --password-stdin ${127214163347}.dkr.ecr.${ap-southeast-1}.amazonaws.com
                    """
                }
            }
        }
  }
}
