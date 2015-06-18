# make 99wm - Jacob Adams (c)2015+others a x9wm fork/twist

CC := gcc
DESTDIR := /usr/local/bin
LIBS := -lX11 -lXext
FILES := 99wm.c 99wm.h
PROG := 99wm
99wm: ${FILES}
	${CC} -O3 99wm.c ${LIBS} -o ${PROG}

debug: ${FILES}
	${CC} -Wall -g 99wm.c ${LIBS} -o debug

uninstall:
	rm -f ${DESTDIR}/${PROG}

install: 99wm
	cp ${PROG} ${DESTDIR}/${PROG}

clean:
	rm -f ${PROG} debug
