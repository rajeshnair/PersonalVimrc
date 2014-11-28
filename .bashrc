# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.git-completion.bash
source ~/.git-prompt.sh
PS1='\t \W $(__git_ps1 " (%s)")\$ '

# User specific aliases and functions
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`


export OSS_ASN1_JAVA=/Users/rajeshnair/projects/oss/asn1pjav/macosx-x86.trial/6.0.0
export OSSINFO=/Users/rajeshnair/projects/oss/asn1pjav/macosx-x86.trial/6.0.0
export OSSINFOTRIAL=$OSS_ASN1_JAVA
export MAVEN_OPTS="-Xms128m -Xmx2048m -XX:MaxPermSize=1024m"
export M2_HOME=/Users/rajeshnair/devenv/apache-maven-3.0.5
export M2=$M2_HOME/bin
export PATH=$PATH:$M2:/Users/rajeshnair/projects/oss/asn1pjav/macosx-x86.trial/6.0.0/bin
export EDITOR=vim
export CLASSPATH=".:/usr/local/lib/antlr-4.0-complete.jar:$OSSINFO/lib/oss.jar:$CLASSPATH"
export DERBY_OPTS='-Dij.database="jdbc:derby://localhost:1527/wactionrepos;user=waction;password=waction;create=true"'


export PRODUCT=/Users/rajeshnair/projects/webaction/Product
export APPLICATION=/Users/rajeshnair/projects/webaction/Applications
alias bt='cd $PRODUCT'
alias ll='ls -l'
alias mm='mvn clean compile | grep ERROR | grep -v "In "'
alias gti='git'
alias antlr4='java -jar /usr/local/lib/antlr-4.0-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'


#Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export DOCKERSRC=~/docker
export VAGRANT_CWD=$DOCKERSRC
export FORWARD_DOCKER_PORT=1


### ANTLR specific settings 
export CLASSPATH=".:/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.0-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias eclipse='/Users/rajeshnair/devenv/eclipse/eclipse'




### My own commands 
function wamk() {
    echo "Compiling $1";
    cd $1;
    mvn clean compile dependency:copy-dependencies install -DskipTests -DexcludeScope=provided
    cd -;

}

findproc() {
	ps aux | grep $1 | grep -v grep
}

function findprocid() {
	ps aux | grep $1 | grep -v grep | tr -s ' ' | cut -d " " -f 2
}

function vpn-connect {
/usr/bin/env osascript <<EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "HPGuardianVPN" 
                if exists VPN then connect VPN
                repeat while (current configuration of VPN is not connected)
                    delay 1
                end repeat
        end tell
end tell
EOF 
}

function vpn-disconnect {
/usr/bin/env osascript <<EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "HPGuardianVPN" 
                if exists VPN then disconnect VPN
        end tell
end tell
EOF
}


function searchClassInJars {

    if [ -z "$2" ]; then 
        export BASEDIR="$BUILDTOP/Platform/target/dependency";
    else    
        export BASEDIR="$2";
    fi    
    for jarfile in `find $BASEDIR -name *.jar`
        do
            jar -tf $jarfile | grep $1 ;
            if [ $? -eq 0 ]; then
                echo "Files found in $jarfile";
            fi    
        done
}

