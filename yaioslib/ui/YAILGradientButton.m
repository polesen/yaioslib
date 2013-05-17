//
//  YAILGradientButton.m
//  yaiolib
//
//  Created by Per Olesen on 1/31/12.
//  Copyright (c) 2012 Per Olesen. All rights reserved.
//

#import "YAILGradientButton.h"

@interface YAILGradientButton ()
@property(nonatomic, retain) CAGradientLayer *gradientLayer;

@end

@implementation YAILGradientButton {
@private
    UIColor *_highColor;
    UIColor *_lowColor;
    CAGradientLayer *_gradientLayer;
}

@synthesize highColor = _highColor;
@synthesize lowColor = _lowColor;
@synthesize gradientLayer = _gradientLayer;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _gradientLayer = [[CAGradientLayer alloc] init];
        [self updateGradientLayerSizeAndPosition];

        // Insert the layer at position zero to make sure the
        // text of the button is not obscured
        [[self layer] insertSublayer:_gradientLayer atIndex:0];

        // bordered, with rounded corners
        [[self layer] setBorderWidth:1.0f];
        [[self layer] setCornerRadius:8.0f];
        [[self layer] setMasksToBounds:YES];

        // need redraw on bounds change instead of stretch
        self.contentMode = UIViewContentModeRedraw;
    }
    return self;
}

- (void)updateGradientLayerSizeAndPosition {
// Set layer bounds to be the same as its parent
    [_gradientLayer setBounds:[self bounds]];

    // Center the layer inside the parent layer
    [_gradientLayer setPosition:CGPointMake([self bounds].size.width / 2, [self bounds].size.height / 2)];
}

- (BOOL)isOpaque {
    return CGColorGetAlpha([self.backgroundColor CGColor]) >= 1.0 ? YES : NO;
}

- (void)drawRect:(CGRect)rect {
    if (_highColor && _lowColor) {
        // Set the colors for the gradient to the two colors specified for high and low
        [_gradientLayer setColors:[NSArray arrayWithObjects:(id) [_highColor CGColor], (id) [_lowColor CGColor], nil]];
    }
    [self updateGradientLayerSizeAndPosition];
    [super drawRect:rect];
}

- (void)setHighColor:(UIColor *)color; {
    _highColor = color;
    [[self layer] setNeedsDisplay]; // repaint
}

- (void)setLowColor:(UIColor *)color; {
    _lowColor = color;
    [[self layer] setNeedsDisplay]; // repaint
}

@end
