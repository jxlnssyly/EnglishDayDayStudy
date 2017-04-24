//
//  UIImage+Extension.h
//
//
//  Created by user on 15/1/23.
//  Copyright (c) 2015年 Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


+ (UIImage *)resizedImage:(NSString *)name;

/**
 *  屏幕截图
 *
 *  @param view 需要截图的view
 *
 *  @return 返回截图后的图片
 */
+ (instancetype)captureWithView:(UIView *)view;


//通过颜色来生成一个纯色图片
+ (UIImage *)buttonImageFromColor:(UIColor *)color;


//图片压缩到指定大小
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

- (UIImage *)scaleImageToKb:(NSInteger)kb;
- (UIImage*)compressToCompressent:(float)compress;

- (NSData *)resetSizeOfImageDataMaxSize:(NSInteger)maxSize;

@end
