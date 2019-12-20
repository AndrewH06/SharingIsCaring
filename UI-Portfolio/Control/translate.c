//
//  translate.c
//  UI-Portfolio - Andrew Hale
//
//  Created by Hale, Andrew on 12/12/19.
//  Copyright © 2019 Hale, Andrew. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include "control.h"

void tokentest(){
    PHRASE in;
    char str[LINE_BUFFER_SIZE] = "A Man A Plan A Canal – Panama";
    const char *tokenizer = " ";
    long i = 0;
    char *token = strtok(str, tokenizer);
    while( token != NULL ) {
        printf( "word after tokenizing: %s\n", token );
        strcpy(in.words[i].word, token);
        printf( "word in structure %li: %s\n", i, in.words[i].word);
        i++;
        token = strtok(NULL, tokenizer);
    }
    return;
}

char transBuffer[BUFFER_SIZE];
void tclearBuffer(){
    for(int i=0; i<BUFFER_SIZE; i++){
        transBuffer[i]= '\0';
    }
}

char *pigl(char* input, long length){
    tclearBuffer();
    strncpy(transBuffer, input, length);
    for(long begin=0, end=length-1; begin<end; begin++, end --) {
        char swap = transBuffer[begin];
        transBuffer[begin]=transBuffer[end];
        transBuffer[end]= swap;
    }
    return transBuffer;
}

char *sh(char* input, long length){
    tclearBuffer();
    strncpy(transBuffer, input, length);
    for(long begin=0, end=length-1; begin<end; begin++, end --) {
        char swap = transBuffer[begin];
        transBuffer[begin]=transBuffer[end];
        transBuffer[end]= swap;
    }
    return transBuffer;
}

char *flip(char* input, long length){
    tclearBuffer();
    strncpy(transBuffer, input, length);
    for(long begin=0, end=length-1; begin<end; begin++, end --) {
        char swap = transBuffer[begin];
        transBuffer[begin]=transBuffer[end];
        transBuffer[end]= swap;
    }
    return transBuffer;
}

