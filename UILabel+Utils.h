#import <UIKit/UIKit.h>

@interface UILabel (Utils)

-(void) setText:(NSString *)text lineSpacing:(CGFloat) lineSpacing;
-(CGFloat) getHeightByLineSpacing:(CGFloat) lineSpacing fontSize:(CGFloat)size;
-(void) setMultipleFont:(NSArray<NSString*>*)text fonts:(NSArray<UIFont*>*)fonts colors:(NSArray<UIColor*>*)colors;
+(CGSize)getSizeFromString:(NSString*)str withFont:(UIFont*)font;
+(CGFloat) getLabelHeightByContent:(NSString*)content font:(UIFont*)font width:(CGFloat)width lineSpacing:(CGFloat)spacing;
+(CGFloat)getLabelHeightWithText:(NSString *)text width:(CGFloat)width size: (CGFloat)size;
+(CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height size:(CGFloat)size;
+(UILabel*)newLabel:(CGRect)frame size:(CGFloat)size weight:(UIFontWeight)weight color:(UIColor*)color align:(NSTextAlignment)align;

@end
