#import "BXRecipe.h"
#import "OCBeerXml.h"
#import "BXHops.h"

@implementation BXRecipe

+ (BXRecipe*)recipeFromDictionary:(NSDictionary *)data error:(NSError**)error {
	return [[BXRecipe alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagRecipeName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagRecipeVersion required:YES error:error] intValue];
	self.type = [self objectInDictionary:data forTag:BXTagRecipeType required:YES error:error];
	self.style = [BXStyle styleFromDictionary:[data objectForKey:BXTagStyle] error:error];
	self.equipments = [BXEquipments equipmentsFromDictionary:[data objectForKey:BXTagEquipments] error:error];
	self.brewer = [self objectInDictionary:data forTag:BXTagRecipeBrewer required:YES error:error];
	self.assistantBrewer = [self objectInDictionary:data forTag:BXTagRecipeAssistantBrewer required:NO error:error];
	self.batchSize = [[self objectInDictionary:data forTag:BXTagRecipeBatchSize required:YES error:error] floatValue];
	self.boilSize = [[self objectInDictionary:data forTag:BXTagRecipeBoilSize required:YES error:error] floatValue];
	self.boilTime = [[self objectInDictionary:data forTag:BXTagRecipeBoilTime required:YES error:error] floatValue];
	self.efficiency = [[self objectInDictionary:data forTag:BXTagRecipeEfficiency required:NO error:error] floatValue]; //TODO: Conditional required.
	self.hops = [BXHops hopsFromDictionary:[data objectForKey:BXTagHops] error:error];
	self.fermentables = [BXFermentables fermentablesFromDictionary:[data objectForKey:BXTagFermentables] error:error];
	self.miscellaneous = [BXMiscs miscsFromDictionary:[data objectForKey:BXTagMiscs] error:error];
	// YEASTS
	self.waters = [BXWaters watersFromDictionary:[data objectForKey:BXTagWaters] error:error];
	// MASH
	self.notes = [self objectInDictionary:data forTag:BXTagRecipeNotes required:NO error:error];
	self.tasteNotes = [self objectInDictionary:data forTag:BXTagRecipeTasteNotes required:NO error:error];
	self.tasteRating = [[self objectInDictionary:data forTag:BXTagRecipeTasteRating required:NO error:error] floatValue];
	self.originalGravity = [[self objectInDictionary:data forTag:BXTagRecipeOriginalGravity required:NO error:error] floatValue];
	self.finalGravity = [[self objectInDictionary:data forTag:BXTagRecipeFinalGravity required:NO error:error] floatValue];
	self.fermentationStages = [[self objectInDictionary:data forTag:BXTagRecipeFermentationStages required:NO error:error] intValue];
	self.primaryAge = [[self objectInDictionary:data forTag:BXTagRecipePrimaryAge required:NO error:error] floatValue];
	self.primaryTemperature = [[self objectInDictionary:data forTag:BXTagRecipePrimaryTemperature required:NO error:error] floatValue];
	self.secondaryAge = [[self objectInDictionary:data forTag:BXTagRecipeSecondaryAge required:NO error:error] floatValue];
	self.secondaryTemperature = [[self objectInDictionary:data forTag:BXTagRecipeSecondaryTemperature required:NO error:error] floatValue];
	self.tertiaryAge = [[self objectInDictionary:data forTag:BXTagRecipeTertiaryAge required:NO error:error] floatValue];
	self.tertiaryTemperature = [[self objectInDictionary:data forTag:BXTagRecipeTertiaryTemperature required:NO error:error] floatValue];
	self.age = [[self objectInDictionary:data forTag:BXTagRecipeAge required:NO error:error] floatValue];
	self.ageTemperature = [[self objectInDictionary:data forTag:BXTagRecipeAgeTemperature required:NO error:error] floatValue];
	self.date = [self objectInDictionary:data forTag:BXTagRecipeDate required:NO error:error];
	self.carbonation = [[self objectInDictionary:data forTag:BXTagRecipeCarbonation required:NO error:error] floatValue];
	self.forcedCarbonation = [[self objectInDictionary:data forTag:BXTagRecipeForcedCarbonation required:NO error:error] boolValue];
	// PRIMING SUGAR EQUIV
	// CARBONATION_TEMP
	// PRIMING_SUGAR_EQUIV
	// KEG PRIMING FACTOR
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
