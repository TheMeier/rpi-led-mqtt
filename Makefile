OBJECTS=led-mqtt.o
BINARIES=led-mqtt

PAHO_C_HEADERS ?= /usr/local/include
PAHO_C_LIB ?= /usr/local/lib

RGB_INCDIR=matrix/include
RGB_LIBDIR=matrix/lib
RGB_LIBRARY_NAME=rgbmatrix
RGB_LIBRARY=$(RGB_LIBDIR)/lib$(RGB_LIBRARY_NAME).a
LDFLAGS+=-L$(PAHO_C_LIB) -L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -ljsoncpp -lpaho-mqtt3a -lpaho-mqttpp3 -lrt -lm -lpthread
CPPFLAGS += -I$(PAHO_C_HEADERS)
CXXFLAGS=-Wall -std=c++0x -Wno-deprecated-declarations
DESTDIR=/usr/local
ifdef DEBUG
	CPPFLAGS += -DDEBUG
	CXXFLAGS += -g -O0
else
	CPPFLAGS += -D_NDEBUG
    CXXFLAGS += -O3
endif

all : led-mqtt

led-mqtt : $(OBJECTS) $(RGB_LIBRARY)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)

$(RGB_LIBRARY): FORCE
	$(MAKE) -C $(RGB_LIBDIR)

%.o : %.cc
	$(CXX) -I$(RGB_INCDIR) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJECTS) $(BINARIES)
	$(MAKE) -C $(RGB_LIBDIR) clean

install:
	install -m 755 led-mqtt $(DESTDIR)/bin
	install -t "$(DESTDIR)/led-mqtt/fonts" -D  fonts/*
  

FORCE:
.PHONY: FORCE

