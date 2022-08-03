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
    
        stage('Docker Images') { 
            steps {
                sh 'docker images'
            }
        }
    stage('Test ') { 
            steps {
              sh 'docker ps -a'
    }
}
     //stage('Docker Remove containers') { 
          when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'Yes' }
            }
            steps {
                sh 'docker rm -f $(docker ps -aq)'
            }
        }
      stage('docker Containers') { 
            steps {
                sh 'docker run -d -p 3001:3000 --name ${containername} node-sample:${imageversion} '
            }
        }
stage('Delpoy nodejs application') { 
            steps {
              sh 'docker ps -a'
    }
}
    
}
    // post{
     //   always{
      //      mail to: "raob6730@gmail.com",
       //     subject: "Test Email",
        //    body: "Test"
        //}
    //}

}
