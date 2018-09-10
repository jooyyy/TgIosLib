//
//  UIView+Efficiency.m
//  ToWallet
//
//  Created by joy on 2018/4/18.
//  Copyright © 2018年 togreat tech. All rights reserved.
//

#import "UIView+Efficiency.h"
#import "sys/utsname.h"

@implementation UIView (Efficiency)

- (CGFloat) height {
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight {
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width {
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth {
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

-(CGFloat) x {
    return self.frame.origin.x;
}

-(void) setX:(CGFloat) x {
    CGRect newframe = self.frame;
    newframe.origin.x = x;
    self.frame = newframe;
}

-(CGFloat) y {
    return self.frame.origin.y;
}

-(void) setY:(CGFloat) y {
    CGRect newframe = self.frame;
    newframe.origin.y = y;
    self.frame = newframe;
}

-(void) setRight:(CGFloat)right {
    CGRect newframe = self.frame;
    newframe.origin.x = right -self.frame.size.width;
    self.frame = newframe;
}

-(CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat) top {
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop {
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom {
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat) left {
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft {
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

-(void) top:(CGFloat)mas_top {
    CGRect frame = self.frame;
    frame.origin.y = mas_top;
    self.frame = frame;
}

+(CGFloat) topBarHeight {
    if ([self isIphoneX]) {
        return 44;
    }else {
        return 20;
    }
}

+(CGFloat) bottomBarHeight {
    if ([self isIphoneX]) {
        return 34;
    }
    return 0;
}

+(BOOL)isIphoneX {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"]) {
        // judgment by height when in simulators
        return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
                CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)));
    }
    BOOL isIPhoneX = [platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"];
    return isIPhoneX;
}
@end
