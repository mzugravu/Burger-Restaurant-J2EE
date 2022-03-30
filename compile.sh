CLASSPATH=./src:$JBOSS_HOME/modules/system/layers/base/javax/servlet/api/main/jboss-servlet-api_4.0_spec-1.0.0.Final.jar

javac -cp $CLASSPATH -sourcepath src -d ./WEB-INF/classes src/*/*.java

jar cf BurgerINSA.war WEB-INF WebContent/*
cp BurgerINSA.war $JBOSS_HOME/standalone/deployments
