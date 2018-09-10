//
//  NSString+Util.m
//  ToWallet
//
//  Created by joy on 2018/4/26.
//  Copyright © 2018年 togreat tech. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString(Util)

-(NSString*) RemoveExcessZeros {
    if (![self containsString:@"."]) {
        return self;
    }
    for (NSInteger index = self.length-1;index>=0;index--) {
        NSString *c = [NSString stringWithFormat:@"%c", [self characterAtIndex:index]];
        if (![c isEqual: @"0"]) {
            if ([c isEqualToString:@"."] && index > 0) {
                return [self substringWithRange:NSMakeRange(0, index)];
            }else {
                return [self substringWithRange:NSMakeRange(0, index+1)];
            }
        }
    }
    return self;
}

-(NSString *) FormatUnixTimeStringToDate {
    double unixTimeStamp = [self doubleValue];
    NSTimeInterval interval = unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}

@end
