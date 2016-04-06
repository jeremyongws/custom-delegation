//
//  Picture.h
//  FeedImage
//
//  Created by Jeremy Ong on 06/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Picture : NSObject

@property UIImage *image;
@property UIColor *frameColor;

- (Picture *)initWithImageName:(NSString *)imageName andColor:(UIColor *)frameColor;

@end
