//
//  ViewController.m
//  Machismo
//
//  Created by Amit on 2/8/15.
//  Copyright (c) 2015 Amit. All rights reserved.
//

#import "MACHViewController.h"
#import "CardMatchingGame.h"

@interface MACHViewController ()

@property (strong, nonatomic) Deck *playingCards;

@property (strong,nonatomic) CardMatchingGame *gameModelController;

@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *playingCardButton;

@property (strong, nonatomic) IBOutlet UISegmentedControl *matchNumCardsSegment;

@property (nonatomic) int playerScore;

- (void)updateUI;

- (NSString *)buttonTitleForCard:(Card *)card;

- (UIImage *)imageForCard:(Card *)card;

@end


@implementation MACHViewController

@synthesize playerScore = _playerScore;

@synthesize gameModelController = _gameModelController;

@synthesize playingCards = _playingCards;

- (CardMatchingGame *)gameModelController
{
    if (!_gameModelController) {
        _gameModelController = [[CardMatchingGame alloc] initWithCardCount:self.playingCardButton.count
                                                                   andDeck:self.playingCards];
    }
    return _gameModelController;
}


- (Deck *)playingCards
{
    if (!_playingCards) {
        _playingCards = [[PlayingCardDeck alloc] init];
    }
    return _playingCards;
}

- (void)setPlayerScore:(int)playerScore
{
    _playerScore = playerScore;
    self.playerScoreLabel.text = [NSString stringWithFormat:@"%d",_playerScore];
}

- (IBAction)cardPressed:(UIButton *)sender
{
    NSUInteger selectedCardIndex = [self.playingCardButton indexOfObject:sender];
    [self.gameModelController selectCardAtIndex:selectedCardIndex];

    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *button in self.playingCardButton)
    {
        NSUInteger cardPos = [self.playingCardButton indexOfObject:button];
        
        Card *card = [self.gameModelController cardAtIndex:cardPos];

        [self.playingCardButton[cardPos] setTitle:[self buttonTitleForCard:card]
                                         forState:UIControlStateNormal];
        [self.playingCardButton[cardPos] setBackgroundImage:[self imageForCard:card]
                                                   forState:UIControlStateNormal];
        
        button.enabled = !card.isMatched;
    }
    
    
    [self setPlayerScore:[self.gameModelController currentScore]];
}

- (NSString *)buttonTitleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed:(card.isChosen ? @"BlankCard" : @"stanford")];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
