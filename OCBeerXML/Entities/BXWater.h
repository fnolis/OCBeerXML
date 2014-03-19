#import "BXObject.h"

@interface BXWater : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, assign) float amount;
@property (nonatomic, assign) float calcium;
@property (nonatomic, assign) float bicarbonate;
@property (nonatomic, assign) float sulfate;
@property (nonatomic, assign) float chloride;
@property (nonatomic, assign) float sodium;
@property (nonatomic, assign) float magnesium;
@property (nonatomic, assign) float ph;
@property (nonatomic, retain) NSString *notes;

+ (BXWater*)waterFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
