//
//  Audio.m
//  SJFinal
//
//  Created by Student on 5/20/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import "Audio.h"
@import AVFoundation;

@interface Audio () <AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioSession *audioSession;
@property (strong, nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@property (assign) BOOL backgroundMusicPlaying;
@property (assign) BOOL backgroundMusicInterrupted;

@end

@implementation Audio

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureAudioSession];
        [self configureAudioPlayer];
    }
    return self;
}

- (void)tryPlayMusic {
    if (self.backgroundMusicPlaying || [self.audioSession isOtherAudioPlaying]) {
        return;
    }
    
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    self.backgroundMusicPlaying = YES;
}

- (void) configureAudioSession {
  
    self.audioSession = [AVAudioSession sharedInstance];
    
    
    NSError *setCategoryError = nil;
    if ([self.audioSession isOtherAudioPlaying]) { 
        [self.audioSession setCategory:AVAudioSessionCategorySoloAmbient error:&setCategoryError];
        self.backgroundMusicPlaying = NO;
    } else {
        [self.audioSession setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    }
    if (setCategoryError) {
        NSLog(@"Error setting category! %ld", (long)[setCategoryError code]);
    }
}

- (void)configureAudioPlayer {
    NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource:@"Vader" ofType:@"caf"];
    NSURL *backgroundMusicURL = [NSURL fileURLWithPath:backgroundMusicPath];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:nil];
    self.backgroundMusicPlayer.delegate = self;
    self.backgroundMusicPlayer.numberOfLoops = -1;
}

- (void) audioPlayerBeginInterruption: (AVAudioPlayer *) player {
    
    self.backgroundMusicInterrupted = YES;
    self.backgroundMusicPlaying = NO;
}

- (void) audioPlayerEndInterruption: (AVAudioPlayer *) player withOptions:(NSUInteger) flags{
    [self tryPlayMusic];
    self.backgroundMusicInterrupted = NO;
}


@end
