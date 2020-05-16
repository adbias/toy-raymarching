GXX=gcc.exe
INCLUDE=-Isdl2/include/SDL2/ -Iinclude/ -Ipthreads-win32/include/
LINK=-Lsdl2/lib/ -Lpthreads-win32/lib/ -lmingw32 -lSDL2main -lSDL2 
NTHREADS=6

main.exe: src/main.c bin/rays.o
	$(GXX) -g -o $@  $? $(INCLUDE) $(LINK)

parallel.exe: src/main.c bin/rays.o bin/parallel_render.o 
	$(GXX) -g -o $@ -DPARALLEL -DN_THREADS=$(NTHREADS) $? $(INCLUDE) $(LINK) -lpthreadGC2 

bin/rays.o: src/rays.c
	$(GXX) -g -c -o $@ $? $(INCLUDE) -DN_THREADS=$(NTHREADS)

bin/parallel_render.o: src/parallel_render.c
	$(GXX) -g -c -o $@ $? $(INCLUDE) -DN_THREADS=$(NTHREADS)
