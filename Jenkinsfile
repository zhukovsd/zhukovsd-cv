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
        sh '''
			chmod a+x deploy.sh
			bash $WORKSPACE/deploy.sh
		'''
      }
    }	
  }
}
