pipeline{
    agent any
    environment{
        registry= "fernandochicote/m17-actividad-jenkins"
        registryCredentials="dockerhub"
        project="m17-actividad-jenkins"
        projectVersion="1.0"
        repository="https://github.com/fernandochicote/m17-actividad.git"
        repositoryCredentials="github"
    }
    stages{
        stage('Clean Workspace'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout code'){
            steps{
                script{
                    git branch: 'main',
                        credentialsId: repositoryCredentials,
                        url: repository
                }
            }
        }

        stage('Build'){
            steps{
                script{
                    dockerImage = docker.build("${registry}:${projectVersion}")
                }
            }
        }

        stage('Test'){
            steps{
                script{
                    try {
                        sh "docker run --name ${project} ${registry}:${projectVersion}"
                    } finally {
                        sh "docker rm ${project}"
                    }

                }
            }
        }

        stage('Deploy'){
            steps{
                script{
                    docker.withRegistry('',registryCredentials ){
                        dockerImage.push("${projectVersion}")
                    }
                }
            }
        }

        stage('Cleaning Up'){
            steps{
                script{
                    sh "docker rmi -f ${registry}:${projectVersion}"
                }
            }
        }

    }
    post{
        always{
            echo 'Registrar Build'
        }
        failure{
            echo 'El pipeline ha fallado.'
        }
    }
}