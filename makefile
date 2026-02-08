# Compiler / Assembler
CC = gcc
ASM = nasm

# Flags
CFLAGS = -Wall -O0 -Iinclude
ASMFLAGS = -f elf64

# Directories
SRC_DIR = src
BUILD_DIR = build
LIB = libsimple_stdio.a

# Find all C and ASM source files recursively
C_SRC = $(shell find $(SRC_DIR) -name '*.c')
ASM_SRC = $(shell find $(SRC_DIR) -name '*.s')

# Generate corresponding object files in build/
OBJ = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(C_SRC)) \
      $(patsubst $(SRC_DIR)/%.s,$(BUILD_DIR)/%.o,$(ASM_SRC))

# Default target: build the library
all: $(LIB)

# Build static library from object files
$(LIB): $(OBJ)
	ar rcs $@ $(OBJ)

# Compile C files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Assemble ASM files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(dir $@)
	$(ASM) $(ASMFLAGS) $< -o $@

# Clean build files
clean:
	rm -rf $(BUILD_DIR) $(LIB)

