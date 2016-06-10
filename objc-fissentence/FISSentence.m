//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Stacy Johnson on 10/27/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence()

@property (nonatomic, strong, readwrite) NSString *sentence;

@end


@implementation FISSentence

-(void) assembleSentence {
    
    self.sentence = [[NSString alloc] initWithFormat:@"%@%@",[self.words componentsJoinedByString:@" "], self.punctuation];
}

-(BOOL) validWord:(NSString *)word {
    
    if (word && word.length > 0 && ![word isEqualToString:@" "]) {
        return YES;
    }
    
    return NO;
}

-(BOOL) validPunctuation:(NSString *)punctuation {
    NSString *validPunctuations = @".?!,;:—";
    
    if (punctuation && [validPunctuations containsString:punctuation]) {
        return YES;
    }
    
    return NO;
}

-(BOOL) validIndex:(NSUInteger)index {
    
    if (index < self.words.count) {
        return YES;
    }
    
    return NO;
}

-(void) addWord:(NSString *)word {
    
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    
    [self assembleSentence];
}

-(void) addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    
    if (!words || [words count] == 0) {
        return;
    }
    
    if (![self validPunctuation:punctuation]) {
        return;
    } else {
        self.punctuation = punctuation;
    }
    
    for (NSString *word in words) {
        if ([self validWord:word]) {
            [self.words addObject:word];
        }
    }
    
    [self assembleSentence];
}

-(void) removeWordAtIndex:(NSUInteger)index {
    
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    
    [self assembleSentence];
}

-(void) insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
    if ([self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    
    [self assembleSentence];
}

-(void) replacePunctuationWithPunctuation:(NSString *)punctuation {
    
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];
}

-(void) replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    
    [self assembleSentence];
}

@end
