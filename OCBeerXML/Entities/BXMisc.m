#import "BXMisc.h"
#import "BXXmlTags.h"

@implementation BXMisc

+ (BXMisc*)miscFromDictionary:(NSDictionary *)data error:(NSError *__autoreleasing *)error {
	return [[BXMisc alloc] initWithDictionary:data error:error];
}

- (id)initWithDictionary:(NSDictionary*)data error:(NSError**)error {
	self = [super init];
	
	self.name = [self objectInDictionary:data forTag:BXTagMiscName required:YES error:error];
	self.version = [[self objectInDictionary:data forTag:BXTagMiscVersion required:YES error:error] intValue];
	self.type = [self objectInDictionary:data forTag:BXTagMiscType required:YES error:error];
	self.use = [self objectInDictionary:data forTag:BXTagMiscUse required:YES error:error];
	self.time = [[self objectInDictionary:data forTag:BXTagMiscTime required:YES error:error] floatValue];
	self.amount = [[self objectInDictionary:data forTag:BXTagMiscAmount required:YES error:error] floatValue];
	self.amountIsWeight = [[self objectInDictionary:data forTag:BXTagMiscTime required:NO error:error] boolValue];
	self.useFor = [self objectInDictionary:data forTag:BXTagMiscUseFor required:NO error:error];
	self.notes = [self objectInDictionary:data forTag:BXTagMiscNotes required:NO error:error];
	
	if( error && *error )
		self = nil;
	
	return self;
}

@end
