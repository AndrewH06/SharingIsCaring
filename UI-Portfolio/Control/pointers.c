//
//  pointers.c
//  UI-Portfolio - Andrew Hale
//
//  Created by Hale, Andrew on 1/9/20.
//  Copyright © 2020 Hale, Andrew. All rights reserved.
//

#include "stdio.h"

// Simple work items for those who need to build confidence.

void pointertest()
{
    int n = 7;
    int *nptr = &n;

    printf("The address of n is %p\n", &n);
    printf("The value of nptr is %p\n\n", nptr);

    printf("The value of n is %d\n", n);
    printf("The value of *nptr is %d\n\n", *nptr);
    
    char *str = "abc";
    char *strbak = str;
    
    printf("The address of str %p\n", str);
    printf("The address of strbak %p\n", strbak);
    printf("The value at the address %c\n", *str);
    printf("The value char string %s\n\n", str);

    printf("The address of strbak after ++ %p\n", ++strbak);
    printf("The value at the address %c\n", *strbak);
    printf("The value char string %s\n\n", strbak);

    printf("The address of strbak after ++ again  %p\n", ++strbak);
    printf("The value at the address %c\n", *strbak);
    printf("The value char string %s\n\n", strbak);
//intx-=-b+-√b2-4(a)(c)
}

