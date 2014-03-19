#import "BXEquipment.h"

@implementation BXEquipment

+ (BXEquipment*)equipmentFromDictionary:(NSDictionary*)data error:(NSError**)error {
	return [[BXEquipment alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagEquipmentName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagEquipmentVersion required:YES error:error] intValue];
	self.boilSize = [[self objectInDictionary:data forTag:BXTagEquipmentBoilSize required:YES error:error] floatValue];
	self.batchSize = [[self objectInDictionary:data forTag:BXTagEquipmentBatchSize required:YES error:error] floatValue];
	self.tunVolume = [[self objectInDictionary:data forTag:BXTagEquipmentTunVolume required:NO error:error] floatValue];
	self.tunWeight = [[self objectInDictionary:data forTag:BXTagEquipmentTunWeight required:NO error:error] floatValue];
	self.tunSpecificHeat = [[self objectInDictionary:data forTag:BXTagEquipmentTunSpecificHeat required:NO error:error] floatValue];
	self.topUpWater = [[self objectInDictionary:data forTag:BXTagEquipmentTopUpWater required:NO error:error] floatValue];
	self.trubChillerLoss = [[self objectInDictionary:data forTag:BXTagEquipmentTrubChillerLoss required:NO error:error] floatValue];
	self.evaporationRate = [[self objectInDictionary:data forTag:BXTagEquipmentEvapRate required:NO error:error] floatValue];
	self.boilTime = [[self objectInDictionary:data forTag:BXTagEquipmentBoilTime required:NO error:error] floatValue];
	self.calculateBoilVolume = [[self objectInDictionary:data forTag:BXTagEquipmentCalcBoilVolume required:NO error:error] boolValue];
	self.lauterDeadspace = [[self objectInDictionary:data forTag:BXTagEquipmentLauterDeadspace required:NO error:error] floatValue];
	self.topUpKettle = [[self objectInDictionary:data forTag:BXTagEquipmentTopUpKettle required:NO error:error] floatValue];
	self.hopUtilization = [[self objectInDictionary:data forTag:BXTagEquipmentHopUtilization required:NO error:error] floatValue];
	self.notes = [self objectInDictionary:data forTag:BXTagEquipmentNotes required:NO error:error];
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
