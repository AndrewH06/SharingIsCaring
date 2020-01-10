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

typedef struct words {
 char word[BUFFER_SIZE];
 char reversed[BUFFER_SIZE];
 char pigged[BUFFER_SIZE];
 char shorted[BUFFER_SIZE];
} WORDS;
typedef struct phrases {
 char original[LINE_BUFFER_SIZE];
 char piglatin[LINE_BUFFER_SIZE];
 char shorthand[LINE_BUFFER_SIZE];
 char reversed[LINE_BUFFER_SIZE];
 WORDS words[WORDS_TO_LINE_SIZE];
} PHRASE;
PHRASE in;


void tokentest(){
  // char str[LINE_BUFFER_SIZE] = "A Man A Plan A Canal Panama";
  // printf ("%s", reversePhrase(str));
}

char *flipPhrase(const char * str) {
 const char *tokenizer = " ";
  
 long i = 0;
 char *token = strtok((char *)str, tokenizer);     // 1st word
 while( token != NULL ) {        // NULL mean end of phrase
  printf( "word after tokenizing: %s\n", token );
  strcpy(in.words[i].word, token);
  printf("word in structure %li: %s\n", i, in.words[i].word);
  strcpy(in.words[i].reversed, in.words[i].word);
  printf("word reversed: %s\n", flipWord(in.words[i].reversed));
    
   if (i == 0)
   {
     strcpy(in.reversed, in.words[i].reversed);
     strcat(in.reversed, tokenizer);
   } else {
     strcat(in.reversed, in.words[i].reversed);
     strcat(in.reversed, tokenizer);
   }
   printf("phrase reversed: %s\n", in.reversed);
    
   token = strtok(NULL, tokenizer);      // remaining words, NULL means same phrase
   i++;
     
 }
 return in.reversed;
}
char *flipWord(char *str)
{
  unsigned long len = strlen(str);
  int i;
  for (i=0; i<len/2; i++)
  {
    //printf("swap %c with %c\n", word[i], word[len-1-i]);
    char temp = str[i];
    str[i]=str[len-1-i];
    str[len-1-i]=temp;
  }
  //printf("%s\n",word);
  return str;
}
