//
//  CardMatchingGame.m
//  CardGame
//
//  Created by 钱辰 on 15/1/8.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,readwrite) NSInteger mode;
@property (strong,nonatomic) NSMutableArray *cards;

@end

@implementation CardMatchingGame

static const int TWO_CARD_MATCH_MODE = 0;
static const int THREE_CARD_MATCH_MODE = 1;

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    return [self initWithCardCount:count andGameMode:TWO_CARD_MATCH_MODE usingDeck:deck];
}

- (instancetype)initWithCardCount:(NSUInteger)count andGameMode:(NSInteger)mode usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.mode = mode;
    }
    
    return self;
}

- (instancetype)init {
    return nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            if (self.mode == TWO_CARD_MATCH_MODE) {
                // match against another card
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
                            card.matched = YES;
                            otherCard.matched = YES;
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                        }
                        break;
                    }
                }
                self.score -= COST_TO_CHOOSE;
            } else if (self.mode == THREE_CARD_MATCH_MODE) {
                // match against other two cards
                NSMutableArray *cardsToMatch = [[NSMutableArray alloc] initWithCapacity:2];
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        [cardsToMatch addObject:otherCard];
                    }
                    if ([cardsToMatch count] == 2) {
                        int matchScore = [card match:cardsToMatch];
                        if (matchScore > 0) {
                            self.score += matchScore * MATCH_BONUS;
                            card.matched = YES;
                            ((Card *)cardsToMatch[0]).matched = YES;
                            ((Card *)cardsToMatch[1]).matched = YES;
                            
                            cardsToMatch = nil;
                        } else {
                            self.score -= MISMATCH_PENALTY * 2;
                            ((Card *)cardsToMatch[0]).chosen = NO;
                            ((Card *)cardsToMatch[1]).chosen = NO;
                            
                            cardsToMatch = nil;
                        }
                        break;
                    }
                }
            }
            
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    Card *card = nil;
    if (index < [self.cards count]) {
        card = [self.cards objectAtIndex:index];
    }
    return card;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

@end
