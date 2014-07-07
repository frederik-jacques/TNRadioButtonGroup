//
//  TNRadioButtonData.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "TNRadioButtonData.h"


@implementation TNRadioButtonData

#pragma mark - Debug
- (NSString *)description {
    return [NSString stringWithFormat:@"[TNRadioButtonData] Identifier: %@ - Tag: %li - Selected: %d", self.identifier, (long)self.tag, self.selected];
}

@end
