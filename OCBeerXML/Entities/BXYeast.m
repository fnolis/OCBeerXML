#import "BXYeast.h"

@implementation BXYeast

+ (BXYeast*)yeastFromDictionary:(NSDictionary *)data error:(NSError**)error {
	return [[BXYeast alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagYeastName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagYeastVersion required:YES error:error] intValue];
	self.type = [self objectInDictionary:data forTag:BXTagYeastType required:YES error:error];
	self.form = [self objectInDictionary:data forTag:BXTagYeastForm required:YES error:error];
	self.amount = [[self objectInDictionary:data forTag:BXTagYeastAmount required:YES error:error] floatValue];
	self.amountIsWeight = [[self objectInDictionary:data forTag:BXTagYeastAmountIsWeight required:NO error:error] boolValue];
	self.laboratory = [self objectInDictionary:data forTag:BXTagYeastLaboratory required:NO error:error];
	self.productId = [self objectInDictionary:data forTag:BXTagYeastProductId required:NO error:error];
	self.minimumTemperature = [[self objectInDictionary:data forTag:BXTagYeastMinTemperature required:NO error:error] floatValue];
	self.maximumTemperature = [[self objectInDictionary:data forTag:BXTagYeastMaxTemperature required:NO error:error] floatValue];
	self.flocculation = [self objectInDictionary:data forTag:BXTagYeastFlocculation required:NO error:error];
	self.attenuation = [[self objectInDictionary:data forTag:BXTagYeastAttenuation required:NO error:error] floatValue];
	self.notes = [self objectInDictionary:data forTag:BXTagHopNotes required:NO error:error];
	self.bestFor = [self objectInDictionary:data forTag:BXTagYeastBestFor required:NO error:error];
	self.timesCultured = [[self objectInDictionary:data forTag:BXTagYeastTimeCultured required:NO error:error] intValue];
	self.maximumReuse = [[self objectInDictionary:data forTag:BXTagYeastMaxReuse required:NO error:error] intValue];
	self.addToSecondary = [[self objectInDictionary:data forTag:BXTagYeastAddToSecondary required:NO error:error] boolValue];
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
