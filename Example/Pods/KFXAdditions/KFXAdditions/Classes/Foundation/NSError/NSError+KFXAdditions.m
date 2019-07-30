/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "NSError+KFXAdditions.h"

@implementation NSError (KFXAdditions)

//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Base
//--------------------------------------------------------
+(instancetype)kfx_errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo sender:(id)sender{
	
	NSError *error = [NSError errorWithDomain:[self kfx_errorDomainWithSender:sender]
										 code:code
									 userInfo:userInfo];
	return error;
	
}

+(instancetype)kfx_errorWithCode:(NSInteger)code localisedDescription:(NSString*)localisedDescription sender:(id)sender{
	
	NSDictionary *userInfo = @{NSLocalizedDescriptionKey:localisedDescription};
	NSError *error = [self kfx_errorWithCode:code
									userInfo:userInfo
										 sender:sender];
	return error;
}

+(instancetype)kfx_errorWithCode:(KFXErrorCode)code sender:(id)sender{
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"An error occured with code: '%ld'; name: '%@'", @"A generic description of an error where a numerical code and error name will be inserted"),(long)code,[self kfx_descriptionForErrorCode:code]];
	return [self kfx_errorWithCode:code
			  localisedDescription:description
							sender:sender];
}


//--------------------------------------------------------
#pragma mark Generic
//--------------------------------------------------------
+(instancetype)kfx_invalidParameterError:(NSString*)paramName
						   withErrorCode:(KFXErrorCode)errorCode
								  sender:(id)sender{
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"The parameter with name '%@' is invalid. Error name: '%@'", @""),paramName,[self kfx_descriptionForErrorCode:errorCode]];
	
	return [self kfx_errorWithCode:errorCode
			  localisedDescription:description
							sender:sender];
}

+(instancetype)kfx_invalidLocalVariableError:(NSString*)variableName
							   withErrorCode:(KFXErrorCode)errorCode
									  sender:(id)sender{
	
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"The local variable with name '%@' is invalid. Error name: '%@'", @""),variableName,[self kfx_descriptionForErrorCode:errorCode]];
	
	return [self kfx_errorWithCode:errorCode
			  localisedDescription:description
							sender:sender];
	
}

+(instancetype)kfx_invalidMemberVariableError:(NSString*)variableName
								   withObject:(id)object
									errorCode:(KFXErrorCode)errorCode
									   sender:(id)sender{
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"The member variable with name '%@' of class: '%@' is invalid. Error name: '%@'", @""),variableName,NSStringFromClass([object class]),[self kfx_descriptionForErrorCode:errorCode]];
	
	return [self kfx_errorWithCode:errorCode
			  localisedDescription:description
							sender:sender];
	
}

+(instancetype)kfx_invalidCollectionError:(NSString*)collectionName
							withErrorCode:(KFXErrorCode)errorCode
									  sender:(id)sender{
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"The collection with name '%@' is invalid. Error name: '%@'", @""),collectionName,[self kfx_descriptionForErrorCode:errorCode]];
	
	return [self kfx_errorWithCode:errorCode
			  localisedDescription:description
							sender:sender];
	
}

+(instancetype)kfx_importFailedWithErrorCode:(KFXErrorCode)errorCode sender:(id)sender{
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"Import failed with error name: '%@'", @""),[self kfx_descriptionForErrorCode:errorCode]];
	
	return [self kfx_errorWithCode:errorCode
			  localisedDescription:description
							sender:sender];
}

+(instancetype)kfx_fileSystemAccessFailedWithErrorCode:(KFXErrorCode)errorCode sender:(id)sender{
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"File system access failed with error name: '%@'", @""),[self kfx_descriptionForErrorCode:errorCode]];
	
	return [self kfx_errorWithCode:errorCode
			  localisedDescription:description
							sender:sender];
}

+(instancetype)kfx_findObjectsFailedWithErrorCode:(KFXErrorCode)errorCode sender:(id)sender{
	
	NSString *description = [NSString stringWithFormat:NSLocalizedString(@"Find objects failed with error name: '%@'", @""),[self kfx_descriptionForErrorCode:errorCode]];
	
	return [self kfx_errorWithCode:errorCode
			  localisedDescription:description
							sender:sender];
}


//--------------------------------------------------------
#pragma mark Specific
//--------------------------------------------------------
+(instancetype)kfx_managedObjectContextIsNilErrorWithSender:(id)sender{
	
	NSString *message = NSLocalizedString(@"ManagedObjectContext is nil", @"");
	NSError *error = [self kfx_errorWithCode:KFXErrorCodeManagedObjectContextIsNil
						localisedDescription:message
									  sender:sender];
	return error;
	
}

//--------------------------------------------------------
#pragma mark Error Domain / Bundle id
//--------------------------------------------------------
+(NSString*)kfx_appBundleIdentifier{
    NSString *bundleID = [[NSBundle mainBundle]bundleIdentifier];
    return bundleID;
}
+(NSString*)kfx_errorDomainWithSender:(id)sender{
	
	NSString *bundleId = [self kfx_appBundleIdentifier];
	NSString *domain;
	if (sender != nil) {
		domain = [NSString stringWithFormat:@"%@.%@",bundleId,NSStringFromClass([sender class])];
	}else{
		domain = bundleId;
	}
	return domain;
}


//--------------------------------------------------------
#pragma mark Error Code Descriptions
//--------------------------------------------------------
+(NSString*)kfx_descriptionForErrorCode:(KFXErrorCode)errorCode{
	
	NSString *description;
	switch (errorCode) {
		case KFXErrorCodeUndefined:{
			description = @"KFXErrorCodeUndefined";
			break;
		}
		case KFXErrorCodeObjectIsNull:{
			description = @"KFXErrorCodeObjectIsNull";
			break;
		}
		case KFXErrorCodeObjectIsNil:{
			description = @"KFXErrorCodeObjectIsNil";
			break;
		}
		case KFXErrorCodeObjectIsNotOfExpectedClass:{
			description = @"KFXErrorCodeObjectIsNotOfExpectedClass";
			break;
		}
		case KFXErrorCodeObjectPropertyIsNull:{
			description = @"KFXErrorCodeObjectPropertyIsNull";
			break;
		}
		case KFXErrorCodeObjectPropertyIsNil:{
			description = @"KFXErrorCodeObjectPropertyIsNil";
			break;
		}
		case KFXErrorCodeObjectPropertyIsZero:{
			description = @"KFXErrorCodeObjectPropertyIsZero";
			break;
		}
		case KFXErrorCodeParameterIsNil:{
			description = @"KFXErrorCodeParameterIsNil";
			break;
		}
		case KFXErrorCodeParameterIsNull:{
			description = @"KFXErrorCodeParameterIsNull";
			break;
		}
		case KFXErrorCodeParameterIsNotOfExpectedClass:{
			description = @"KFXErrorCodeParameterIsNotOfExpectedClass";
			break;
		}
		case KFXErrorCodeNSArrayCountIsZero:{
			description = @"KFXErrorCodeNSArrayCountIsZero";
			break;
		}
		case KFXErrorCodeNSDictionaryCountIsZero:{
			description = @"KFXErrorCodeNSDictionaryCountIsZero";
			break;
		}
		case KFXErrorCodeNSSetCountIsZero:{
			description = @"KFXErrorCodeNSSetCountIsZero";
			break;
		}
		case KFXErrorCodeNSArrayIsNil:{
			description = @"KFXErrorCodeNSArrayIsNil";
			break;
		}
		case KFXErrorCodeNSDictionaryIsNil:{
			description = @"KFXErrorCodeNSDictionaryIsNil";
			break;
		}
		case KFXErrorCodeNSSetIsNil:{
			description = @"KFXErrorCodeNSSetIsNil";
			break;
		}
		case KFXErrorCodeNSArrayIsNilOrCountIsZero:{
			description = @"KFXErrorCodeNSArrayIsNilOrCountIsZero";
			break;
		}
		case KFXErrorCodeNSDictionaryIsNilOrCountIsZero:{
			description = @"KFXErrorCodeNSDictionaryIsNilOrCountIsZero";
			break;
		}
		case KFXErrorCodeNSSetIsNilOrCountIsZero:{
			description = @"KFXErrorCodeNSSetIsNilOrCountIsZero";
			break;
		}
		case KFXErrorCodeIndexOutOfBoundsForArray:{
			description = @"KFXErrorCodeIndexOutOfBoundsForArray";
			break;
		}
		case KFXErrorCodeArrayIndexIsLessThanZero:{
			description = @"KFXErrorCodeArrayIndexIsLessThanZero";
			break;
		}
		case KFXErrorCodeArrayIndexIsGreaterThanArrayCount:{
			description = @"KFXErrorCodeArrayIndexIsGreaterThanArrayCount";
			break;
		}
		case KFXErrorCodeDictionaryDoesNotContainKey:{
			description = @"KFXErrorCodeDictionaryDoesNotContainKey";
			break;
		}
		case KFXErrorCodeDictionaryContainsNSNullForKey:{
			description = @"KFXErrorCodeDictionaryContainsNSNullForKey";
			break;
		}
		case KFXErrorCodeKeyIsNil:{
			description = @"KFXErrorCodeKeyIsNil";
			break;
		}
		case KFXErrorCodeStringLengthIsZero:{
			description = @"KFXErrorCodeStringLengthIsZero";
			break;
		}
		case KFXErrorCodeStringIsNil:{
			description = @"KFXErrorCodeStringIsNil";
			break;
		}
		case KFXErrorCodeStringIsNilOrLengthIsZero:{
			description = @"KFXErrorCodeStringIsNilOrLengthIsZero";
			break;
		}
		case KFXErrorCodeStringOnlyContainsWhitespace:{
			description = @"KFXErrorCodeStringOnlyContainsWhitespace";
			break;
		}
		case KFXErrorCodeStringDoesNotFormatToDate:{
			description = @"KFXErrorCodeStringDoesNotFormatToDate";
			break;
		}
		case KFXErrorCodeStringDoesNotFormatToNumber:{
			description = @"KFXErrorCodeStringDoesNotFormatToNumber";
			break;
		}
		case KFXErrorCodeObjectDoesNotComformToNSCoding:{
			description = @"KFXErrorCodeObjectDoesNotComformToNSCoding";
			break;
		}
		case KFXErrorCodeObjectDoesNotComformToExpectedProtocol:{
			description = @"KFXErrorCodeObjectDoesNotComformToExpectedProtocol";
			break;
		}
		case KFXErrorCodeFilePathIsNil:{
			description = @"KFXErrorCodeFilePathIsNil";
			break;
		}
		case KFXErrorCodeFileDoesNotExistAtFilePath:{
			description = @"KFXErrorCodeFileDoesNotExistAtFilePath";
			break;
		}
		case KFXErrorCodeDirectoryDoesNotExistAtDirectoryPath:{
			description = @"KFXErrorCodeDirectoryDoesNotExistAtDirectoryPath";
			break;
		}
		case KFXErrorCodeNoPathsFoundInDirectoryPath:{
			description = @"KFXErrorCodeNoPathsFoundInDirectoryPath";
			break;
		}
		case KFXErrorCodeFileDoesNotExistInBundle:{
			description = @"KFXErrorCodeFileDoesNotExistInBundle";
			break;
		}
		case KFXErrorCodeFailedToWriteDataToFilePath:{
			description = @"KFXErrorCodeFailedToWriteDataToFilePath";
			break;
		}
		case KFXErrorCodeFailedToReadDataFromFile:{
			description = @"KFXErrorCodeFailedToReadDataFromFile";
			break;
		}
		case KFXErrorCodeManagedObjectContextIsNil:{
			description = @"KFXErrorCodeManagedObjectContextIsNil";
			break;
		}
		case KFXErrorCodeManagedObjectIsNil:{
			description = @"KFXErrorCodeManagedObjectIsNil";
			break;
		}
        case KFXErrorCodeNoInternetConnection:{
            description = @"KFXErrorCodeNoInternetConnection";
            break;
        }
		default:
			NSAssert(NO,@"Hit default case of a switch statement. %s. Value is : %ld",__PRETTY_FUNCTION__, (long)errorCode);
			break;
	}
	return description;
}




@end
