//
//  Deck.m
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong,nonatomic) NSMutableArray *cardDeck;

@end

@implementation Deck

@synthesize cardDeck = _cardDeck;

- (NSMutableArray *)cardDeck
{
    if (!_cardDeck) {
        _cardDeck = [[NSMutableArray alloc] init];
    }
    return _cardDeck;
}

- (void)setCardDeck:(NSMutableArray *)cardDeck
{
    _cardDeck = cardDeck;
}

- (void)addCard:(Card *)card toTop:(BOOL)top
{
    if (top == YES)
    {
        [self.cardDeck insertObject:card atIndex:0];
    }
    else
    {
        [self.cardDeck addObject:card];
    }
}

- (void)addCard:(Card*)card
{
    [self addCard:card toTop:NO];
}

- (Card*)drawRandomCard
{
    Card *randomCard = nil;
    if (self.cardDeck.count > 0) {
        unsigned int randomIndex = arc4random()%self.cardDeck.count;
        randomCard = self.cardDeck[randomIndex];
        [self.cardDeck removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}



@end
