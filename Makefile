obj-m += minigmp.o
minigmp-objs := mini-gmp.o export.o
EXTRA_CFLAGS+=-DKERNEL=1

all:
	 make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	 make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
