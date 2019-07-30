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
@interface NSMutableDictionary (KFXAdditions)


/**
 * Checks if the object and key are nil and if they are not it adds the object to the dictionary using -setObject:forKey:. If either the object or key are nil then it does nothing but doesn't crash.
 * @param object The object you want to add to the dictionary. Can be nil.
 * @param key The key to use when adding the object. Can be nil. Must conform to NSCopying.
 * @return YES if the object was added, NO if it was not.
 * @since 0.5.0
 **/
-(BOOL)kfx_setObject:(id __nullable)object forKey:(id<NSCopying> __nullable)key;

@end
NS_ASSUME_NONNULL_END
