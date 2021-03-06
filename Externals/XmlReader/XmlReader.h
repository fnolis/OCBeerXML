//
//  XmlReader.h
//  XmlReader
//
//  Created by Benoit C on 10/31/13.
//  Copyright (c) 2013 Benoit Caccinolo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMLReader : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *dictionaryStack;
    NSMutableString *textInProgress;
    __autoreleasing NSError **errorPointer;
}

+ (NSDictionary *)dictionaryForXMLData:(NSData *)data error:(NSError **)errorPointer;
+ (NSDictionary *)dictionaryForXMLString:(NSString *)string error:(NSError **)errorPointer;

@end
