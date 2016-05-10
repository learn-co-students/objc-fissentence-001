//
//  FISSentence.m
//  objc-fissentence
//
//  Created by John Richardson on 5/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (nonatomic, readwrite) NSString *sentence;

- (void)assembleSentence;

- (BOOL)validWord:(NSString *)word;

- (BOOL)validPunctuation:(NSString *)punctuation;

- (BOOL)validIndex:(NSUInteger)index;

@end

@implementation FISSentence

- (void)addWord:(NSString *)word {
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    /*The addWords:withPunctuation: method should add the strings in the words argument array to the end of the words property array, 
     and it should overwrite the string in the punctuation property with the punctuation argument string.
     */
    if ([words count] == 0) {
        return;
    }
    
    if (![self validPunctuation:punctuation]) {
        return;
    }
    self.punctuation = punctuation;
    for(NSUInteger i=0; i < [words count]; i++) {
        [self addWord:words[i]];
    }
}

- (void)removeWordAtIndex:(NSUInteger)index {
    if(![self validIndex:index]) {
        return;
    }
    [self.words removeObjectAtIndex:index];
    [self assembleSentence];
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    
}

- (void)assembleSentence {
    NSString *sentence = [self.words componentsJoinedByString:@" "];
    sentence = [sentence stringByAppendingString:self.punctuation];
    self.sentence = sentence;
}

- (BOOL)validWord:(NSString *)word {
    return [word length] > 0 && ![word isEqualToString:@" "];
}

- (BOOL)validPunctuation:(NSString *)punctuation {
    BOOL singleChar = [punctuation length] == 1;
    BOOL validPunctuation = NO;
    NSArray *validPunctuationChars = @[@".", @"?", @"!", @",", @";", @":", @"—"];
    for (NSUInteger i = 0; i < [validPunctuationChars count]; i++) {
        validPunctuation = [punctuation containsString:validPunctuationChars[i]];
        if(validPunctuation) {
            break;
        }
    }
    return singleChar && validPunctuation;
}

- (BOOL)validIndex:(NSUInteger)index {
    return index <[self.words count];
}

@end
