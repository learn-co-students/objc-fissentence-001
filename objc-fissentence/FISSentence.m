//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Richard Martin on 2015-11-23.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence

-(void)assembleSentence {
    
    NSString *newSentence = [self.words componentsJoinedByString:@" "];
    
    newSentence = [newSentence stringByAppendingString:self.punctuation];
    
    self.sentence = newSentence;
    
}

-(BOOL)validWord:(NSString *)word {
    
    if (word == nil) {
        return NO;
    }
    
    if ([word isEqualToString:@""]) {
        return NO;
    }
    
    if ([word isEqualToString:@" "]) {
        return NO;
    }
    
    return YES;
    
}

-(BOOL)validPunctuation:(NSString *)punctuation {
    
    if (punctuation == nil) {
        return NO;
    }
    
    if (!([punctuation isEqualToString:@"."] || [punctuation isEqualToString:@"?"] || [punctuation isEqualToString:@"!"] || [punctuation isEqualToString:@","] || [punctuation isEqualToString:@";"] || [punctuation isEqualToString:@":"] || [punctuation isEqualToString:@"-"])) {
        return NO;
    }
    
    return YES;
    
}

-(BOOL)validIndex:(NSUInteger)index {
    
    NSUInteger wordsArrayLength = [self.words count];
    
    if ((index + 1) > wordsArrayLength) {
        return NO;
    }
    
    return YES;
}

-(void)addWord:(NSString *)word {
    
    BOOL wordIsValid = [self validWord:word];
    
    if (wordIsValid) {
        [self.words addObject:word];
    }
    
    [self assembleSentence];
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    
    if ([words isEqualToArray:@[]] || words == nil) {
        return;
    }
    
    BOOL validPunctuation = [self validPunctuation:punctuation];
    
    if (!validPunctuation) {
        return;
    }
    
    self.punctuation = punctuation;
    
    for (NSString *word in words) {
        
        BOOL wordIsValid = [self validWord:word];
        
        if (wordIsValid) {
            
            [self.words addObject:word];
            
        }
    }
    
    [self assembleSentence];
    
}

-(void)removeWordAtIndex:(NSUInteger)index {
    
    BOOL indexInbounds = [self validIndex:index];
    
    if (!indexInbounds) {
        return;
    }
    
    [self.words removeObjectAtIndex:index];
    
    [self assembleSentence];
    
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
    BOOL wordIsValid = [self validWord:word];
    
    BOOL indexInbounds = [self validIndex:index];
    
    if (wordIsValid && indexInbounds) {
        [self.words insertObject:word atIndex:index];
    }
    
    [self assembleSentence];
    
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    
    BOOL validPunctuation = [self validPunctuation:punctuation];
    
    if (validPunctuation) {
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];
    
}

-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    
    BOOL wordIsValid = [self validWord:word];
    
    BOOL indexInbounds = [self validIndex:index];
    
    if (wordIsValid && indexInbounds) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    
    [self assembleSentence];
    
}

@end
