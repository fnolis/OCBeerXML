#import "BXObject.h"

@interface BXYeast : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *form;
@property (nonatomic, assign) float amount;
@property (nonatomic, assign) BOOL amountIsWeight;
@property (nonatomic, retain) NSString *laboratory;
@property (nonatomic, retain) NSString *productId;
@property (nonatomic, assign) float minimumTemperature;
@property (nonatomic, assign) float maximumTemperature;
@property (nonatomic, retain) NSString *flocculation;
@property (nonatomic, assign) float attenuation;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *bestFor;
@property (nonatomic, assign) int timesCultured;
@property (nonatomic, assign) int maximumReuse;
@property (nonatomic, assign) BOOL addToSecondary;

+ (BXYeast*)yeastFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
