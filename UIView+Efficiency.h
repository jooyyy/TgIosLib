//
//  UIView+Efficiency.h
//  ToWallet
//
//  Created by joy on 2018/4/18.
//  Copyright © 2018年 togreat tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Efficiency)

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat right;

+(CGFloat)topBarHeight;
+(CGFloat)bottomBarHeight;
-(void)top:(CGFloat)mas_top;

@end
