//
//  CustomView.h
//  FeedImage
//
//  Created by Jeremy Ong on 06/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomViewDelegate <NSObject>

@required
- (void) onColourButtonPressed:(UIButton *)button ;
- (void)onGoButtonPressed:(UIButton *)sender withRedSliderValue:(float)redSliderValue withGreenSliderValue:(float)greenSliderValue withBlueSliderValue:(float)blueSliderValue;

@end

@interface CustomView : UIView

@property (nonatomic, assign) id <CustomViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end
