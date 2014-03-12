#import "BXEquipments.h"
#import "BXXmlTags.h"
#import "OCBeerXML.h"

@interface BXEquipments()
@property (nonatomic, retain) NSMutableArray *objects;
@end

@implementation BXEquipments

+ (BXEquipments*)equipmentsFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXEquipments *object = [[BXEquipments alloc] init];
	
	if ([[data objectForKey:BXTagEquipment] isKindOfClass:[NSArray class]] ){ // many
		for (NSDictionary *o in [data objectForKey:BXTagEquipment]) {
			[object addObjectFromDictionary:o error:error];
			if( error && *error ) break;
		}
	} else if ([[data objectForKey:BXTagEquipment] isKindOfClass:[NSDictionary class]] ){ // one
		[object addObjectFromDictionary:[data objectForKey:BXTagEquipment] error:error];
	}
	
	if( error && *error ) {
		object = nil;
	}
	
	return object;
}

- (instancetype)init {
	self = [super init];
	
	if( self ) {
		self.objects = [NSMutableArray array];
	}
	
	return self;
}

- (void)addObjectFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXEquipment *object = [BXEquipment equipmentFromDictionary:data error:error];
	
	if( object )
		[self.objects addObject:object];
	else if( !error )// If error was nil and bxhop resulted in nil, unknown error
		*error = [NSError errorWithDomain:BeerXMLErrorDomain code:BeerXMLErrorUnknownError userInfo:nil];
}

- (NSUInteger)count {
	return self.objects.count;
}

- (BXEquipment*)objectAtIndex:(NSUInteger)index {
	return [self.objects objectAtIndex:index];
}

@end
