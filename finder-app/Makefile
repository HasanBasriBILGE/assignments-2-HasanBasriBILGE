CC = gcc
CFLAGS = -Wall -Wextra
LDFLAGS = -lsystemd

# Check if CROSS_COMPILE is specified
ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
    CC = $(CROSS_COMPILE)gcc
endif

# Source files and object files
SRC = writer.c
OBJ = $(SRC:.c=.o)
TARGET = writer

# Default target: build the writer application
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

# Clean target: remove the application and object files
clean:
	rm -f $(TARGET) $(OBJ)

.PHONY: all clean

