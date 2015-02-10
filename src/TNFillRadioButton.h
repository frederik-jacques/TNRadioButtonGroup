//
//  TNFillRadioButton.h
//  TNRadioButtonGroupDemo
//
//  Created by olunx on 15/2/9.
//  Copyright (c) 2015年 Frederik Jacques. All rights reserved.
//

#import "TNRadioButton.h"

@interface TNFillRadioButton : TNRadioButton

@property (nonatomic, strong) TNFillRadioButtonData *data;

- (instancetype)initWithData:(TNFillRadioButtonData *)data;

@end
