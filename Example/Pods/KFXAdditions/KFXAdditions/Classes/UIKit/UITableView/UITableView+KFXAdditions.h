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

@interface UITableView (KFXAdditions)

/// Total size of the tableview. Width of tableView + height of sections and section headers
-(CGSize)kfx_totalSize;

/// Deselect whichever row is selected
-(void)kfx_deselectSelectedRow:(BOOL)animated;

/// Reloads the data but keeps a record of which rows are selected before reloading and re-selects those rows
-(void)kfx_reloadDataAndPreserveSelectedRows;


@end
