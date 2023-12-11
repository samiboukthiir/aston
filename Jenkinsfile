pipeline {
 agent any
 tools{ jdk 'jdk-17' }
 environment { 
DOCKER_TAG = getVersion()
 }
 stages {
 
 stage ('Clone Stage') {
 steps {
 git 'https://github.com/samiboukthiir/aston.git'
 }
 }
 }
}

