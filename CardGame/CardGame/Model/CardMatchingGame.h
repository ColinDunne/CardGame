//
//  CardMatchingGame.h
//  CardGame
//
//  Created by 钱辰 on 15/1/8.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (readonly,nonatomic) NSInteger score;

@property (readonly,nonatomic) NSInteger mode;

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (instancetype)initWithCardCount:(NSUInteger)count andGameMode:(NSInteger)mode usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
