#import "BXMash.h"
#import "BXMashStep.h"

@implementation BXMash

+ (BXMash*)mashFromDictionary:(NSDictionary *)data error:(NSError**)error {
	return [[BXMash alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagMashName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagMashVersion required:YES error:error] intValue];
	self.grainTemperature = [[self objectInDictionary:data forTag:BXTagMashGrainTemp required:YES error:error] floatValue];
	
	if( [[[data objectForKey:BXTagMashMashSteps] objectForKey:BXTagMashStep] isKindOfClass:[NSDictionary class]] ) {
		BXMashStep *step = [BXMashStep mashStepFromDictionary:[[data objectForKey:BXTagMashMashSteps] objectForKey:BXTagMashStep] error:error];
		if( step )
			self.mashSteps = [NSArray arrayWithObject:step];
	} else if ( [[[data objectForKey:BXTagMashMashSteps] objectForKey:BXTagMashStep] isKindOfClass:[NSArray class]] ) {
		NSMutableArray *array = [NSMutableArray array];
		
		for (NSDictionary *d in [[data objectForKey:BXTagMashMashSteps] objectForKey:BXTagMashStep] ) {
			BXMashStep *step = [BXMashStep mashStepFromDictionary:d error:error];

			if( step )
			   [array addObject:step];
		}
		
		if( array.count )
			self.mashSteps = [NSArray arrayWithArray:array];
	}
	
	self.notes = [self objectInDictionary:data forTag:BXTagMashNotes required:NO error:error];
	self.tunTemperature = [[self objectInDictionary:data forTag:BXTagMashTunTemp required:NO error:error] floatValue];
	self.spargeTemperature = [[self objectInDictionary:data forTag:BXTagMashSpargeTemp required:NO error:error] floatValue];
	self.ph = [[self objectInDictionary:data forTag:BXTagMashPH required:NO error:error] floatValue];
	self.tunWeight = [[self objectInDictionary:data forTag:BXTagMashTunWeight required:NO error:error] floatValue];
	self.tunSpecificHeat = [[self objectInDictionary:data forTag:BXTagMashTunSpecificHeat required:NO error:error] floatValue];
	self.equipmentAdjust = [[self objectInDictionary:data forTag:BXTagMashEquipmentAdjust required:NO error:error] boolValue];
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
