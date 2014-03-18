#import "BXObject.h"
#import "BXMisc.h"

@interface BXMiscs : BXObject

+ (BXMiscs*)miscsFromDictionary:(NSDictionary*)data error:(NSError**)error;

- (NSUInteger)count;
- (BXMisc*)objectAtIndex:(NSUInteger)index;

@end
