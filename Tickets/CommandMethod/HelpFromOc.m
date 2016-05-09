//
//  helpFromOc.m
//  SuperGina
//
//  Created by ai966669 on 15/7/30.
//  Copyright (c) 2015年 Anve. All rights reserved.
//

#import "HelpFromOc.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <objc/runtime.h>
#import "sys/sysctl.h"
#import <CommonCrypto/CommonDigest.h>
//ALAuthorizationStatus author = [ALAssetsLibraryauthorizationStatus];
//if (author == kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied)        {           //无权限
//}
//typedef enum {
//    kCLAuthorizationStatusNotDetermined = 0,  // 用户尚未做出选择这个应用程序的问候
//    kCLAuthorizationStatusRestricted,        // 此应用程序没有被授权访问的照片数据。可能是家长控制权限
//    kCLAuthorizationStatusDenied,            // 用户已经明确否认了这一照片数据的应用程序访问
//    kCLAuthorizationStatusAuthorized         // 用户已经授权应用访问照片数据} CLAuthorizationStatus;
//}
@implementation HelpFromOc
static NSString *pathOfDoc;
+(NSString*)stringFromData:(NSData *)deviceToken{
    NSString *token = [[deviceToken description]
                       stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    NSString *deviceTokenInString = [token stringByReplacingOccurrencesOfString:@" " withString:@""] ;
    return  deviceTokenInString;
}
+(BOOL)isCameraAvalible{
    //判断相机是否能够使用
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(status == AVAuthorizationStatusAuthorized) {
        // authorized
        return true;
    } else if(status == AVAuthorizationStatusDenied){
        // denied
        return  false;
    } else if(status == AVAuthorizationStatusRestricted){
        // restricted
        return  false;
    } else if(status == AVAuthorizationStatusNotDetermined){
        // not determined
        //        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        //            if(granted){
        //                [self presentViewController:self.imagePickerController animated:YES completion:nil];
        //            } else {
        //                return;
        //            }
        //        }];
        return true;
    }else{
        return false;
    }
}
+(BOOL)isPhotoLibraryAvailble{
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    if(status == AVAuthorizationStatusAuthorized) {
        // authorized
        return true;
    } else if(status == AVAuthorizationStatusDenied){
        // denied
        return  false;
    } else if(status == AVAuthorizationStatusRestricted){
        // restricted
        return  false;
    } else if(status == AVAuthorizationStatusNotDetermined){
        
        return true;
    }else{
        return false;
    }
}

+ (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    UIViewController *realVc=topVC;
    if ([realVc isKindOfClass:[UINavigationController class]]){
        UINavigationController *nav= (UINavigationController *)realVc;
        realVc=nav.viewControllers.lastObject;
    }

    UITabBarController *tabbar=[[UITabBarController alloc] init];
    if ([realVc isKindOfClass:[UITabBarController class]]){
        tabbar=(UITabBarController*)realVc;
        return tabbar.viewControllers[tabbar.selectedIndex];
    }
    return realVc;
}
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }

    UIView *frontView = [[window subviews] objectAtIndex:0];


    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
        NSLog(@"%lu  %s",(unsigned long)[window subviews].count,object_getClassName(result));
    return result;
}

+(NSString *)md5:(NSString *)str {
    
    const char *cStr = [str UTF8String];//转换成utf-8
    
    unsigned char result[16];//开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    
    CC_MD5( cStr, strlen(cStr), result);
    
    /*
     
     extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     
     把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了result这个空间中
     
     */
    
    return [NSString stringWithFormat:
            
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            
            result[0], result[1], result[2], result[3],
            
            result[4], result[5], result[6], result[7],
            
            result[8], result[9], result[10], result[11],
            
            result[12], result[13], result[14], result[15]
            
            ];
    
    /*
     
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     
     NSLog("%02X", 0x888);  //888
     
     NSLog("%02X", 0x4); //04
     
     */
    
}
+ (NSString *)getUUID{
    
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    NSString *uuid=[HelpFromOc md5:[NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle] bundleIdentifier],idfv]];

    return uuid;
}
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    //整形转化为Int时显示Int64，但是内部数据还是Int类型（如下判断）需要测试超过int类型的数据是否还能通过这个方法进行转换
    
//    if aOrderId is Int64{
//        
//    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:nil error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}


+ (NSString *)objectToJsonString:(NSDictionary *)dictionary

{
    
    if ([NSJSONSerialization isValidJSONObject:dictionary])
        
    {
        
        NSError *error;
        
        //创超一个json从Data,NSJSONWritingPrettyPrinted指定的JSON数据产的空白，使输出更具可读性
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                            
                                                           options:NSJSONWritingPrettyPrinted
                            
                                                             error:&error];
        
        NSString *jsonString = [[NSString alloc]initWithData:jsonData
                                
                                                    encoding:NSUTF8StringEncoding];
        
        return jsonString;
        
    }
    
    
    
    return nil;
    
}
//
+(NSString *)getMsgPath:(NSString *)nameOfFile :(BOOL)isVoice{
    if(pathOfDoc==nil){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        pathOfDoc = [paths objectAtIndex:0];
    }
    NSString *dir;
    if(isVoice){
        dir = [NSString stringWithFormat:@"%@/msg/voice",pathOfDoc];
    }else {
        dir = [NSString stringWithFormat:@"%@/msg/image",pathOfDoc];
    }
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:dir isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        NSError *temp=[[NSError alloc] init];
        [fileManager createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&temp];
    }
    NSString *fullPath;
    if(isVoice){
        fullPath=[pathOfDoc stringByAppendingString:[NSString stringWithFormat:@"/msg/voice/%@",nameOfFile]];
    }else{
        fullPath=[pathOfDoc stringByAppendingString:[NSString stringWithFormat:@"/msg/image/%@",nameOfFile]];
    }
    return fullPath;
}
//+ (NSDictionary*)analysisNotificationInGetui:(NSString*)payloadId{
//    // [4]: 收到个推消息
//
//    NSData* payload = [GeTuiSdk retrivePayloadById:payloadId];
//
//    NSString *payloadMsg = nil;
//    if (payload) {
//        payloadMsg = [[NSString alloc] initWithBytes:payload.bytes
//                                              length:payload.length
//                                            encoding:NSUTF8StringEncoding];
//    }
//    NSData *jsonData = [payloadMsg dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *err;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                        options:NSJSONReadingMutableContainers
//                                                          error:&err];
//    return dic;
//}


//根据string（2011-11-11 11:11:11）返回两个时间之间相差的秒数
+ (double)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2
{
    NSArray *timeArray1=[dateString1 componentsSeparatedByString:@"."];
    dateString1=[timeArray1 objectAtIndex:0];
    
    
    NSArray *timeArray2=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray2 objectAtIndex:0];
    
    NSLog(@"%@.....%@",dateString1,dateString2);
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    NSTimeInterval cha=late2-late1;
    
    //    NSString *timeString=@"";
    //    NSString *house=@"";
    //    NSString *min=@"";
    //    NSString *sen=@"";
    //
    //    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
    //    //        min = [min substringToIndex:min.length-7];
    //    //    秒
    //    sen=[NSString stringWithFormat:@"%@", sen];
    //
    //
    //
    //    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    //    //        min = [min substringToIndex:min.length-7];
    //    //    分
    //    min=[NSString stringWithFormat:@"%@", min];
    //
    //
    //    //    小时
    //    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    //    //        house = [house substringToIndex:house.length-7];
    //    house=[NSString stringWithFormat:@"%@", house];
    //
    //
    //    timeString=[NSString stringWithFormat:@"%@:%@:%@",house,min,sen];
    
    
    return cha;
}
+ (void)redirectNSlogToDocumentFolder
{
    
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"log"];
    BOOL bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSAssert(bo,@"创建目录失败");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [[paths objectAtIndex:0] stringByAppendingString:@"/log/"];
    NSDate *now=[[NSDate alloc] init];
    NSDateFormatter *formtter1=[[NSDateFormatter alloc] init];
    [formtter1 setDateFormat:@"yyyy-MM-ddHH:mm:ss"];  //HH时24小时进制的   hh是12小时制度的
    NSString *nsdatenow=[formtter1 stringFromDate:now];
    NSString *fileName = [NSString stringWithFormat:@"%@.log",nsdatenow];// 注意不是NSData!
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    // 先删除已经存在的文件
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:logFilePath error:nil];
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
}
+ (NSDictionary*)getObjectData:(id)obj
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    for(int i = 0;i < propsCount; i++)
    {
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        
        id value = [obj valueForKey:propName];
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

+ (void)print:(id)obj
{
    NSLog(@"%@", [self getObjectData:obj]);
}


+ (NSData*)getJSON:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error
{
    return [NSJSONSerialization dataWithJSONObject:[self getObjectData:obj] options:options error:error];
}

+ (id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}
//通过颜色来生成一个纯色图片
+ (UIImage *)buttonImageFromColor:(UIColor *)color :(CGSize)imgSize{
    
    CGRect rect = CGRectMake(0, 0, imgSize.width, imgSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}
+(NSString*)getDeveicePlatform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    return platform;
}
+(NSObject*)getValueFromObject:(NSObject *)obj :(NSString*)key{
    @try {
//        NSObject *value=[obj valueForKey:key];
        return [obj valueForKey:key];
    } @catch (NSException *exception) {
        NSLog(@"main: Caught %@: %@", [exception name], [exception reason]);
        return  nil;
    }
}
//+(void)initCassyler{
//#if TARGET_IPHONE_SIMULATOR
//    NSString* absoluteFilePath = CASAbsoluteFilePath(@"stylesheet.cas");
//    [CASStyler defaultStyler].watchFilePath = absoluteFilePath;
//#endif
//}
@end
