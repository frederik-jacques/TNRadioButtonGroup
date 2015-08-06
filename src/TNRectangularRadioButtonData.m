//
//  TNRectangularRadioButtonData.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "TNRectangularRadioButtonData.h"

@implementation TNRectangularRadioButtonData


#pragma mark - Getters and setters
- (UIColor *)borderActiveColor {
    
    if( !_borderActiveColor ){
        _borderActiveColor = [UIColor blackColor];
    }
    
    return _borderActiveColor;
}

- (UIColor *)borderPassiveColor {
    
    if( !_borderPassiveColor ){
        _borderPassiveColor = [UIColor blackColor];
    }
    
    return _borderPassiveColor;
}

- (UIColor *)rectangleActiveColor {
    
    if( !_rectangleActiveColor ){
        _rectangleActiveColor = [UIColor blackColor];
    }
    
    return _rectangleActiveColor;
}

- (UIColor *)rectanglePassiveColor {
    
    if( !_rectanglePassiveColor ){
        _rectanglePassiveColor = [UIColor blackColor];
    }
    
    return _rectanglePassiveColor;
}

- (NSInteger)borderWidth {
    
    if( !_borderWidth ){
        _borderWidth = 12;
    }
    
    return _borderWidth;
}

- (NSInteger)borderHeight {
    
    if( !_borderHeight ){
        _borderHeight = 12;
    }
    
    return _borderHeight;
}

- (NSInteger)rectangleWidth {
    
    if( !_rectangleWidth ){
        _rectangleWidth = 6;
    }
    
    return _rectangleWidth;
}

- (NSInteger)rectangleHeight {
    
    if( !_rectangleHeight ){
        _rectangleHeight = 6;
    }
    
    return _rectangleHeight;
}

- (CGFloat)borderLineThickness {
	if( !_borderLineThickness ){
        _borderLineThickness = 2.0f;
    }
    
    return _borderLineThickness;
}



@end
