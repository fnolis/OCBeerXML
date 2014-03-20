#import "BXMashStep.h"

@implementation BXMashStep

+ (BXMashStep*)mashStepFromDictionary:(NSDictionary *)data error:(NSError**)error {
	return [[BXMashStep alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagMashStepName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagMashStepVersion required:YES error:error] intValue];
	self.type = [self objectInDictionary:data forTag:BXTagMashStepType required:YES error:error];
	self.infuseAmount = [[self objectInDictionary:data forTag:BXTagMashStepInfuseAmount required:NO error:error] floatValue]; // Conditional
	self.stepTemperature = [[self objectInDictionary:data forTag:BXTagMashStepStepTemp required:YES error:error] floatValue];
	self.stepTime = [[self objectInDictionary:data forTag:BXTagMashStepStepTime required:YES error:error] floatValue];
	self.rampTime = [[self objectInDictionary:data forTag:BXTagMashStepRampTime required:NO error:error] floatValue];
	self.endTemperature = [[self objectInDictionary:data forTag:BXTagMashStepEndTemp required:NO error:error] floatValue];
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
