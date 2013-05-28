# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export M2_HOME=/usr/local/apache-maven-3.0.5
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export EDITOR=vim

export BUILDTOP=/home/rajeshnair/workspace
alias bt='cd $BUILDTOP'

findproc() {
	ps aux | grep $1 | grep -v grep
}

function findprocid() {
	ps aux | grep $1 | grep -v grep | tr -s ' ' | cut -d " " -f 2
}

function updatesvn() {
	SVN_ROOT='/home/rajeshnair/workspace';
	cd $SVN_ROOT;

	for D in `ls -d */`
		do
			echo "===========Udpating $D==================="
			cd $D;
			svn up;
			cd -;
		done

}

function listchangedrepos() {
	SVN_ROOT='/home/rajeshnair/workspace';
	cd $SVN_ROOT;

	for D in `ls -d */`
		do
			echo "===========Checking  $D==================="
			cd $D;
			svn st;
			cd -;
		done
}

function foreachrepo() {
	SVN_ROOT='/home/rajeshnair/workspace';
	cd $SVN_ROOT;
	echo "===========Trying to execute $1 in each repo===================="

	for D in `ls -d */`
		do
			echo "===========Checking  $D==================="
			cd $D;
			`$1`;
			cd -;
		done
}
