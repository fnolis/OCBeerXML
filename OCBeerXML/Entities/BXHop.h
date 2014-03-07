#import "BXObject.h"

@interface BXHop : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, assign) float alpha;
@property (nonatomic, assign) float amount;
@property (nonatomic, retain) NSString *use;
@property (nonatomic, assign) float time;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *form;
@property (nonatomic, assign) float beta;
@property (nonatomic, assign) float hsi;
@property (nonatomic, retain) NSString *origin;
@property (nonatomic, retain) NSString *substitutes;
@property (nonatomic, assign) float humulene;
@property (nonatomic, assign) float caryophyllene;
@property (nonatomic, assign) float cohumulone;
@property (nonatomic, assign) float myrcene;

+ (BXHop*)hopFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
