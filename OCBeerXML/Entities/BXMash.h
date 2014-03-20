#import "BXObject.h"

@interface BXMash : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, assign) float grainTemperature;
@property (nonatomic, retain) NSArray *mashSteps;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, assign) float tunTemperature;
@property (nonatomic, assign) float spargeTemperature;
@property (nonatomic, assign) float ph;
@property (nonatomic, assign) float tunWeight;
@property (nonatomic, assign) float tunSpecificHeat;
@property (nonatomic, assign) BOOL equipmentAdjust;

+ (BXMash*)mashFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
