# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /Users/rajeshnair/projects/PersonalVimrc/.git-completion.bash
source /Users/rajeshnair/projects/PersonalVimrc/.git-prompt.sh
PS1='\t \W $(__git_ps1 " (%s)")\$ '


# User specific aliases and functions
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export SPARK_HOME="/Users/rajeshnair/installs/spark-1.4.0-bin-custom-spark"
export ORACLE_HOME="/Applications/oracle/product/instantclient_64/11.2.0.4.0"
export MAVEN_OPTS="-Xms128m -Xmx2048m -XX:MaxPermSize=1024m"
export M2_HOME=/Users/rajeshnair/devenv/apache-maven-3.2.5
export M2=$M2_HOME/bin
export PATH=$GOBIN:/usr/local/homebrew/bin:$PATH
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
export OREO_PARAMS="--enable-auth --enable-acp --enable-bet9ja --enable-ussd-facade --enable-gateway --enable-graphql-wip --enable-graphql --enable-spa
--enable-dashboard --enable-bank-inbound --enable-flutterwave --enable-paystack --enable-moneywave --test=true --port=8080 --db-host=localhost
--secure-cookie=false --callback-host=http://$CALLBACK_HOST:8080 --nossl --ipay-url=http://localhost:8083  --safaricom-url=http://localhost:8097
--kazang-url=http://localhost:8089 --mock-vault --twilio-url=http://localhost:8084/ --infobip-url=http://localhost:8087/ --enable-za --deny-topup-sec=10
--pending-exp-sec=3 --monitor-interval-sec=2 --rave-url=http://localhost:8085 --log-level=debug --paystack-url=http://localhost:8099
--cowrie-url=http://localhost:8086 --gtgaps-url=http://localhost:8066 --etranzact-url=http://localhost:8092 --peach-url=http://localhost:8093/v1
--peach-source-url=http://localhost:8093/v1/paymentWidgets.js?checkoutId= --threeline-url=http://localhost:8094 --flutterwave-url=http://localhost:8088
--bet9ja-url=http://localhost:8095 --moneywave-url=http://localhost:8098 --redis-host=localhost:6379"


export EDITOR=vim
export CLASSPATH=".:/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH"
export DERBY_OPTS='-Dij.database="jdbc:derby://localhost:1527/wactionrepos;user=waction;password=waction;create=true"'
export ANDROID_HOME=/usr/local/opt/android-sdk

export PRODUCT=/Users/rajeshnair/go/src/gitlab.services.ams.osa/opera-mobile/opera-pay
alias bt='cd $PRODUCT'
alias ll='ls -l'
alias mm='./bld.sh'
alias gti='git'
alias gut='git'
alias antlr4='java -jar /usr/local/lib/antlr-4.0-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias vimgo='vim -u ~/.vimrc.go'
alias searchgo='find . -name "*.go" | xargs grep'
alias gomast='git checkout master'

#Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


### ANTLR specific settings
export CLASSPATH=".:/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.0-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias eclipse='/Users/rajeshnair/devenv/eclipse/eclipse'

# Autocomplet Makefile targets
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make


### My own commands
function switchToJava8() {
    export JAVA8_HOME=`/usr/libexec/java_home -v 1.8`
    export JAVA_HOME=$JAVA8_HOME
}
export -f switchToJava8

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



[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export COLUMNS="120"

export PATH="$PATH:/Users/rajeshnair/ACLI"
