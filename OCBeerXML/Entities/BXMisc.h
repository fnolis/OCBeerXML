#import "BXObject.h"

@interface BXMisc : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *use;
@property (nonatomic, assign) float time;
@property (nonatomic, assign) float amount;
@property (nonatomic, assign) BOOL amountIsWeight;
@property (nonatomic, retain) NSString *useFor;
@property (nonatomic, retain) NSString *notes;

+ (BXMisc*)miscFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
