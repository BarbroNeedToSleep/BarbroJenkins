pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/NeedToSleep/BarbroJenkins.git'
            }
        }
	stage('newman') {
            steps {
                sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
	        }
          stage('robot') {
           steps {
               sh 'robot -d results --variable BROWSER:headlesschrome car.robot'
           }
           post {
               always {
                   script {
                         step(
                               [
                                 $class              : 'RobotPublisher',
                                 outputPath          : 'results',
                                 outputFileName      : '**/output.xml',
                                 reportFileName      : '**/report.html',
                                 logFileName         : '**/log.html',
                                 disableArchiveOutput: false,
                                 passThreshold       : 50,
                                 unstableThreshold   : 40,
                                 otherFiles          : "**/*.png,**/*.jpg",
                               ]
                         )
                   }
               }
           }
       }
       }
    }
