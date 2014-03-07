#import "BXHop.h"
#import "BXXmlTags.h"

@implementation BXHop

+ (BXHop*)hopFromDictionary:(NSDictionary *)data error:(NSError**)error {
	return [[BXHop alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagHopName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagHopVersion required:YES error:error] intValue];
	self.alpha = [[self objectInDictionary:data forTag:BXTagHopAlpha required:YES error:error] floatValue];
	self.amount = [[self objectInDictionary:data forTag:BXTagHopAmount required:YES error:error] floatValue];
	self.use = [self objectInDictionary:data forTag:BXTagHopUse required:YES error:error]; //! TODO: Validate value
	self.time = [[self objectInDictionary:data forTag:BXTagHopTime required:YES error:error] intValue];
	self.notes = [self objectInDictionary:data forTag:BXTagHopNotes required:NO error:error];
	self.type = [self objectInDictionary:data forTag:BXTagHopType required:NO error:error]; //! TODO: Validate value
	self.form = [self objectInDictionary:data forTag:BXTagHopForm required:NO error:error]; //! TODO: Validate value
	self.beta = [[self objectInDictionary:data forTag:BXTagHopBeta required:NO error:error] floatValue];
	self.hsi = [[self objectInDictionary:data forTag:BXTagHopHSI required:NO error:error] floatValue];
	self.origin = [self objectInDictionary:data forTag:BXTagHopOrigin required:NO error:error];
	self.substitutes = [self objectInDictionary:data forTag:BXTagHopSubstitutes required:NO error:error];
	self.humulene = [[self objectInDictionary:data forTag:BXTagHopHumulene required:NO error:error] floatValue];
	self.caryophyllene = [[self objectInDictionary:data forTag:BXTagHopCaryophyllene required:NO error:error] floatValue];
	self.cohumulone = [[self objectInDictionary:data forTag:BXTagHopCohumulone required:NO error:error] floatValue];
	self.myrcene = [[self objectInDictionary:data forTag:BXTagHopMyrcene required:NO error:error] floatValue];
		
	if( *error )
		self = nil;
	
	return self;
}

@end
