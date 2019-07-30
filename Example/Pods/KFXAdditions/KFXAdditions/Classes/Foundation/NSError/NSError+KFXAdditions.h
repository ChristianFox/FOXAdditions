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

//--------------------------------------------------------
#pragma mark - Enums
//--------------------------------------------------------
typedef NS_ENUM(NSUInteger, KFXErrorCode){
	// # Undefined
	KFXErrorCodeUndefined = 0,
	// # Generic
	KFXErrorCodeObjectIsNull = 890000,
	KFXErrorCodeObjectIsNil,
	KFXErrorCodeObjectIsNotOfExpectedClass,
	KFXErrorCodeObjectPropertyIsNull,
	KFXErrorCodeObjectPropertyIsNil,
	KFXErrorCodeObjectPropertyIsZero,
	KFXErrorCodeParameterIsNil,
	KFXErrorCodeParameterIsNull,
	KFXErrorCodeParameterIsNotOfExpectedClass,
	// # Collections
	KFXErrorCodeNSArrayCountIsZero,
	KFXErrorCodeNSDictionaryCountIsZero,
	KFXErrorCodeNSSetCountIsZero,
	KFXErrorCodeNSArrayIsNil,
	KFXErrorCodeNSDictionaryIsNil,
	KFXErrorCodeNSSetIsNil,
	KFXErrorCodeNSArrayIsNilOrCountIsZero,
	KFXErrorCodeNSDictionaryIsNilOrCountIsZero,
	KFXErrorCodeNSSetIsNilOrCountIsZero,
	KFXErrorCodeIndexOutOfBoundsForArray,
	KFXErrorCodeArrayIndexIsLessThanZero,
	KFXErrorCodeArrayIndexIsGreaterThanArrayCount,
	KFXErrorCodeDictionaryDoesNotContainKey,
	KFXErrorCodeDictionaryContainsNSNullForKey,
	KFXErrorCodeKeyIsNil,
	// # Strings
	KFXErrorCodeStringLengthIsZero,
	KFXErrorCodeStringIsNil,
	KFXErrorCodeStringIsNilOrLengthIsZero,
	KFXErrorCodeStringOnlyContainsWhitespace,
	KFXErrorCodeStringDoesNotFormatToDate,
	KFXErrorCodeStringDoesNotFormatToNumber,
	// # Protocols
	KFXErrorCodeObjectDoesNotComformToNSCoding,
	KFXErrorCodeObjectDoesNotComformToExpectedProtocol,
	// # File & Directories
	KFXErrorCodeFilePathIsNil,
	KFXErrorCodeFileDoesNotExistAtFilePath,
	KFXErrorCodeDirectoryDoesNotExistAtDirectoryPath,
	KFXErrorCodeNoPathsFoundInDirectoryPath,
	KFXErrorCodeFileDoesNotExistInBundle,
	KFXErrorCodeFailedToWriteDataToFilePath,
	KFXErrorCodeFailedToReadDataFromFile,
	// # Core Data
	KFXErrorCodeManagedObjectContextIsNil,
	KFXErrorCodeManagedObjectIsNil,
    // # Network / System
    KFXErrorCodeNoInternetConnection
};

/**
 * Error Codes to Add:
 * -
 *
 **/

@interface NSError (KFXAdditions)

//--------------------------------------------------------
#pragma mark Base
//--------------------------------------------------------
+(instancetype)kfx_errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo sender:(id)sender;
+(instancetype)kfx_errorWithCode:(NSInteger)code localisedDescription:(NSString*)localisedDescription sender:(id)sender;
+(instancetype)kfx_errorWithCode:(KFXErrorCode)code sender:(id)sender;


//--------------------------------------------------------
#pragma mark Generic
//--------------------------------------------------------
//-----------------------------------
// Invalid variables
//-----------------------------------
+(instancetype)kfx_invalidParameterError:(NSString*)paramName
						   withErrorCode:(KFXErrorCode)errorCode
								  sender:(id)sender;

+(instancetype)kfx_invalidLocalVariableError:(NSString*)variableName
						   withErrorCode:(KFXErrorCode)errorCode
								  sender:(id)sender;

+(instancetype)kfx_invalidMemberVariableError:(NSString*)variableName
								   withObject:(id)object
									errorCode:(KFXErrorCode)errorCode
									   sender:(id)sender;

+(instancetype)kfx_invalidCollectionError:(NSString*)collectionName
							   withErrorCode:(KFXErrorCode)errorCode
									  sender:(id)sender;

//-----------------------------------
// Failed Actions
//-----------------------------------
+(instancetype)kfx_importFailedWithErrorCode:(KFXErrorCode)errorCode sender:(id)sender;

+(instancetype)kfx_fileSystemAccessFailedWithErrorCode:(KFXErrorCode)errorCode sender:(id)sender;

+(instancetype)kfx_findObjectsFailedWithErrorCode:(KFXErrorCode)errorCode sender:(id)sender;


//--------------------------------------------------------
#pragma mark Specific
//--------------------------------------------------------
+(instancetype)kfx_managedObjectContextIsNilErrorWithSender:(id)sender;

//--------------------------------------------------------
#pragma mark Error Domain / Bundle id
//--------------------------------------------------------
+(NSString*)kfx_appBundleIdentifier;
+(NSString*)kfx_errorDomainWithSender:(id)sender;



//--------------------------------------------------------
#pragma mark Error Code Descriptions
//--------------------------------------------------------
+(NSString*)kfx_descriptionForErrorCode:(KFXErrorCode)errorCode;




@end











