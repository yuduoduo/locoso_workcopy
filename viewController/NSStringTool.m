//
//  NSStringTool.m
//  Locoso
//
//  Created by yongchang hu on 12-2-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSStringTool.h"

@implementation NSStringTool
+(NSString *)flattenHTML:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@" "];
        
    } // while //
    
    return html;
    
} 
+(NSString *)flattenHttp:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@" "];
        
    } // while //
    
    return html;
    
} 

+(NSString*)getFileNameFromUrl:(NSString*)url
{
    url = [url stringByReplacingOccurrencesOfString:@"http://www.locoso.net/uploads/s/" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"/logo_{0}.jpg" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"/" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"/" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    return url;
}
@end
