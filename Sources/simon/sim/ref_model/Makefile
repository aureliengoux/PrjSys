SIMULATOR_INC_PATH = /comelec/softs/opt/mentor/modelsim/current/include
LDLIBS =  -lgmpxx
LDFLAGS = -shared -Bsymbolic
CXXFLAGS += -fPIC -I$(REF_CPP) -I$(SIMULATOR_INC_PATH)

TARGET = simon_dpi.so
DEPS   = Simon.o simon_dpi.o

REF_CPP = ./

VPATH=$(REF_CPP)

.PHONY: all clean simu

all: $(TARGET)

$(TARGET):$(DEPS)
	g++ $(LDFLAGS) $^ -o $@ $(LDLIBS)

clean:
	rm -f *.o
	rm -f $(TARGET)

