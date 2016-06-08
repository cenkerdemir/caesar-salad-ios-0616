//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here
-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key {
    NSString *returnString = @"";
    key = key%26;
    
    NSMutableArray *mMessageArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i < [message length]; i++) {
        [mMessageArray addObject:[NSString stringWithFormat:@"%c",[message characterAtIndex:i]]];
    }
    
    for (NSUInteger i=0; i < [mMessageArray count]; i++) {
        unichar asciiCode = [mMessageArray[i] characterAtIndex:0];
        unichar newAsciiCode = asciiCode;
        NSLog(@"asciicode before: %d",asciiCode);
        if (asciiCode >= 65 && asciiCode <= 90) {
            newAsciiCode = asciiCode + key;
            if (newAsciiCode < 65) {
                newAsciiCode += 26;
            }
            else if (newAsciiCode > 90){
                newAsciiCode -= 26;
            }
        }
        if (asciiCode >= 97 && asciiCode <= 122) {
            newAsciiCode = asciiCode + key;
            if (newAsciiCode < 97) {
                newAsciiCode += 26;
            }
            else if (newAsciiCode > 122){
                newAsciiCode -= 26;
            }
        }
            
        NSLog(@"asciicode after: %d", newAsciiCode);
        NSString *cipheredLetter = [NSString stringWithFormat:@"%C", newAsciiCode];
        [mMessageArray replaceObjectAtIndex:i withObject:cipheredLetter];
    }
    
    for (NSUInteger i = 0; i < [mMessageArray count]; i++) {
        returnString = [returnString stringByAppendingString:mMessageArray[i]];
    }
    
    return returnString;
}

-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key {
    NSString *returnString = @"";
    
    key = key%26;
    
    NSMutableArray *mMessageArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i < [encodedMessage length]; i++) {
        [mMessageArray addObject:[NSString stringWithFormat:@"%c",[encodedMessage characterAtIndex:i]]];
    }
    
    for (NSUInteger i=0; i < [mMessageArray count]; i++) {
        unichar asciiCode = [mMessageArray[i] characterAtIndex:0];
        unichar newAsciiCode = asciiCode;
        NSLog(@"asciicode before: %d",asciiCode);
        if (asciiCode >= 65 && asciiCode <= 90) {
            newAsciiCode = asciiCode - key;
            if (newAsciiCode < 65) {
                newAsciiCode += 26;
            }
        }
        if (asciiCode >= 97 && asciiCode <= 122) {
            newAsciiCode = asciiCode - key;
            if (newAsciiCode < 97) {
                newAsciiCode += 26;
            }
        }
        
        NSLog(@"asciicode after: %d", newAsciiCode);
        NSString *deCipheredLetter = [NSString stringWithFormat:@"%C", newAsciiCode];
        [mMessageArray replaceObjectAtIndex:i withObject:deCipheredLetter];
    }
    
    for (NSUInteger i = 0; i < [mMessageArray count]; i++) {
        returnString = [returnString stringByAppendingString:mMessageArray[i]];
    }
    
    return returnString;
}

@end
