#import "BXWater.h"

@implementation BXWater

+ (BXWater*)waterFromDictionary:(NSDictionary *)data error:(NSError**)error {
	return [[BXWater alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagWaterName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagWaterVersion required:YES error:error] intValue];
	self.amount = [[self objectInDictionary:data forTag:BXTagWaterAmount required:YES error:error] floatValue];
	self.calcium = [[self objectInDictionary:data forTag:BXTagWaterCalcium required:YES error:error] floatValue];
	self.bicarbonate = [[self objectInDictionary:data forTag:BXTagWaterBicarbonate required:YES error:error] floatValue];
	self.sulfate = [[self objectInDictionary:data forTag:BXTagWaterSulfate required:YES error:error] floatValue];
	self.chloride = [[self objectInDictionary:data forTag:BXTagWaterChloride required:YES error:error] floatValue];
	self.sodium = [[self objectInDictionary:data forTag:BXTagWaterSodium required:YES error:error] floatValue];
	self.magnesium = [[self objectInDictionary:data forTag:BXTagWaterMagnesium required:YES error:error] floatValue];
	self.ph = [[self objectInDictionary:data forTag:BXTagWaterPh required:NO error:error] floatValue];
	self.notes = [self objectInDictionary:data forTag:BXTagHopNotes required:NO error:error];
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
