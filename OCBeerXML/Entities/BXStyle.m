#import "BXStyle.h"

@implementation BXStyle

+ (BXStyle*)styleFromDictionary:(NSDictionary*)data error:(NSError**)error {
	return [[BXStyle alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagStyleName required:YES error:error];
	self.category = [self objectInDictionary:data forTag:BXTagStyleCategory required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagHopVersion required:YES error:error] intValue];
	self.categoryNumber = [self objectInDictionary:data forTag:BXTagStyleCategoryNumber required:YES error:error];
	self.letter = [self objectInDictionary:data forTag:BXTagStyleLetter required:YES error:error];
	self.guide = [self objectInDictionary:data forTag:BXTagStyleGuide required:YES error:error];
	self.type = [self objectInDictionary:data forTag:BXTagStyleType required:YES error:error];
	self.minimumOriginalGravity = [[self objectInDictionary:data forTag:BXTagStyleOGMin required:YES error:error] floatValue];
	self.maximumOriginalGravity = [[self objectInDictionary:data forTag:BXTagStyleOGMax required:YES error:error] floatValue];
	self.minimumFinalGravity = [[self objectInDictionary:data forTag:BXTagStyleFGMin required:YES error:error] floatValue];
	self.maximumFinalGravity = [[self objectInDictionary:data forTag:BXTagStyleFGMax required:YES error:error] floatValue];
	self.minimumIBU = [[self objectInDictionary:data forTag:BXTagStyleIBUMin required:YES error:error] floatValue];
	self.maximumIBU = [[self objectInDictionary:data forTag:BXTagStyleIBUMax required:YES error:error] floatValue];
	self.minimumColor = [[self objectInDictionary:data forTag:BXTagStyleColorMin required:YES error:error] floatValue];
	self.maximumColor = [[self objectInDictionary:data forTag:BXTagStyleColorMax required:YES error:error] floatValue];
	self.minimumCarbonation = [[self objectInDictionary:data forTag:BXTagStyleCarbMin required:YES error:error] floatValue];
	self.maximumCarbonation = [[self objectInDictionary:data forTag:BXTagStyleCarbMax required:YES error:error] floatValue];
	self.minimumABV = [[self objectInDictionary:data forTag:BXTagStyleABVMin required:YES error:error] floatValue];
	self.maximumABV = [[self objectInDictionary:data forTag:BXTagStyleABVMax required:YES error:error] floatValue];
	self.notes = [self objectInDictionary:data forTag:BXTagStyleNotes required:NO error:error];
	self.profile = [self objectInDictionary:data forTag:BXTagStyleProfile required:NO error:error];
	self.ingredients = [self objectInDictionary:data forTag:BXTagStyleIngredients required:NO error:error];
	self.examples = [self objectInDictionary:data forTag:BXTagStyleExamples required:NO error:error];
	
	if( error && *error )
		self = nil;
	
	return self;
}


@end
