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

#import "AWSPinpointSDKService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSPinpointSDKResources.h"

static NSString *const AWSInfoPinpointSDK = @"PinpointSDK";
NSString *const AWSPinpointSDKSDKVersion = @"2.13.6";


@interface AWSPinpointSDKResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSPinpointSDKResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSPinpointSDKErrorBadRequest),
                            @"ForbiddenException" : @(AWSPinpointSDKErrorForbidden),
                            @"InternalServerErrorException" : @(AWSPinpointSDKErrorInternalServerError),
                            @"MethodNotAllowedException" : @(AWSPinpointSDKErrorMethodNotAllowed),
                            @"NotFoundException" : @(AWSPinpointSDKErrorNotFound),
                            @"TooManyRequestsException" : @(AWSPinpointSDKErrorTooManyRequests),
                            };
}

#pragma mark -

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {
    id responseObject = [super responseObjectForResponse:response
                                         originalRequest:originalRequest
                                          currentRequest:currentRequest
                                                    data:data
                                                   error:error];

	if (*error) {
        NSMutableDictionary *richUserInfo = [NSMutableDictionary dictionaryWithDictionary:(*error).userInfo];
        [richUserInfo setObject:@"responseStatusCode" forKey:@([response statusCode])];
        [richUserInfo setObject:@"responseHeaders" forKey:[response allHeaderFields]];
        [richUserInfo setObject:@"responseDataSize" forKey:@(data?[data length]:0)];
        *error = [NSError errorWithDomain:(*error).domain
                                     code:(*error).code
                                 userInfo:richUserInfo];
        
    }
    
    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        NSString *errorTypeHeader = [[[[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"] componentsSeparatedByString:@":"] firstObject];
        
        //server may also return error message in the body, need to catch it.
        if (errorTypeHeader == nil) {
            errorTypeHeader = [responseObject objectForKey:@"__type"];
        }
        
        if (errorCodeDictionary[[[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]]) {
            if (error) {
                NSMutableDictionary *userInfo = [@{
                                                   NSLocalizedFailureReasonErrorKey : errorTypeHeader,
                                                   @"responseStatusCode" : @([response statusCode]),
                                                   @"responseHeaders" : [response allHeaderFields],
                                                   @"responseDataSize" : @(data?[data length]:0),
                                                   } mutableCopy];
                [userInfo addEntriesFromDictionary:responseObject];
                *error = [NSError errorWithDomain:AWSPinpointSDKErrorDomain
                                             code:[[errorCodeDictionary objectForKey:[[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]] integerValue]
                                         userInfo:userInfo];
            }
            return responseObject;
        } else if ([[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]) {
            if (error) {
                NSMutableDictionary *userInfo = [@{
                                                   NSLocalizedFailureReasonErrorKey : errorTypeHeader,
                                                   @"responseStatusCode" : @([response statusCode]),
                                                   @"responseHeaders" : [response allHeaderFields],
                                                   @"responseDataSize" : @(data?[data length]:0),
                                                   } mutableCopy];
                [userInfo addEntriesFromDictionary:responseObject];
                *error = [NSError errorWithDomain:AWSPinpointSDKErrorDomain
                                             code:AWSPinpointSDKErrorUnknown
                                         userInfo:userInfo];
            }
            return responseObject;
        } else if (response.statusCode/100 != 2) {
            //should be an error if not a 2xx response.
            if (error) {
                *error = [NSError errorWithDomain:AWSPinpointSDKErrorDomain
                                             code:AWSPinpointSDKErrorUnknown
                                         userInfo:responseObject];
            } 
            return responseObject;
        }
        
        
        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }
    
    if (responseObject == nil ||
        ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject count] == 0)) {
        return @{@"responseStatusCode" : @([response statusCode]),
                 @"responseHeaders" : [response allHeaderFields],
                 @"responseDataSize" : @(data?[data length]:0),
                 };
    }
	
    return responseObject;
}

@end

@interface AWSPinpointSDKRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSPinpointSDKRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSPinpointSDK()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSPinpointSDK

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSPinpointSDKSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSPinpointSDK versions need to match. Check your SDK installation. AWSCore: %@ AWSPinpointSDK: %@", AWSiOSSDKVersion, AWSPinpointSDKSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultPinpointSDK {
    static AWSPinpointSDK *_defaultPinpointSDK = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPinpointSDK];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json`, `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultPinpointSDK = [[AWSPinpointSDK alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultPinpointSDK;
}

+ (void)registerPinpointSDKWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSPinpointSDK alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)PinpointSDKForKey:(NSString *)key {
    @synchronized(self) {
        AWSPinpointSDK *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoPinpointSDK
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSPinpointSDK registerPinpointSDKWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removePinpointSDKForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultPinpointSDK` or `+ PinpointSDKForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMobileTargeting
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMobileTargeting];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSPinpointSDKRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.1"}; 
		
        _networking = [[AWSNetworking alloc] initWithConfiguration:_configuration];
    }
    
    return self;
}

- (AWSTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    
    @autoreleasepool {
        if (!request) {
            request = [AWSRequest new];
        }

        AWSNetworkingRequest *networkingRequest = request.internalRequest;
        if (request) {
            networkingRequest.parameters = [[AWSMTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
        } else {
            networkingRequest.parameters = @{};
        }

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSPinpointSDKResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSPinpointSDKResponseSerializer alloc] initWithJSONDefinition:[[AWSPinpointSDKResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSPinpointSDKCreateAppResponse *> *)createApp:(AWSPinpointSDKCreateAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps"
                  targetPrefix:@""
                 operationName:@"CreateApp"
                   outputClass:[AWSPinpointSDKCreateAppResponse class]];
}

- (void)createApp:(AWSPinpointSDKCreateAppRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKCreateAppResponse *response, NSError *error))completionHandler {
    [[self createApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKCreateAppResponse *> * _Nonnull task) {
        AWSPinpointSDKCreateAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKCreateCampaignResponse *> *)createCampaign:(AWSPinpointSDKCreateCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/campaigns"
                  targetPrefix:@""
                 operationName:@"CreateCampaign"
                   outputClass:[AWSPinpointSDKCreateCampaignResponse class]];
}

- (void)createCampaign:(AWSPinpointSDKCreateCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKCreateCampaignResponse *response, NSError *error))completionHandler {
    [[self createCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKCreateCampaignResponse *> * _Nonnull task) {
        AWSPinpointSDKCreateCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKCreateExportJobResponse *> *)createExportJob:(AWSPinpointSDKCreateExportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/jobs/export"
                  targetPrefix:@""
                 operationName:@"CreateExportJob"
                   outputClass:[AWSPinpointSDKCreateExportJobResponse class]];
}

- (void)createExportJob:(AWSPinpointSDKCreateExportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKCreateExportJobResponse *response, NSError *error))completionHandler {
    [[self createExportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKCreateExportJobResponse *> * _Nonnull task) {
        AWSPinpointSDKCreateExportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKCreateImportJobResponse *> *)createImportJob:(AWSPinpointSDKCreateImportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/jobs/import"
                  targetPrefix:@""
                 operationName:@"CreateImportJob"
                   outputClass:[AWSPinpointSDKCreateImportJobResponse class]];
}

- (void)createImportJob:(AWSPinpointSDKCreateImportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKCreateImportJobResponse *response, NSError *error))completionHandler {
    [[self createImportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKCreateImportJobResponse *> * _Nonnull task) {
        AWSPinpointSDKCreateImportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKCreateSegmentResponse *> *)createSegment:(AWSPinpointSDKCreateSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/segments"
                  targetPrefix:@""
                 operationName:@"CreateSegment"
                   outputClass:[AWSPinpointSDKCreateSegmentResponse class]];
}

- (void)createSegment:(AWSPinpointSDKCreateSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKCreateSegmentResponse *response, NSError *error))completionHandler {
    [[self createSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKCreateSegmentResponse *> * _Nonnull task) {
        AWSPinpointSDKCreateSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteAdmChannelResponse *> *)deleteAdmChannel:(AWSPinpointSDKDeleteAdmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/adm"
                  targetPrefix:@""
                 operationName:@"DeleteAdmChannel"
                   outputClass:[AWSPinpointSDKDeleteAdmChannelResponse class]];
}

- (void)deleteAdmChannel:(AWSPinpointSDKDeleteAdmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteAdmChannelResponse *response, NSError *error))completionHandler {
    [[self deleteAdmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteAdmChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteAdmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteApnsChannelResponse *> *)deleteApnsChannel:(AWSPinpointSDKDeleteApnsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns"
                  targetPrefix:@""
                 operationName:@"DeleteApnsChannel"
                   outputClass:[AWSPinpointSDKDeleteApnsChannelResponse class]];
}

- (void)deleteApnsChannel:(AWSPinpointSDKDeleteApnsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteApnsChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteApnsChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteApnsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteApnsSandboxChannelResponse *> *)deleteApnsSandboxChannel:(AWSPinpointSDKDeleteApnsSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns_sandbox"
                  targetPrefix:@""
                 operationName:@"DeleteApnsSandboxChannel"
                   outputClass:[AWSPinpointSDKDeleteApnsSandboxChannelResponse class]];
}

- (void)deleteApnsSandboxChannel:(AWSPinpointSDKDeleteApnsSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteApnsSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteApnsSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteApnsSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteApnsVoipChannelResponse *> *)deleteApnsVoipChannel:(AWSPinpointSDKDeleteApnsVoipChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip"
                  targetPrefix:@""
                 operationName:@"DeleteApnsVoipChannel"
                   outputClass:[AWSPinpointSDKDeleteApnsVoipChannelResponse class]];
}

- (void)deleteApnsVoipChannel:(AWSPinpointSDKDeleteApnsVoipChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteApnsVoipChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsVoipChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteApnsVoipChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteApnsVoipChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse *> *)deleteApnsVoipSandboxChannel:(AWSPinpointSDKDeleteApnsVoipSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip_sandbox"
                  targetPrefix:@""
                 operationName:@"DeleteApnsVoipSandboxChannel"
                   outputClass:[AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse class]];
}

- (void)deleteApnsVoipSandboxChannel:(AWSPinpointSDKDeleteApnsVoipSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsVoipSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteAppResponse *> *)deleteApp:(AWSPinpointSDKDeleteAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}"
                  targetPrefix:@""
                 operationName:@"DeleteApp"
                   outputClass:[AWSPinpointSDKDeleteAppResponse class]];
}

- (void)deleteApp:(AWSPinpointSDKDeleteAppRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteAppResponse *response, NSError *error))completionHandler {
    [[self deleteApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteAppResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteBaiduChannelResponse *> *)deleteBaiduChannel:(AWSPinpointSDKDeleteBaiduChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/baidu"
                  targetPrefix:@""
                 operationName:@"DeleteBaiduChannel"
                   outputClass:[AWSPinpointSDKDeleteBaiduChannelResponse class]];
}

- (void)deleteBaiduChannel:(AWSPinpointSDKDeleteBaiduChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteBaiduChannelResponse *response, NSError *error))completionHandler {
    [[self deleteBaiduChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteBaiduChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteBaiduChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteCampaignResponse *> *)deleteCampaign:(AWSPinpointSDKDeleteCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}"
                  targetPrefix:@""
                 operationName:@"DeleteCampaign"
                   outputClass:[AWSPinpointSDKDeleteCampaignResponse class]];
}

- (void)deleteCampaign:(AWSPinpointSDKDeleteCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteCampaignResponse *response, NSError *error))completionHandler {
    [[self deleteCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteCampaignResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteEmailChannelResponse *> *)deleteEmailChannel:(AWSPinpointSDKDeleteEmailChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/email"
                  targetPrefix:@""
                 operationName:@"DeleteEmailChannel"
                   outputClass:[AWSPinpointSDKDeleteEmailChannelResponse class]];
}

- (void)deleteEmailChannel:(AWSPinpointSDKDeleteEmailChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteEmailChannelResponse *response, NSError *error))completionHandler {
    [[self deleteEmailChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteEmailChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteEmailChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteEndpointResponse *> *)deleteEndpoint:(AWSPinpointSDKDeleteEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/endpoints/{endpoint-id}"
                  targetPrefix:@""
                 operationName:@"DeleteEndpoint"
                   outputClass:[AWSPinpointSDKDeleteEndpointResponse class]];
}

- (void)deleteEndpoint:(AWSPinpointSDKDeleteEndpointRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteEndpointResponse *response, NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteEndpointResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteEventStreamResponse *> *)deleteEventStream:(AWSPinpointSDKDeleteEventStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/eventstream"
                  targetPrefix:@""
                 operationName:@"DeleteEventStream"
                   outputClass:[AWSPinpointSDKDeleteEventStreamResponse class]];
}

- (void)deleteEventStream:(AWSPinpointSDKDeleteEventStreamRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteEventStreamResponse *response, NSError *error))completionHandler {
    [[self deleteEventStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteEventStreamResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteEventStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteGcmChannelResponse *> *)deleteGcmChannel:(AWSPinpointSDKDeleteGcmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/gcm"
                  targetPrefix:@""
                 operationName:@"DeleteGcmChannel"
                   outputClass:[AWSPinpointSDKDeleteGcmChannelResponse class]];
}

- (void)deleteGcmChannel:(AWSPinpointSDKDeleteGcmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteGcmChannelResponse *response, NSError *error))completionHandler {
    [[self deleteGcmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteGcmChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteGcmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteSegmentResponse *> *)deleteSegment:(AWSPinpointSDKDeleteSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}"
                  targetPrefix:@""
                 operationName:@"DeleteSegment"
                   outputClass:[AWSPinpointSDKDeleteSegmentResponse class]];
}

- (void)deleteSegment:(AWSPinpointSDKDeleteSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteSegmentResponse *response, NSError *error))completionHandler {
    [[self deleteSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteSegmentResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteSmsChannelResponse *> *)deleteSmsChannel:(AWSPinpointSDKDeleteSmsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/sms"
                  targetPrefix:@""
                 operationName:@"DeleteSmsChannel"
                   outputClass:[AWSPinpointSDKDeleteSmsChannelResponse class]];
}

- (void)deleteSmsChannel:(AWSPinpointSDKDeleteSmsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteSmsChannelResponse *response, NSError *error))completionHandler {
    [[self deleteSmsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteSmsChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteSmsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteUserEndpointsResponse *> *)deleteUserEndpoints:(AWSPinpointSDKDeleteUserEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/users/{user-id}"
                  targetPrefix:@""
                 operationName:@"DeleteUserEndpoints"
                   outputClass:[AWSPinpointSDKDeleteUserEndpointsResponse class]];
}

- (void)deleteUserEndpoints:(AWSPinpointSDKDeleteUserEndpointsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteUserEndpointsResponse *response, NSError *error))completionHandler {
    [[self deleteUserEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteUserEndpointsResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteUserEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKDeleteVoiceChannelResponse *> *)deleteVoiceChannel:(AWSPinpointSDKDeleteVoiceChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/voice"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceChannel"
                   outputClass:[AWSPinpointSDKDeleteVoiceChannelResponse class]];
}

- (void)deleteVoiceChannel:(AWSPinpointSDKDeleteVoiceChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKDeleteVoiceChannelResponse *response, NSError *error))completionHandler {
    [[self deleteVoiceChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKDeleteVoiceChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKDeleteVoiceChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetAdmChannelResponse *> *)getAdmChannel:(AWSPinpointSDKGetAdmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/adm"
                  targetPrefix:@""
                 operationName:@"GetAdmChannel"
                   outputClass:[AWSPinpointSDKGetAdmChannelResponse class]];
}

- (void)getAdmChannel:(AWSPinpointSDKGetAdmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetAdmChannelResponse *response, NSError *error))completionHandler {
    [[self getAdmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetAdmChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetAdmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetApnsChannelResponse *> *)getApnsChannel:(AWSPinpointSDKGetApnsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns"
                  targetPrefix:@""
                 operationName:@"GetApnsChannel"
                   outputClass:[AWSPinpointSDKGetApnsChannelResponse class]];
}

- (void)getApnsChannel:(AWSPinpointSDKGetApnsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetApnsChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetApnsChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetApnsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetApnsSandboxChannelResponse *> *)getApnsSandboxChannel:(AWSPinpointSDKGetApnsSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns_sandbox"
                  targetPrefix:@""
                 operationName:@"GetApnsSandboxChannel"
                   outputClass:[AWSPinpointSDKGetApnsSandboxChannelResponse class]];
}

- (void)getApnsSandboxChannel:(AWSPinpointSDKGetApnsSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetApnsSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetApnsSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetApnsSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetApnsVoipChannelResponse *> *)getApnsVoipChannel:(AWSPinpointSDKGetApnsVoipChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip"
                  targetPrefix:@""
                 operationName:@"GetApnsVoipChannel"
                   outputClass:[AWSPinpointSDKGetApnsVoipChannelResponse class]];
}

- (void)getApnsVoipChannel:(AWSPinpointSDKGetApnsVoipChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetApnsVoipChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsVoipChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetApnsVoipChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetApnsVoipChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetApnsVoipSandboxChannelResponse *> *)getApnsVoipSandboxChannel:(AWSPinpointSDKGetApnsVoipSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip_sandbox"
                  targetPrefix:@""
                 operationName:@"GetApnsVoipSandboxChannel"
                   outputClass:[AWSPinpointSDKGetApnsVoipSandboxChannelResponse class]];
}

- (void)getApnsVoipSandboxChannel:(AWSPinpointSDKGetApnsVoipSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetApnsVoipSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsVoipSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetApnsVoipSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetApnsVoipSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetAppResponse *> *)getApp:(AWSPinpointSDKGetAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}"
                  targetPrefix:@""
                 operationName:@"GetApp"
                   outputClass:[AWSPinpointSDKGetAppResponse class]];
}

- (void)getApp:(AWSPinpointSDKGetAppRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetAppResponse *response, NSError *error))completionHandler {
    [[self getApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetAppResponse *> * _Nonnull task) {
        AWSPinpointSDKGetAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetApplicationSettingsResponse *> *)getApplicationSettings:(AWSPinpointSDKGetApplicationSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/settings"
                  targetPrefix:@""
                 operationName:@"GetApplicationSettings"
                   outputClass:[AWSPinpointSDKGetApplicationSettingsResponse class]];
}

- (void)getApplicationSettings:(AWSPinpointSDKGetApplicationSettingsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetApplicationSettingsResponse *response, NSError *error))completionHandler {
    [[self getApplicationSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetApplicationSettingsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetApplicationSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetAppsResponse *> *)getApps:(AWSPinpointSDKGetAppsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps"
                  targetPrefix:@""
                 operationName:@"GetApps"
                   outputClass:[AWSPinpointSDKGetAppsResponse class]];
}

- (void)getApps:(AWSPinpointSDKGetAppsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetAppsResponse *response, NSError *error))completionHandler {
    [[self getApps:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetAppsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetAppsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetBaiduChannelResponse *> *)getBaiduChannel:(AWSPinpointSDKGetBaiduChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/baidu"
                  targetPrefix:@""
                 operationName:@"GetBaiduChannel"
                   outputClass:[AWSPinpointSDKGetBaiduChannelResponse class]];
}

- (void)getBaiduChannel:(AWSPinpointSDKGetBaiduChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetBaiduChannelResponse *response, NSError *error))completionHandler {
    [[self getBaiduChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetBaiduChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetBaiduChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetCampaignResponse *> *)getCampaign:(AWSPinpointSDKGetCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}"
                  targetPrefix:@""
                 operationName:@"GetCampaign"
                   outputClass:[AWSPinpointSDKGetCampaignResponse class]];
}

- (void)getCampaign:(AWSPinpointSDKGetCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetCampaignResponse *response, NSError *error))completionHandler {
    [[self getCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetCampaignResponse *> * _Nonnull task) {
        AWSPinpointSDKGetCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetCampaignActivitiesResponse *> *)getCampaignActivities:(AWSPinpointSDKGetCampaignActivitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}/activities"
                  targetPrefix:@""
                 operationName:@"GetCampaignActivities"
                   outputClass:[AWSPinpointSDKGetCampaignActivitiesResponse class]];
}

- (void)getCampaignActivities:(AWSPinpointSDKGetCampaignActivitiesRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetCampaignActivitiesResponse *response, NSError *error))completionHandler {
    [[self getCampaignActivities:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetCampaignActivitiesResponse *> * _Nonnull task) {
        AWSPinpointSDKGetCampaignActivitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetCampaignVersionResponse *> *)getCampaignVersion:(AWSPinpointSDKGetCampaignVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"GetCampaignVersion"
                   outputClass:[AWSPinpointSDKGetCampaignVersionResponse class]];
}

- (void)getCampaignVersion:(AWSPinpointSDKGetCampaignVersionRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetCampaignVersionResponse *response, NSError *error))completionHandler {
    [[self getCampaignVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetCampaignVersionResponse *> * _Nonnull task) {
        AWSPinpointSDKGetCampaignVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetCampaignVersionsResponse *> *)getCampaignVersions:(AWSPinpointSDKGetCampaignVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}/versions"
                  targetPrefix:@""
                 operationName:@"GetCampaignVersions"
                   outputClass:[AWSPinpointSDKGetCampaignVersionsResponse class]];
}

- (void)getCampaignVersions:(AWSPinpointSDKGetCampaignVersionsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetCampaignVersionsResponse *response, NSError *error))completionHandler {
    [[self getCampaignVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetCampaignVersionsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetCampaignVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetCampaignsResponse *> *)getCampaigns:(AWSPinpointSDKGetCampaignsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns"
                  targetPrefix:@""
                 operationName:@"GetCampaigns"
                   outputClass:[AWSPinpointSDKGetCampaignsResponse class]];
}

- (void)getCampaigns:(AWSPinpointSDKGetCampaignsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetCampaignsResponse *response, NSError *error))completionHandler {
    [[self getCampaigns:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetCampaignsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetCampaignsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetChannelsResponse *> *)getChannels:(AWSPinpointSDKGetChannelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels"
                  targetPrefix:@""
                 operationName:@"GetChannels"
                   outputClass:[AWSPinpointSDKGetChannelsResponse class]];
}

- (void)getChannels:(AWSPinpointSDKGetChannelsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetChannelsResponse *response, NSError *error))completionHandler {
    [[self getChannels:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetChannelsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetChannelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetEmailChannelResponse *> *)getEmailChannel:(AWSPinpointSDKGetEmailChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/email"
                  targetPrefix:@""
                 operationName:@"GetEmailChannel"
                   outputClass:[AWSPinpointSDKGetEmailChannelResponse class]];
}

- (void)getEmailChannel:(AWSPinpointSDKGetEmailChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetEmailChannelResponse *response, NSError *error))completionHandler {
    [[self getEmailChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetEmailChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetEmailChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetEndpointResponse *> *)getEndpoint:(AWSPinpointSDKGetEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/endpoints/{endpoint-id}"
                  targetPrefix:@""
                 operationName:@"GetEndpoint"
                   outputClass:[AWSPinpointSDKGetEndpointResponse class]];
}

- (void)getEndpoint:(AWSPinpointSDKGetEndpointRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetEndpointResponse *response, NSError *error))completionHandler {
    [[self getEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetEndpointResponse *> * _Nonnull task) {
        AWSPinpointSDKGetEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetEventStreamResponse *> *)getEventStream:(AWSPinpointSDKGetEventStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/eventstream"
                  targetPrefix:@""
                 operationName:@"GetEventStream"
                   outputClass:[AWSPinpointSDKGetEventStreamResponse class]];
}

- (void)getEventStream:(AWSPinpointSDKGetEventStreamRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetEventStreamResponse *response, NSError *error))completionHandler {
    [[self getEventStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetEventStreamResponse *> * _Nonnull task) {
        AWSPinpointSDKGetEventStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetExportJobResponse *> *)getExportJob:(AWSPinpointSDKGetExportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/export/{job-id}"
                  targetPrefix:@""
                 operationName:@"GetExportJob"
                   outputClass:[AWSPinpointSDKGetExportJobResponse class]];
}

- (void)getExportJob:(AWSPinpointSDKGetExportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetExportJobResponse *response, NSError *error))completionHandler {
    [[self getExportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetExportJobResponse *> * _Nonnull task) {
        AWSPinpointSDKGetExportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetExportJobsResponse *> *)getExportJobs:(AWSPinpointSDKGetExportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/export"
                  targetPrefix:@""
                 operationName:@"GetExportJobs"
                   outputClass:[AWSPinpointSDKGetExportJobsResponse class]];
}

- (void)getExportJobs:(AWSPinpointSDKGetExportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetExportJobsResponse *response, NSError *error))completionHandler {
    [[self getExportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetExportJobsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetExportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetGcmChannelResponse *> *)getGcmChannel:(AWSPinpointSDKGetGcmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/gcm"
                  targetPrefix:@""
                 operationName:@"GetGcmChannel"
                   outputClass:[AWSPinpointSDKGetGcmChannelResponse class]];
}

- (void)getGcmChannel:(AWSPinpointSDKGetGcmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetGcmChannelResponse *response, NSError *error))completionHandler {
    [[self getGcmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetGcmChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetGcmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetImportJobResponse *> *)getImportJob:(AWSPinpointSDKGetImportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/import/{job-id}"
                  targetPrefix:@""
                 operationName:@"GetImportJob"
                   outputClass:[AWSPinpointSDKGetImportJobResponse class]];
}

- (void)getImportJob:(AWSPinpointSDKGetImportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetImportJobResponse *response, NSError *error))completionHandler {
    [[self getImportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetImportJobResponse *> * _Nonnull task) {
        AWSPinpointSDKGetImportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetImportJobsResponse *> *)getImportJobs:(AWSPinpointSDKGetImportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/import"
                  targetPrefix:@""
                 operationName:@"GetImportJobs"
                   outputClass:[AWSPinpointSDKGetImportJobsResponse class]];
}

- (void)getImportJobs:(AWSPinpointSDKGetImportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetImportJobsResponse *response, NSError *error))completionHandler {
    [[self getImportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetImportJobsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetImportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetSegmentResponse *> *)getSegment:(AWSPinpointSDKGetSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}"
                  targetPrefix:@""
                 operationName:@"GetSegment"
                   outputClass:[AWSPinpointSDKGetSegmentResponse class]];
}

- (void)getSegment:(AWSPinpointSDKGetSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetSegmentResponse *response, NSError *error))completionHandler {
    [[self getSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetSegmentResponse *> * _Nonnull task) {
        AWSPinpointSDKGetSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetSegmentExportJobsResponse *> *)getSegmentExportJobs:(AWSPinpointSDKGetSegmentExportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/jobs/export"
                  targetPrefix:@""
                 operationName:@"GetSegmentExportJobs"
                   outputClass:[AWSPinpointSDKGetSegmentExportJobsResponse class]];
}

- (void)getSegmentExportJobs:(AWSPinpointSDKGetSegmentExportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetSegmentExportJobsResponse *response, NSError *error))completionHandler {
    [[self getSegmentExportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetSegmentExportJobsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetSegmentExportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetSegmentImportJobsResponse *> *)getSegmentImportJobs:(AWSPinpointSDKGetSegmentImportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/jobs/import"
                  targetPrefix:@""
                 operationName:@"GetSegmentImportJobs"
                   outputClass:[AWSPinpointSDKGetSegmentImportJobsResponse class]];
}

- (void)getSegmentImportJobs:(AWSPinpointSDKGetSegmentImportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetSegmentImportJobsResponse *response, NSError *error))completionHandler {
    [[self getSegmentImportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetSegmentImportJobsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetSegmentImportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetSegmentVersionResponse *> *)getSegmentVersion:(AWSPinpointSDKGetSegmentVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"GetSegmentVersion"
                   outputClass:[AWSPinpointSDKGetSegmentVersionResponse class]];
}

- (void)getSegmentVersion:(AWSPinpointSDKGetSegmentVersionRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetSegmentVersionResponse *response, NSError *error))completionHandler {
    [[self getSegmentVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetSegmentVersionResponse *> * _Nonnull task) {
        AWSPinpointSDKGetSegmentVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetSegmentVersionsResponse *> *)getSegmentVersions:(AWSPinpointSDKGetSegmentVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/versions"
                  targetPrefix:@""
                 operationName:@"GetSegmentVersions"
                   outputClass:[AWSPinpointSDKGetSegmentVersionsResponse class]];
}

- (void)getSegmentVersions:(AWSPinpointSDKGetSegmentVersionsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetSegmentVersionsResponse *response, NSError *error))completionHandler {
    [[self getSegmentVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetSegmentVersionsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetSegmentVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetSegmentsResponse *> *)getSegments:(AWSPinpointSDKGetSegmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments"
                  targetPrefix:@""
                 operationName:@"GetSegments"
                   outputClass:[AWSPinpointSDKGetSegmentsResponse class]];
}

- (void)getSegments:(AWSPinpointSDKGetSegmentsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetSegmentsResponse *response, NSError *error))completionHandler {
    [[self getSegments:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetSegmentsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetSegmentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetSmsChannelResponse *> *)getSmsChannel:(AWSPinpointSDKGetSmsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/sms"
                  targetPrefix:@""
                 operationName:@"GetSmsChannel"
                   outputClass:[AWSPinpointSDKGetSmsChannelResponse class]];
}

- (void)getSmsChannel:(AWSPinpointSDKGetSmsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetSmsChannelResponse *response, NSError *error))completionHandler {
    [[self getSmsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetSmsChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetSmsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetUserEndpointsResponse *> *)getUserEndpoints:(AWSPinpointSDKGetUserEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/users/{user-id}"
                  targetPrefix:@""
                 operationName:@"GetUserEndpoints"
                   outputClass:[AWSPinpointSDKGetUserEndpointsResponse class]];
}

- (void)getUserEndpoints:(AWSPinpointSDKGetUserEndpointsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetUserEndpointsResponse *response, NSError *error))completionHandler {
    [[self getUserEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetUserEndpointsResponse *> * _Nonnull task) {
        AWSPinpointSDKGetUserEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKGetVoiceChannelResponse *> *)getVoiceChannel:(AWSPinpointSDKGetVoiceChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/voice"
                  targetPrefix:@""
                 operationName:@"GetVoiceChannel"
                   outputClass:[AWSPinpointSDKGetVoiceChannelResponse class]];
}

- (void)getVoiceChannel:(AWSPinpointSDKGetVoiceChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKGetVoiceChannelResponse *response, NSError *error))completionHandler {
    [[self getVoiceChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKGetVoiceChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKGetVoiceChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKPhoneNumberValidateResponse *> *)phoneNumberValidate:(AWSPinpointSDKPhoneNumberValidateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/phone/number/validate"
                  targetPrefix:@""
                 operationName:@"PhoneNumberValidate"
                   outputClass:[AWSPinpointSDKPhoneNumberValidateResponse class]];
}

- (void)phoneNumberValidate:(AWSPinpointSDKPhoneNumberValidateRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKPhoneNumberValidateResponse *response, NSError *error))completionHandler {
    [[self phoneNumberValidate:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKPhoneNumberValidateResponse *> * _Nonnull task) {
        AWSPinpointSDKPhoneNumberValidateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKPutEventStreamResponse *> *)putEventStream:(AWSPinpointSDKPutEventStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/eventstream"
                  targetPrefix:@""
                 operationName:@"PutEventStream"
                   outputClass:[AWSPinpointSDKPutEventStreamResponse class]];
}

- (void)putEventStream:(AWSPinpointSDKPutEventStreamRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKPutEventStreamResponse *response, NSError *error))completionHandler {
    [[self putEventStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKPutEventStreamResponse *> * _Nonnull task) {
        AWSPinpointSDKPutEventStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKPutEventsResponse *> *)putEvents:(AWSPinpointSDKPutEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/events"
                  targetPrefix:@""
                 operationName:@"PutEvents"
                   outputClass:[AWSPinpointSDKPutEventsResponse class]];
}

- (void)putEvents:(AWSPinpointSDKPutEventsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKPutEventsResponse *response, NSError *error))completionHandler {
    [[self putEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKPutEventsResponse *> * _Nonnull task) {
        AWSPinpointSDKPutEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKRemoveAttributesResponse *> *)removeAttributes:(AWSPinpointSDKRemoveAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/attributes/{attribute-type}"
                  targetPrefix:@""
                 operationName:@"RemoveAttributes"
                   outputClass:[AWSPinpointSDKRemoveAttributesResponse class]];
}

- (void)removeAttributes:(AWSPinpointSDKRemoveAttributesRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKRemoveAttributesResponse *response, NSError *error))completionHandler {
    [[self removeAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKRemoveAttributesResponse *> * _Nonnull task) {
        AWSPinpointSDKRemoveAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKSendMessagesResponse *> *)sendMessages:(AWSPinpointSDKSendMessagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/messages"
                  targetPrefix:@""
                 operationName:@"SendMessages"
                   outputClass:[AWSPinpointSDKSendMessagesResponse class]];
}

- (void)sendMessages:(AWSPinpointSDKSendMessagesRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKSendMessagesResponse *response, NSError *error))completionHandler {
    [[self sendMessages:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKSendMessagesResponse *> * _Nonnull task) {
        AWSPinpointSDKSendMessagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKSendUsersMessagesResponse *> *)sendUsersMessages:(AWSPinpointSDKSendUsersMessagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/users-messages"
                  targetPrefix:@""
                 operationName:@"SendUsersMessages"
                   outputClass:[AWSPinpointSDKSendUsersMessagesResponse class]];
}

- (void)sendUsersMessages:(AWSPinpointSDKSendUsersMessagesRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKSendUsersMessagesResponse *response, NSError *error))completionHandler {
    [[self sendUsersMessages:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKSendUsersMessagesResponse *> * _Nonnull task) {
        AWSPinpointSDKSendUsersMessagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateAdmChannelResponse *> *)updateAdmChannel:(AWSPinpointSDKUpdateAdmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/adm"
                  targetPrefix:@""
                 operationName:@"UpdateAdmChannel"
                   outputClass:[AWSPinpointSDKUpdateAdmChannelResponse class]];
}

- (void)updateAdmChannel:(AWSPinpointSDKUpdateAdmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateAdmChannelResponse *response, NSError *error))completionHandler {
    [[self updateAdmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateAdmChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateAdmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateApnsChannelResponse *> *)updateApnsChannel:(AWSPinpointSDKUpdateApnsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns"
                  targetPrefix:@""
                 operationName:@"UpdateApnsChannel"
                   outputClass:[AWSPinpointSDKUpdateApnsChannelResponse class]];
}

- (void)updateApnsChannel:(AWSPinpointSDKUpdateApnsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateApnsChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateApnsChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateApnsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateApnsSandboxChannelResponse *> *)updateApnsSandboxChannel:(AWSPinpointSDKUpdateApnsSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns_sandbox"
                  targetPrefix:@""
                 operationName:@"UpdateApnsSandboxChannel"
                   outputClass:[AWSPinpointSDKUpdateApnsSandboxChannelResponse class]];
}

- (void)updateApnsSandboxChannel:(AWSPinpointSDKUpdateApnsSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateApnsSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateApnsSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateApnsSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateApnsVoipChannelResponse *> *)updateApnsVoipChannel:(AWSPinpointSDKUpdateApnsVoipChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip"
                  targetPrefix:@""
                 operationName:@"UpdateApnsVoipChannel"
                   outputClass:[AWSPinpointSDKUpdateApnsVoipChannelResponse class]];
}

- (void)updateApnsVoipChannel:(AWSPinpointSDKUpdateApnsVoipChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateApnsVoipChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsVoipChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateApnsVoipChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateApnsVoipChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse *> *)updateApnsVoipSandboxChannel:(AWSPinpointSDKUpdateApnsVoipSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip_sandbox"
                  targetPrefix:@""
                 operationName:@"UpdateApnsVoipSandboxChannel"
                   outputClass:[AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse class]];
}

- (void)updateApnsVoipSandboxChannel:(AWSPinpointSDKUpdateApnsVoipSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsVoipSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateApplicationSettingsResponse *> *)updateApplicationSettings:(AWSPinpointSDKUpdateApplicationSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/settings"
                  targetPrefix:@""
                 operationName:@"UpdateApplicationSettings"
                   outputClass:[AWSPinpointSDKUpdateApplicationSettingsResponse class]];
}

- (void)updateApplicationSettings:(AWSPinpointSDKUpdateApplicationSettingsRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateApplicationSettingsResponse *response, NSError *error))completionHandler {
    [[self updateApplicationSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateApplicationSettingsResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateApplicationSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateBaiduChannelResponse *> *)updateBaiduChannel:(AWSPinpointSDKUpdateBaiduChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/baidu"
                  targetPrefix:@""
                 operationName:@"UpdateBaiduChannel"
                   outputClass:[AWSPinpointSDKUpdateBaiduChannelResponse class]];
}

- (void)updateBaiduChannel:(AWSPinpointSDKUpdateBaiduChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateBaiduChannelResponse *response, NSError *error))completionHandler {
    [[self updateBaiduChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateBaiduChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateBaiduChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateCampaignResponse *> *)updateCampaign:(AWSPinpointSDKUpdateCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}"
                  targetPrefix:@""
                 operationName:@"UpdateCampaign"
                   outputClass:[AWSPinpointSDKUpdateCampaignResponse class]];
}

- (void)updateCampaign:(AWSPinpointSDKUpdateCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateCampaignResponse *response, NSError *error))completionHandler {
    [[self updateCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateCampaignResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateEmailChannelResponse *> *)updateEmailChannel:(AWSPinpointSDKUpdateEmailChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/email"
                  targetPrefix:@""
                 operationName:@"UpdateEmailChannel"
                   outputClass:[AWSPinpointSDKUpdateEmailChannelResponse class]];
}

- (void)updateEmailChannel:(AWSPinpointSDKUpdateEmailChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateEmailChannelResponse *response, NSError *error))completionHandler {
    [[self updateEmailChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateEmailChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateEmailChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateEndpointResponse *> *)updateEndpoint:(AWSPinpointSDKUpdateEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/endpoints/{endpoint-id}"
                  targetPrefix:@""
                 operationName:@"UpdateEndpoint"
                   outputClass:[AWSPinpointSDKUpdateEndpointResponse class]];
}

- (void)updateEndpoint:(AWSPinpointSDKUpdateEndpointRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateEndpointResponse *response, NSError *error))completionHandler {
    [[self updateEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateEndpointResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateEndpointsBatchResponse *> *)updateEndpointsBatch:(AWSPinpointSDKUpdateEndpointsBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/endpoints"
                  targetPrefix:@""
                 operationName:@"UpdateEndpointsBatch"
                   outputClass:[AWSPinpointSDKUpdateEndpointsBatchResponse class]];
}

- (void)updateEndpointsBatch:(AWSPinpointSDKUpdateEndpointsBatchRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateEndpointsBatchResponse *response, NSError *error))completionHandler {
    [[self updateEndpointsBatch:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateEndpointsBatchResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateEndpointsBatchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateGcmChannelResponse *> *)updateGcmChannel:(AWSPinpointSDKUpdateGcmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/gcm"
                  targetPrefix:@""
                 operationName:@"UpdateGcmChannel"
                   outputClass:[AWSPinpointSDKUpdateGcmChannelResponse class]];
}

- (void)updateGcmChannel:(AWSPinpointSDKUpdateGcmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateGcmChannelResponse *response, NSError *error))completionHandler {
    [[self updateGcmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateGcmChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateGcmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateSegmentResponse *> *)updateSegment:(AWSPinpointSDKUpdateSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}"
                  targetPrefix:@""
                 operationName:@"UpdateSegment"
                   outputClass:[AWSPinpointSDKUpdateSegmentResponse class]];
}

- (void)updateSegment:(AWSPinpointSDKUpdateSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateSegmentResponse *response, NSError *error))completionHandler {
    [[self updateSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateSegmentResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateSmsChannelResponse *> *)updateSmsChannel:(AWSPinpointSDKUpdateSmsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/sms"
                  targetPrefix:@""
                 operationName:@"UpdateSmsChannel"
                   outputClass:[AWSPinpointSDKUpdateSmsChannelResponse class]];
}

- (void)updateSmsChannel:(AWSPinpointSDKUpdateSmsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateSmsChannelResponse *response, NSError *error))completionHandler {
    [[self updateSmsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateSmsChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateSmsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointSDKUpdateVoiceChannelResponse *> *)updateVoiceChannel:(AWSPinpointSDKUpdateVoiceChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/voice"
                  targetPrefix:@""
                 operationName:@"UpdateVoiceChannel"
                   outputClass:[AWSPinpointSDKUpdateVoiceChannelResponse class]];
}

- (void)updateVoiceChannel:(AWSPinpointSDKUpdateVoiceChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointSDKUpdateVoiceChannelResponse *response, NSError *error))completionHandler {
    [[self updateVoiceChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointSDKUpdateVoiceChannelResponse *> * _Nonnull task) {
        AWSPinpointSDKUpdateVoiceChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
