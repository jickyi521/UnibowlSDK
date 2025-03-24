//
//  SPUnibowlManager.m
//  UnibowlSDK
//
//  Created by Qian Yi on 2025/3/24.
//

#import "SPUnibowlManager.h"

@implementation SPUnibowlManager

+ (void)handleUniversalLink:(NSDictionary<NSString *, NSString *> *)parameters
                completion:(UNCompletionBlock)completion {
    NSURLComponents *components = [[NSURLComponents alloc] init];
    components.scheme = @"https";
    components.host = @"unibowl.com";
    
    // 添加查询参数
    NSMutableArray *queryItems = [NSMutableArray array];
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:value]];
    }];
    components.queryItems = queryItems;
    NSURL *url = components.URL;
    
    // 检查是否可以打开URL
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            if (completion) {
                completion(success, nil);
            }
        }];
    } else {
        // 如果无法打开URL，重定向到App Store
        [self redirectToAppStoreWithAppId:@"YOUR_APP_ID"];
        if (completion) {
            NSError *error = [NSError errorWithDomain:@"com.unibowl.error"
                                               code:SPErrorCodeAppNotInstalled
                                           userInfo:@{NSLocalizedDescriptionKey: @"App not installed"}];
            completion(NO, error);
        }
    }
}

+ (void)redirectToAppStoreWithAppId:(NSString *)appId {
    NSString *appStoreURL = [NSString stringWithFormat:@"https://apps.apple.com/app/id%@", appId];
    NSURL *url = [NSURL URLWithString:appStoreURL];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end
