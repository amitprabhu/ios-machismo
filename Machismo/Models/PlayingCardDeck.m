//
//  PlayingCardDeck.m
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        for (NSUInteger rank = 1;rank<= [PlayingCard maxRank];rank++)
        {
            for (NSString *suit in [PlayingCard validSuits])
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                
                [self addCard:card];
            }
        }
        
    }
    return self;
}

@end
