//
//  ViewController.h
//  CardGame
//
//  Created by 钱辰 on 15/1/6.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

// Abstract class.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

// for subclasses
- (Deck *)createDeck; // abstract

@end

