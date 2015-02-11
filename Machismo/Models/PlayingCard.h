//
//  PlayingCard.h
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validRanks;
+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;

@end
