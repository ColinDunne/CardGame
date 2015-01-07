//
//  Card.h
//  CardGame
//
//  Created by 钱辰 on 15/1/6.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
