//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Alex J Lee on 10/20/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (nonatomic, readwrite) NSString *sentence;
@end

@implementation FISSentence

- (void)assembleSentence {
    self.sentence = [[self.words componentsJoinedByString:@" "] stringByAppendingString: self.punctuation];
}

- (BOOL) validWord:(NSString *)word{
    if (word == nil || [word isEqualToString:@""] || [word isEqualToString:@" "]) {
        return NO;
    }
    
    return YES;
}

- (BOOL) validPunctuation:(NSString *)punctuation{
    NSArray *validPunctationArray = @[@".",@"?",@"!",@",",@";",@":",@"—"];
    if ([validPunctationArray containsObject:punctuation]) {
        return YES;
    }
    return NO;
}

- (BOOL)validIndex:(NSUInteger )index{
    if (self.words.count >= (index + 1)) {
        return YES;
    }
    return NO;
}

- (void)addWord: (NSString *)word {
//    [self validword:word is done privately]
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    if (!words || !words.count){
        return;
    } else {
        if ([self validPunctuation:punctuation]) {
            for (NSString *word in words) {
                if ([self validWord:word]) {
                    [self.words addObject:word];
                }
            }
            self.punctuation = punctuation;
            [self assembleSentence];
        }
    }
}

- (void)removeWordAtIndex:(NSUInteger )index {
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger )index {
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}
- (void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}
- (void)replaceWordAtIndex:(NSUInteger )index withWord:(NSString *)word{
    if ([self validWord:word] && [self validIndex:index]){
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}

@end
