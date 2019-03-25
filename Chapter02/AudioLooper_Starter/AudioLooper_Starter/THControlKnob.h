//
//  THControlKnob.h
//  AudioLooper_Starter
//
//  Created by QinTuanye on 2019/3/23.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THControlKnob : UIControl

@property (nonatomic, assign) float maximumValue;
@property (nonatomic, assign) float minimumValue;
@property (nonatomic, assign) float value;
@property (nonatomic, assign) float defaultValue;

@end

@interface THGreenControlKnob : THControlKnob

@end


@interface THOrangeControlKnob : THControlKnob

@end
