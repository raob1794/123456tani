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
    stage ('Pushing image to ECR')
    {
        steps
        {
            sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/k0d4i8o3'
            sh 'docker tag node-sample:${imageversion} public.ecr.aws/k0d4i8o3/node-sample:${imageversion}'
            sh 'docker push public.ecr.aws/k0d4i8o3/node-sample:${imageversion}'
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
                
              step([$class: 'DockerBuilderPublisher', cleanImages: false, cleanupWithJenkinsJobDelete: false, cloud: '', dockerFileDirectory: '', fromRegistry: [credentialsId: 'ecr:us-east-1:aws-credentials'], pushCredentialsId: 'ecr:us-east-1:aws-credentials', pushOnSuccess: true, tagsString: 'public.ecr.aws/k0d4i8o3/node-sample:${imageversion}'])
    }
}
}
    

}
