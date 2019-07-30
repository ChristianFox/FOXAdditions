/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/

@import UIKit;

@interface KFXTableViewCell : UITableViewCell

@property (nonatomic) CGFloat borderWidth;
@property (strong,nonatomic) UIColor *borderColour;

//
@property (weak,nonatomic) id cellData;
@property (weak,nonatomic) id identifier;



+(UINib*)nib;
+(NSString*)reuseIdentifier;
+(NSBundle*)bundle;

-(void)addBorder;

@end
