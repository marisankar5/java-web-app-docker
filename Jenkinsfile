node{
     
    stage('SCM Checkout'){
        git url: 'https://github.com/marisankar5/java-web-app-docker.git',branch: 'main'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven-3.5.6", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      
    } 
    
    
    stage('Build Docker Image'){
        sh 'docker build -t dockerhandson/java-web-app .'
    }
    
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'Docker_Pwd', variable: 'Docker_Hub_Pwd')]) {
          sh "docker login -u mahes05 -p ${Docker_Hub_Pwd}"
        }
        sh 'docker push mahes05/java-web-app'
     }
     
      stage('Run Docker Image In Dev Server'){
        
        def dockerRun = ' docker run  -d -p 8080:8080 --name java-web-app mahes05/java-web-app'
         
         sshagent(['DOCKER_SERVER']) {
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.20.72 docker stop java-web-app || true'
          sh 'ssh  ubuntu@172.31.95.232 docker rm java-web-app || true'
          sh 'ssh  ubuntu@172.31.95.232 docker rmi -f  $(docker images -q) || true'
          sh "ssh  ubuntu@172.31.95.232 ${dockerRun}"
       }
       
    }
     
     
}
