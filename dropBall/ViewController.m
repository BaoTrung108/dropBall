//
//  ViewController.m
//  dropBall
//
//  Created by trung bao on 16/11/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *ball;
    CGFloat X,Y,centreX,maxY;
    CGFloat statusNavigation;
    CGFloat radiusBall;
    CGFloat V,A;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    centreX = self.view.bounds.size.width * 0.5;
    radiusBall = 32.0;
    X = self.view.bounds.size.width * 0.5;
    statusNavigation = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    maxY = self.view.bounds.size.height - radiusBall;
    Y =  radiusBall + statusNavigation;
    V = 0.0;
    A = 4.0;
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) addBall {
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball"]];
    ball.center = CGPointMake(centreX, Y);
    [self.view addSubview:ball];
}
- (void) dropBall {
    V += A;
    Y += V;
    if (Y > maxY) {
        V = - V * 0.93 ;
        Y = maxY;
    }
    ball.center = CGPointMake(X, Y);
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end
