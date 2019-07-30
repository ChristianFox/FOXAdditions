/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "NSFileManager+KFXDirectoryLocations.h"
//#import "KFXErrorHandler.h"
//#import "KFXErrorBuilder.h"

NSString * const DirectoryLocationDomain = @"NSFileManager+KFXDirectoryLocations";

@implementation NSFileManager (KFXDirectoryLocations)

#pragma mark - Public Methods
-(NSString*)kfx_Documents{
    return [self findOrCreateDirectory:NSDocumentDirectory
                   appendPathComponent:nil
                           handleError:YES];
}

-(NSString*)kfx_Documents_Inbox{
    return [self findOrCreateDirectory:NSDocumentDirectory
                   appendPathComponent:@"Inbox"
                           handleError:YES];
}

-(NSString*)kfx_Documents_Archives{
    return [self findOrCreateDirectory:NSDocumentDirectory
                   appendPathComponent:@"Archives"
                           handleError:YES];
}

-(NSString*)kfx_Library{
    return [self findOrCreateDirectory:NSLibraryDirectory
                   appendPathComponent:nil
                           handleError:YES];
}

-(NSString*)kfx_Library_ApplicationSupport{
    return [self findOrCreateDirectory:NSApplicationSupportDirectory
                   appendPathComponent:nil
                           handleError:YES];
}

-(NSString *)kfx_Library_ApplicationSupport_ManagedApplicationData{
    return [self findOrCreateDirectory:NSApplicationSupportDirectory
                   appendPathComponent:@"ManagedApplicationData"
                           handleError:YES];
}

-(NSString *)kfx_Library_ApplicationSupport_ManagedApplicationData_Plists{
    return [self findOrCreateDirectory:NSApplicationSupportDirectory
                   appendPathComponent:@"ManagedApplicationData/Plists"
                           handleError:YES];
}

-(NSString*)kfx_Library_Caches{
    return [self findOrCreateDirectory:NSCachesDirectory
                   appendPathComponent:nil
                           handleError:YES];
}

-(NSString *)kfx_Library_LogFiles{
    return [self findOrCreateDirectory:NSLibraryDirectory
                   appendPathComponent:@"LogFiles"
                           handleError:YES];
}

-(NSString*)kfx_tmp{
    NSString *fullPath;
    fullPath = NSTemporaryDirectory();
    if (fullPath == nil) {
//        NSError *error = [KFXErrorBuilder errorForDirectoryDoesNotExistAtDirectoryPath:fullPath
//                                                                   withDomainComponent:[DirectoryLocationDomain stringByAppendingString:@".kfx_temp"]];
//        [KFXErrorHandler handleError:error];
    }
    return fullPath;
}

#pragma mark - Private Method with Error handling
-(NSString*)findOrCreateDirectory:(NSSearchPathDirectory)directory appendPathComponent:(NSString*)pathComponent handleError:(BOOL)shouldHandleError{
    
    NSString *fullPath;
    NSError *error = nil;
    fullPath = [self kfx_findOrCreateDirectory:directory
                                      inDomain:NSUserDomainMask
                           appendPathComponent:pathComponent
                                         error:&error];
    if (shouldHandleError) {
        if (fullPath ==  nil) {
            if (error != nil) {
//                [KFXErrorHandler handleError:error];
                NSLog(@"<<ERROR>> %@",error);
            }
        }
    }
    return fullPath;

    
}

#pragma mark - Main Method By Matt Gallagher
//  NSFileManager+DirectoryLocations.m
//
//  Created by Matt Gallagher on 06 May 2010
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//


//
// findOrCreateDirectory:inDomain:appendPathComponent:error:
//
// Method to tie together the steps of:
//	1) Locate a standard directory by search path and domain mask
//  2) Select the first path in the results
//	3) Append a subdirectory to that path
//	4) Create the directory and intermediate directories if needed
//	5) Handle errors by emitting a proper NSError object
//
// Parameters:
//    searchPathDirectory - the search path passed to NSSearchPathForDirectoriesInDomains
//    domainMask - the domain mask passed to NSSearchPathForDirectoriesInDomains
//    appendComponent - the subdirectory appended
//    errorOut - any error from file operations
//
// returns the path to the directory (if path found and exists), nil otherwise
//
#pragma mark renamed with kfx prefix for consistency
- (NSString *)kfx_findOrCreateDirectory:(NSSearchPathDirectory)searchPathDirectory
                           inDomain:(NSSearchPathDomainMask)domainMask
                appendPathComponent:(NSString *)appendComponent
                              error:(NSError **)errorOut
{
    NSError *localError;
    
	// Search for the path
	NSArray* paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory,domainMask,YES);
	if ([paths count] == 0)
	{
		if (errorOut != nil)
		{
//            localError = [KFXErrorBuilder errorForNoPathsFoundInDirectoryPath:[NSString stringWithFormat:@"NSSearchPathDirectory = %li",(unsigned long)searchPathDirectory]
//                                                          withDomainComponent:[DirectoryLocationDomain stringByAppendingString:@".findOrCreteDirectory"]];
//            *errorOut = localError;
            /*
            NSDictionary *userInfo =
            [NSDictionary dictionaryWithObjectsAndKeys:
             NSLocalizedStringFromTable(@"No path found for directory in domain.",@"Errors",nil),
             NSLocalizedDescriptionKey,[NSNumber numberWithInteger:searchPathDirectory],
             @"NSSearchPathDirectory",
             [NSNumber numberWithInteger:domainMask],
             @"NSSearchPathDomainMask",
             nil];
            *errorOut =
            [NSError
             errorWithDomain:DirectoryLocationDomain
             code:DirectoryLocationErrorNoPathFound
             userInfo:userInfo];
             */
            
		}
		return nil;
	}
	
	//
	// Normally only need the first path returned
	//
	NSString *resolvedPath = [paths objectAtIndex:0];
    
	//
	// Append the extra path component
	//
	if (appendComponent)
	{
		resolvedPath = [resolvedPath
                        stringByAppendingPathComponent:appendComponent];
	}
	
	//
	// Create the path if it doesn't exist
	//
    if ([self fileExistsAtPath:resolvedPath]) {
        return resolvedPath;
    }
	BOOL success = [self
                    createDirectoryAtPath:resolvedPath
                    withIntermediateDirectories:YES
                    attributes:nil
                    error:&localError];
	if (!success)
	{
		if (errorOut != NULL)
		{
			*errorOut = localError;
		}
		return nil;
	}
	
	//
	// If we've made it this far, we have a success
	//
	if (errorOut)
	{
		*errorOut = nil;
	}
	return resolvedPath;
}

//
// applicationSupportDirectory
//
// Returns the path to the applicationSupportDirectory (creating it if it doesn't exist).
//
- (NSString *)applicationSupportDirectory
{
	NSString *executableName =
    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleExecutable"];
	NSError *error;
    NSString *result = [self kfx_findOrCreateDirectory:NSApplicationSupportDirectory
                                              inDomain:NSUserDomainMask
                                   appendPathComponent:executableName
                                                 error:&error];
	if (!result)
	{
//        [KFXErrorHandler handleError:error];
        if (error != nil) {
            NSLog(@"<<ERROR>> %@",error);
        }
    
    }
	return result;
}


@end
