//
//  TNCircularRadioButtonData.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "TNCircularRadioButtonData.h"

@implementation TNCircularRadioButtonData

- (instancetype)init {
    
    self = [super init];

    if (self) {
        
    }
    
    return self;
}

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

- (UIColor *)circleActiveColor {
    
    if( !_circleActiveColor ){
        _circleActiveColor = [UIColor blackColor];
    }
    
    return _circleActiveColor;
}

- (UIColor *)circlePassiveColor {
    
    if( !_circlePassiveColor ){
        _circlePassiveColor = [UIColor blackColor];
    }
    
    return _circlePassiveColor;
}

- (NSInteger)borderRadius {
    
    if( !_borderRadius ){
        _borderRadius = 12;
    }
    
    return _borderRadius;
}

- (NSInteger)circleRadius {
    
    if( !_circleRadius ){
        _circleRadius = 6;
    }
    
    return _circleRadius;
}

- (CGFloat)circleLineThickness {
	if( !_circleLineThickness ){
        _circleLineThickness = 2.0f;
    }
    
    return _circleLineThickness;
}

@end
