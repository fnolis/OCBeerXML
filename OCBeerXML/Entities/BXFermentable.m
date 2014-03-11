#import "BXFermentable.h"
#import "BXXmlTags.h"

@implementation BXFermentable

+ (BXFermentable*)fermentableFromDictionary:(NSDictionary*)data error:(NSError**)error {
	return [[BXFermentable alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagFermentableName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagFermentableVersion required:YES error:error] intValue];
	self.type = [self objectInDictionary:data forTag:BXTagFermentableType required:YES error:error];
	self.amount = [[self objectInDictionary:data forTag:BXTagFermentableAmount required:YES error:error] floatValue];
	self.yield = [[self objectInDictionary:data forTag:BXTagFermentableYield required:YES error:error] floatValue];
	self.color = [[self objectInDictionary:data forTag:BXTagFermentableColor required:YES error:error] floatValue];
	self.addAfterBoil = [[self objectInDictionary:data forTag:BXTagFermentableAddAfterBoil required:NO error:error] boolValue];
	self.origin = [self objectInDictionary:data forTag:BXTagFermentableOrigin required:NO error:error];
	self.supplier = [self objectInDictionary:data forTag:BXTagFermentableSupplier required:NO error:error];
	self.notes = [self objectInDictionary:data forTag:BXTagFermentableNotes required:NO error:error];
	self.coarseFineDifference = [[self objectInDictionary:data forTag:BXTagFermentableCoarseFineDiff required:NO error:error] floatValue];
	self.moisture = [[self objectInDictionary:data forTag:BXTagFermentableMoisture required:NO error:error] floatValue];
	self.diastaticPower = [[self objectInDictionary:data forTag:BXTagFermentableDiastaticPower required:NO error:error] floatValue];
	self.protein = [[self objectInDictionary:data forTag:BXTagFermentableProtein required:NO error:error] floatValue];
	self.maxInBatch = [[self objectInDictionary:data forTag:BXTagFermentableMaxInBatch required:NO error:error] floatValue];
	self.recommendMash = [[self objectInDictionary:data forTag:BXTagFermentableRecommendMash required:NO error:error] boolValue];
	self.ibuGalPerLB = [[self objectInDictionary:data forTag:BXTagFermentableIBUGalPerLB required:NO error:error] floatValue];
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
