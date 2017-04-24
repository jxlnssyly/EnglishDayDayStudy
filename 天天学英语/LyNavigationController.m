//
//  LyNavigationController.m
//  
//
//  Created by user on 15/1/24.
//  Copyright (c) 2015年 Ly. All rights reserved.
//

#import "LyNavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
//#import "UINavigationController+FDFullscreenPopGesture.h"

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define leftNormalImage @"commond_back"
#define leftHightImage @""
#define rightNormalImage @""
#define rightHightImage @""


@interface LyNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LyNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationBar.translucent = NO;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:leftNormalImage targer:self action:@selector(back)];
//        self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

// 当第一次使用这个类的时候调用1次
+ (void)initialize
{
    // 设置UINavigationBarTheme的主题
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemThem];
}

+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]};

    [appearance setTitleTextAttributes:dict];
    
    [appearance setBarTintColor:[self colorWithString:@"#4CAF50"]];
}

// 设置UIBarButtonItem的主题
+ (void)setupBarButtonItemThem
{
    // 通过appearance对象能修改整个项目中所有的UIBarButtonItem的样式
    
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /** 设置文字属性 **/
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置高亮状态的文字属性
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    /**设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}

int charToInt(char c);
int stringToInt(NSString *str){
    int res = 0;
    
    NSInteger length = str.length;
    for (int i = 0; i < length; i++) {
        char c = [str characterAtIndex:i];
        int s = charToInt(c);
        res += s * pow(16, length - 1 - i);
    }
    
    return res;
}

int charToInt(char c){
    int res = 0;
    if (c >= 'A' && c <= 'F') {
        switch (c) {
            case 'A':
            {
                res = 10;
            }
                break;
            case 'B':
            {
                res = 11;
            }
                break;
            case 'C':
            {
                res = 12;
            }
                break;
            case 'D':
            {
                res = 13;
            }
                break;
            case 'E':
            {
                res = 14;
            }
                break;
            case 'F':
            {
                res = 15;
            }
                break;
                
            default:
                break;
        }
    }
    
    if (c >= '0' && c <= '9') {
        res = c-48;
    }
    
    return res;
}

+(UIColor *)colorWithString:(NSString *)colorString{
    colorString = [colorString uppercaseString];
    UIColor *color = nil;
    // #ff00ff
    if (![colorString hasPrefix:@"#"]) {
        return color;
    }
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    if ([colorString length] == 7) {
        NSString *rs = [colorString substringWithRange:NSMakeRange(1, 2)];
        NSString *gs = [colorString substringWithRange:NSMakeRange(3, 2)];
        NSString *bs = [colorString substringWithRange:NSMakeRange(5, 2)];
        r = stringToInt(rs);
        g = stringToInt(gs);
        b = stringToInt(bs);
    }
    
    
    color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
    
    return color;
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

@end
