//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Ben on 10/31/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence

- (void) assembleSentence {
    NSString *completeSentence = [self.words componentsJoinedByString:@" "];
    self.sentence = [completeSentence stringByAppendingFormat:@"%@", self.punctuation];
}

- (BOOL) validWord: (NSString *)word {
    if (word != nil && ![word isEqualToString:@""] && ![word isEqualToString:@" "]) {
        return YES;
    }
    return NO;
}

- (BOOL) validPunctuation: (NSString *)punctuation {
    if ((![punctuation isEqualToString:@"."]
        &&![punctuation isEqualToString:@"?"]
        &&![punctuation isEqualToString:@"!"]
        &&![punctuation isEqualToString:@","]
        &&![punctuation isEqualToString:@";"]
        &&![punctuation isEqualToString:@":"]
        &&![punctuation isEqualToString:@"-"])
        ||(punctuation = nil)
        ||[punctuation isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

- (BOOL) validIndex: (NSUInteger)index {
    if (index < self.words.count) {
        return YES;
    }
    return NO;
}

- (void) addWord:(NSString *)word {
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void) addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    if ((words == nil || words.count == 0)) {
        return;
    }
    for (NSString *seperatedWord in words) {
        if ([self validWord:seperatedWord]) {
            [self.words addObject:seperatedWord];
        }
    }
    if (![self validPunctuation:punctuation]) {
        return;
    }
    self.punctuation=punctuation;
    [self assembleSentence];
}

- (void) removeWordAtIndex:(NSUInteger)index {
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

- (void) insertWord:(NSString *)word atIndex:(NSUInteger)index {
    if ([self validIndex:index] && [self validWord:word]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

- (void) replacePunctuationWithPunctuation:(NSString *)punctuation {
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}

- (void) replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    if ([self validIndex:index] && [self validWord:word]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}

@end
