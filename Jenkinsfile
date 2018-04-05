pipeline {
  agent any
  environment {
    PATH = "/opt/apache-maven-3.5.3/bin:$PATH"
  }
  stages {
    stage('build') {
      steps {
        sh 'xelatex cv.tex'
      }
    }
  }
}
