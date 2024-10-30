# Definimos el compilador y las banderas
CC = gcc
CFLAGS = -Wall -g

# Archivos fuente
SRCS = main.c utils.c 
# Archivos objeto
OBJS = $(SRCS:.c=.o)
# Nombre del ejecutable
EXEC = program

# Regla por defecto
all: $(EXEC)

# Regla para crear el ejecutable
$(EXEC): $(OBJS)
	$(CC) $(OBJS) -o $(EXEC)

# Regla para compilar los archivos .c en archivos .o
%.o: %.c functions.h
	$(CC) $(CFLAGS) -c $<

# Regla para limpiar los archivos generados
clean:
	rm -f $(OBJS) $(EXEC)

# Regla para limpiar objetos y el ejecutable
.PHONY: all clean