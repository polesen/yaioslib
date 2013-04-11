//
//  YAILGradientButton.h
//  yaioslib
//
//  Created by Per Olesen on 1/31/12.
//  Copyright (c) 2012 Per Olesen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface YAILGradientButton : UIButton {
@private
    UIColor *_highColor;
    UIColor *_lowColor;
    CAGradientLayer *_gradientLayer;
}

@property(nonatomic, retain) UIColor *highColor;
@property(nonatomic, retain) UIColor *lowColor;

@end
