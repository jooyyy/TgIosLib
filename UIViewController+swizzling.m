//
//  UIViewController+swizzling.m
//  DaLong-iOS
//
//  Created by joy on 2018/9/8.
//  Copyright © 2018年 togreat tech. All rights reserved.
//

#import "UIViewController+swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController(swizzling)

+(void)load {
    SEL origSel = @selector(viewDidAppear:);
    SEL swizSel = @selector(swiz_viewDidAppear:);
    [UIViewController swizzMethods:[self class] originalSelector:origSel swizzledSelector:swizSel];
}

+(void)swizzMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel {
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    if(didAddMethod) {
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else {
        method_exchangeImplementations(origMethod, swizMethod);
    }
}

-(void)swiz_viewDidAppear:(BOOL)animated {
    NSLog(@"--->  i ma in [siwz_viewDidappear");
    [self swiz_viewDidAppear:animated];
}

@end
