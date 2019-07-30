/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSKeyedArchiver+KFXAdditions.h"

@implementation NSKeyedArchiver (KFXAdditions)

+(BOOL)kfx_archiveRootObject:(id)object
             toDirectoryPath:(NSString *)dirPath
                withFileName:(NSString *)fileName
                       error:(NSError * _Nullable __autoreleasing *)error{
    
    
    BOOL success = NO;
    
    NSString *fullPath = [dirPath stringByAppendingPathComponent:fileName];
    success = [NSKeyedArchiver archiveRootObject:object
                                          toFile:fullPath];
    if (!success) {
        if (error != nil) {
            
            BOOL isDirectory = NO;
            NSString *message;
            
            if (object == nil) {
                
                message = NSLocalizedString(@"The object to archive is nil",@"The object to archive is nil");
                
            }else if (fileName == nil){
                
                message = NSLocalizedString(@"The fileName to use when archiving is nil",@"The fileName to use when archiving is nil");
                
            }else if (dirPath == nil){
                
                message = NSLocalizedString(@"The directoryPath is nil",@"The directoryPath is nil");
                
            }else if (![[NSFileManager defaultManager]fileExistsAtPath:dirPath]){
                
                message = NSLocalizedString(@"The directoryPath is invalid",@"The directoryPath is invalid");
                
            }else if ([[NSFileManager defaultManager]fileExistsAtPath:dirPath isDirectory:&isDirectory]
                      && !isDirectory){
                
                message = NSLocalizedString(@"The directoryPath points to a file not a directory",@"The directoryPath points to a file not a directory");
//            }else if (![self kfx_doObjectsConformToNSCoding:object]){
//            
//                message = NSLocalizedString(@"The root object or a sub-object does not conform to NSCoding", @"The root object or a sub-object does not conform to NSCoding");
            }else{
                
                message = NSLocalizedString(@"Unknown Error when attempting to archive",@"");
                
            }
            
            *error = [NSError errorWithDomain:@"com.KFXTech.KFXAdditions.NSKeyedArchiver+KFXAdditions"
                                         code:0
                                     userInfo:@{NSLocalizedDescriptionKey:message}];
        }
    }
    
    
    return success;
}


+(BOOL)kfx_doObjectsConformToNSCoding:(id)object{
    
    if (![object conformsToProtocol:@protocol(NSCoding)]) {
        return NO;
    }else{
        
        if ([object isKindOfClass:[NSArray class]]) {
            
            for (id subObject in object) {
                
                if (![subObject conformsToProtocol:@protocol(NSCoding)]) {
                    return NO;
                }
            }
            
        }else if ([object isKindOfClass:[NSDictionary class]]){
            
            for (id key in  object) {
                
                id subObject = object[key];
                if (![subObject conformsToProtocol:@protocol(NSCoding)]) {
                    return NO;
                }
            }
            
        }else if ([object isKindOfClass:[NSSet class]]){
            
            for (id subObject in object) {
                
                if (![subObject conformsToProtocol:@protocol(NSCoding)]) {
                    return NO;
                }
            }

        }
        
    }
    return YES; // As far as we can tell
}




@end
