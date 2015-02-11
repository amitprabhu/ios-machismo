//
//  Deck.h
//  Machismo
//
//  Created by Amit on 2/9/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


- (void)addCard:(Card*)card toTop:(BOOL)top;
- (void)addCard:(Card*)card;

- (Card*)drawRandomCard;

@end
