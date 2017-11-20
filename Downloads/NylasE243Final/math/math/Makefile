simv:	math.c math.v math.tab
	vcs -R -Mupdate math.v -P math.tab -l vcs.log \
		math.c -CFLAGS "-I${VCS_HOME}/include"

DIR = $(shell basename `pwd`)
tar:	clean
	cd ..; tar cvf ${DIR}.tar ${DIR}

clean:
	rm -rf simv* csrc* vcs.log vcs.key *~ unknown*.err