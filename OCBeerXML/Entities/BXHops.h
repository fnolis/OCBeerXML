#import "BXObject.h"
#import "BXHop.h"

@interface BXHops : BXObject

+ (BXHops*)hopsFromDictionary:(NSDictionary*)data error:(NSError**)error;

- (NSUInteger)count;
- (BXHop*)objectAtIndex:(NSUInteger)index;

@end
