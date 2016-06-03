//
//  ViewController.m
//  04-帧动画(拳皇)
//
//  Created by xiaomage on 16/6/1.
//  Copyright © 2016年 赵恩峰. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong , nonatomic) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self stand];
}

#pragma mark - 站立
- (IBAction)stand {
    [self play:10 imageName:@"stand"];
//    // 1.创建图片
//    NSMutableArray *tempImages = [NSMutableArray array];
//    for (int i = 0; i < 10; i++) {
//        // 获取图片吗
//        NSString *imaegName = [NSString stringWithFormat:@"stand_%d",i + 1];
//        UIImage *image = [UIImage imageNamed:imaegName];
//        [tempImages addObject:image];
//    }
//    // 设置图片的动画
//    self.imageView.animationImages = tempImages;
//    
//    // 设置动画次数
//    self.imageView.animationRepeatCount = 1;
//    
//    // 设置显示的图片
//    self.imageView.image = [UIImage imageNamed:@"stand_1"];
//    // 开启动画
//    [self.imageView startAnimating];
}

#pragma mark - 大招
- (IBAction)dazhao {
    [self play:87 imageName:@"dazhao"];
//    // 1.创建图片
//    NSMutableArray *tempImages = [NSMutableArray array];
//    for (int i = 0; i < 87; i++) {
//        // 获取图片吗
//        NSString *imaegName = [NSString stringWithFormat:@"dazhao_%d",i + 1];
//        UIImage *image = [UIImage imageNamed:imaegName];
//        [tempImages addObject:image];
//    }
//    // 设置图片的动画
//    self.imageView.animationImages = tempImages;
//    
//    // 设置动画次数
//    self.imageView.animationRepeatCount = 1;
//    
//    // 设置显示的图片
//    self.imageView.image = [UIImage imageNamed:@"stand_1"];
//    // 开启动画
//    [self.imageView startAnimating];
}

// 缓存
#pragma mark - 播放帧动画
- (void)play:(int) count imageName:(NSString *)name
{
    // 1.创建图片
    NSMutableArray *tempImages = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        // 获取图片名
        NSString *imaegName = [NSString stringWithFormat:@"%@_%d",name,i + 1];
        // 获取图片的全路径
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imaegName ofType:@"png"];
        // 通过imageNamed:加载图片默认使用缓存技术
//        UIImage *image = [UIImage imageNamed:imaegName];
        
        // 通过imageWithContentsOfFile:加载图片不使用缓存技术
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        [tempImages addObject:image];
    }
    
    // 设置图片的动画
    self.imageView.animationImages = tempImages;
    // 设置动画的时间
    self.imageView.animationDuration = count * 0.06;
    // 设置动画次数
    self.imageView.animationRepeatCount = [name isEqualToString:@"stand"] ? 0 : 1;
    
    // 设置显示的图片
//    self.imageView.image = [UIImage imageNamed:@"stand_1"];
    // 开启动画
    [self.imageView startAnimating];
    
    if ([name isEqualToString:@"stand"]) return;
    // 大招动画播放完毕后播放站立的动画
    // self.imageView.animationDuration后,执行self的satnd方法
    [self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
    
    // 播放音频
    // 资源的路径对象
//    NSURL *url = [NSURL URLWithString:@"file:///Users/xiaomage/Desktop/dazhao.mp3"];
    // 获取软件安装包对象
    NSBundle *bundle = [NSBundle mainBundle];
    // 获取安装包中某一个资源的路径
    NSURL *url = [bundle URLForResource:@"dazhao" withExtension:@"mp3"];
    
//    [bundle pathForResource:@"dazhao.mp3" ofType:nil];
//    NSURL *url = ;
    // 创建播放器对象
//    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
    self.player = [[AVPlayer alloc] initWithURL:url];
    [self.player play];
}


















@end
