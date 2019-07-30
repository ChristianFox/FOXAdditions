/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "UILabel+KFXAdditions.h"

@implementation UILabel (KFXAdditions)

//--------------------------------------------------------
#pragma mark Set Text with defaults
//--------------------------------------------------------
-(BOOL)kfx_setText:(NSString*)text withDefault:(NSString*)defaultText{

    if (text == nil || [text isEqual:[NSNull null]] || text.length == 0) {
        self.text = defaultText;
        return NO;
    }else{
        self.text = text;
        return YES;
    }
}

-(BOOL)kfx_setTextToNumber:(NSNumber *)number withDefault:(NSString *)defaultText{
    
    if (number == nil || [number isEqual:[NSNull null]]) {
        self.text = defaultText;
        return NO;
    }else{
        self.text = [number stringValue];
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



//--------------------------------------------------------
#pragma mark Frame
//--------------------------------------------------------
-(CGFloat)kfx_heightForText{
    return [self kfx_boundingRectForText].size.height;
}

-(CGRect)kfx_boundingRectForText{
    return [self.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.bounds), CGFLOAT_MAX)
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{NSFontAttributeName: self.font}
                                   context:nil];
}













@end
