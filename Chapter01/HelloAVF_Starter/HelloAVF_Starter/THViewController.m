//
//  ViewController.m
//  HelloAVF_Starter
//
//  Created by QinTuanye on 2019/3/22.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "THViewController.h"
#import "THSpeechController.h"
#import <AVFoundation/AVFoundation.h>
#import "THBubbleCell.h"

@interface THViewController () <AVSpeechSynthesizerDelegate>
@property (strong, nonatomic) THSpeechController *speechController;
@property (strong, nonatomic) NSMutableArray *speechStrings;
@end

@implementation THViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 20.0f, 0.0f);
    self.speechController = [THSpeechController speechController];
    self.speechController.synthesizer.delegate = self;
    self.speechStrings = [NSMutableArray arrayWithObjects:@"Hello AV Foundation. How are you?", @"I'm well! Thanks for asking.", @"Are you exow are you? Hello AV Foundation. How are you? Hello AV Foundation. How are you?  Hello AV Foundation. Hello AV Foundation. How are you? Hello AV Foundation. How are you? Hello AV Foundation. How are you? Hello AV Foundation. How are you? How are you? Hello AV Foundation. How are you? Hello AV Foundation. How are you?  you exow are you? Hello AV Foundation. How are you? Hello AV Foundation. How are you?  Hello AV Foundation. Hello AV Foundation. How are you? Hello AV Foundation. How are you? Hello AV Foundation. How are you? Hello AV Foundation. How are you? How are you? Hello AV Foundation. How are you? Hello AV Foundation. How are", @"What's your favorite feature?", @"是考虑对方奥斯卡房间爱上水电费垃圾阿斯利康福建安慰哦你房间迅速是大法官了会计师二批速度快跟你说了", nil];
    [self.speechController beginConversation];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.speechStrings.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self getTextHeightWithStr:self.speechStrings[indexPath.row] withWidth:([UIScreen mainScreen].bounds.size.width - 85 - 29) withLineSpacing:0 withFont:17];
    NSLog(@"width: %f height: %f", ([UIScreen mainScreen].bounds.size.width - 85 - 29), height);
    return MAX(60, ceil(height + 20));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = indexPath.row % 2 == 0 ? @"YouCell" : @"AVFCell";
    NSLog(@"identifier: %@", identifier);
    
    THBubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.messageLabel.text = self.speechStrings[indexPath.row];
    return cell;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    [self.speechStrings addObject:utterance.speechString];
    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.speechStrings.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

/**
 计算文本高度
 
 @param str         文本内容
 @param width       lab宽度
 @param lineSpacing 行间距(没有行间距就传0)
 @param font        文本字体大小
 
 @return 文本高度
 */
-(CGFloat)getTextHeightWithStr:(NSString *)str
                     withWidth:(CGFloat)width
               withLineSpacing:(CGFloat)lineSpacing
                      withFont:(CGFloat)font
{
    if (!str || str.length == 0) {
        return 0;
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
    paraStyle.lineSpacing = lineSpacing;
    paraStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:str
                        attributes:@{NSParagraphStyleAttributeName:paraStyle,
                                     NSFontAttributeName:[UIFont systemFontOfSize:font]}];
    
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                context:nil];
    
    if ((rect.size.height - [UIFont systemFontOfSize:font].lineHeight)  <= lineSpacing){
        if ([self containChinese:str]){
            rect.size.height -= lineSpacing;
        }
    }
    return rect.size.height;
}
//判断是否包含中文
- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

@end
