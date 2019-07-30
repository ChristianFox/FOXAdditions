/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "NSKeyedUnarchiver+KFXAdditions.h"

@implementation NSKeyedUnarchiver (KFXAdditions)

+(id)kfx_unarchiveObjectFromDirectoryPath:(NSString *)dirPath
                             withFileName:(NSString *)fileName
                                    error:(NSError * _Nullable __autoreleasing *)error{
    
    NSString *fullPath = [dirPath stringByAppendingPathComponent:fileName];
    id object = [NSKeyedUnarchiver unarchiveObjectWithFile:fullPath];
    
    if (object == nil) {
        
        if (error != nil) {
            
            BOOL isDirectory = NO;
            NSString *message;
            
           if (fileName == nil){
                
                message = NSLocalizedString(@"The fileName to use when unarchiving is nil",@"The fileName to use when unarchiving is nil");
                
            }else if (dirPath == nil){
                
                message = NSLocalizedString(@"The directoryPath is nil",@"The directoryPath is nil");
                
            }else if (![[NSFileManager defaultManager]fileExistsAtPath:dirPath]){
                
                message = NSLocalizedString(@"The directoryPath is invalid",@"The directoryPath is invalid");
                
            }else if ([[NSFileManager defaultManager]fileExistsAtPath:dirPath isDirectory:&isDirectory]
                      && !isDirectory){
                
                message = NSLocalizedString(@"The directoryPath points to a file not a directory",@"The directoryPath points to a file not a directory");
            
            }else if (![[NSFileManager defaultManager]fileExistsAtPath:fullPath]){
                
                message = NSLocalizedString(@"No file found with the given file name in the given directory", @"No file found with the given file name in the given directory");
                
            }else{
                
                message = NSLocalizedString(@"Unknown Error when attempting to unarchive",@"Unknown Error when attempting to unarchive");
                
            }
            
            *error = [NSError errorWithDomain:@"com.KFXTech.KFXAdditions.NSKeyedUnarchiver+KFXAdditions"
                                         code:0
                                     userInfo:@{NSLocalizedDescriptionKey:message}];

        }
        
    }
    return object;
}

@end
