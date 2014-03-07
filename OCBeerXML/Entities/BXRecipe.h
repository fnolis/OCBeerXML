#import "BXObject.h"
#import "BXStyle.h"
#import "BXHops.h"

@interface BXRecipe : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) BXStyle *style;
//EQUIPMENT - optional
@property (nonatomic, retain) NSString *brewer;
@property (nonatomic, retain) NSString *assistantBrewer;
@property (nonatomic, assign) float batchSize;
@property (nonatomic, assign) float boilSize;
@property (nonatomic, assign) float boilTime;
//EFFICIENCY
@property (nonatomic, retain) BXHops *hops;
//...
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *tasteNotes;
@property (nonatomic, assign) float tasteRating;
//...
@property (nonatomic, assign) int fermentationStages;
@property (nonatomic, assign) float primaryAge;
@property (nonatomic, assign) float primaryTemperature;
@property (nonatomic, assign) float secondaryAge;
@property (nonatomic, assign) float secondaryTemperature;
@property (nonatomic, assign) float tertiaryAge;
@property (nonatomic, assign) float tertiaryTemperature;
@property (nonatomic, assign) float age;
@property (nonatomic, assign) float ageTemperature;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, assign) float carbonation;
@property (nonatomic, assign) BOOL forcedCarbonation;
//...


+ (BXRecipe*)recipeFromDictionary:(NSDictionary *)data error:(NSError**)error;

@end
