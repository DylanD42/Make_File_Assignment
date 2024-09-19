 # @file Makefile
 # @author Dylan Daniels
 # @date 2024-09-19
 # @brief make file to easily compile mutiple files together 
 # 
 # compiles and links mutiple files together into a single binary 
 #

CC = g++ # the compiler of choice
TARGET = employee # name of the binary we wish to create
CFLAGS = -c -Wall -Wextra #Compile with all erros and warnings

all: $(TARGET)

$(TARGET): Employee.o Officer.o Supervisor.o main.o
	$(CC) -g -Wall -Wextra -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

Employee.o: Employee.cpp Employee.h 
	$(CC) $(CFLAGS) Employee.cpp

Officer.o: Officer.cpp Officer.h
	$(CC) $(CFLAGS) Officer.cpp

Supervisor.o: Supervisor.cpp Supervisor.h
	$(CC) $(CFLAGS) Supervisor.cpp

main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

clean: ## removes the binary, any .o files and emacs backups
	$(RM) $(TARGET) *.o *~
