//
//  Card.m
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize contents = _contents;

- (int)match:(NSArray*)otherCards
{
    int score = 0;
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score++;
        }
    }
    return score;
}

@end
