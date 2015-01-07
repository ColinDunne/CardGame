//
//  Card.m
//  CardGame
//
//  Created by 钱辰 on 15/1/6.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
