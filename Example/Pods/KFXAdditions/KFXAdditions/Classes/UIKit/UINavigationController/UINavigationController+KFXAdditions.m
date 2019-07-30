

#import "UINavigationController+KFXAdditions.h"

@implementation UINavigationController (KFXAdditions)

-(void)kfx_makeInvisible{
    
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    self.view.backgroundColor = [UIColor clearColor];
    
}


@end
