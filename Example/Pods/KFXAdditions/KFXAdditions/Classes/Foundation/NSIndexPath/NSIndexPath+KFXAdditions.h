/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <Foundation/Foundation.h>

@interface NSIndexPath (KFXAdditions)

//------------------------
#pragma mark Convenience
//------------------------
/// Creates an instance with section = 0, row = 0
+(instancetype)kfx_zeroZeroPath;

//--------------------------------------------------------
#pragma mark Creating Arrays of Index Paths
//--------------------------------------------------------
/**
 
 Ripped from iOSKit http://foundationk.it
 
 This method returns an array of indexPaths in the same section.
 The row index starts with startRow (including) and ends with endRow (including).
 
 @param startRow the row-index to start
 @param endRow the row-index to end
 @param section the section index of the indexPaths
 @return an array of indexPaths in the given section, starting from startRow to endRow
 */
+ (NSArray<NSIndexPath*>*)kfx_indexPathsFromRow:(NSInteger)startRow
							 toRow:(NSInteger)endRow
						 inSection:(NSInteger)section;

/**
 
 Ripped from iOSKit http://foundationk.it
 
 This method returns an array of indexPaths in the same section.
 The row index starts with startItem (including) and ends with endItem (including).
 
 @param startItem the item-index to start
 @param endItem the item-index to end
 @param section the section index of the indexPaths
 @return an array of indexPaths in the given section, starting from startItem to endItem
 */
+ (NSArray<NSIndexPath*>*)kfx_indexPathsFromItem:(NSInteger)startItem
										  toItem:(NSInteger)endItem
									  inSection:(NSInteger)section;

//------------------------
#pragma mark Converting from/to view Tags
//------------------------
-(NSInteger)kfx_viewTag;
+(NSIndexPath*)kfx_indexPathForViewTag:(NSInteger)viewTag;


@end
