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

NS_ASSUME_NONNULL_BEGIN
@interface NSKeyedUnarchiver (KFXAdditions)


/**
 * @brief Unarchive an object from disk
 * @param dirPath The path of the directory to save the object to
 * @param fileName The name of the file
 * @param error If an error occurs, upon return contains an NSError object that describes the problem.
 * @return An unarchived object
 **/
+(id)kfx_unarchiveObjectFromDirectoryPath:(NSString*)dirPath
                             withFileName:(NSString*)fileName
                                    error:(NSError *__autoreleasing  _Nullable *)error;


@end
NS_ASSUME_NONNULL_END
