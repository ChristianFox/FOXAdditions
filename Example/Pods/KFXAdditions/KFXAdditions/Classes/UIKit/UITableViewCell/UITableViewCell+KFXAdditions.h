/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <UIKit/UIKit.h>

@interface UITableViewCell (KFXAdditions)

/** The tableView (superview) the cell is displayed in */
-(UITableView*)kfx_tableView;

/** The indexPath of the cell in the tableView the cell is displayed in */
-(NSIndexPath*)kfx_indexPath;

/// Assumes the nib has the same name as the class. Loads nib with nil owner and options
+(UINib*)kfx_nib;

/// Returns the class name for use as a reuseIdentifier
+(NSString*)kfx_reuseIdentifier;


@end
