//
//  UIBarButtonItem+Extension.h
//
//
//  Created by user on 15/1/24.
//  Copyright (c) 2015年 Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 导航按钮自定义（图片生成按钮）

 @param imageName 按钮图
 @param target    执行对象
 @param action    时间

 @return 返回导航按钮
 */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName targer:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemName:(NSString *)name targer:(id)target action:(SEL)action;

@end
