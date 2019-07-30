/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/



#import "UITableView+KFXAdditions.h"

@implementation UITableView (KFXAdditions)



-(CGSize)kfx_totalSize{
    
    CGFloat totalHeight = 0.0;
    CGFloat totalWidth = 0.0;
    NSInteger numSections = [self numberOfSections];
    for (NSInteger idx = 0; idx < numSections; idx++) {
        CGRect rect = [self rectForSection:idx];
        totalHeight += rect.size.height;
        totalWidth += rect.size.width;
    }
    return CGSizeMake(totalWidth, totalHeight);
}

-(void)kfx_deselectSelectedRow:(BOOL)animated{
    [self deselectRowAtIndexPath:[self indexPathForSelectedRow] animated:animated];
}

-(void)kfx_reloadDataAndPreserveSelectedRows{
    
    NSArray *indexPaths = nil;
    if ([self respondsToSelector:@selector(indexPathsForSelectedRows)]) {
        indexPaths = [self performSelector:@selector(indexPathsForSelectedRows)];
    } else {
        indexPaths = [NSArray arrayWithObject:[self indexPathForSelectedRow]];
    }
    
    [self reloadData];
    
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL *stop) {
        [self selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }];

}











@end
