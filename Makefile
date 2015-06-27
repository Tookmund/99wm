# make 99wm - Jacob Adams (c)2015+others a x9wm fork/twist

CC := gcc
DESTDIR := /usr/local/bin
LIBS := -lX11 -lXext
FILES := 99wm.c 99wm.h
PROG := 99wm
XSESSIONS := /usr/local/share/xsessions/

99wm: ${FILES}
	${CC} -O3 99wm.c ${LIBS} -o ${PROG}

debug: ${FILES}
	${CC} -Wall -g -D DEBUG 99wm.c ${LIBS} -o debug


install: 99wm xsession
	cp ${PROG} ${DESTDIR}/${PROG}

.PHONY: uninstall clean xsession

uninstall:
	rm -f ${DESTDIR}/${PROG} ${XSESSIONS}/99wm.desktop

clean:
	rm -f ${PROG} debug

xsession:
	mkdir -p ${XSESSIONS}
	cp 99wm.desktop ${XSESSIONS}
