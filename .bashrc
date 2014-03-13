# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.git-completion.bash
source ~/.git-prompt.sh
PS1='\t \W $(__git_ps1 " (%s)")\$ '

# User specific aliases and functions
export M2_HOME=/Users/rajeshnair/devenv/apache-maven-3.0.5
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export EDITOR=vim
export CLASSPATH=".:/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH"

export DERBY_OPTS='-Dij.database="jdbc:derby://localhost:1527/wactionrepos;user=waction;password=w@c10n;create=true;"'

export BUILDTOP=/home/rajeshnair/workspace
alias bt='cd $BUILDTOP'
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

findproc() {
	ps aux | grep $1 | grep -v grep
}

function findprocid() {
	ps aux | grep $1 | grep -v grep | tr -s ' ' | cut -d " " -f 2
}


