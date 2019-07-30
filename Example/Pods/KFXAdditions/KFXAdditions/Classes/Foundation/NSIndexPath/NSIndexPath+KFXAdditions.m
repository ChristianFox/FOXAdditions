/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSIndexPath+KFXAdditions.h"
@import UIKit.UITableView;
@import UIKit.UICollectionView;

static NSInteger kIndexPathSectionTagMultiplier = 10000;


@implementation NSIndexPath (KFXAdditions)


//------------------------
#pragma mark Convenience
//------------------------
+(instancetype)kfx_zeroZeroPath{
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

//--------------------------------------------------------
#pragma mark Creating Arrays of Index Paths
//--------------------------------------------------------
+(NSArray *)kfx_indexPathsFromRow:(NSInteger)startRow
							toRow:(NSInteger)endRow
						inSection:(NSInteger)section{
	
	NSAssert(endRow >= startRow,
			 @"endRow must be greater or equal than startRow");
	
	NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:(NSUInteger)(endRow-startRow+1)];
	
	for (NSInteger row = startRow; row <= endRow; row++) {

		[indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:section]];
	}
	
	return [indexPaths copy];
}

+(NSArray<NSIndexPath *> *)kfx_indexPathsFromItem:(NSInteger)startItem
										   toItem:(NSInteger)endItem
										inSection:(NSInteger)section{
	
	NSAssert(endItem >= startItem,
			 @"endItem must be greater or equal than startItem");
	
	NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:(NSUInteger)(endItem-startItem+1)];
	
	for (NSInteger item = startItem; item <= endItem; item++) {
		
		[indexPaths addObject:[NSIndexPath indexPathForItem:item inSection:section]];
	}
	
	return [indexPaths copy];
}

//------------------------
#pragma mark Converting from/to view Tags
//------------------------
-(NSInteger)kfx_viewTag{
    NSInteger tag = (kIndexPathSectionTagMultiplier * (self.section+1)) + self.row;
    return tag;
}

+(NSIndexPath*)kfx_indexPathForViewTag:(NSInteger)viewTag{
    NSInteger section = (viewTag / kIndexPathSectionTagMultiplier) -1;
    NSInteger row = viewTag - ((1 + section) * kIndexPathSectionTagMultiplier);
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:section];
    return path;
}


@end
