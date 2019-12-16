//
//  reverse.c
//  UI-Portfolio - Andrew Hale
//
//  Created by Hale, Andrew on 12/9/19.
//  Copyright © 2019 Hale, Andrew. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include "control.h"

char revBuffer[BUFFER_SIZE];
char *isPali = "Yes";
char *notPali = "No";
void clearBuffer(){
    for(int i=0; i<BUFFER_SIZE; i++){
        revBuffer[i]= '\0';
    }
}

char *revXArray(char* input, long length){
    clearBuffer();
    strncpy(revBuffer, input, length);
    for(long begin=0, end=length-1; begin<end; begin++, end --) {
        char swap = revBuffer[begin];
        revBuffer[begin]=revBuffer[end];
        revBuffer[end]= swap;
    }
    return revBuffer;
}

char *revXPointer(char* input, long length) {
    clearBuffer();
    strncpy(revBuffer, input, length);
    char *begin = revBuffer;
    char *end = revBuffer;
    end += length - 1;
    while ( begin < end ) {
        char swap = *begin;
        *begin = *end;
        *end = swap;
        begin++;
        end--;
 }
    return revBuffer;
}

void recurse(char* input, long begin, long end) {
    char ch;
    if (begin >= end)
        return;
  
    ch = *(input+begin);
    *(input+begin)=*(input+end);
    *(input+end)=ch;
  
    recurse(input, ++begin, --end);
}

char *revXRecurse(char* input, long length){
    clearBuffer();
    strncpy(revBuffer, input, length);
    long begin = 0, end = length-1;
    recurse(revBuffer, begin, end);
    return revBuffer;
}

char *paliEval(char* input, long length) {
    clearBuffer();
    strncpy(revBuffer, input, length);
    
    char *reverse = revXArray(input, length);
    if(strcmp(input, reverse) ==0){
        return isPali;
    } else {
        return notPali;
 }
}
