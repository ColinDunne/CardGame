//
//  ViewController.m
//  CardGame
//
//  Created by 钱辰 on 15/1/6.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) NSUInteger flipCounts;
@property (strong,nonatomic) PlayingCardDeck *cardDeck;
@end

@implementation ViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCounts++;
    } else {
        PlayingCard *card = (PlayingCard *)[self.cardDeck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:[card contents] forState:UIControlStateNormal];
            self.flipCounts++;
        }
    }
}

- (void)setFlipCounts:(NSUInteger)flipCounts {
    _flipCounts = flipCounts;
    self.flipLabel.text = [NSString stringWithFormat:@"FlipCounts:%lu",(unsigned long)self.flipCounts];
}

- (PlayingCardDeck *)cardDeck {
    if (!_cardDeck) {
        _cardDeck = [[PlayingCardDeck alloc] init];
    }
    return _cardDeck;
}


@end
