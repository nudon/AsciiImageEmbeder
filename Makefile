CC = gcc
MATH_CONFIG = "-lm"
IMG_MAGICK_CONFIG = `pkg-config --cflags --libs MagickWand`
TOT_CONFIG = $(MATH_CONFIG) $(IMG_MAGICK_CONFIG)
COMP_FLAGS = -Wall -g
TARGET = askii
BACKEND = picture.o region.o chars.o dataStructures.o myList.o
ALLOBJ = cli_driver.o $(BACKEND)
QTBUILDINFO = "built QtAskii in ./QtAskii/build"

all: $(ALLOBJ)
	$(CC) $(COMP_FLAGS) -o $(TARGET) $(ALLOBJ) $(TOT_CONFIG)

QtAskii: qtStuff.o
	cd ./QtAskii/ && qmake QtAskii.pro -spec linux-g++ CONFIG+=debug CONFIG+=qml_debug
	cd ./QtAskii/build && make
	echo $(QTBUILDINFO)


qtStuff.o: $(BACKEND)
	$(CC) $(COMP_FLAGS)  -c -o $@ $< $(IMG_MAGICK_CONFIG)	

cli_driver.o: cli_driver.c cli_driver.h
	$(CC) $(COMP_FLAGS)  -c -o $@ $< $(IMG_MAGICK_CONFIG)	


pictureWCLI.o: pictureWCLI.c
	$(CC) $(COMP_FLAGS)  -c -o $@ $< $(IMG_MAGICK_CONFIG)	

picture.o: picture.c region.h
	$(CC) $(COMP_FLAGS)  -c -o $@ $< $(IMG_MAGICK_CONFIG)	

region.o: region.c region.h
	$(CC) $(COMP_FLAGS) -c -o $@ $< $(MATH_CONFIG)  $(IMG_MAGICK_CONFIG)

chars.o: characters.c characters.h
	$(CC) $(COMP_FLAGS) -c -o $@ $< $(IMG_MAGICK_CONFIG)	

dataStructures.o: dataStructures.c dataStructures.h
	$(CC) $(COMP_FLAGS) -c -o $@ $< 

myList.o: myList.c myList.h
	$(CC) $(COMP_FLAGS) -c -o $@ $< 

clean:
	rm -f *.o $(TARGET)
	cd ./QtAskii/build && rm -f QtAskii
	cd ./QtAskii/build && make clean

