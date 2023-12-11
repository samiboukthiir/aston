pipeline {
 agent any
 tools{ jdk 'JDK8' }
 environment { 
JAVA_HOME = '/usr/lib/jvm/java-1.8.0-openjdk-amd64'
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

