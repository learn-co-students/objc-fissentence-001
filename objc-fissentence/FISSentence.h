//
//  FISSentence.h
//  
//
//  Created by Wo Jun Feng on 9/10/15.
//
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject
@property (nonatomic, readonly)NSString *sentence;
@property (strong, nonatomic)NSMutableArray *words;
@property (strong, nonatomic)NSString *punctuation;

- (void)addWord:(NSString *)word;
- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation;
- (void)removeWordAtIndex:(NSUInteger)index;
- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index;
- (void)replacePunctuationWithPunctuation:(NSString *)punctuation;
- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word;
@end
