CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11
AR = ar
ARFLAGS = rcs

LIB_NAME = libcalculator.a
EXEC_NAME = calculator_app

LIB_OBJS = calculator.o
APP_OBJS = main.o

all: $(EXEC_NAME)

$(LIB_NAME): $(LIB_OBJS)
	$(AR) $(ARFLAGS) $@ $^

calculator.o: calculator.cpp calculator.h
	$(CXX) $(CXXFLAGS) -c calculator.cpp

main.o: main.cpp calculator.h
	$(CXX) $(CXXFLAGS) -c main.cpp

$(EXEC_NAME): $(APP_OBJS) $(LIB_NAME)
	$(CXX) $(CXXFLAGS) -o $@ $(APP_OBJS) -L. -lcalculator

clean:
	rm -f *.o $(LIB_NAME) $(EXEC_NAME)

.PHONY: all clean