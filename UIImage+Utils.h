#import <UIKit/UIKit.h>

@interface UIImage (Utils)

-(UIImage *)normalizedImage;
+(UIImage *) imageFromColor:(UIColor *) color;
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;
+(UIImage *)triangleImageWithSize:(CGSize)size tintColor:(UIColor *)tintColor;
+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
+(UIImage *)handleImageOrientation:(UIImage*)image;

@end
