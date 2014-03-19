#import "BXXmlTags.h"

@interface BXObject : NSObject

- (id)objectInDictionary:(NSDictionary*)data forTag:(NSString*)tag required:(BOOL)required error:(NSError**)error;

@end
