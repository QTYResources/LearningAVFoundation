//
//  THPlayerController.h
//  AudioLooper_Starter
//
//  Created by QinTuanye on 2019/3/25.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol THPlayerControllerDelegate <NSObject>

- (void)playbackStopped;
- (void)playbackBegan;

@end

@interface THPlayerController : NSObject

@property (nonatomic, getter = isPlaying) BOOL playing;
@property (weak, nonatomic) id<THPlayerControllerDelegate> delegate;

// Global methods
- (void)play;
- (void)stop;
- (void)adjustRate:(float)rate;

// Player-specific methods
- (void)adjustPan:(float)pan forPlayerAtIndex:(NSUInteger)index;
- (void)adjustVolume:(float)volume forPlayerAtIndex:(NSUInteger)index;

@end
