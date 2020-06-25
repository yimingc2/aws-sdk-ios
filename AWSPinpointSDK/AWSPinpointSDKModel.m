//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSPinpointSDKModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSPinpointSDKErrorDomain = @"com.amazonaws.AWSPinpointSDKErrorDomain";

@implementation AWSPinpointSDKADMChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientSecret" : @"ClientSecret",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointSDKADMChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKADMMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"consolidationKey" : @"ConsolidationKey",
             @"data" : @"Data",
             @"expiresAfter" : @"ExpiresAfter",
             @"iconReference" : @"IconReference",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"MD5" : @"MD5",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"smallImageIconUrl" : @"SmallImageIconUrl",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionUrl);
        }
        return @(AWSPinpointSDKActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointSDKActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointSDKActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKAPNSChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointSDKAPNSChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKAPNSMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"badge" : @"Badge",
             @"body" : @"Body",
             @"category" : @"Category",
             @"collapseId" : @"CollapseId",
             @"data" : @"Data",
             @"mediaUrl" : @"MediaUrl",
             @"preferredAuthenticationMethod" : @"PreferredAuthenticationMethod",
             @"priority" : @"Priority",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"threadId" : @"ThreadId",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionUrl);
        }
        return @(AWSPinpointSDKActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointSDKActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointSDKActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKAPNSSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointSDKAPNSSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKAPNSVoipChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointSDKAPNSVoipChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKAPNSVoipSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointSDKAPNSVoipSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKActivitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKActivityResponse class]];
}

@end

@implementation AWSPinpointSDKActivityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"end" : @"End",
             @"identifier" : @"Id",
             @"result" : @"Result",
             @"scheduledStart" : @"ScheduledStart",
             @"start" : @"Start",
             @"state" : @"State",
             @"successfulEndpointCount" : @"SuccessfulEndpointCount",
             @"timezonesCompletedCount" : @"TimezonesCompletedCount",
             @"timezonesTotalCount" : @"TimezonesTotalCount",
             @"totalEndpointCount" : @"TotalEndpointCount",
             @"treatmentId" : @"TreatmentId",
             };
}

@end

@implementation AWSPinpointSDKAddressConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bodyOverride" : @"BodyOverride",
             @"channelType" : @"ChannelType",
             @"context" : @"Context",
             @"rawContent" : @"RawContent",
             @"substitutions" : @"Substitutions",
             @"titleOverride" : @"TitleOverride",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeCustom);
        }
        return @(AWSPinpointSDKChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKChannelTypeGcm:
                return @"GCM";
            case AWSPinpointSDKChannelTypeApns:
                return @"APNS";
            case AWSPinpointSDKChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointSDKChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointSDKChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointSDKChannelTypeAdm:
                return @"ADM";
            case AWSPinpointSDKChannelTypeSms:
                return @"SMS";
            case AWSPinpointSDKChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointSDKChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointSDKChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointSDKChannelTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKApplicationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSPinpointSDKApplicationSettingsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignHook" : @"CampaignHook",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"quietTime" : @"QuietTime",
             };
}

+ (NSValueTransformer *)campaignHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKQuietTime class]];
}

@end

@implementation AWSPinpointSDKApplicationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKApplicationResponse class]];
}

@end

@implementation AWSPinpointSDKAttributeDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeType" : @"AttributeType",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointSDKAttributeTypeInclusive);
        }
        if ([value caseInsensitiveCompare:@"EXCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointSDKAttributeTypeExclusive);
        }
        return @(AWSPinpointSDKAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKAttributeTypeInclusive:
                return @"INCLUSIVE";
            case AWSPinpointSDKAttributeTypeExclusive:
                return @"EXCLUSIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKAttributesResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"attributeType" : @"AttributeType",
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSPinpointSDKBaiduChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKey" : @"ApiKey",
             @"enabled" : @"Enabled",
             @"secretKey" : @"SecretKey",
             };
}

@end

@implementation AWSPinpointSDKBaiduChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"credential" : @"Credential",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKBaiduMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"data" : @"Data",
             @"iconReference" : @"IconReference",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"smallImageIconUrl" : @"SmallImageIconUrl",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionUrl);
        }
        return @(AWSPinpointSDKActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointSDKActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointSDKActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKCampaignEmailMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"fromAddress" : @"FromAddress",
             @"htmlBody" : @"HtmlBody",
             @"title" : @"Title",
             };
}

@end

@implementation AWSPinpointSDKCampaignEventFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"filterType" : @"FilterType",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEventDimensions class]];
}

+ (NSValueTransformer *)filterTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSPinpointSDKFilterTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"ENDPOINT"] == NSOrderedSame) {
            return @(AWSPinpointSDKFilterTypeEndpoint);
        }
        return @(AWSPinpointSDKFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKFilterTypeSystem:
                return @"SYSTEM";
            case AWSPinpointSDKFilterTypeEndpoint:
                return @"ENDPOINT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKCampaignHook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambdaFunctionName" : @"LambdaFunctionName",
             @"mode" : @"Mode",
             @"webUrl" : @"WebUrl",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DELIVERY"] == NSOrderedSame) {
            return @(AWSPinpointSDKModeDelivery);
        }
        if ([value caseInsensitiveCompare:@"FILTER"] == NSOrderedSame) {
            return @(AWSPinpointSDKModeFilter);
        }
        return @(AWSPinpointSDKModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKModeDelivery:
                return @"DELIVERY";
            case AWSPinpointSDKModeFilter:
                return @"FILTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKCampaignLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"daily" : @"Daily",
             @"maximumDuration" : @"MaximumDuration",
             @"messagesPerSecond" : @"MessagesPerSecond",
             @"total" : @"Total",
             };
}

@end

@implementation AWSPinpointSDKCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultState" : @"DefaultState",
             @"detail" : @"Description",
             @"holdoutPercent" : @"HoldoutPercent",
             @"hook" : @"Hook",
             @"identifier" : @"Id",
             @"isPaused" : @"IsPaused",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"messageConfiguration" : @"MessageConfiguration",
             @"name" : @"Name",
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"state" : @"State",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKTreatmentResource class]];
}

+ (NSValueTransformer *)defaultStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignState class]];
}

+ (NSValueTransformer *)hookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignLimits class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSchedule class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignState class]];
}

@end

@implementation AWSPinpointSDKCampaignSmsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"messageType" : @"MessageType",
             @"senderId" : @"SenderId",
             };
}

+ (NSValueTransformer *)messageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRANSACTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointSDKMessageTypeTransactional);
        }
        if ([value caseInsensitiveCompare:@"PROMOTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointSDKMessageTypePromotional);
        }
        return @(AWSPinpointSDKMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKMessageTypeTransactional:
                return @"TRANSACTIONAL";
            case AWSPinpointSDKMessageTypePromotional:
                return @"PROMOTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKCampaignState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignStatus" : @"CampaignStatus",
             };
}

+ (NSValueTransformer *)campaignStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSPinpointSDKCampaignStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"EXECUTING"] == NSOrderedSame) {
            return @(AWSPinpointSDKCampaignStatusExecuting);
        }
        if ([value caseInsensitiveCompare:@"PENDING_NEXT_RUN"] == NSOrderedSame) {
            return @(AWSPinpointSDKCampaignStatusPendingNextRun);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointSDKCampaignStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSPinpointSDKCampaignStatusPaused);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSPinpointSDKCampaignStatusDeleted);
        }
        return @(AWSPinpointSDKCampaignStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKCampaignStatusScheduled:
                return @"SCHEDULED";
            case AWSPinpointSDKCampaignStatusExecuting:
                return @"EXECUTING";
            case AWSPinpointSDKCampaignStatusPendingNextRun:
                return @"PENDING_NEXT_RUN";
            case AWSPinpointSDKCampaignStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointSDKCampaignStatusPaused:
                return @"PAUSED";
            case AWSPinpointSDKCampaignStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKCampaignsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKCampaignResponse class]];
}

@end

@implementation AWSPinpointSDKChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKChannelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKChannelResponse class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKCreateAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createApplicationRequest" : @"CreateApplicationRequest",
             };
}

+ (NSValueTransformer *)createApplicationRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCreateApplicationRequest class]];
}

@end

@implementation AWSPinpointSDKCreateAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationResponse" : @"ApplicationResponse",
             };
}

+ (NSValueTransformer *)applicationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKApplicationResponse class]];
}

@end

@implementation AWSPinpointSDKCreateApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSPinpointSDKCreateCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeCampaignRequest" : @"WriteCampaignRequest",
             };
}

+ (NSValueTransformer *)writeCampaignRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKWriteCampaignRequest class]];
}

@end

@implementation AWSPinpointSDKCreateCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignResponse class]];
}

@end

@implementation AWSPinpointSDKCreateExportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"exportJobRequest" : @"ExportJobRequest",
             };
}

+ (NSValueTransformer *)exportJobRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKExportJobRequest class]];
}

@end

@implementation AWSPinpointSDKCreateExportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobResponse" : @"ExportJobResponse",
             };
}

+ (NSValueTransformer *)exportJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKExportJobResponse class]];
}

@end

@implementation AWSPinpointSDKCreateImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"importJobRequest" : @"ImportJobRequest",
             };
}

+ (NSValueTransformer *)importJobRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKImportJobRequest class]];
}

@end

@implementation AWSPinpointSDKCreateImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobResponse" : @"ImportJobResponse",
             };
}

+ (NSValueTransformer *)importJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKImportJobResponse class]];
}

@end

@implementation AWSPinpointSDKCreateSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeSegmentRequest" : @"WriteSegmentRequest",
             };
}

+ (NSValueTransformer *)writeSegmentRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKWriteSegmentRequest class]];
}

@end

@implementation AWSPinpointSDKCreateSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentResponse class]];
}

@end

@implementation AWSPinpointSDKDefaultMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"substitutions" : @"Substitutions",
             };
}

@end

@implementation AWSPinpointSDKDefaultPushNotificationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"data" : @"Data",
             @"silentPush" : @"SilentPush",
             @"substitutions" : @"Substitutions",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionUrl);
        }
        return @(AWSPinpointSDKActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointSDKActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointSDKActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKDeleteAdmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteAdmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelResponse" : @"ADMChannelResponse",
             };
}

+ (NSValueTransformer *)ADMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKADMChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteApnsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteApnsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteApnsSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteApnsSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelResponse" : @"APNSSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteApnsVoipChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteApnsVoipChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelResponse" : @"APNSVoipChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteApnsVoipSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelResponse" : @"APNSVoipSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationResponse" : @"ApplicationResponse",
             };
}

+ (NSValueTransformer *)applicationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKApplicationResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteBaiduChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteBaiduChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baiduChannelResponse" : @"BaiduChannelResponse",
             };
}

+ (NSValueTransformer *)baiduChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKBaiduChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointSDKDeleteCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteEmailChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteEmailChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEmailChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointSDKDeleteEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointResponse" : @"EndpointResponse",
             };
}

+ (NSValueTransformer *)endpointResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteEventStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteEventStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventStream" : @"EventStream",
             };
}

+ (NSValueTransformer *)eventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEventStream class]];
}

@end

@implementation AWSPinpointSDKDeleteGcmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteGcmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKGCMChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointSDKDeleteSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteSmsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteSmsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSMSChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteUserEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointSDKDeleteUserEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointsResponse" : @"EndpointsResponse",
             };
}

+ (NSValueTransformer *)endpointsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointsResponse class]];
}

@end

@implementation AWSPinpointSDKDeleteVoiceChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKDeleteVoiceChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointSDKDirectMessageConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMMessage" : @"ADMMessage",
             @"APNSMessage" : @"APNSMessage",
             @"baiduMessage" : @"BaiduMessage",
             @"defaultMessage" : @"DefaultMessage",
             @"defaultPushNotificationMessage" : @"DefaultPushNotificationMessage",
             @"emailMessage" : @"EmailMessage",
             @"GCMMessage" : @"GCMMessage",
             @"SMSMessage" : @"SMSMessage",
             @"voiceMessage" : @"VoiceMessage",
             };
}

+ (NSValueTransformer *)ADMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKADMMessage class]];
}

+ (NSValueTransformer *)APNSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSMessage class]];
}

+ (NSValueTransformer *)baiduMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKBaiduMessage class]];
}

+ (NSValueTransformer *)defaultMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKDefaultMessage class]];
}

+ (NSValueTransformer *)defaultPushNotificationMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKDefaultPushNotificationMessage class]];
}

+ (NSValueTransformer *)emailMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEmailMessage class]];
}

+ (NSValueTransformer *)GCMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKGCMMessage class]];
}

+ (NSValueTransformer *)SMSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSMSMessage class]];
}

+ (NSValueTransformer *)voiceMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKVoiceMessage class]];
}

@end

@implementation AWSPinpointSDKEmailChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSet" : @"ConfigurationSet",
             @"enabled" : @"Enabled",
             @"fromAddress" : @"FromAddress",
             @"identity" : @"Identity",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSPinpointSDKEmailChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationSet" : @"ConfigurationSet",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"fromAddress" : @"FromAddress",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"identity" : @"Identity",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"messagesPerSecond" : @"MessagesPerSecond",
             @"platform" : @"Platform",
             @"roleArn" : @"RoleArn",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKEmailMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"feedbackForwardingAddress" : @"FeedbackForwardingAddress",
             @"fromAddress" : @"FromAddress",
             @"rawEmail" : @"RawEmail",
             @"replyToAddresses" : @"ReplyToAddresses",
             @"simpleEmail" : @"SimpleEmail",
             @"substitutions" : @"Substitutions",
             };
}

+ (NSValueTransformer *)rawEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKRawEmail class]];
}

+ (NSValueTransformer *)simpleEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSimpleEmail class]];
}

@end

@implementation AWSPinpointSDKEndpointBatchItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"identifier" : @"Id",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeCustom);
        }
        return @(AWSPinpointSDKChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKChannelTypeGcm:
                return @"GCM";
            case AWSPinpointSDKChannelTypeApns:
                return @"APNS";
            case AWSPinpointSDKChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointSDKChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointSDKChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointSDKChannelTypeAdm:
                return @"ADM";
            case AWSPinpointSDKChannelTypeSms:
                return @"SMS";
            case AWSPinpointSDKChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointSDKChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointSDKChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointSDKChannelTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointUser class]];
}

@end

@implementation AWSPinpointSDKEndpointBatchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKEndpointBatchItem class]];
}

@end

@implementation AWSPinpointSDKEndpointDemographic

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appVersion" : @"AppVersion",
             @"locale" : @"Locale",
             @"make" : @"Make",
             @"model" : @"Model",
             @"modelVersion" : @"ModelVersion",
             @"platform" : @"Platform",
             @"platformVersion" : @"PlatformVersion",
             @"timezone" : @"Timezone",
             };
}

@end

@implementation AWSPinpointSDKEndpointItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSPinpointSDKEndpointLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"city" : @"City",
             @"country" : @"Country",
             @"latitude" : @"Latitude",
             @"longitude" : @"Longitude",
             @"postalCode" : @"PostalCode",
             @"region" : @"Region",
             };
}

@end

@implementation AWSPinpointSDKEndpointMessageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"deliveryStatus" : @"DeliveryStatus",
             @"messageId" : @"MessageId",
             @"statusCode" : @"StatusCode",
             @"statusMessage" : @"StatusMessage",
             @"updatedToken" : @"UpdatedToken",
             };
}

+ (NSValueTransformer *)deliveryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"THROTTLED"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusThrottled);
        }
        if ([value caseInsensitiveCompare:@"TEMPORARY_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"PERMANENT_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusPermanentFailure);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusUnknownFailure);
        }
        if ([value caseInsensitiveCompare:@"OPT_OUT"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusOptOut);
        }
        if ([value caseInsensitiveCompare:@"DUPLICATE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusDuplicate);
        }
        return @(AWSPinpointSDKDeliveryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKDeliveryStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSPinpointSDKDeliveryStatusThrottled:
                return @"THROTTLED";
            case AWSPinpointSDKDeliveryStatusTemporaryFailure:
                return @"TEMPORARY_FAILURE";
            case AWSPinpointSDKDeliveryStatusPermanentFailure:
                return @"PERMANENT_FAILURE";
            case AWSPinpointSDKDeliveryStatusUnknownFailure:
                return @"UNKNOWN_FAILURE";
            case AWSPinpointSDKDeliveryStatusOptOut:
                return @"OPT_OUT";
            case AWSPinpointSDKDeliveryStatusDuplicate:
                return @"DUPLICATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeCustom);
        }
        return @(AWSPinpointSDKChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKChannelTypeGcm:
                return @"GCM";
            case AWSPinpointSDKChannelTypeApns:
                return @"APNS";
            case AWSPinpointSDKChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointSDKChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointSDKChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointSDKChannelTypeAdm:
                return @"ADM";
            case AWSPinpointSDKChannelTypeSms:
                return @"SMS";
            case AWSPinpointSDKChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointSDKChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointSDKChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointSDKChannelTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointUser class]];
}

@end

@implementation AWSPinpointSDKEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"applicationId" : @"ApplicationId",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"cohortId" : @"CohortId",
             @"creationDate" : @"CreationDate",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"identifier" : @"Id",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeCustom);
        }
        return @(AWSPinpointSDKChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKChannelTypeGcm:
                return @"GCM";
            case AWSPinpointSDKChannelTypeApns:
                return @"APNS";
            case AWSPinpointSDKChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointSDKChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointSDKChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointSDKChannelTypeAdm:
                return @"ADM";
            case AWSPinpointSDKChannelTypeSms:
                return @"SMS";
            case AWSPinpointSDKChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointSDKChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointSDKChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointSDKChannelTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointUser class]];
}

@end

@implementation AWSPinpointSDKEndpointSendConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bodyOverride" : @"BodyOverride",
             @"context" : @"Context",
             @"rawContent" : @"RawContent",
             @"substitutions" : @"Substitutions",
             @"titleOverride" : @"TitleOverride",
             };
}

@end

@implementation AWSPinpointSDKEndpointUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userAttributes" : @"UserAttributes",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointSDKEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKEndpointResponse class]];
}

@end

@implementation AWSPinpointSDKEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appPackageName" : @"AppPackageName",
             @"appTitle" : @"AppTitle",
             @"appVersionCode" : @"AppVersionCode",
             @"attributes" : @"Attributes",
             @"clientSdkVersion" : @"ClientSdkVersion",
             @"eventType" : @"EventType",
             @"metrics" : @"Metrics",
             @"sdkName" : @"SdkName",
             @"session" : @"Session",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)sessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSession class]];
}

@end

@implementation AWSPinpointSDKEventDimensions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"eventType" : @"EventType",
             @"metrics" : @"Metrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKAttributeDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKMetricDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKEventItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSPinpointSDKEventStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"destinationStreamArn" : @"DestinationStreamArn",
             @"externalId" : @"ExternalId",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"lastUpdatedBy" : @"LastUpdatedBy",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSPinpointSDKEventsBatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"events" : @"Events",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKPublicEndpoint class]];
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKEvent class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchItem" : @"BatchItem",
             };
}

+ (NSValueTransformer *)batchItemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKEventsBatch class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKItemResponse class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKExportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"s3UrlPrefix" : @"S3UrlPrefix",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             };
}

@end

@implementation AWSPinpointSDKExportJobResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"s3UrlPrefix" : @"S3UrlPrefix",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             };
}

@end

@implementation AWSPinpointSDKExportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"completedPieces" : @"CompletedPieces",
             @"completionDate" : @"CompletionDate",
             @"creationDate" : @"CreationDate",
             @"definition" : @"Definition",
             @"failedPieces" : @"FailedPieces",
             @"failures" : @"Failures",
             @"identifier" : @"Id",
             @"jobStatus" : @"JobStatus",
             @"totalFailures" : @"TotalFailures",
             @"totalPieces" : @"TotalPieces",
             @"totalProcessed" : @"TotalProcessed",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)definitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKExportJobResource class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"PROCESSING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusFailed);
        }
        return @(AWSPinpointSDKJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKJobStatusCreated:
                return @"CREATED";
            case AWSPinpointSDKJobStatusInitializing:
                return @"INITIALIZING";
            case AWSPinpointSDKJobStatusProcessing:
                return @"PROCESSING";
            case AWSPinpointSDKJobStatusCompleting:
                return @"COMPLETING";
            case AWSPinpointSDKJobStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointSDKJobStatusFailing:
                return @"FAILING";
            case AWSPinpointSDKJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKExportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKExportJobResponse class]];
}

@end

@implementation AWSPinpointSDKGCMChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKey" : @"ApiKey",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointSDKGCMChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"credential" : @"Credential",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKGCMMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"collapseKey" : @"CollapseKey",
             @"data" : @"Data",
             @"iconReference" : @"IconReference",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"priority" : @"Priority",
             @"rawContent" : @"RawContent",
             @"restrictedPackageName" : @"RestrictedPackageName",
             @"silentPush" : @"SilentPush",
             @"smallImageIconUrl" : @"SmallImageIconUrl",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionUrl);
        }
        return @(AWSPinpointSDKActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointSDKActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointSDKActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKGPSCoordinates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latitude" : @"Latitude",
             @"longitude" : @"Longitude",
             };
}

@end

@implementation AWSPinpointSDKGPSPointDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"coordinates" : @"Coordinates",
             @"rangeInKilometers" : @"RangeInKilometers",
             };
}

+ (NSValueTransformer *)coordinatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKGPSCoordinates class]];
}

@end

@implementation AWSPinpointSDKGetAdmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetAdmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelResponse" : @"ADMChannelResponse",
             };
}

+ (NSValueTransformer *)ADMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKADMChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetApnsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetApnsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetApnsSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetApnsSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelResponse" : @"APNSSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetApnsVoipChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetApnsVoipChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelResponse" : @"APNSVoipChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetApnsVoipSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetApnsVoipSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelResponse" : @"APNSVoipSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationResponse" : @"ApplicationResponse",
             };
}

+ (NSValueTransformer *)applicationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKApplicationResponse class]];
}

@end

@implementation AWSPinpointSDKGetApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetApplicationSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationSettingsResource" : @"ApplicationSettingsResource",
             };
}

+ (NSValueTransformer *)applicationSettingsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKApplicationSettingsResource class]];
}

@end

@implementation AWSPinpointSDKGetAppsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetAppsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationsResponse" : @"ApplicationsResponse",
             };
}

+ (NSValueTransformer *)applicationsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKApplicationsResponse class]];
}

@end

@implementation AWSPinpointSDKGetBaiduChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetBaiduChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baiduChannelResponse" : @"BaiduChannelResponse",
             };
}

+ (NSValueTransformer *)baiduChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKBaiduChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetCampaignActivitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetCampaignActivitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activitiesResponse" : @"ActivitiesResponse",
             };
}

+ (NSValueTransformer *)activitiesResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKActivitiesResponse class]];
}

@end

@implementation AWSPinpointSDKGetCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointSDKGetCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignResponse class]];
}

@end

@implementation AWSPinpointSDKGetCampaignVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKGetCampaignVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignResponse class]];
}

@end

@implementation AWSPinpointSDKGetCampaignVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetCampaignVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignsResponse" : @"CampaignsResponse",
             };
}

+ (NSValueTransformer *)campaignsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignsResponse class]];
}

@end

@implementation AWSPinpointSDKGetCampaignsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetCampaignsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignsResponse" : @"CampaignsResponse",
             };
}

+ (NSValueTransformer *)campaignsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignsResponse class]];
}

@end

@implementation AWSPinpointSDKGetChannelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetChannelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelsResponse" : @"ChannelsResponse",
             };
}

+ (NSValueTransformer *)channelsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKChannelsResponse class]];
}

@end

@implementation AWSPinpointSDKGetEmailChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetEmailChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEmailChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointSDKGetEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointResponse" : @"EndpointResponse",
             };
}

+ (NSValueTransformer *)endpointResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointResponse class]];
}

@end

@implementation AWSPinpointSDKGetEventStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetEventStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventStream" : @"EventStream",
             };
}

+ (NSValueTransformer *)eventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEventStream class]];
}

@end

@implementation AWSPinpointSDKGetExportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSPinpointSDKGetExportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobResponse" : @"ExportJobResponse",
             };
}

+ (NSValueTransformer *)exportJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKExportJobResponse class]];
}

@end

@implementation AWSPinpointSDKGetExportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetExportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobsResponse" : @"ExportJobsResponse",
             };
}

+ (NSValueTransformer *)exportJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKExportJobsResponse class]];
}

@end

@implementation AWSPinpointSDKGetGcmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetGcmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKGCMChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSPinpointSDKGetImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobResponse" : @"ImportJobResponse",
             };
}

+ (NSValueTransformer *)importJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKImportJobResponse class]];
}

@end

@implementation AWSPinpointSDKGetImportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobsResponse" : @"ImportJobsResponse",
             };
}

+ (NSValueTransformer *)importJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKImportJobsResponse class]];
}

@end

@implementation AWSPinpointSDKGetSegmentExportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetSegmentExportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobsResponse" : @"ExportJobsResponse",
             };
}

+ (NSValueTransformer *)exportJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKExportJobsResponse class]];
}

@end

@implementation AWSPinpointSDKGetSegmentImportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetSegmentImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobsResponse" : @"ImportJobsResponse",
             };
}

+ (NSValueTransformer *)importJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKImportJobsResponse class]];
}

@end

@implementation AWSPinpointSDKGetSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointSDKGetSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentResponse class]];
}

@end

@implementation AWSPinpointSDKGetSegmentVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKGetSegmentVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentResponse class]];
}

@end

@implementation AWSPinpointSDKGetSegmentVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetSegmentVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentsResponse" : @"SegmentsResponse",
             };
}

+ (NSValueTransformer *)segmentsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentsResponse class]];
}

@end

@implementation AWSPinpointSDKGetSegmentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointSDKGetSegmentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentsResponse" : @"SegmentsResponse",
             };
}

+ (NSValueTransformer *)segmentsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentsResponse class]];
}

@end

@implementation AWSPinpointSDKGetSmsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetSmsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSMSChannelResponse class]];
}

@end

@implementation AWSPinpointSDKGetUserEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointSDKGetUserEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointsResponse" : @"EndpointsResponse",
             };
}

+ (NSValueTransformer *)endpointsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointsResponse class]];
}

@end

@implementation AWSPinpointSDKGetVoiceChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointSDKGetVoiceChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointSDKImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defineSegment" : @"DefineSegment",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"registerEndpoints" : @"RegisterEndpoints",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"segmentId" : @"SegmentId",
             @"segmentName" : @"SegmentName",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointSDKFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointSDKFormatJson);
        }
        return @(AWSPinpointSDKFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKFormatCsv:
                return @"CSV";
            case AWSPinpointSDKFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKImportJobResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defineSegment" : @"DefineSegment",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"registerEndpoints" : @"RegisterEndpoints",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"segmentId" : @"SegmentId",
             @"segmentName" : @"SegmentName",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointSDKFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointSDKFormatJson);
        }
        return @(AWSPinpointSDKFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKFormatCsv:
                return @"CSV";
            case AWSPinpointSDKFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"completedPieces" : @"CompletedPieces",
             @"completionDate" : @"CompletionDate",
             @"creationDate" : @"CreationDate",
             @"definition" : @"Definition",
             @"failedPieces" : @"FailedPieces",
             @"failures" : @"Failures",
             @"identifier" : @"Id",
             @"jobStatus" : @"JobStatus",
             @"totalFailures" : @"TotalFailures",
             @"totalPieces" : @"TotalPieces",
             @"totalProcessed" : @"TotalProcessed",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)definitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKImportJobResource class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"PROCESSING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILING"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSPinpointSDKJobStatusFailed);
        }
        return @(AWSPinpointSDKJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKJobStatusCreated:
                return @"CREATED";
            case AWSPinpointSDKJobStatusInitializing:
                return @"INITIALIZING";
            case AWSPinpointSDKJobStatusProcessing:
                return @"PROCESSING";
            case AWSPinpointSDKJobStatusCompleting:
                return @"COMPLETING";
            case AWSPinpointSDKJobStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointSDKJobStatusFailing:
                return @"FAILING";
            case AWSPinpointSDKJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKImportJobResponse class]];
}

@end

@implementation AWSPinpointSDKItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointItemResponse" : @"EndpointItemResponse",
             @"eventsItemResponse" : @"EventsItemResponse",
             };
}

+ (NSValueTransformer *)endpointItemResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointItemResponse class]];
}

+ (NSValueTransformer *)eventsItemResponseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKEventItemResponse class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageSmallIconUrl" : @"ImageSmallIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"jsonBody" : @"JsonBody",
             @"mediaUrl" : @"MediaUrl",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointSDKActionUrl);
        }
        return @(AWSPinpointSDKActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointSDKActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointSDKActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKMessageBody

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"requestID" : @"RequestID",
             };
}

@end

@implementation AWSPinpointSDKMessageConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMMessage" : @"ADMMessage",
             @"APNSMessage" : @"APNSMessage",
             @"baiduMessage" : @"BaiduMessage",
             @"defaultMessage" : @"DefaultMessage",
             @"emailMessage" : @"EmailMessage",
             @"GCMMessage" : @"GCMMessage",
             @"SMSMessage" : @"SMSMessage",
             };
}

+ (NSValueTransformer *)ADMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessage class]];
}

+ (NSValueTransformer *)APNSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessage class]];
}

+ (NSValueTransformer *)baiduMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessage class]];
}

+ (NSValueTransformer *)defaultMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessage class]];
}

+ (NSValueTransformer *)emailMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignEmailMessage class]];
}

+ (NSValueTransformer *)GCMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessage class]];
}

+ (NSValueTransformer *)SMSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignSmsMessage class]];
}

@end

@implementation AWSPinpointSDKMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addresses" : @"Addresses",
             @"context" : @"Context",
             @"endpoints" : @"Endpoints",
             @"messageConfiguration" : @"MessageConfiguration",
             @"traceId" : @"TraceId",
             };
}

+ (NSValueTransformer *)addressesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKAddressConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKEndpointSendConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKDirectMessageConfiguration class]];
}

@end

@implementation AWSPinpointSDKMessageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointResult" : @"EndpointResult",
             @"requestId" : @"RequestId",
             @"result" : @"Result",
             };
}

+ (NSValueTransformer *)endpointResultJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKEndpointMessageResult class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)resultJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKMessageResult class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKMessageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStatus" : @"DeliveryStatus",
             @"messageId" : @"MessageId",
             @"statusCode" : @"StatusCode",
             @"statusMessage" : @"StatusMessage",
             @"updatedToken" : @"UpdatedToken",
             };
}

+ (NSValueTransformer *)deliveryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"THROTTLED"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusThrottled);
        }
        if ([value caseInsensitiveCompare:@"TEMPORARY_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"PERMANENT_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusPermanentFailure);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusUnknownFailure);
        }
        if ([value caseInsensitiveCompare:@"OPT_OUT"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusOptOut);
        }
        if ([value caseInsensitiveCompare:@"DUPLICATE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDeliveryStatusDuplicate);
        }
        return @(AWSPinpointSDKDeliveryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKDeliveryStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSPinpointSDKDeliveryStatusThrottled:
                return @"THROTTLED";
            case AWSPinpointSDKDeliveryStatusTemporaryFailure:
                return @"TEMPORARY_FAILURE";
            case AWSPinpointSDKDeliveryStatusPermanentFailure:
                return @"PERMANENT_FAILURE";
            case AWSPinpointSDKDeliveryStatusUnknownFailure:
                return @"UNKNOWN_FAILURE";
            case AWSPinpointSDKDeliveryStatusOptOut:
                return @"OPT_OUT";
            case AWSPinpointSDKDeliveryStatusDuplicate:
                return @"DUPLICATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKMetricDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"value" : @"Value",
             };
}

@end

@implementation AWSPinpointSDKNumberValidateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isoCountryCode" : @"IsoCountryCode",
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSPinpointSDKNumberValidateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"carrier" : @"Carrier",
             @"city" : @"City",
             @"cleansedPhoneNumberE164" : @"CleansedPhoneNumberE164",
             @"cleansedPhoneNumberNational" : @"CleansedPhoneNumberNational",
             @"country" : @"Country",
             @"countryCodeIso2" : @"CountryCodeIso2",
             @"countryCodeNumeric" : @"CountryCodeNumeric",
             @"county" : @"County",
             @"originalCountryCodeIso2" : @"OriginalCountryCodeIso2",
             @"originalPhoneNumber" : @"OriginalPhoneNumber",
             @"phoneType" : @"PhoneType",
             @"phoneTypeCode" : @"PhoneTypeCode",
             @"timezone" : @"Timezone",
             @"zipCode" : @"ZipCode",
             };
}

@end

@implementation AWSPinpointSDKPhoneNumberValidateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberValidateRequest" : @"NumberValidateRequest",
             };
}

+ (NSValueTransformer *)numberValidateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKNumberValidateRequest class]];
}

@end

@implementation AWSPinpointSDKPhoneNumberValidateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberValidateResponse" : @"NumberValidateResponse",
             };
}

+ (NSValueTransformer *)numberValidateResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKNumberValidateResponse class]];
}

@end

@implementation AWSPinpointSDKPublicEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointSDKChannelTypeCustom);
        }
        return @(AWSPinpointSDKChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKChannelTypeGcm:
                return @"GCM";
            case AWSPinpointSDKChannelTypeApns:
                return @"APNS";
            case AWSPinpointSDKChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointSDKChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointSDKChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointSDKChannelTypeAdm:
                return @"ADM";
            case AWSPinpointSDKChannelTypeSms:
                return @"SMS";
            case AWSPinpointSDKChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointSDKChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointSDKChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointSDKChannelTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointUser class]];
}

@end

@implementation AWSPinpointSDKPutEventStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeEventStream" : @"WriteEventStream",
             };
}

+ (NSValueTransformer *)writeEventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKWriteEventStream class]];
}

@end

@implementation AWSPinpointSDKPutEventStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventStream" : @"EventStream",
             };
}

+ (NSValueTransformer *)eventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEventStream class]];
}

@end

@implementation AWSPinpointSDKPutEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"eventsRequest" : @"EventsRequest",
             };
}

+ (NSValueTransformer *)eventsRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEventsRequest class]];
}

@end

@implementation AWSPinpointSDKPutEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventsResponse" : @"EventsResponse",
             };
}

+ (NSValueTransformer *)eventsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEventsResponse class]];
}

@end

@implementation AWSPinpointSDKQuietTime

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"End",
             @"start" : @"Start",
             };
}

@end

@implementation AWSPinpointSDKRawEmail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointSDKRecencyDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"recencyType" : @"RecencyType",
             };
}

+ (NSValueTransformer *)durationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HR_24"] == NSOrderedSame) {
            return @(AWSPinpointSDKDurationHr24);
        }
        if ([value caseInsensitiveCompare:@"DAY_7"] == NSOrderedSame) {
            return @(AWSPinpointSDKDurationDay7);
        }
        if ([value caseInsensitiveCompare:@"DAY_14"] == NSOrderedSame) {
            return @(AWSPinpointSDKDurationDay14);
        }
        if ([value caseInsensitiveCompare:@"DAY_30"] == NSOrderedSame) {
            return @(AWSPinpointSDKDurationDay30);
        }
        return @(AWSPinpointSDKDurationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKDurationHr24:
                return @"HR_24";
            case AWSPinpointSDKDurationDay7:
                return @"DAY_7";
            case AWSPinpointSDKDurationDay14:
                return @"DAY_14";
            case AWSPinpointSDKDurationDay30:
                return @"DAY_30";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recencyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointSDKRecencyTypeActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointSDKRecencyTypeInactive);
        }
        return @(AWSPinpointSDKRecencyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKRecencyTypeActive:
                return @"ACTIVE";
            case AWSPinpointSDKRecencyTypeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKRemoveAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"attributeType" : @"AttributeType",
             @"updateAttributesRequest" : @"UpdateAttributesRequest",
             };
}

+ (NSValueTransformer *)updateAttributesRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKUpdateAttributesRequest class]];
}

@end

@implementation AWSPinpointSDKRemoveAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesResource" : @"AttributesResource",
             };
}

+ (NSValueTransformer *)attributesResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAttributesResource class]];
}

@end

@implementation AWSPinpointSDKSMSChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"senderId" : @"SenderId",
             @"shortCode" : @"ShortCode",
             };
}

@end

@implementation AWSPinpointSDKSMSChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"promotionalMessagesPerSecond" : @"PromotionalMessagesPerSecond",
             @"senderId" : @"SenderId",
             @"shortCode" : @"ShortCode",
             @"transactionalMessagesPerSecond" : @"TransactionalMessagesPerSecond",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKSMSMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"keyword" : @"Keyword",
             @"messageType" : @"MessageType",
             @"originationNumber" : @"OriginationNumber",
             @"senderId" : @"SenderId",
             @"substitutions" : @"Substitutions",
             };
}

+ (NSValueTransformer *)messageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRANSACTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointSDKMessageTypeTransactional);
        }
        if ([value caseInsensitiveCompare:@"PROMOTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointSDKMessageTypePromotional);
        }
        return @(AWSPinpointSDKMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKMessageTypeTransactional:
                return @"TRANSACTIONAL";
            case AWSPinpointSDKMessageTypePromotional:
                return @"PROMOTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"eventFilter" : @"EventFilter",
             @"frequency" : @"Frequency",
             @"isLocalTime" : @"IsLocalTime",
             @"quietTime" : @"QuietTime",
             @"startTime" : @"StartTime",
             @"timezone" : @"Timezone",
             };
}

+ (NSValueTransformer *)eventFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignEventFilter class]];
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONCE"] == NSOrderedSame) {
            return @(AWSPinpointSDKFrequencyOnce);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSPinpointSDKFrequencyHourly);
        }
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSPinpointSDKFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"WEEKLY"] == NSOrderedSame) {
            return @(AWSPinpointSDKFrequencyWeekly);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSPinpointSDKFrequencyMonthly);
        }
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSPinpointSDKFrequencyEvent);
        }
        return @(AWSPinpointSDKFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKFrequencyOnce:
                return @"ONCE";
            case AWSPinpointSDKFrequencyHourly:
                return @"HOURLY";
            case AWSPinpointSDKFrequencyDaily:
                return @"DAILY";
            case AWSPinpointSDKFrequencyWeekly:
                return @"WEEKLY";
            case AWSPinpointSDKFrequencyMonthly:
                return @"MONTHLY";
            case AWSPinpointSDKFrequencyEvent:
                return @"EVENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKQuietTime class]];
}

@end

@implementation AWSPinpointSDKSegmentBehaviors

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recency" : @"Recency",
             };
}

+ (NSValueTransformer *)recencyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKRecencyDimension class]];
}

@end

@implementation AWSPinpointSDKSegmentDemographics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appVersion" : @"AppVersion",
             @"channel" : @"Channel",
             @"deviceType" : @"DeviceType",
             @"make" : @"Make",
             @"model" : @"Model",
             @"platform" : @"Platform",
             };
}

+ (NSValueTransformer *)appVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

+ (NSValueTransformer *)deviceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

+ (NSValueTransformer *)makeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

+ (NSValueTransformer *)modelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

@end

@implementation AWSPinpointSDKSegmentDimensions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"behavior" : @"Behavior",
             @"demographic" : @"Demographic",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"userAttributes" : @"UserAttributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKAttributeDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)behaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentBehaviors class]];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentDemographics class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentLocation class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKMetricDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKAttributeDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKSegmentGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"sourceSegments" : @"SourceSegments",
             @"sourceType" : @"SourceType",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKSegmentDimensions class]];
}

+ (NSValueTransformer *)sourceSegmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKSegmentReference class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSPinpointSDKSourceTypeAll);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSPinpointSDKSourceTypeAny);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSPinpointSDKSourceTypeNone);
        }
        return @(AWSPinpointSDKSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKSourceTypeAll:
                return @"ALL";
            case AWSPinpointSDKSourceTypeAny:
                return @"ANY";
            case AWSPinpointSDKSourceTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSPinpointSDKTypesAll);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSPinpointSDKTypesAny);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSPinpointSDKTypesNone);
        }
        return @(AWSPinpointSDKTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKTypesAll:
                return @"ALL";
            case AWSPinpointSDKTypesAny:
                return @"ANY";
            case AWSPinpointSDKTypesNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKSegmentGroupList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"include" : @"Include",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKSegmentGroup class]];
}

+ (NSValueTransformer *)includeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSPinpointSDKIncludeAll);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSPinpointSDKIncludeAny);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSPinpointSDKIncludeNone);
        }
        return @(AWSPinpointSDKIncludeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKIncludeAll:
                return @"ALL";
            case AWSPinpointSDKIncludeAny:
                return @"ANY";
            case AWSPinpointSDKIncludeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKSegmentImportResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelCounts" : @"ChannelCounts",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"size" : @"Size",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointSDKFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointSDKFormatJson);
        }
        return @(AWSPinpointSDKFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKFormatCsv:
                return @"CSV";
            case AWSPinpointSDKFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKSegmentLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"country" : @"Country",
             @"GPSPoint" : @"GPSPoint",
             };
}

+ (NSValueTransformer *)countryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSetDimension class]];
}

+ (NSValueTransformer *)GPSPointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKGPSPointDimension class]];
}

@end

@implementation AWSPinpointSDKSegmentReference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"dimensions" : @"Dimensions",
             @"identifier" : @"Id",
             @"importDefinition" : @"ImportDefinition",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"name" : @"Name",
             @"segmentGroups" : @"SegmentGroups",
             @"segmentType" : @"SegmentType",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentDimensions class]];
}

+ (NSValueTransformer *)importDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentImportResource class]];
}

+ (NSValueTransformer *)segmentGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentGroupList class]];
}

+ (NSValueTransformer *)segmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DIMENSIONAL"] == NSOrderedSame) {
            return @(AWSPinpointSDKSegmentTypeDimensional);
        }
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSPinpointSDKSegmentTypeImport);
        }
        return @(AWSPinpointSDKSegmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKSegmentTypeDimensional:
                return @"DIMENSIONAL";
            case AWSPinpointSDKSegmentTypeImport:
                return @"IMPORT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKSegmentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKSegmentResponse class]];
}

@end

@implementation AWSPinpointSDKSendMessagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"messageRequest" : @"MessageRequest",
             };
}

+ (NSValueTransformer *)messageRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageRequest class]];
}

@end

@implementation AWSPinpointSDKSendMessagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageResponse" : @"MessageResponse",
             };
}

+ (NSValueTransformer *)messageResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageResponse class]];
}

@end

@implementation AWSPinpointSDKSendUsersMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"context" : @"Context",
             @"messageConfiguration" : @"MessageConfiguration",
             @"traceId" : @"TraceId",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKDirectMessageConfiguration class]];
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointSDKEndpointSendConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointSDKSendUsersMessageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"requestId" : @"RequestId",
             @"result" : @"Result",
             };
}

@end

@implementation AWSPinpointSDKSendUsersMessagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"sendUsersMessageRequest" : @"SendUsersMessageRequest",
             };
}

+ (NSValueTransformer *)sendUsersMessageRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSendUsersMessageRequest class]];
}

@end

@implementation AWSPinpointSDKSendUsersMessagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sendUsersMessageResponse" : @"SendUsersMessageResponse",
             };
}

+ (NSValueTransformer *)sendUsersMessageResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSendUsersMessageResponse class]];
}

@end

@implementation AWSPinpointSDKSession

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"identifier" : @"Id",
             @"startTimestamp" : @"StartTimestamp",
             @"stopTimestamp" : @"StopTimestamp",
             };
}

@end

@implementation AWSPinpointSDKSetDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionType" : @"DimensionType",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)dimensionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDimensionTypeInclusive);
        }
        if ([value caseInsensitiveCompare:@"EXCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointSDKDimensionTypeExclusive);
        }
        return @(AWSPinpointSDKDimensionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointSDKDimensionTypeInclusive:
                return @"INCLUSIVE";
            case AWSPinpointSDKDimensionTypeExclusive:
                return @"EXCLUSIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointSDKSimpleEmail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"htmlPart" : @"HtmlPart",
             @"subject" : @"Subject",
             @"textPart" : @"TextPart",
             };
}

+ (NSValueTransformer *)htmlPartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSimpleEmailPart class]];
}

+ (NSValueTransformer *)subjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSimpleEmailPart class]];
}

+ (NSValueTransformer *)textPartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSimpleEmailPart class]];
}

@end

@implementation AWSPinpointSDKSimpleEmailPart

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"charset" : @"Charset",
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointSDKTreatmentResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"state" : @"State",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSchedule class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignState class]];
}

@end

@implementation AWSPinpointSDKUpdateAdmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelRequest" : @"ADMChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)ADMChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKADMChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateAdmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelResponse" : @"ADMChannelResponse",
             };
}

+ (NSValueTransformer *)ADMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKADMChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelRequest" : @"APNSChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelRequest" : @"APNSSandboxChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSSandboxChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelResponse" : @"APNSSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsVoipChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelRequest" : @"APNSVoipChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSVoipChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsVoipChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelResponse" : @"APNSVoipChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsVoipSandboxChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelRequest" : @"APNSVoipSandboxChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipSandboxChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelResponse" : @"APNSVoipSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKAPNSVoipSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeApplicationSettingsRequest" : @"WriteApplicationSettingsRequest",
             };
}

+ (NSValueTransformer *)writeApplicationSettingsRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKWriteApplicationSettingsRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateApplicationSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationSettingsResource" : @"ApplicationSettingsResource",
             };
}

+ (NSValueTransformer *)applicationSettingsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKApplicationSettingsResource class]];
}

@end

@implementation AWSPinpointSDKUpdateAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blacklist" : @"Blacklist",
             };
}

@end

@implementation AWSPinpointSDKUpdateBaiduChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"baiduChannelRequest" : @"BaiduChannelRequest",
             };
}

+ (NSValueTransformer *)baiduChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKBaiduChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateBaiduChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baiduChannelResponse" : @"BaiduChannelResponse",
             };
}

+ (NSValueTransformer *)baiduChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKBaiduChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"writeCampaignRequest" : @"WriteCampaignRequest",
             };
}

+ (NSValueTransformer *)writeCampaignRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKWriteCampaignRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateEmailChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"emailChannelRequest" : @"EmailChannelRequest",
             };
}

+ (NSValueTransformer *)emailChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEmailChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateEmailChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEmailChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             @"endpointRequest" : @"EndpointRequest",
             };
}

+ (NSValueTransformer *)endpointRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageBody class]];
}

@end

@implementation AWSPinpointSDKUpdateEndpointsBatchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointBatchRequest" : @"EndpointBatchRequest",
             };
}

+ (NSValueTransformer *)endpointBatchRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKEndpointBatchRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateEndpointsBatchResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageBody class]];
}

@end

@implementation AWSPinpointSDKUpdateGcmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"GCMChannelRequest" : @"GCMChannelRequest",
             };
}

+ (NSValueTransformer *)GCMChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKGCMChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateGcmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKGCMChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             @"writeSegmentRequest" : @"WriteSegmentRequest",
             };
}

+ (NSValueTransformer *)writeSegmentRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKWriteSegmentRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateSmsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"SMSChannelRequest" : @"SMSChannelRequest",
             };
}

+ (NSValueTransformer *)SMSChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSMSChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateSmsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSMSChannelResponse class]];
}

@end

@implementation AWSPinpointSDKUpdateVoiceChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"voiceChannelRequest" : @"VoiceChannelRequest",
             };
}

+ (NSValueTransformer *)voiceChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKVoiceChannelRequest class]];
}

@end

@implementation AWSPinpointSDKUpdateVoiceChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointSDKVoiceChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointSDKVoiceChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointSDKVoiceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"languageCode" : @"LanguageCode",
             @"originationNumber" : @"OriginationNumber",
             @"substitutions" : @"Substitutions",
             @"voiceId" : @"VoiceId",
             };
}

@end

@implementation AWSPinpointSDKWriteApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignHook" : @"CampaignHook",
             @"cloudWatchMetricsEnabled" : @"CloudWatchMetricsEnabled",
             @"limits" : @"Limits",
             @"quietTime" : @"QuietTime",
             };
}

+ (NSValueTransformer *)campaignHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKQuietTime class]];
}

@end

@implementation AWSPinpointSDKWriteCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"detail" : @"Description",
             @"holdoutPercent" : @"HoldoutPercent",
             @"hook" : @"Hook",
             @"isPaused" : @"IsPaused",
             @"limits" : @"Limits",
             @"messageConfiguration" : @"MessageConfiguration",
             @"name" : @"Name",
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointSDKWriteTreatmentResource class]];
}

+ (NSValueTransformer *)hookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKCampaignLimits class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSchedule class]];
}

@end

@implementation AWSPinpointSDKWriteEventStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationStreamArn" : @"DestinationStreamArn",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSPinpointSDKWriteSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"name" : @"Name",
             @"segmentGroups" : @"SegmentGroups",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentDimensions class]];
}

+ (NSValueTransformer *)segmentGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSegmentGroupList class]];
}

@end

@implementation AWSPinpointSDKWriteTreatmentResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointSDKSchedule class]];
}

@end
