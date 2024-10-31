# Nombre del compilador
CC = gcc

# Opciones de compilación
CFLAGS = -Wall -Wextra -g

# Directorios
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Archivos fuente y ejecutable
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SOURCES))
EXECUTABLE = $(BINDIR)/programa

# Regla principal
all: $(EXECUTABLE)

# Regla para crear el ejecutable
$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $@ $^

# Regla para compilar los archivos objeto
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Regla para crear el directorio obj
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Regla para crear el directorio bin
$(BINDIR):
	mkdir -p $(BINDIR)

# Regla para limpiar archivos generados
clean:
	rm -rf $(OBJDIR) $(BINDIR) $(EXECUTABLE)

# Regla para asegurar que los directorios existen antes de compilar
.PHONY: all clean
