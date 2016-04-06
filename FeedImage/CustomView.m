//
//  CustomView.m
//  FeedImage
//
//  Created by Jeremy Ong on 06/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (IBAction)onButtonPressed:(id)sender {
	[self.delegate onColourButtonPressed:sender];
}

- (IBAction)onGoButtonPressed:(UIButton *)sender {
	float redValue = self.redSlider.value;
	float greenValue = self.greenSlider.value;
	float blueValue = self.blueSlider.value;
	[self.delegate onGoButtonPressed:sender withRedSliderValue:self.redSlider.value withGreenSliderValue:self.greenSlider.value withBlueSliderValue:self.blueSlider.value];
}

@end
