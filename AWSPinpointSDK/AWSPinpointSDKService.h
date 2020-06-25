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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSPinpointSDKModel.h"
#import "AWSPinpointSDKResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSPinpointSDK
FOUNDATION_EXPORT NSString *const AWSPinpointSDKSDKVersion;

/**
 Amazon Pinpoint
 */
@interface AWSPinpointSDK : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let PinpointSDK = AWSPinpointSDK.default()

 *Objective-C*

     AWSPinpointSDK *PinpointSDK = [AWSPinpointSDK defaultPinpointSDK];

 @return The default service client.
 */
+ (instancetype)defaultPinpointSDK;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPinpointSDK.register(with: configuration!, forKey: "USWest2PinpointSDK")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPinpointSDK registerPinpointSDKWithConfiguration:configuration forKey:@"USWest2PinpointSDK"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let PinpointSDK = AWSPinpointSDK(forKey: "USWest2PinpointSDK")

 *Objective-C*

     AWSPinpointSDK *PinpointSDK = [AWSPinpointSDK PinpointSDKForKey:@"USWest2PinpointSDK"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerPinpointSDKWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerPinpointSDKWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPinpointSDK.register(with: configuration!, forKey: "USWest2PinpointSDK")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPinpointSDK registerPinpointSDKWithConfiguration:configuration forKey:@"USWest2PinpointSDK"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let PinpointSDK = AWSPinpointSDK(forKey: "USWest2PinpointSDK")

 *Objective-C*

     AWSPinpointSDK *PinpointSDK = [AWSPinpointSDK PinpointSDKForKey:@"USWest2PinpointSDK"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)PinpointSDKForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removePinpointSDKForKey:(NSString *)key;

/**
 Creates or updates an app.
 
 @param request A container for the necessary parameters to execute the CreateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKCreateAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateAppRequest
 @see AWSPinpointSDKCreateAppResponse
 */
- (AWSTask<AWSPinpointSDKCreateAppResponse *> *)createApp:(AWSPinpointSDKCreateAppRequest *)request;

/**
 Creates or updates an app.
 
 @param request A container for the necessary parameters to execute the CreateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateAppRequest
 @see AWSPinpointSDKCreateAppResponse
 */
- (void)createApp:(AWSPinpointSDKCreateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKCreateAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates or updates a campaign.
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKCreateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateCampaignRequest
 @see AWSPinpointSDKCreateCampaignResponse
 */
- (AWSTask<AWSPinpointSDKCreateCampaignResponse *> *)createCampaign:(AWSPinpointSDKCreateCampaignRequest *)request;

/**
 Creates or updates a campaign.
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateCampaignRequest
 @see AWSPinpointSDKCreateCampaignResponse
 */
- (void)createCampaign:(AWSPinpointSDKCreateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKCreateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates an export job.
 
 @param request A container for the necessary parameters to execute the CreateExportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKCreateExportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateExportJobRequest
 @see AWSPinpointSDKCreateExportJobResponse
 */
- (AWSTask<AWSPinpointSDKCreateExportJobResponse *> *)createExportJob:(AWSPinpointSDKCreateExportJobRequest *)request;

/**
 Creates an export job.
 
 @param request A container for the necessary parameters to execute the CreateExportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateExportJobRequest
 @see AWSPinpointSDKCreateExportJobResponse
 */
- (void)createExportJob:(AWSPinpointSDKCreateExportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKCreateExportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates or updates an import job.
 
 @param request A container for the necessary parameters to execute the CreateImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKCreateImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateImportJobRequest
 @see AWSPinpointSDKCreateImportJobResponse
 */
- (AWSTask<AWSPinpointSDKCreateImportJobResponse *> *)createImportJob:(AWSPinpointSDKCreateImportJobRequest *)request;

/**
 Creates or updates an import job.
 
 @param request A container for the necessary parameters to execute the CreateImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateImportJobRequest
 @see AWSPinpointSDKCreateImportJobResponse
 */
- (void)createImportJob:(AWSPinpointSDKCreateImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKCreateImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to create or update a segment.
 
 @param request A container for the necessary parameters to execute the CreateSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKCreateSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateSegmentRequest
 @see AWSPinpointSDKCreateSegmentResponse
 */
- (AWSTask<AWSPinpointSDKCreateSegmentResponse *> *)createSegment:(AWSPinpointSDKCreateSegmentRequest *)request;

/**
 Used to create or update a segment.
 
 @param request A container for the necessary parameters to execute the CreateSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKCreateSegmentRequest
 @see AWSPinpointSDKCreateSegmentResponse
 */
- (void)createSegment:(AWSPinpointSDKCreateSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKCreateSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an ADM channel.
 
 @param request A container for the necessary parameters to execute the DeleteAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteAdmChannelRequest
 @see AWSPinpointSDKDeleteAdmChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteAdmChannelResponse *> *)deleteAdmChannel:(AWSPinpointSDKDeleteAdmChannelRequest *)request;

/**
 Delete an ADM channel.
 
 @param request A container for the necessary parameters to execute the DeleteAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteAdmChannelRequest
 @see AWSPinpointSDKDeleteAdmChannelResponse
 */
- (void)deleteAdmChannel:(AWSPinpointSDKDeleteAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsChannelRequest
 @see AWSPinpointSDKDeleteApnsChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteApnsChannelResponse *> *)deleteApnsChannel:(AWSPinpointSDKDeleteApnsChannelRequest *)request;

/**
 Deletes the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsChannelRequest
 @see AWSPinpointSDKDeleteApnsChannelResponse
 */
- (void)deleteApnsChannel:(AWSPinpointSDKDeleteApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the DeleteApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsSandboxChannelRequest
 @see AWSPinpointSDKDeleteApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteApnsSandboxChannelResponse *> *)deleteApnsSandboxChannel:(AWSPinpointSDKDeleteApnsSandboxChannelRequest *)request;

/**
 Delete an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the DeleteApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsSandboxChannelRequest
 @see AWSPinpointSDKDeleteApnsSandboxChannelResponse
 */
- (void)deleteApnsSandboxChannel:(AWSPinpointSDKDeleteApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsVoipChannelRequest
 @see AWSPinpointSDKDeleteApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteApnsVoipChannelResponse *> *)deleteApnsVoipChannel:(AWSPinpointSDKDeleteApnsVoipChannelRequest *)request;

/**
 Delete an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsVoipChannelRequest
 @see AWSPinpointSDKDeleteApnsVoipChannelResponse
 */
- (void)deleteApnsVoipChannel:(AWSPinpointSDKDeleteApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsVoipSandboxChannelRequest
 @see AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse *> *)deleteApnsVoipSandboxChannel:(AWSPinpointSDKDeleteApnsVoipSandboxChannelRequest *)request;

/**
 Delete an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteApnsVoipSandboxChannelRequest
 @see AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse
 */
- (void)deleteApnsVoipSandboxChannel:(AWSPinpointSDKDeleteApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an app.
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteAppRequest
 @see AWSPinpointSDKDeleteAppResponse
 */
- (AWSTask<AWSPinpointSDKDeleteAppResponse *> *)deleteApp:(AWSPinpointSDKDeleteAppRequest *)request;

/**
 Deletes an app.
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteAppRequest
 @see AWSPinpointSDKDeleteAppResponse
 */
- (void)deleteApp:(AWSPinpointSDKDeleteAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the DeleteBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteBaiduChannelRequest
 @see AWSPinpointSDKDeleteBaiduChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteBaiduChannelResponse *> *)deleteBaiduChannel:(AWSPinpointSDKDeleteBaiduChannelRequest *)request;

/**
 Delete a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the DeleteBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteBaiduChannelRequest
 @see AWSPinpointSDKDeleteBaiduChannelResponse
 */
- (void)deleteBaiduChannel:(AWSPinpointSDKDeleteBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a campaign.
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteCampaignRequest
 @see AWSPinpointSDKDeleteCampaignResponse
 */
- (AWSTask<AWSPinpointSDKDeleteCampaignResponse *> *)deleteCampaign:(AWSPinpointSDKDeleteCampaignRequest *)request;

/**
 Deletes a campaign.
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteCampaignRequest
 @see AWSPinpointSDKDeleteCampaignResponse
 */
- (void)deleteCampaign:(AWSPinpointSDKDeleteCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an email channel.
 
 @param request A container for the necessary parameters to execute the DeleteEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteEmailChannelRequest
 @see AWSPinpointSDKDeleteEmailChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteEmailChannelResponse *> *)deleteEmailChannel:(AWSPinpointSDKDeleteEmailChannelRequest *)request;

/**
 Delete an email channel.
 
 @param request A container for the necessary parameters to execute the DeleteEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteEmailChannelRequest
 @see AWSPinpointSDKDeleteEmailChannelResponse
 */
- (void)deleteEmailChannel:(AWSPinpointSDKDeleteEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an endpoint.
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteEndpointRequest
 @see AWSPinpointSDKDeleteEndpointResponse
 */
- (AWSTask<AWSPinpointSDKDeleteEndpointResponse *> *)deleteEndpoint:(AWSPinpointSDKDeleteEndpointRequest *)request;

/**
 Deletes an endpoint.
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteEndpointRequest
 @see AWSPinpointSDKDeleteEndpointResponse
 */
- (void)deleteEndpoint:(AWSPinpointSDKDeleteEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the event stream for an app.
 
 @param request A container for the necessary parameters to execute the DeleteEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteEventStreamRequest
 @see AWSPinpointSDKDeleteEventStreamResponse
 */
- (AWSTask<AWSPinpointSDKDeleteEventStreamResponse *> *)deleteEventStream:(AWSPinpointSDKDeleteEventStreamRequest *)request;

/**
 Deletes the event stream for an app.
 
 @param request A container for the necessary parameters to execute the DeleteEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteEventStreamRequest
 @see AWSPinpointSDKDeleteEventStreamResponse
 */
- (void)deleteEventStream:(AWSPinpointSDKDeleteEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteGcmChannelRequest
 @see AWSPinpointSDKDeleteGcmChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteGcmChannelResponse *> *)deleteGcmChannel:(AWSPinpointSDKDeleteGcmChannelRequest *)request;

/**
 Deletes the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteGcmChannelRequest
 @see AWSPinpointSDKDeleteGcmChannelResponse
 */
- (void)deleteGcmChannel:(AWSPinpointSDKDeleteGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a segment.
 
 @param request A container for the necessary parameters to execute the DeleteSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteSegmentRequest
 @see AWSPinpointSDKDeleteSegmentResponse
 */
- (AWSTask<AWSPinpointSDKDeleteSegmentResponse *> *)deleteSegment:(AWSPinpointSDKDeleteSegmentRequest *)request;

/**
 Deletes a segment.
 
 @param request A container for the necessary parameters to execute the DeleteSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteSegmentRequest
 @see AWSPinpointSDKDeleteSegmentResponse
 */
- (void)deleteSegment:(AWSPinpointSDKDeleteSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an SMS channel.
 
 @param request A container for the necessary parameters to execute the DeleteSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteSmsChannelRequest
 @see AWSPinpointSDKDeleteSmsChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteSmsChannelResponse *> *)deleteSmsChannel:(AWSPinpointSDKDeleteSmsChannelRequest *)request;

/**
 Delete an SMS channel.
 
 @param request A container for the necessary parameters to execute the DeleteSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteSmsChannelRequest
 @see AWSPinpointSDKDeleteSmsChannelResponse
 */
- (void)deleteSmsChannel:(AWSPinpointSDKDeleteSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the DeleteUserEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteUserEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteUserEndpointsRequest
 @see AWSPinpointSDKDeleteUserEndpointsResponse
 */
- (AWSTask<AWSPinpointSDKDeleteUserEndpointsResponse *> *)deleteUserEndpoints:(AWSPinpointSDKDeleteUserEndpointsRequest *)request;

/**
 Deletes endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the DeleteUserEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteUserEndpointsRequest
 @see AWSPinpointSDKDeleteUserEndpointsResponse
 */
- (void)deleteUserEndpoints:(AWSPinpointSDKDeleteUserEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteUserEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an Voice channel
 
 @param request A container for the necessary parameters to execute the DeleteVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKDeleteVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteVoiceChannelRequest
 @see AWSPinpointSDKDeleteVoiceChannelResponse
 */
- (AWSTask<AWSPinpointSDKDeleteVoiceChannelResponse *> *)deleteVoiceChannel:(AWSPinpointSDKDeleteVoiceChannelRequest *)request;

/**
 Delete an Voice channel
 
 @param request A container for the necessary parameters to execute the DeleteVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKDeleteVoiceChannelRequest
 @see AWSPinpointSDKDeleteVoiceChannelResponse
 */
- (void)deleteVoiceChannel:(AWSPinpointSDKDeleteVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKDeleteVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an ADM channel.
 
 @param request A container for the necessary parameters to execute the GetAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetAdmChannelRequest
 @see AWSPinpointSDKGetAdmChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetAdmChannelResponse *> *)getAdmChannel:(AWSPinpointSDKGetAdmChannelRequest *)request;

/**
 Get an ADM channel.
 
 @param request A container for the necessary parameters to execute the GetAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetAdmChannelRequest
 @see AWSPinpointSDKGetAdmChannelResponse
 */
- (void)getAdmChannel:(AWSPinpointSDKGetAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the GetApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsChannelRequest
 @see AWSPinpointSDKGetApnsChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetApnsChannelResponse *> *)getApnsChannel:(AWSPinpointSDKGetApnsChannelRequest *)request;

/**
 Returns information about the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the GetApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsChannelRequest
 @see AWSPinpointSDKGetApnsChannelResponse
 */
- (void)getApnsChannel:(AWSPinpointSDKGetApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the GetApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsSandboxChannelRequest
 @see AWSPinpointSDKGetApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetApnsSandboxChannelResponse *> *)getApnsSandboxChannel:(AWSPinpointSDKGetApnsSandboxChannelRequest *)request;

/**
 Get an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the GetApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsSandboxChannelRequest
 @see AWSPinpointSDKGetApnsSandboxChannelResponse
 */
- (void)getApnsSandboxChannel:(AWSPinpointSDKGetApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsVoipChannelRequest
 @see AWSPinpointSDKGetApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetApnsVoipChannelResponse *> *)getApnsVoipChannel:(AWSPinpointSDKGetApnsVoipChannelRequest *)request;

/**
 Get an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsVoipChannelRequest
 @see AWSPinpointSDKGetApnsVoipChannelResponse
 */
- (void)getApnsVoipChannel:(AWSPinpointSDKGetApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an APNS VoIPSandbox channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsVoipSandboxChannelRequest
 @see AWSPinpointSDKGetApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetApnsVoipSandboxChannelResponse *> *)getApnsVoipSandboxChannel:(AWSPinpointSDKGetApnsVoipSandboxChannelRequest *)request;

/**
 Get an APNS VoIPSandbox channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApnsVoipSandboxChannelRequest
 @see AWSPinpointSDKGetApnsVoipSandboxChannelResponse
 */
- (void)getApnsVoipSandboxChannel:(AWSPinpointSDKGetApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an app.
 
 @param request A container for the necessary parameters to execute the GetApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetAppRequest
 @see AWSPinpointSDKGetAppResponse
 */
- (AWSTask<AWSPinpointSDKGetAppResponse *> *)getApp:(AWSPinpointSDKGetAppRequest *)request;

/**
 Returns information about an app.
 
 @param request A container for the necessary parameters to execute the GetApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetAppRequest
 @see AWSPinpointSDKGetAppResponse
 */
- (void)getApp:(AWSPinpointSDKGetAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to request the settings for an app.
 
 @param request A container for the necessary parameters to execute the GetApplicationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetApplicationSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApplicationSettingsRequest
 @see AWSPinpointSDKGetApplicationSettingsResponse
 */
- (AWSTask<AWSPinpointSDKGetApplicationSettingsResponse *> *)getApplicationSettings:(AWSPinpointSDKGetApplicationSettingsRequest *)request;

/**
 Used to request the settings for an app.
 
 @param request A container for the necessary parameters to execute the GetApplicationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetApplicationSettingsRequest
 @see AWSPinpointSDKGetApplicationSettingsResponse
 */
- (void)getApplicationSettings:(AWSPinpointSDKGetApplicationSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetApplicationSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your apps.
 
 @param request A container for the necessary parameters to execute the GetApps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetAppsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetAppsRequest
 @see AWSPinpointSDKGetAppsResponse
 */
- (AWSTask<AWSPinpointSDKGetAppsResponse *> *)getApps:(AWSPinpointSDKGetAppsRequest *)request;

/**
 Returns information about your apps.
 
 @param request A container for the necessary parameters to execute the GetApps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetAppsRequest
 @see AWSPinpointSDKGetAppsResponse
 */
- (void)getApps:(AWSPinpointSDKGetAppsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetAppsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the GetBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetBaiduChannelRequest
 @see AWSPinpointSDKGetBaiduChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetBaiduChannelResponse *> *)getBaiduChannel:(AWSPinpointSDKGetBaiduChannelRequest *)request;

/**
 Get a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the GetBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetBaiduChannelRequest
 @see AWSPinpointSDKGetBaiduChannelResponse
 */
- (void)getBaiduChannel:(AWSPinpointSDKGetBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignRequest
 @see AWSPinpointSDKGetCampaignResponse
 */
- (AWSTask<AWSPinpointSDKGetCampaignResponse *> *)getCampaign:(AWSPinpointSDKGetCampaignRequest *)request;

/**
 Returns information about a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignRequest
 @see AWSPinpointSDKGetCampaignResponse
 */
- (void)getCampaign:(AWSPinpointSDKGetCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the activity performed by a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaignActivities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetCampaignActivitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignActivitiesRequest
 @see AWSPinpointSDKGetCampaignActivitiesResponse
 */
- (AWSTask<AWSPinpointSDKGetCampaignActivitiesResponse *> *)getCampaignActivities:(AWSPinpointSDKGetCampaignActivitiesRequest *)request;

/**
 Returns information about the activity performed by a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaignActivities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignActivitiesRequest
 @see AWSPinpointSDKGetCampaignActivitiesResponse
 */
- (void)getCampaignActivities:(AWSPinpointSDKGetCampaignActivitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetCampaignActivitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about a specific version of a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetCampaignVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignVersionRequest
 @see AWSPinpointSDKGetCampaignVersionResponse
 */
- (AWSTask<AWSPinpointSDKGetCampaignVersionResponse *> *)getCampaignVersion:(AWSPinpointSDKGetCampaignVersionRequest *)request;

/**
 Returns information about a specific version of a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignVersionRequest
 @see AWSPinpointSDKGetCampaignVersionResponse
 */
- (void)getCampaignVersion:(AWSPinpointSDKGetCampaignVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetCampaignVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your campaign versions.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetCampaignVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignVersionsRequest
 @see AWSPinpointSDKGetCampaignVersionsResponse
 */
- (AWSTask<AWSPinpointSDKGetCampaignVersionsResponse *> *)getCampaignVersions:(AWSPinpointSDKGetCampaignVersionsRequest *)request;

/**
 Returns information about your campaign versions.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignVersionsRequest
 @see AWSPinpointSDKGetCampaignVersionsResponse
 */
- (void)getCampaignVersions:(AWSPinpointSDKGetCampaignVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetCampaignVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your campaigns.
 
 @param request A container for the necessary parameters to execute the GetCampaigns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetCampaignsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignsRequest
 @see AWSPinpointSDKGetCampaignsResponse
 */
- (AWSTask<AWSPinpointSDKGetCampaignsResponse *> *)getCampaigns:(AWSPinpointSDKGetCampaignsRequest *)request;

/**
 Returns information about your campaigns.
 
 @param request A container for the necessary parameters to execute the GetCampaigns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetCampaignsRequest
 @see AWSPinpointSDKGetCampaignsResponse
 */
- (void)getCampaigns:(AWSPinpointSDKGetCampaignsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetCampaignsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get all channels.
 
 @param request A container for the necessary parameters to execute the GetChannels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetChannelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetChannelsRequest
 @see AWSPinpointSDKGetChannelsResponse
 */
- (AWSTask<AWSPinpointSDKGetChannelsResponse *> *)getChannels:(AWSPinpointSDKGetChannelsRequest *)request;

/**
 Get all channels.
 
 @param request A container for the necessary parameters to execute the GetChannels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetChannelsRequest
 @see AWSPinpointSDKGetChannelsResponse
 */
- (void)getChannels:(AWSPinpointSDKGetChannelsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetChannelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an email channel.
 
 @param request A container for the necessary parameters to execute the GetEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetEmailChannelRequest
 @see AWSPinpointSDKGetEmailChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetEmailChannelResponse *> *)getEmailChannel:(AWSPinpointSDKGetEmailChannelRequest *)request;

/**
 Get an email channel.
 
 @param request A container for the necessary parameters to execute the GetEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetEmailChannelRequest
 @see AWSPinpointSDKGetEmailChannelResponse
 */
- (void)getEmailChannel:(AWSPinpointSDKGetEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an endpoint.
 
 @param request A container for the necessary parameters to execute the GetEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetEndpointRequest
 @see AWSPinpointSDKGetEndpointResponse
 */
- (AWSTask<AWSPinpointSDKGetEndpointResponse *> *)getEndpoint:(AWSPinpointSDKGetEndpointRequest *)request;

/**
 Returns information about an endpoint.
 
 @param request A container for the necessary parameters to execute the GetEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetEndpointRequest
 @see AWSPinpointSDKGetEndpointResponse
 */
- (void)getEndpoint:(AWSPinpointSDKGetEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the event stream for an app.
 
 @param request A container for the necessary parameters to execute the GetEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetEventStreamRequest
 @see AWSPinpointSDKGetEventStreamResponse
 */
- (AWSTask<AWSPinpointSDKGetEventStreamResponse *> *)getEventStream:(AWSPinpointSDKGetEventStreamRequest *)request;

/**
 Returns the event stream for an app.
 
 @param request A container for the necessary parameters to execute the GetEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetEventStreamRequest
 @see AWSPinpointSDKGetEventStreamResponse
 */
- (void)getEventStream:(AWSPinpointSDKGetEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an export job.
 
 @param request A container for the necessary parameters to execute the GetExportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetExportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetExportJobRequest
 @see AWSPinpointSDKGetExportJobResponse
 */
- (AWSTask<AWSPinpointSDKGetExportJobResponse *> *)getExportJob:(AWSPinpointSDKGetExportJobRequest *)request;

/**
 Returns information about an export job.
 
 @param request A container for the necessary parameters to execute the GetExportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetExportJobRequest
 @see AWSPinpointSDKGetExportJobResponse
 */
- (void)getExportJob:(AWSPinpointSDKGetExportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetExportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your export jobs.
 
 @param request A container for the necessary parameters to execute the GetExportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetExportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetExportJobsRequest
 @see AWSPinpointSDKGetExportJobsResponse
 */
- (AWSTask<AWSPinpointSDKGetExportJobsResponse *> *)getExportJobs:(AWSPinpointSDKGetExportJobsRequest *)request;

/**
 Returns information about your export jobs.
 
 @param request A container for the necessary parameters to execute the GetExportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetExportJobsRequest
 @see AWSPinpointSDKGetExportJobsResponse
 */
- (void)getExportJobs:(AWSPinpointSDKGetExportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetExportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the GetGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetGcmChannelRequest
 @see AWSPinpointSDKGetGcmChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetGcmChannelResponse *> *)getGcmChannel:(AWSPinpointSDKGetGcmChannelRequest *)request;

/**
 Returns information about the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the GetGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetGcmChannelRequest
 @see AWSPinpointSDKGetGcmChannelResponse
 */
- (void)getGcmChannel:(AWSPinpointSDKGetGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an import job.
 
 @param request A container for the necessary parameters to execute the GetImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetImportJobRequest
 @see AWSPinpointSDKGetImportJobResponse
 */
- (AWSTask<AWSPinpointSDKGetImportJobResponse *> *)getImportJob:(AWSPinpointSDKGetImportJobRequest *)request;

/**
 Returns information about an import job.
 
 @param request A container for the necessary parameters to execute the GetImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetImportJobRequest
 @see AWSPinpointSDKGetImportJobResponse
 */
- (void)getImportJob:(AWSPinpointSDKGetImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your import jobs.
 
 @param request A container for the necessary parameters to execute the GetImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetImportJobsRequest
 @see AWSPinpointSDKGetImportJobsResponse
 */
- (AWSTask<AWSPinpointSDKGetImportJobsResponse *> *)getImportJobs:(AWSPinpointSDKGetImportJobsRequest *)request;

/**
 Returns information about your import jobs.
 
 @param request A container for the necessary parameters to execute the GetImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetImportJobsRequest
 @see AWSPinpointSDKGetImportJobsResponse
 */
- (void)getImportJobs:(AWSPinpointSDKGetImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about a segment.
 
 @param request A container for the necessary parameters to execute the GetSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentRequest
 @see AWSPinpointSDKGetSegmentResponse
 */
- (AWSTask<AWSPinpointSDKGetSegmentResponse *> *)getSegment:(AWSPinpointSDKGetSegmentRequest *)request;

/**
 Returns information about a segment.
 
 @param request A container for the necessary parameters to execute the GetSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentRequest
 @see AWSPinpointSDKGetSegmentResponse
 */
- (void)getSegment:(AWSPinpointSDKGetSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a list of export jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentExportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetSegmentExportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentExportJobsRequest
 @see AWSPinpointSDKGetSegmentExportJobsResponse
 */
- (AWSTask<AWSPinpointSDKGetSegmentExportJobsResponse *> *)getSegmentExportJobs:(AWSPinpointSDKGetSegmentExportJobsRequest *)request;

/**
 Returns a list of export jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentExportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentExportJobsRequest
 @see AWSPinpointSDKGetSegmentExportJobsResponse
 */
- (void)getSegmentExportJobs:(AWSPinpointSDKGetSegmentExportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetSegmentExportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a list of import jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetSegmentImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentImportJobsRequest
 @see AWSPinpointSDKGetSegmentImportJobsResponse
 */
- (AWSTask<AWSPinpointSDKGetSegmentImportJobsResponse *> *)getSegmentImportJobs:(AWSPinpointSDKGetSegmentImportJobsRequest *)request;

/**
 Returns a list of import jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentImportJobsRequest
 @see AWSPinpointSDKGetSegmentImportJobsResponse
 */
- (void)getSegmentImportJobs:(AWSPinpointSDKGetSegmentImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetSegmentImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about a segment version.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetSegmentVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentVersionRequest
 @see AWSPinpointSDKGetSegmentVersionResponse
 */
- (AWSTask<AWSPinpointSDKGetSegmentVersionResponse *> *)getSegmentVersion:(AWSPinpointSDKGetSegmentVersionRequest *)request;

/**
 Returns information about a segment version.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentVersionRequest
 @see AWSPinpointSDKGetSegmentVersionResponse
 */
- (void)getSegmentVersion:(AWSPinpointSDKGetSegmentVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetSegmentVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your segment versions.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetSegmentVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentVersionsRequest
 @see AWSPinpointSDKGetSegmentVersionsResponse
 */
- (AWSTask<AWSPinpointSDKGetSegmentVersionsResponse *> *)getSegmentVersions:(AWSPinpointSDKGetSegmentVersionsRequest *)request;

/**
 Returns information about your segment versions.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentVersionsRequest
 @see AWSPinpointSDKGetSegmentVersionsResponse
 */
- (void)getSegmentVersions:(AWSPinpointSDKGetSegmentVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetSegmentVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to get information about your segments.
 
 @param request A container for the necessary parameters to execute the GetSegments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetSegmentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentsRequest
 @see AWSPinpointSDKGetSegmentsResponse
 */
- (AWSTask<AWSPinpointSDKGetSegmentsResponse *> *)getSegments:(AWSPinpointSDKGetSegmentsRequest *)request;

/**
 Used to get information about your segments.
 
 @param request A container for the necessary parameters to execute the GetSegments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSegmentsRequest
 @see AWSPinpointSDKGetSegmentsResponse
 */
- (void)getSegments:(AWSPinpointSDKGetSegmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetSegmentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an SMS channel.
 
 @param request A container for the necessary parameters to execute the GetSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSmsChannelRequest
 @see AWSPinpointSDKGetSmsChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetSmsChannelResponse *> *)getSmsChannel:(AWSPinpointSDKGetSmsChannelRequest *)request;

/**
 Get an SMS channel.
 
 @param request A container for the necessary parameters to execute the GetSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetSmsChannelRequest
 @see AWSPinpointSDKGetSmsChannelResponse
 */
- (void)getSmsChannel:(AWSPinpointSDKGetSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the GetUserEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetUserEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetUserEndpointsRequest
 @see AWSPinpointSDKGetUserEndpointsResponse
 */
- (AWSTask<AWSPinpointSDKGetUserEndpointsResponse *> *)getUserEndpoints:(AWSPinpointSDKGetUserEndpointsRequest *)request;

/**
 Returns information about the endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the GetUserEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetUserEndpointsRequest
 @see AWSPinpointSDKGetUserEndpointsResponse
 */
- (void)getUserEndpoints:(AWSPinpointSDKGetUserEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetUserEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get a Voice Channel
 
 @param request A container for the necessary parameters to execute the GetVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKGetVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetVoiceChannelRequest
 @see AWSPinpointSDKGetVoiceChannelResponse
 */
- (AWSTask<AWSPinpointSDKGetVoiceChannelResponse *> *)getVoiceChannel:(AWSPinpointSDKGetVoiceChannelRequest *)request;

/**
 Get a Voice Channel
 
 @param request A container for the necessary parameters to execute the GetVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKGetVoiceChannelRequest
 @see AWSPinpointSDKGetVoiceChannelResponse
 */
- (void)getVoiceChannel:(AWSPinpointSDKGetVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKGetVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the specified phone number.
 
 @param request A container for the necessary parameters to execute the PhoneNumberValidate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKPhoneNumberValidateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKPhoneNumberValidateRequest
 @see AWSPinpointSDKPhoneNumberValidateResponse
 */
- (AWSTask<AWSPinpointSDKPhoneNumberValidateResponse *> *)phoneNumberValidate:(AWSPinpointSDKPhoneNumberValidateRequest *)request;

/**
 Returns information about the specified phone number.
 
 @param request A container for the necessary parameters to execute the PhoneNumberValidate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKPhoneNumberValidateRequest
 @see AWSPinpointSDKPhoneNumberValidateResponse
 */
- (void)phoneNumberValidate:(AWSPinpointSDKPhoneNumberValidateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKPhoneNumberValidateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to create or update the event stream for an app.
 
 @param request A container for the necessary parameters to execute the PutEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKPutEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKPutEventStreamRequest
 @see AWSPinpointSDKPutEventStreamResponse
 */
- (AWSTask<AWSPinpointSDKPutEventStreamResponse *> *)putEventStream:(AWSPinpointSDKPutEventStreamRequest *)request;

/**
 Use to create or update the event stream for an app.
 
 @param request A container for the necessary parameters to execute the PutEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKPutEventStreamRequest
 @see AWSPinpointSDKPutEventStreamResponse
 */
- (void)putEventStream:(AWSPinpointSDKPutEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKPutEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to record events for endpoints. This method creates events and creates or updates the endpoints that those events are associated with.
 
 @param request A container for the necessary parameters to execute the PutEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKPutEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKPutEventsRequest
 @see AWSPinpointSDKPutEventsResponse
 */
- (AWSTask<AWSPinpointSDKPutEventsResponse *> *)putEvents:(AWSPinpointSDKPutEventsRequest *)request;

/**
 Use to record events for endpoints. This method creates events and creates or updates the endpoints that those events are associated with.
 
 @param request A container for the necessary parameters to execute the PutEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKPutEventsRequest
 @see AWSPinpointSDKPutEventsResponse
 */
- (void)putEvents:(AWSPinpointSDKPutEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKPutEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to remove the attributes for an app
 
 @param request A container for the necessary parameters to execute the RemoveAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKRemoveAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKRemoveAttributesRequest
 @see AWSPinpointSDKRemoveAttributesResponse
 */
- (AWSTask<AWSPinpointSDKRemoveAttributesResponse *> *)removeAttributes:(AWSPinpointSDKRemoveAttributesRequest *)request;

/**
 Used to remove the attributes for an app
 
 @param request A container for the necessary parameters to execute the RemoveAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKRemoveAttributesRequest
 @see AWSPinpointSDKRemoveAttributesResponse
 */
- (void)removeAttributes:(AWSPinpointSDKRemoveAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKRemoveAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to send a direct message.
 
 @param request A container for the necessary parameters to execute the SendMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKSendMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKSendMessagesRequest
 @see AWSPinpointSDKSendMessagesResponse
 */
- (AWSTask<AWSPinpointSDKSendMessagesResponse *> *)sendMessages:(AWSPinpointSDKSendMessagesRequest *)request;

/**
 Used to send a direct message.
 
 @param request A container for the necessary parameters to execute the SendMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKSendMessagesRequest
 @see AWSPinpointSDKSendMessagesResponse
 */
- (void)sendMessages:(AWSPinpointSDKSendMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKSendMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to send a message to a list of users.
 
 @param request A container for the necessary parameters to execute the SendUsersMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKSendUsersMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKSendUsersMessagesRequest
 @see AWSPinpointSDKSendUsersMessagesResponse
 */
- (AWSTask<AWSPinpointSDKSendUsersMessagesResponse *> *)sendUsersMessages:(AWSPinpointSDKSendUsersMessagesRequest *)request;

/**
 Used to send a message to a list of users.
 
 @param request A container for the necessary parameters to execute the SendUsersMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKSendUsersMessagesRequest
 @see AWSPinpointSDKSendUsersMessagesResponse
 */
- (void)sendUsersMessages:(AWSPinpointSDKSendUsersMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKSendUsersMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an ADM channel.
 
 @param request A container for the necessary parameters to execute the UpdateAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateAdmChannelRequest
 @see AWSPinpointSDKUpdateAdmChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateAdmChannelResponse *> *)updateAdmChannel:(AWSPinpointSDKUpdateAdmChannelRequest *)request;

/**
 Update an ADM channel.
 
 @param request A container for the necessary parameters to execute the UpdateAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateAdmChannelRequest
 @see AWSPinpointSDKUpdateAdmChannelResponse
 */
- (void)updateAdmChannel:(AWSPinpointSDKUpdateAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsChannelRequest
 @see AWSPinpointSDKUpdateApnsChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateApnsChannelResponse *> *)updateApnsChannel:(AWSPinpointSDKUpdateApnsChannelRequest *)request;

/**
 Use to update the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsChannelRequest
 @see AWSPinpointSDKUpdateApnsChannelResponse
 */
- (void)updateApnsChannel:(AWSPinpointSDKUpdateApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the UpdateApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsSandboxChannelRequest
 @see AWSPinpointSDKUpdateApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateApnsSandboxChannelResponse *> *)updateApnsSandboxChannel:(AWSPinpointSDKUpdateApnsSandboxChannelRequest *)request;

/**
 Update an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the UpdateApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsSandboxChannelRequest
 @see AWSPinpointSDKUpdateApnsSandboxChannelResponse
 */
- (void)updateApnsSandboxChannel:(AWSPinpointSDKUpdateApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsVoipChannelRequest
 @see AWSPinpointSDKUpdateApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateApnsVoipChannelResponse *> *)updateApnsVoipChannel:(AWSPinpointSDKUpdateApnsVoipChannelRequest *)request;

/**
 Update an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsVoipChannelRequest
 @see AWSPinpointSDKUpdateApnsVoipChannelResponse
 */
- (void)updateApnsVoipChannel:(AWSPinpointSDKUpdateApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsVoipSandboxChannelRequest
 @see AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse *> *)updateApnsVoipSandboxChannel:(AWSPinpointSDKUpdateApnsVoipSandboxChannelRequest *)request;

/**
 Update an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApnsVoipSandboxChannelRequest
 @see AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse
 */
- (void)updateApnsVoipSandboxChannel:(AWSPinpointSDKUpdateApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to update the settings for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApplicationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateApplicationSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApplicationSettingsRequest
 @see AWSPinpointSDKUpdateApplicationSettingsResponse
 */
- (AWSTask<AWSPinpointSDKUpdateApplicationSettingsResponse *> *)updateApplicationSettings:(AWSPinpointSDKUpdateApplicationSettingsRequest *)request;

/**
 Used to update the settings for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApplicationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateApplicationSettingsRequest
 @see AWSPinpointSDKUpdateApplicationSettingsResponse
 */
- (void)updateApplicationSettings:(AWSPinpointSDKUpdateApplicationSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateApplicationSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the UpdateBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateBaiduChannelRequest
 @see AWSPinpointSDKUpdateBaiduChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateBaiduChannelResponse *> *)updateBaiduChannel:(AWSPinpointSDKUpdateBaiduChannelRequest *)request;

/**
 Update a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the UpdateBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateBaiduChannelRequest
 @see AWSPinpointSDKUpdateBaiduChannelResponse
 */
- (void)updateBaiduChannel:(AWSPinpointSDKUpdateBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update a campaign.
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateCampaignRequest
 @see AWSPinpointSDKUpdateCampaignResponse
 */
- (AWSTask<AWSPinpointSDKUpdateCampaignResponse *> *)updateCampaign:(AWSPinpointSDKUpdateCampaignRequest *)request;

/**
 Use to update a campaign.
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateCampaignRequest
 @see AWSPinpointSDKUpdateCampaignResponse
 */
- (void)updateCampaign:(AWSPinpointSDKUpdateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an email channel.
 
 @param request A container for the necessary parameters to execute the UpdateEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateEmailChannelRequest
 @see AWSPinpointSDKUpdateEmailChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateEmailChannelResponse *> *)updateEmailChannel:(AWSPinpointSDKUpdateEmailChannelRequest *)request;

/**
 Update an email channel.
 
 @param request A container for the necessary parameters to execute the UpdateEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateEmailChannelRequest
 @see AWSPinpointSDKUpdateEmailChannelResponse
 */
- (void)updateEmailChannel:(AWSPinpointSDKUpdateEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates or updates an endpoint.
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateEndpointRequest
 @see AWSPinpointSDKUpdateEndpointResponse
 */
- (AWSTask<AWSPinpointSDKUpdateEndpointResponse *> *)updateEndpoint:(AWSPinpointSDKUpdateEndpointRequest *)request;

/**
 Creates or updates an endpoint.
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateEndpointRequest
 @see AWSPinpointSDKUpdateEndpointResponse
 */
- (void)updateEndpoint:(AWSPinpointSDKUpdateEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update a batch of endpoints.
 
 @param request A container for the necessary parameters to execute the UpdateEndpointsBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateEndpointsBatchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateEndpointsBatchRequest
 @see AWSPinpointSDKUpdateEndpointsBatchResponse
 */
- (AWSTask<AWSPinpointSDKUpdateEndpointsBatchResponse *> *)updateEndpointsBatch:(AWSPinpointSDKUpdateEndpointsBatchRequest *)request;

/**
 Use to update a batch of endpoints.
 
 @param request A container for the necessary parameters to execute the UpdateEndpointsBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateEndpointsBatchRequest
 @see AWSPinpointSDKUpdateEndpointsBatchResponse
 */
- (void)updateEndpointsBatch:(AWSPinpointSDKUpdateEndpointsBatchRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateEndpointsBatchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateGcmChannelRequest
 @see AWSPinpointSDKUpdateGcmChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateGcmChannelResponse *> *)updateGcmChannel:(AWSPinpointSDKUpdateGcmChannelRequest *)request;

/**
 Use to update the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateGcmChannelRequest
 @see AWSPinpointSDKUpdateGcmChannelResponse
 */
- (void)updateGcmChannel:(AWSPinpointSDKUpdateGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to update a segment.
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateSegmentRequest
 @see AWSPinpointSDKUpdateSegmentResponse
 */
- (AWSTask<AWSPinpointSDKUpdateSegmentResponse *> *)updateSegment:(AWSPinpointSDKUpdateSegmentRequest *)request;

/**
 Used to update a segment.
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateSegmentRequest
 @see AWSPinpointSDKUpdateSegmentResponse
 */
- (void)updateSegment:(AWSPinpointSDKUpdateSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an SMS channel.
 
 @param request A container for the necessary parameters to execute the UpdateSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateSmsChannelRequest
 @see AWSPinpointSDKUpdateSmsChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateSmsChannelResponse *> *)updateSmsChannel:(AWSPinpointSDKUpdateSmsChannelRequest *)request;

/**
 Update an SMS channel.
 
 @param request A container for the necessary parameters to execute the UpdateSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateSmsChannelRequest
 @see AWSPinpointSDKUpdateSmsChannelResponse
 */
- (void)updateSmsChannel:(AWSPinpointSDKUpdateSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an Voice channel
 
 @param request A container for the necessary parameters to execute the UpdateVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointSDKUpdateVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateVoiceChannelRequest
 @see AWSPinpointSDKUpdateVoiceChannelResponse
 */
- (AWSTask<AWSPinpointSDKUpdateVoiceChannelResponse *> *)updateVoiceChannel:(AWSPinpointSDKUpdateVoiceChannelRequest *)request;

/**
 Update an Voice channel
 
 @param request A container for the necessary parameters to execute the UpdateVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointSDKErrorDomain` domain and the following error code: `AWSPinpointSDKErrorBadRequest`, `AWSPinpointSDKErrorInternalServerError`, `AWSPinpointSDKErrorForbidden`, `AWSPinpointSDKErrorNotFound`, `AWSPinpointSDKErrorMethodNotAllowed`, `AWSPinpointSDKErrorTooManyRequests`.
 
 @see AWSPinpointSDKUpdateVoiceChannelRequest
 @see AWSPinpointSDKUpdateVoiceChannelResponse
 */
- (void)updateVoiceChannel:(AWSPinpointSDKUpdateVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointSDKUpdateVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
