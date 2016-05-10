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
    
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    
}

- (void)removeWordAtIndex:(NSUInteger)index {
    
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    
}

- (void)assembleSentence {
    
}

- (BOOL)validWord:(NSString *)word {
    return NO;
}

- (BOOL)validPunctuation:(NSString *)punctuation {
    return NO;
}

- (BOOL)validIndex:(NSUInteger)index {
    return NO;
}

@end
