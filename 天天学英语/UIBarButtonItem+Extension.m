//
//  UIBarButtonItem+Extension.m
//
//
//  Created by user on 15/1/24.
//  Copyright (c) 2015年 Ly. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+YP.h"
#import "UIImage+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName targer:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
//    btn.x = 0;
    btn.size = btn.currentBackgroundImage.size;
//    btn.size = CGSizeMake(75, 33);

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

+ (UIBarButtonItem *)itemName:(NSString *)name targer:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:name forState:UIControlStateNormal];
    //    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
//    btn.x =
    btn.size = CGSizeMake(44, 44);
    
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
