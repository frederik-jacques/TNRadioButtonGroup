//
//  RadioButtonGroup.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "TNRadioButtonGroup.h"

NSString *const SELECTED_RADIO_BUTTON_CHANGED = @"selectedRadioButtonChanged";

@interface TNRadioButtonGroup()

@property (nonatomic, strong) NSArray *radioButtonData;
@property (nonatomic) TNRadioButtonGroupLayout layout;
@property (nonatomic) NSInteger widthOfComponent;
@property (nonatomic) NSInteger heightOfComponent;

@end

@implementation TNRadioButtonGroup

#pragma mark - Initializers
- (instancetype)initWithRadioButtonData:(NSArray *)radioButtonData layout:(TNRadioButtonGroupLayout)layout {
    
    self = [super init];
    
    if (self) {
        self.radioButtonData = radioButtonData;
        self.layout = layout;
        self.marginBetweenItems = 15;
		self.itemsInsets = UIEdgeInsetsZero;
        self.rowItemCount = 3;
    }
    
    return self;
}

#pragma mark - Setup
- (void)create {
    [self createRadioButtons];
    
    self.frame = CGRectMake(0, 0, self.widthOfComponent, self.heightOfComponent);
}

 -(void)update {
	for (TNRadioButton *radioButton in self.radioButtons) {
		[radioButton update];
	}
}

- (void)createRadioButtons {
    
    int xPos = _itemsInsets.left;
    int yPos = _itemsInsets.top;
    int maxWidth = 0;
    int maxHeight = 0;
    int i = 0;

    NSMutableArray *tmp = [NSMutableArray new];
    
    for (TNRadioButtonData *data in self.radioButtonData) {
        
        TNRadioButton *radioButton = nil;
        
        if( !data.labelFont) data.labelFont = self.labelFont;
        if( !data.labelColor) data.labelColor = self.labelColor;

        if( [data isKindOfClass:[TNCircularRadioButtonData class]] ){
            radioButton = [[TNCircularRadioButton alloc] initWithData:(TNCircularRadioButtonData *)data];
        }else if( [data isKindOfClass:[TNRectangularRadioButtonData class]] ){
            radioButton = [[TNRectangularRadioButton alloc] initWithData:(TNRectangularRadioButtonData *)data];
        }else if( [data isKindOfClass:[TNImageRadioButtonData class]] ){
            radioButton = [[TNImageRadioButton alloc] initWithData:(TNImageRadioButtonData *)data];
        }else {
            radioButton = [[TNFillRadioButton alloc] initWithData:(TNFillRadioButtonData *)data];
        }
        
        // If there is already a radio button selected ... deselect the current one
        if( self.selectedRadioButton ){
            data.selected = NO;
        }
        
        data.tag = i;
        
        radioButton.delegate = self;

        CGRect frame;
        long rows = (i + self.rowItemCount) / self.rowItemCount;
        if( self.layout == TNRadioButtonGroupLayoutHorizontal ){
            if(i % self.rowItemCount == 0){
                xPos = _itemsInsets.left;
            }else{
                yPos -= radioButton.frame.size.height + self.marginBetweenItems;
            }
            frame = CGRectMake(xPos, yPos, radioButton.frame.size.width, radioButton.frame.size.height);
            maxWidth = self.rowItemCount * (radioButton.frame.size.width + self.marginBetweenItems);
            maxHeight = rows * (radioButton.frame.size.height + self.marginBetweenItems) + self.marginBetweenItems;
        }else{
            frame = CGRectMake(_itemsInsets.left, yPos, radioButton.frame.size.width, radioButton.frame.size.height);
        }
        
        radioButton.frame = frame;
        [self addSubview:radioButton];

        xPos += radioButton.frame.size.width + self.marginBetweenItems;
        yPos += radioButton.frame.size.height + self.marginBetweenItems;
        maxWidth = MAX(maxWidth, radioButton.frame.size.width);
        maxHeight = MAX(maxHeight, radioButton.frame.size.height);

        if( self.layout == TNRadioButtonGroupLayoutVertical ){
            maxHeight = yPos;
        }
        
        if( data.selected ){
            self.selectedRadioButton = radioButton;
        }
        
        [tmp addObject:radioButton];
        i++;
    }
    
    self.widthOfComponent = maxWidth;
    self.heightOfComponent = maxHeight;
    self.radioButtons = [NSArray arrayWithArray:tmp];
}

#pragma mark - TNRadioButtonDelegate methods
- (void)radioButtonDidChange:(TNRadioButton *)radioButton {
    
    for (TNRadioButton *rb in self.radioButtons) {
        
        if( rb != radioButton ){
            rb.data.selected = !radioButton.data.selected;
        }

        [rb selectWithAnimation:YES];
    }
    
    self.selectedRadioButton = radioButton;
}

#pragma mark - Getters / Setters
- (void)setSelectedRadioButton:(TNRadioButton *)selectedRadioButton {
    
    if( _selectedRadioButton != selectedRadioButton ){
        _selectedRadioButton = selectedRadioButton;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:SELECTED_RADIO_BUTTON_CHANGED object:self];
    }
    
}

- (void)setPosition:(CGPoint)position {
    
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
    
}

- (UIColor *)labelColor {
    
    if( !_labelColor ){
        _labelColor = [UIColor blackColor];
    }
    
    return _labelColor;
    
}

- (UIFont *)labelFont {
    
    if( !_labelFont ){
        _labelFont = [UIFont systemFontOfSize:14];
    }
    
    return  _labelFont;
}


@end
