#import "BXObject.h"

@interface BXFermentable : BXObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int version;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, assign) float amount;
@property (nonatomic, assign) float yield;
@property (nonatomic, assign) float color;
@property (nonatomic, assign) BOOL addAfterBoil;
@property (nonatomic, retain) NSString *origin;
@property (nonatomic, retain) NSString *supplier;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, assign) float coarseFineDifference;
@property (nonatomic, assign) float moisture;
@property (nonatomic, assign) float diastaticPower;
@property (nonatomic, assign) float protein;
@property (nonatomic, assign) float maxInBatch;
@property (nonatomic, assign) BOOL recommendMash;
@property (nonatomic, assign) float ibuGalPerLB;

/*!
 *	@brief	Returns an object created from the supplied data. If param error is not nil and
 *  an error occurs, error will be set to the last occured error and also the return value
 *	will be nil. \n If error is nil, the return value will be an object created from what
 *  ever data supplied, even if it was missing mandatory tags.
 *
 *	@param data		A dictionary with BeerXML tags as keys.
 *	@param error	If error is nil, missing data for mandatory XML tags will not be
 *					treated as an error.
 *
 *	@return		Returns a BXFermentable object created from the data supplied. If a
 *				mandatory tag was missing and param error was not nil, the value nil
 *				will be return instead of a created object.
 */
+ (BXFermentable*)fermentableFromDictionary:(NSDictionary*)data error:(NSError**)error;

@end
