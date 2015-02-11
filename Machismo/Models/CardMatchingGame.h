//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

@property (nonatomic,readonly) int currentScore;

@property (strong,nonatomic) NSMutableArray *cards;

//Designated initializer
- (instancetype)initWithCardCount:(NSUInteger)cardCount
                          andDeck:(Deck *)cardDeck
                         andMatch:(int)noOfCards;

- (instancetype)initWithCardCount:(NSUInteger)cardCount
                          andDeck:(Deck *)cardDeck;

- (Card *)cardAtIndex:(NSUInteger)index;

- (void)selectCardAtIndex:(NSUInteger)index;

@end
