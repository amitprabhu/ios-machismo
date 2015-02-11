//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import "CardMatchingGame.h"

const int MATCH_BONUS       = 6;
const int MISMATCH_PENALTY  = 4;
const int PLAY_COST         = 1;

@interface CardMatchingGame()

@property (atomic,readwrite) int currentScore;

@property (atomic) int matchNumCards;

@end


@implementation CardMatchingGame

@synthesize cards = _cards;
@synthesize matchNumCards = _matchNumCards;

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithCardCount:(NSUInteger)cardCount andDeck:(Deck *)cardDeck
{
    return [self initWithCardCount:cardCount
                           andDeck:cardDeck
                          andMatch:2];
}

- (instancetype)initWithCardCount:(NSUInteger)cardCount
                          andDeck:(Deck *)cardDeck
                         andMatch:(int)noOfCards
{
    self = [super init];
    
    if (self)
    {
        for (int index=0; index<cardCount; index++)
        {
            [self.cards addObject:[cardDeck drawRandomCard]];
        }
        self.matchNumCards = noOfCards;
    }
    return self;
}

- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    if (index < self.cards.count)
    {
        return [self.cards objectAtIndex:index];
    }
    return nil;
}

- (void)selectCardAtIndex:(NSUInteger)index
{
    Card *selectedCard = [self cardAtIndex:index];
    
    if (!selectedCard.isMatched)
    {
        if (selectedCard.isChosen)
        {
            selectedCard.chosen = NO;
        }
        else
        {
            for (Card *otherCard in self.cards) {
                if (!otherCard.isMatched && otherCard.isChosen)
                {
                    int score = [selectedCard match:@[otherCard]];
                    if (score > 0) //Matched
                    {
                        self.currentScore = self.currentScore + score * MATCH_BONUS;
                        selectedCard.matched = YES;
                        otherCard.matched = YES;
                    }
                    else
                    {
                        self.currentScore = self.currentScore - MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            selectedCard.chosen = YES;
            self.currentScore = self.currentScore - PLAY_COST;
        }
    }
}



















@end
