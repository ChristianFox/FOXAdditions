/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXUtilities
 *
 ************************************/


@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface KFXFileHelper : NSObject

//--------------------------------------------------------
#pragma mark Initilisers
//--------------------------------------------------------
+(instancetype)fileHelper;


//--------------------------------------------------------
#pragma mark MIME Type
//--------------------------------------------------------
-(NSString*)kfx_mimeTypeForFilePath:(NSString*)filePath;
-(NSString*)kfx_uniformTypeIdentifierForURLResponse:(NSURLResponse*)response;


@end
NS_ASSUME_NONNULL_END
