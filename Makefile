all: mytest

#ARCH=arm
#CC="/home/albert/buildroot/buildroot-2017.11/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
%.o: %.c 
	$(CC) -c -rdynamic -o $@ $< $(CFLAGS)

mytest: mytest.o
	$(CC) -dl -o mytest mytest.o

clean:
	rm -f *.o mytest