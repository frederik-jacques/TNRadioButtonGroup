//
//  MainView.h
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TNRadioButtonGroup.h"

@interface MainView : UIView

@property (nonatomic, strong) UIImageView *background;

@property (nonatomic, strong) TNRadioButtonGroup *sexGroup;
@property (nonatomic, strong) TNRadioButtonGroup *hobbiesGroup;
@property (nonatomic, strong) TNRadioButtonGroup *temperatureGroup;

@end
