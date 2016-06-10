//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Stacy Johnson on 10/27/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (nonatomic, strong, readonly) NSString *sentence;

@property (nonatomic, strong) NSMutableArray *words;
@property (nonatomic, strong) NSString *punctuation;

-(void) addWord:(NSString *)word;
-(void) addWords:(NSArray *)words withPunctuation:(NSString *)punctuation;
-(void) removeWordAtIndex:(NSUInteger)index;
-(void) insertWord:(NSString *)word atIndex:(NSUInteger)index;
-(void) replacePunctuationWithPunctuation:(NSString *)punctuation;
-(void) replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word;

@end
