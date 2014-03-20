#import "BXObject.h"

@interface BXMashStep : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, assign) float infuseAmount;
@property (nonatomic, assign) float stepTemperature;
@property (nonatomic, assign) float stepTime;
@property (nonatomic, assign) float rampTime;
@property (nonatomic, assign) float endTemperature;

+ (BXMashStep*)mashStepFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
