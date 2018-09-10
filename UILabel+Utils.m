#import "UILabel+Utils.h"

@implementation UILabel (Utils)

-(void) setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, [text length])];
    self.attributedText = attrStr;
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
//    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:lineSpacing];
//    [paragraphStyle setLineBreakMode:self.lineBreakMode];
//    [paragraphStyle setAlignment:self.textAlignment];
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
//    self.attributedText = attributedString;
}

-(CGFloat) getHeightByLineSpacing:(CGFloat) lineSpacing fontSize:(CGFloat)size {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, MAXFLOAT)];
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = 0;
    [label setText:self.text lineSpacing:lineSpacing];
    [label sizeToFit];
    return label.frame.size.height;
}

+(CGFloat) getLabelHeightByContent:(NSString*)content font:(UIFont*)font width:(CGFloat)width lineSpacing:(CGFloat)spacing {
    if (nil == content || nil == font) {
        return 0.0;
    }
    CGRect size = [content boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    NSInteger lineNumber = size.size.height/15;
    if (lineNumber < 2) {
        return size.size.height;
    }
    return size.size.height + lineNumber*spacing;
}

+ (CGSize)getSizeFromString:(NSString*)str withFont:(UIFont*)font{
    return [str sizeWithAttributes:@{
                                     NSFontAttributeName : font
                                     }];
    
}

+ (CGFloat)getLabelHeightWithText:(NSString *)text width:(CGFloat)width size: (CGFloat)size {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    return rect.size.height;
}

+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height size:(CGFloat)size {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}
                                     context:nil];
    return rect.size.width;
}

-(void) setMultipleFont:(NSArray<NSString*>*)text fonts:(NSArray<UIFont*>*)fonts colors:(NSArray<UIColor*>*)colors {
    NSString *s = @"";
    for (NSString *t in text) {
        s = [NSString stringWithFormat:@"%@%@", s, t];
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:s];
    NSUInteger index = 0;
    for (NSInteger i = 0; i < fonts.count; i++) {
        [str addAttribute:NSFontAttributeName value:fonts[i] range:NSMakeRange(index, text[i].length)];
        [str addAttribute:NSForegroundColorAttributeName value:colors[i] range:NSMakeRange(index, text[i].length)];
        index+=(text[i].length);
    }
    self.attributedText = str;
}


+(UILabel*)newLabel:(CGRect)frame size:(CGFloat)size weight:(UIFontWeight)weight color:(UIColor*)color align:(NSTextAlignment)align {
    UILabel *l = [[UILabel alloc] initWithFrame:frame];
    l.font = [UIFont systemFontOfSize:size weight:weight];
    l.textColor = color;
    l.textAlignment = align;
    return l;
}

@end
