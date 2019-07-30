/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "UITextView+KFXAdditions.h"

@implementation UITextView (KFXAdditions)

-(BOOL)kfx_setText:(NSString*)text withDefault:(NSString*)defaultText{
    
    if (text == nil || [text isEqual:[NSNull null]] || text.length == 0) {
        self.text = defaultText;
        return NO;
    }else{
        self.text = text;
        return YES;
    }
}

-(BOOL)kfx_setAttributedText:(NSAttributedString *)text withDefault:(NSAttributedString *)defaultText{
    
    if (text == nil || [text isEqual:[NSNull null]] || text.string.length == 0) {
        self.attributedText = defaultText;
        return NO;
    }else{
        self.attributedText = text;
        return YES;
    }
    
}


@end
