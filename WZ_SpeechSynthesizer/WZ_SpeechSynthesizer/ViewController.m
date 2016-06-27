//
//  ViewController.m
//  WZ_SpeechSynthesizer
//
//  Created by songbiwen on 16/6/27.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.array = @[
                   @"最是一年春好处,绝胜烟柳满皇都",
                   @"陌上花开,可缓缓归矣",
                   @"沾衣欲湿杏花雨，吹面不寒杨柳风",
                   @"竹外桃花三两枝，春江水暖鸭先知",
                   @"几处早莺争暖树,谁家新燕啄春泥",
                   @"乱花渐欲迷人眼,浅草才能没马蹄"
                   ];
}

- (IBAction)buttonAction {
    
    for (int i = 0; i < self.array.count; i ++) {
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.array[i]];
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        utterance.rate = 0.5;
        utterance.postUtteranceDelay = 0.1;
        utterance.pitchMultiplier = 0.8;
        [self.synthesizer speakUtterance:utterance];
    }
}
@end
