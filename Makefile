obj-m += mini-gmp.o
EXTRA_CFLAGS+=-DKERNEL=1

all:
	 make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	 make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean