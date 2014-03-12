#import "BXObject.h"

@interface BXEquipment : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, assign) float boilSize;
@property (nonatomic, assign) float batchSize;
@property (nonatomic, assign) float tunVolume;
@property (nonatomic, assign) float tunWeight;
@property (nonatomic, assign) float tunSpecificHeat;
@property (nonatomic, assign) float topUpWater;
@property (nonatomic, assign) float trubChillerLoss;
@property (nonatomic, assign) float evaporationRate;
@property (nonatomic, assign) float boilTime;
@property (nonatomic, assign) BOOL calculateBoilVolume;
@property (nonatomic, assign) float lauterDeadspace;
@property (nonatomic, assign) float topUpKettle;
@property (nonatomic, assign) float hopUtilization;
@property (nonatomic, retain) NSString *notes;

+ (BXEquipment*)equipmentFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
