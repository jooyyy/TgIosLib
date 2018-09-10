#import "UIView+ViewController.h"

@implementation UIView(ViewController)

-(UIViewController*) resp_viewController {
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = responder.nextResponder;
    }
    return nil;
}

@end
