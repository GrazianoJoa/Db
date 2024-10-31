#ifndef TOKENIZER_H
#define TOKENIZER_H

#define MAX_TOKEN_SIZE 64
#define MAX_TOKENS 100

typedef enum {
    TOKEN_KEYWORD,
    TOKEN_IDENTIFIER,
    TOKEN_NUMBER,
    TOKEN_STRING,
    TOKEN_OPERATOR,
    TOKEN_UNKNOW,
    TOKEN_END
} TokenType;

typedef struct {
    TokenType type;
    char value[MAX_TOKEN_SIZE];
} Token;

typedef Token* Tokens;

const char *keywords[] = {"SELECT", "FROM", "WHERE", NULL};

int is_keyword(const char *word);

Token get_next_token(const char **input);

Tokens tokenizer(const char **input);

#endif