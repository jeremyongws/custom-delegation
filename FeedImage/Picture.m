//
//  Picture.m
//  FeedImage
//
//  Created by Jeremy Ong on 06/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "Picture.h"

@implementation Picture

- (Picture *)initWithImageName:(NSString*)imageName andColor:(UIColor *)frameColor{
	Picture *temp = [[Picture alloc] init];
	temp.image = [UIImage imageNamed:imageName];
	temp.frameColor = frameColor;
	return temp;
}

@end
