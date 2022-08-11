pipeline {
    agent any 
    parameters { 
         string(defaultValue: "1.0.0.0", description: 'Image version ', name: 'imageversion')
               string(defaultValue: "containername", description: 'Container Name ', name: 'containername')
        choice(
            choices: ['Yes' , 'No'],
            description: 'IF you want to Delete existing containers ? ',
            name: 'REQUESTED_ACTION')
        }

stages{
        stage ('DOcker build image using Dockerfile'){
         steps {
            sh 'docker build -t node-sample:${imageversion} . ' 
}
        }

 stage('Test ') { 
            steps {
                sh 'npm test'
                    echo 'testing application'
           
    }
}
     stage('Docker Remove containers') { 
          when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'Yes' }
          }
           steps {
                sh 'docker rm -f $(docker ps -aq)'
            }
        }
   
stage('Delpoy nodejs application') { 
            steps {
                
              sh 'docker run -d -p 3001:3000 --name ${containername} node-sample:${imageversion} '
    }
}
    stage('Publish to ECR') { 
            steps {
                
              script{
                  docker.withRegistry(
                     "https://486949303415.dkr.ecr.us-east-1.amazonaws.com",
                      "ecr:us-east-1:aws-credential"){
                    def myImage = docker.build("node-repo"), 
                    myImage.push("1.0.1")
                  }
    }
}
}
    

}
