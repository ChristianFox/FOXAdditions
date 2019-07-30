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

@interface UITableViewController (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Data
//--------------------------------------------------------
/**
 * @brief Simply dispatches onto the main queue and calls reloadData on self.tableView
 * @since 0.22.0
 **/
-(void)kfx_reloadDataOnMainQueue;

@end
