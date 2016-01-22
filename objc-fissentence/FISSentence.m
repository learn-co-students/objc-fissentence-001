//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Joshua Motley on 1/21/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (readwrite) NSString *sentence;

-(void)assembleSentence;
-(BOOL)validWord:(NSString *)word;
-(BOOL)validPunctuation:(NSString *)punctuation;
-(BOOL)validIndex:(NSUInteger)index;

@end

@implementation FISSentence

-(BOOL)validWord:(NSString *)word{
    
    if (word != nil && ![word  isEqual: @""] && ![word  isEqual: @" "]) {
        return YES;
    }
    
    return NO;
}

-(BOOL)validPunctuation:(NSString *)punctuation{
    
    return NO;
}

-(BOOL)validIndex:(NSUInteger)index{
    
    return NO;
}

-(void)assembleSentence{
    
  NSString *wordsString =  [self.words componentsJoinedByString:@" "];
   self.sentence = [wordsString stringByAppendingString:self.punctuation];
    
}

-(void)addWord:(NSString *)word{
    if ([self validWord:word]) {
            [self.words addObject:word];
    }else{
        
    }

    [self assembleSentence];
    
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    
    NSArray *punctuations = [NSArray arrayWithObjects:@"!",@"?",@",",@".",@";",@":",@"-", nil];
 
    if([words count]==0){
        return;
    }
    

    
    if ([punctuation  isEqual: @""] || [punctuation isEqual:nil]) {
        return;
    }else{self.punctuation = punctuation;}
    
    if ([punctuations containsObject:punctuation]) {
        
    }else{
        return;
    }

     
    

    NSMutableArray *emptyString = [[NSMutableArray alloc]init];
    [emptyString addObjectsFromArray:self.words];
    for (NSString *word in words) {
        if ([word isEqualToString:@" "] || [word isEqualToString:@""]) {
            
        }else{
            [emptyString addObject:word];
        }
    }
    
    self.words = emptyString;
    
    
    
    [self assembleSentence];
    
}

-(void)removeWordAtIndex:(NSUInteger)index{
    
    if (index >[self.words count]-1) {
        
    }else{
        
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
    
    
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    if (index >[self.words count]-1) {
        
    }else{
    
    [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
    
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    
    NSArray *punctuations = [NSArray arrayWithObjects:@"!",@"?",@",",@".",@";",@":",@"-", nil];
    
    if ([punctuation  isEqual: @""] || [punctuation isEqual:nil]) {
        return;
    }else if(![punctuations containsObject:punctuation]){
    
    }else{self.punctuation = punctuation;}
    

    
    [self assembleSentence];
}

-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    if ([word isEqual: @""] || word==nil || [word isEqual:@" "] || index >[self.words count]-1) {

    }else{
        [self.words replaceObjectAtIndex:index withObject:word];}
    [self assembleSentence];
    
}

@end
