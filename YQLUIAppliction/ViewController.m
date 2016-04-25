//
//  ViewController.m
//  YQLUIAppliction
//
//  Created by MS on 15-9-1.
//  Copyright (c) 2015年 YQL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self createImageView];
    
    //创建并添加一个按钮
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(130, 96, 60, 30)];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setAlpha:0.5];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
    //错误，只能有一个唯一的UIApplication对象，不能再进行创建
    //UIApplication *app2=[[UIApplication alloc]init];
    
    //通过sharedApplication获取该程序的UIApplication对象
    UIApplication * app = [UIApplication sharedApplication];
    UIApplication * app1 = [UIApplication sharedApplication];
    
    NSLog(@"app:**%@  app1:__%@",app,app1);
    

    //设置指示器的联网动画
    app.networkActivityIndicatorVisible=YES;
    
    //设置状态栏的样式
    //app.statusBarStyle=UIStatusBarStyleDefault;//默认（黑色）
    //设置为白色+动画效果
    [app setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    //设置状态栏是否隐藏
    //app.statusBarHidden=YES;
    //设置状态栏是否隐藏+动画效果
    [app setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
  
    
}
-(void)onClick
{
    
    //判断版本类型
    float sysVersion=[[UIDevice currentDevice]systemVersion].floatValue;
    if (sysVersion>=8.0){
     
    //通知设置”，主要是定义“通知类型”
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    }
    
    //通过sharedApplication获取该程序的UIApplication对象
    UIApplication *app=[UIApplication sharedApplication];
    //设置应用程序图标右上角的红色提醒数字  如果想取消提醒数字的话  将数字🐢0
    app.applicationIconBadgeNumber=2;
    
    //发短信
    //[app openURL:[NSURL URLWithString:@"sms://10086"]];

    //发邮件
    //[app openURL:[NSURL URLWithString:@"mailto://*****@qq.com"]];

    //打开本地资源
    //[app openURL:[NSURL URLWithString:@"file:///Users/ms/***"]];
    
    //打开网页资源
    //[app openURL:[NSURL URLWithString:@"https://www.baidu.com"]];

}


#pragma mark-设置状态栏的样式
-(UIStatusBarStyle)preferredStatusBarStyle
{
    //设置为白色
    return UIStatusBarStyleLightContent;
    //默认为黑色
//    return UIStatusBarStyleDefault;
}


#pragma mark-设置状态栏是否隐藏（否）
-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)createImageView
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    imageView.image = [UIImage imageNamed:@"54-130G9110351.jpg"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
