//  objc-fissentence
//
//  Created by JASON HARRIS on 9/24/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;
- (BOOL)validWord: (NSString *)word;
- (BOOL)validPunctuation: (NSString *)punctuation;
- (BOOL)validIndex: (NSUInteger)index;

@end


@implementation FISSentence

- (void)assembleSentence{
    NSString *englishSentence = [self.words componentsJoinedByString:@" "];
    englishSentence = [englishSentence stringByAppendingString:self.punctuation];
    self.sentence = englishSentence;
}

- (BOOL)validWord: (NSString *)word {
    if(word.length == 0){
        return NO;
    }
    
    if([word isEqualToString:@" "]){
        return NO;
    }
    
    if (word == nil){
        return NO;
    }
    
    return YES;
}

- (BOOL)validPunctuation: (NSString *)punctuation {
    NSString *testPunctuation = @".?!,;:—";
    if(punctuation == nil) {return NO;}
    
    if ([testPunctuation containsString:punctuation]){
        return YES;
    }
    
    return NO;
}

- (BOOL)validIndex: (NSUInteger)index {
    if(index < self.words.count){
        return YES;
    }
    return NO;
}

- (void)addWord: (NSString *)word{
    if ([self validWord:word]){
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void)addWords: (NSArray *)words
 withPunctuation: (NSString *)punctuation{
    if((words == nil) || ([words isEqualToArray:@[]])){
        return;
    }
    if(   ![self validPunctuation:punctuation]   ){
        return;
    }
    self.punctuation = punctuation;
    //[self.words addObjectsFromArray:words];
    for (NSString *theWord in words) {
        if ([self validWord:theWord]){
            [self.words addObject:theWord];
        }
    }
    [self assembleSentence];
}

- (void)removeWordAtIndex: (NSUInteger)index{
    if( ![self validIndex:index]){
        return;
    }
    [self.words removeObjectAtIndex:index];
    [self assembleSentence];
}

- (void)insertWord:(NSString *)word
           atIndex:(NSUInteger)index{
    bool areTheseValid = ([self validWord:word]) && ([self validIndex:index]);
    if ( !areTheseValid) {
        [self assembleSentence];
        return;
    }
    [self.words insertObject:word atIndex:index];
    [self assembleSentence];
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    if( [self validPunctuation:punctuation] ){
        self.punctuation = punctuation;
        [self assembleSentence];
    }
    [self assembleSentence];
    
}

- (void)replaceWordAtIndex:(NSUInteger)index
                  withWord:(NSString *)word{
    bool areTheseValid = ([self validWord:word]) && ([self validIndex:index]);
    if ( !areTheseValid) {
        return;
    }
    
    [self.words replaceObjectAtIndex:index withObject:word];
    [self assembleSentence];
    
}










@end
