//
//  ViewController.m
//  CardGame
//
//  Created by 钱辰 on 15/1/6.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) NSUInteger flipCounts;
@end

@implementation ViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@""]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        [sender setTitle:@"A♠︎" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    self.flipCounts++;
}

- (void)setFlipCounts:(NSUInteger)flipCounts {
    _flipCounts = flipCounts;
    self.flipLabel.text = [NSString stringWithFormat:@"FlipCounts:%lu",(unsigned long)self.flipCounts];
}


@end
