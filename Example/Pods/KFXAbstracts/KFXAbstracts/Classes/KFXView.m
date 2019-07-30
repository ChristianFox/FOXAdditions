/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/

#import "KFXView.h"


@implementation KFXView


+(instancetype)kfx_viewWithFrame:(CGRect)frame
                    drawingBlock:(KFXViewDrawingBlock)block {
    
    KFXView *view = [[[self class] alloc] initWithFrame:frame];
    view.drawingBlock = block;
    
    return view;
}


- (void)drawRect:(CGRect)rect {
    if (self.drawingBlock != nil) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSaveGState(context);
        self.drawingBlock(self, context);
        CGContextRestoreGState(context);
    }
}


@end
