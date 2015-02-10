//
//  RadioButton.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "TNRadioButton.h"

@interface TNRadioButton()

@end

@implementation TNRadioButton

- (instancetype)initWithData:(TNRadioButtonData *)data {
    
    self = [super init];
    
    if (self) {
        self.data = data;
    }
    
    return self;
}

- (void)setup {
    
    [self createLabel];
    [self createHiddenButton];
    
    [self selectWithAnimation:NO];
    self.frame = self.btnHidden.frame;
}

- (void)update {
	[self updateLabel];
}

- (void)updateLabel {
    self.lblButton.backgroundColor = [UIColor clearColor];
    self.lblButton.titleLabel.font = self.data.labelFont;
    [self.lblButton setTitleColor:self.data.labelColor forState:UIControlStateNormal];
    [self.lblButton setTitle:self.data.labelText forState:UIControlStateNormal];

    if(self.data.labelBorderWidth){
        self.lblButton.layer.masksToBounds = YES;
        self.lblButton.layer.cornerRadius = self.data.labelBorderCornerRadius ?: 5.0;
        self.lblButton.layer.borderWidth = self.data.labelBorderWidth ?: 1.0;
        self.lblButton.layer.borderColor = self.data.labelBorderColor ?: [UIColor grayColor].CGColor;
    }
}

- (void)createRadioButton {}

- (void)createLabel {
    
    CGSize labelSize;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        labelSize = [self.data.labelText sizeWithFont:self.data.labelFont forWidth:150 lineBreakMode:NSLineBreakByWordWrapping];
        
    } else {
        CGRect labelRect = [self.data.labelText boundingRectWithSize:CGSizeMake(150, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.data.labelFont} context:nil];
        
        labelSize = CGSizeMake(labelRect.size.width, labelRect.size.height);
        
    }

    self.lblButton = [[UIButton alloc] initWithFrame:CGRectMake(self.radioButton.frame.origin.x + self.radioButton.frame.size.width + self.data.labelMarginLeft, (self.radioButton.frame.size.height - labelSize.height) / 2, self.data.labelWidth ?: labelSize.width, self.data.labelHeight ?: labelSize.height)];
    [self updateLabel];
    [self addSubview:self.lblButton];
}

- (void)createHiddenButton {
    
    int height = MAX(self.lblButton.frame.size.height, self.radioButton.frame.size.height);
    
    self.btnHidden = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnHidden.frame = CGRectMake(0, 0, self.lblButton.frame.origin.x + self.lblButton.frame.size.width, height);
    [self addSubview:self.btnHidden];
    
    [self.btnHidden addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTapped:(id)sender {
    
    if( !self.data.selected ){
        self.data.selected = !self.data.selected;
        
        if ([self.delegate respondsToSelector:@selector(radioButtonDidChange:)]) {
            [self.delegate radioButtonDidChange:self];
        }
        
    }
}

#pragma mark - Animations
- (void)selectWithAnimation:(BOOL)animated {}

@end
