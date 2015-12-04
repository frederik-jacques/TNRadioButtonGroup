//
//  TNRadioButtonGroup.h
//  TNRadioButtonGroup
//
//  Created by Sascha M Holesch on 2015/12/04.
//  Copyright © 2015年 Frederik Jacques. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for TNRadioButtonGroup.
FOUNDATION_EXPORT double TNRadioButtonGroupVersionNumber;

//! Project version string for TNRadioButtonGroup.
FOUNDATION_EXPORT const unsigned char TNRadioButtonGroupVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <TNRadioButtonGroup/PublicHeader.h>

#import <TNRadioButtonGroup/TNRadioButtonGroup.h>
#import <TNRadioButtonGroup/TNRadioButtonDelegate.h>
#import <TNRadioButtonGroup/TNRadioButtonGroupProtocol.h>
#import <TNRadioButtonGroup/TNRadioButton.h>
#import <TNRadioButtonGroup/TNRadioButtonData.h>
#import <TNRadioButtonGroup/TNCircularRadioButton.h>
#import <TNRadioButtonGroup/TNCircularRadioButtonData.h>
#import <TNRadioButtonGroup/TNImageRadioButton.h>
#import <TNRadioButtonGroup/TNImageRadioButtonData.h>
#import <TNRadioButtonGroup/TNRectangularRadioButton.h>
#import <TNRadioButtonGroup/TNRectangularRadioButtonData.h>

extern NSString *const SELECTED_RADIO_BUTTON_CHANGED;

typedef enum : NSUInteger {
    TNRadioButtonGroupLayoutHorizontal,
    TNRadioButtonGroupLayoutVertical
} TNRadioButtonGroupLayout;

@interface TNRadioButtonGroup : UIView <TNRadioButtonDelegate>

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic) CGPoint position;
@property (nonatomic) NSInteger marginBetweenItems;
@property (nonatomic) UIEdgeInsets itemsInsets;

@property (nonatomic, strong) UIFont *labelFont;
@property (nonatomic, strong) UIColor *labelColor;

@property (nonatomic, strong) UIColor *textActiveColor;
@property (nonatomic, strong) UIColor *textPassiveColor;
@property (nonatomic, strong) UIColor *controlActiveColor;
@property (nonatomic, strong) UIColor *controlPassiveColor;

@property (nonatomic, strong) NSArray *radioButtons;
@property (nonatomic, weak) TNRadioButton *selectedRadioButton;

@property (nonatomic, assign) BOOL multipleOptions;

- (instancetype)initWithRadioButtonData:(NSArray *)radioButtonData layout:(TNRadioButtonGroupLayout)layout;
- (void)create;
- (void)update;
@end
