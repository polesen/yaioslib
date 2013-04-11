//
//  YAILViewController.m
//  yaioslib-SampleApp
//
//  Created by Per Olesen on 4/11/13.
//  Copyright (c) 2013 Per Olesen. All rights reserved.
//

#import "YAILViewController.h"
#import "YAILGradientButton.h"

@interface YAILViewController ()

@end

@implementation YAILViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	YAILGradientButton *gradientButton = [[YAILGradientButton alloc] initWithFrame:CGRectMake(5, 5, 310, 45)];
    gradientButton.highColor = [UIColor lightGrayColor];
    gradientButton.lowColor = [UIColor darkGrayColor];
    [gradientButton setTitle:@"I am a Gradient Button" forState:UIControlStateNormal];
    
    [self.view addSubview:gradientButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
