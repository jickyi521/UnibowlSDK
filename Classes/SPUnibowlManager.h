//
//  SPUnibowlManager.h
//  UnibowlSDK
//
//  Created by Qian Yi on 2025/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 定义错误码
typedef NS_ENUM(NSInteger, SPSDKErrorCode) {
    SPSDKErrorCodeUnknown = -1,
    SPSDKErrorCodeAppNotInstalled = -2,
    SPSDKErrorCodeInvalidURL = -3
};

// 定义回调block
typedef void(^UNCompletionBlock)(BOOL success, NSError * _Nullable error);

@interface SPUnibowlManager : NSObject

/// 解析 Universal Link 参数
/// @param parameters Universal Link parameters as dictionary
/// @param completion 参数回调
+ (void)handleUniversalLink:(NSDictionary<NSString *, NSString *> *)parameters
                completion:(nullable UNCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
