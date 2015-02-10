//
//  TNFillRadioButton.m
//  TNRadioButtonGroupDemo
//
//  Created by olunx on 15/2/9.
//  Copyright (c) 2015年 Frederik Jacques. All rights reserved.
//

#import "TNFillRadioButton.h"

@implementation TNFillRadioButton

#pragma mark - Initializers

- (instancetype)initWithData:(TNFillRadioButtonData *)data {

    self = [super initWithData:data];

    if (self) {
        // Initialization code
        self.data = data;

        [self setup];
    }

    return self;
}

#pragma mark - Creation
- (void)setup{

    [self createRadioButton];

    [super setup];
}

- (void)update {
    [super update];

    self.lblButton.backgroundColor = ( self.data.selected ) ? self.data.labelBgSelectedColor : self.data.labelBgNormalColor;
}

#pragma mark - Animations
- (void)selectWithAnimation:(BOOL)animated {

    self.lblButton.backgroundColor = ( self.data.selected ) ? self.data.labelBgSelectedColor : self.data.labelBgNormalColor;

}

@end
