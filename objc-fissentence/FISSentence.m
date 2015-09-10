//
//  FISSentence.m
//  
//
//  Created by Wo Jun Feng on 9/10/15.
//
//

#import "FISSentence.h"

@interface FISSentence ()
@property (nonatomic, readwrite)NSString * sentence;

- (void)assembleSentence;
@end

@implementation FISSentence
- (BOOL)validWord:(NSString *)word{
    if (word != nil && ![word isEqualToString: @""] && ![word  isEqualToString: @" "]){
    return YES;
    };

    return NO;
};

- (BOOL)validPunctuation:(NSString *)punctuation{
    NSArray *possiblePunctuation = @[@".", @"?", @"!", @",", @";", @":" ,@"—"];
    
    if ([possiblePunctuation containsObject:punctuation]){
        return YES;
    }
    
    return NO;
};

- (BOOL)validIndex:(NSUInteger)index{
    if (index < self.words.count){
        return YES;
    }
    
    return NO;
};

- (void)addWord:(NSString *)word{
    if ([self validWord:word]){
    [self.words addObject:word];
    };
    
    [self assembleSentence];
};

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{

    if (words == nil || words.count == 0){
        return;
    }
    
    if (![self validPunctuation:punctuation]){
        return;
    }

    for (NSString *word in words){
        if ([self validWord:word]){
            [self.words addObject:word];
        };
    };
    
    self.punctuation = punctuation;
    [self assembleSentence];
};

- (void)removeWordAtIndex:(NSUInteger)index{
    if ([self validIndex:index]){
        [self.words removeObjectAtIndex:index];
    }
    
    [self assembleSentence];
};

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    
    [self assembleSentence];
};

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];
};

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    if ([self validWord:word] && [self validIndex:index]) {
        self.words[index] = word;
    }
    
    [self assembleSentence];
};

- (void)assembleSentence{
    self.sentence = [[self.words componentsJoinedByString:@" "] stringByAppendingString: self.punctuation];
};
@end
