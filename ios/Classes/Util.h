//
//  Util.h
//  flutter_openctm
//
//  Created by qiuguian on 2020/7/15.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject

+(SCNNode *)loadCtmWithUrl:(NSString *)ctmurl;

@end

NS_ASSUME_NONNULL_END
