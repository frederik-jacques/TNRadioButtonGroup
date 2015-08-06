//
//  MainView.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
        [self addSubview:self.background];
        
        [self createHorizontalList];
        [self createVerticalList];
        [self createHorizontalListWithImage];
    }
    
    return self;
}

- (void)createHorizontalList {
    TNCircularRadioButtonData *maleData = [TNCircularRadioButtonData new];
    maleData.labelText = @"Male";
    maleData.identifier = @"male";
    maleData.selected = YES;

    
    TNCircularRadioButtonData *femaleData = [TNCircularRadioButtonData new];
    femaleData.labelText = @"Female";
    femaleData.identifier = @"female";
    femaleData.selected = NO;
    femaleData.borderRadius = 12;
    femaleData.circleRadius = 5;
    
    TNCircularRadioButtonData *alienData = [TNCircularRadioButtonData new];
    alienData.labelText = @"Alien";
    alienData.identifier = @"alien";
    alienData.selected = NO;
    alienData.borderRadius = 12;
    alienData.circleRadius = 5;
    
    self.sexGroup = [[TNRadioButtonGroup alloc] initWithRadioButtonData:@[maleData, femaleData, alienData] layout:TNRadioButtonGroupLayoutHorizontal];
    self.sexGroup.identifier = @"Sex group";
    [self.sexGroup create];
    self.sexGroup.position = CGPointMake(25, 175);
    [self addSubview:self.sexGroup];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sexGroupUpdated:) name:SELECTED_RADIO_BUTTON_CHANGED object:self.sexGroup];

	// show how update data works...

	[self.sexGroup update];

}

- (void)createVerticalList {
    TNRectangularRadioButtonData *snowboardData = [TNRectangularRadioButtonData new];
    snowboardData.labelText = @"Snowboarding";
    snowboardData.identifier = @"snowboarding";
    snowboardData.selected = NO;
  
    
    TNRectangularRadioButtonData *tennisData = [TNRectangularRadioButtonData new];
    tennisData.labelText = @"Tennis";
    tennisData.identifier = @"tennis";
    tennisData.selected = YES;
    tennisData.borderWidth = tennisData.borderHeight = 12;
    tennisData.rectangleWidth = tennisData.rectangleHeight = 5;
    
    TNRectangularRadioButtonData *programmingData = [TNRectangularRadioButtonData new];
    programmingData.labelText = @"Programming";
    programmingData.identifier = @"programming";
    programmingData.selected = NO;
    programmingData.borderWidth = programmingData.borderHeight = 12;
    programmingData.rectangleWidth = programmingData.rectangleHeight = 5;
    
    self.hobbiesGroup = [[TNRadioButtonGroup alloc] initWithRadioButtonData:@[snowboardData,tennisData, programmingData] layout:TNRadioButtonGroupLayoutVertical];
    self.hobbiesGroup.identifier = @"Hobbies group";
    self.hobbiesGroup.textActiveColor = [UIColor redColor];
    self.hobbiesGroup.textPassiveColor = [UIColor blueColor];
    self.hobbiesGroup.controlActiveColor = [UIColor greenColor];
    self.hobbiesGroup.controlPassiveColor = [UIColor cyanColor];
    [self.hobbiesGroup create];
    self.hobbiesGroup.position = CGPointMake(25, 265);

    [self addSubview:self.hobbiesGroup];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hobbiesGroupUpdated:) name:SELECTED_RADIO_BUTTON_CHANGED object:self.hobbiesGroup];

	// show how update data works...

	[self.hobbiesGroup update];

}

- (void)createHorizontalListWithImage {
    TNImageRadioButtonData *coldData = [TNImageRadioButtonData new];
    coldData.labelText = @"Hot";
    coldData.identifier = @"hot";
    coldData.selected = YES;
    coldData.unselectedImage = [UIImage imageNamed:@"unchecked"];
    coldData.selectedImage = [UIImage imageNamed:@"checked"];
    
    TNImageRadioButtonData *hotData = [TNImageRadioButtonData new];
    hotData.labelText = @"Cold";
    hotData.identifier = @"cold";
    hotData.selected = NO;
    hotData.unselectedImage = [UIImage imageNamed:@"unchecked"];
    hotData.selectedImage = [UIImage imageNamed:@"checked"];
    
    self.temperatureGroup = [[TNRadioButtonGroup alloc] initWithRadioButtonData:@[coldData, hotData] layout:TNRadioButtonGroupLayoutVertical];
    self.temperatureGroup.identifier = @"Temperature group";
    [self.temperatureGroup create];
    self.temperatureGroup.position = CGPointMake(25, 400);
    
    [self addSubview:self.temperatureGroup];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(temperatureGroupUpdated:) name:SELECTED_RADIO_BUTTON_CHANGED object:self.temperatureGroup];
}

- (void)sexGroupUpdated:(NSNotification *)notification {
    NSLog(@"[MainView] Sex group updated to %@", self.sexGroup.selectedRadioButton.data.identifier);
}

- (void)hobbiesGroupUpdated:(NSNotification *)notification {
    NSLog(@"[MainView] Hobbies group updated to %@", self.hobbiesGroup.selectedRadioButton.data.identifier);
}

- (void)temperatureGroupUpdated:(NSNotification *)notification {
    NSLog(@"[MainView] Temperature group updated to %@", self.temperatureGroup.selectedRadioButton.data.identifier);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SELECTED_RADIO_BUTTON_CHANGED object:self.sexGroup];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SELECTED_RADIO_BUTTON_CHANGED object:self.hobbiesGroup];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SELECTED_RADIO_BUTTON_CHANGED object:self.temperatureGroup];
}

@end
