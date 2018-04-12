pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'xelatex cv.tex'
      }
    }
    stage('deploy') {
      steps {
        sh 'deploy.sh'
      }
    }	
  }
}
