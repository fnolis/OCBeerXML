#import "BXObject.h"
#import "BXWater.h"

@interface BXWaters : BXObject

+ (BXWaters*)watersFromDictionary:(NSDictionary*)data error:(NSError**)error;

- (NSUInteger)count;
- (BXWater*)objectAtIndex:(NSUInteger)index;

@end
