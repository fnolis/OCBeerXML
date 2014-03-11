#import "BXObject.h"
#import "BXFermentable.h"

@interface BXFermentables : BXObject

+ (BXFermentables*)fermentablesFromDictionary:(NSDictionary*)data error:(NSError**)error;

- (NSUInteger)count;
- (BXFermentable*)objectAtIndex:(NSUInteger)index;

@end
