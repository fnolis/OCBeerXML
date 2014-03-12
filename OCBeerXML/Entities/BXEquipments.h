#import "BXEquipment.h"

@interface BXEquipments : NSObject

+ (BXEquipments*)equipmentsFromDictionary:(NSDictionary*)data error:(NSError**)error;

- (NSUInteger)count;
- (BXEquipment*)objectAtIndex:(NSUInteger)index;

@end
