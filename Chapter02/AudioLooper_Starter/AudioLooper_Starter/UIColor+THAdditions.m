//
//  UIColor+THAdditions.m
//  AudioLooper_Starter
//
//  Created by QinTuanye on 2019/3/23.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "UIColor+THAdditions.h"

@implementation UIColor (THAdditions)

-(UIColor *)lighterColor {
    CGFloat hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        return [UIColor colorWithHue:hue saturation:saturation brightness:MIN(brightness * 1.3, 1.0) alpha:0.5];
    }
    return nil;
}

- (UIColor *)darkerColor {
    CGFloat hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness * 0.92 alpha:alpha];
    }
    return nil;
}

@end
