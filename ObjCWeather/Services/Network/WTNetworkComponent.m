//
//  WTNetworkComponent.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>

#import "WTNetworkComponent.h"

@interface WTNetworkComponent ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation WTNetworkComponent

- (instancetype)init
{
    if ((self = [super init]))
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    }

    return self;
}

- (RACSignal *)requestWithURL:(NSURL *)url parameters:(NSDictionary *)parameters class:(Class)clazz
{
    AFHTTPSessionManager *manager = self.manager;

    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [manager GET:url.absoluteString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSError *error = nil;
            id model = [MTLJSONAdapter modelOfClass:clazz fromJSONDictionary:responseObject error:&error];
            if (error)
            {
                [subscriber sendError:error];
            }
            else
            {
                [subscriber sendNext:model];
                [subscriber sendCompleted];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];

        [task resume];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end
