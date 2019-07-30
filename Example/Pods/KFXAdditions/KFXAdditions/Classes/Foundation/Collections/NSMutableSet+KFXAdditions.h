/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


NS_ASSUME_NONNULL_BEGIN
@interface NSMutableSet (KFXAdditions)

/**
 * Checks if the object is nil and if it is not it adds the object to the set using --addObject:. If the object is nil then it does nothing but doesn't crash.
 * @param object The object you want to add to the set. Can be nil.
 * @return YES if the object was added, NO if it was not.
 * @since 0.10.0
 **/
-(BOOL)kfx_addObject:(id __nullable)object;



@end
NS_ASSUME_NONNULL_END
