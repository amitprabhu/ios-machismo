//
//  PlayingCard.m
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;
@synthesize rank = _rank;

#pragma  -- Utility Methods -

+ (NSArray *)validRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSArray *)validSuits
{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

+ (NSUInteger) maxRank
{
    return [self validRanks].count - 1;
}

#pragma - logic -

- (NSString *)contents
{
    return [[PlayingCard validRanks][self.rank] stringByAppendingString:self.suit];
}

- (NSString *)suit
{
   return  _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
    else _rank = 0;
}

- (NSUInteger)rank
{
    return _rank;
}

- (int)match:(NSArray*)otherCards
{
    int matchScore = 0;
    
    PlayingCard *card = otherCards.firstObject;
    
    if ([self.suit isEqualToString:card.suit])
    {
        matchScore = 1;
    }
    if (self.rank == card.rank)
    {
        matchScore = 4;
    }
    return matchScore;
}


@end
