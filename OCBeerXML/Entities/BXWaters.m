#import "BXWaters.h"
#import "OCBeerXML.h"

@interface BXWaters()
@property (nonatomic, retain) NSMutableArray *objects;
@end

@implementation BXWaters

+ (BXWaters*)watersFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXWaters *object = [[BXWaters alloc] init];
	
	if ([[data objectForKey:BXTagWater] isKindOfClass:[NSArray class]] ){ // many
		for (NSDictionary *o in [data objectForKey:BXTagWater]) {
			[object addObjectFromDictionary:o error:error];
			if( error && *error ) break;
		}
	} else if ([[data objectForKey:BXTagWater] isKindOfClass:[NSDictionary class]] ){ // one
		[object addObjectFromDictionary:[data objectForKey:BXTagWater] error:error];
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
	BXWater *object = [BXWater waterFromDictionary:data error:error];
	
	if( object )
		[self.objects addObject:object];
	else if( !error )// If error was nil and bxhop resulted in nil, unknown error
		*error = [NSError errorWithDomain:BeerXMLErrorDomain code:BeerXMLErrorUnknownError userInfo:nil];
}

- (NSUInteger)count {
	return self.objects.count;
}

- (BXWater*)objectAtIndex:(NSUInteger)index {
	return [self.objects objectAtIndex:index];
}

@end
