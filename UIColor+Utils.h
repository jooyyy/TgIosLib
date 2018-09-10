//
//  UIColor+Utils.h
//  ToWallet
//
//  Created by joy on 2018/4/26.
//  Copyright © 2018年 togreat tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(Utils)
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
@end
