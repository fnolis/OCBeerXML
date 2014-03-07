#import "BXObject.h"

@interface BXStyle : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *category;
@property (nonatomic, assign) int version;
@property (nonatomic, retain) NSString *categoryNumber;
@property (nonatomic, retain) NSString *letter;
@property (nonatomic, retain) NSString *guide;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, assign) float minimumOriginalGravity;
@property (nonatomic, assign) float maximumOriginalGravity;
@property (nonatomic, assign) float minimumFinalGravity;
@property (nonatomic, assign) float maximumFinalGravity;
@property (nonatomic, assign) float minimumIBU;
@property (nonatomic, assign) float maximumIBU;
@property (nonatomic, assign) float minimumColor;
@property (nonatomic, assign) float maximumColor;
@property (nonatomic, assign) float minimumCarbonation;
@property (nonatomic, assign) float maximumCarbonation;
@property (nonatomic, assign) float minimumABV;
@property (nonatomic, assign) float maximumABV;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *profile;
@property (nonatomic, retain) NSString *ingredients;
@property (nonatomic, retain) NSString *examples;

+ (BXStyle*)styleFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
