#import "BXObject.h"
#import "BXYeast.h"

@interface BXYeasts : BXObject

+ (BXYeasts*)yeastsFromDictionary:(NSDictionary*)data error:(NSError**)error;

- (NSUInteger)count;
- (BXYeast*)objectAtIndex:(NSUInteger)index;

@end
