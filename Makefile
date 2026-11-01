CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra -Wpedantic

TARGET := marketplace
SOURCES := main.c application.c graph_marketplace.c \
           marketplace_items.c marketplace_recommendations.c
OBJECTS := $(SOURCES:.c=.o)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@

%.o: %.c graph_marketplace.h marketplace_internal.h application.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJECTS)
