//
//  THSpeechController.h
//  HelloAVF_Final
//
//  Created by QinTuanye on 2019/3/22.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface THSpeechController : NSObject

@property (strong, nonatomic, readonly) AVSpeechSynthesizer *synthesizer;

+ (instancetype)speechController;
- (void)beginConversation;

@end
