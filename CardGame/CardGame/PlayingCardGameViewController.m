//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by 钱辰 on 15/2/5.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
