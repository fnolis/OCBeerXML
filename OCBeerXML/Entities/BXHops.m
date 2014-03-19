#import "BXHops.h"
#import "OCBeerXML.h"

@interface BXHops()
@property (nonatomic, retain) NSMutableArray *objects;
@end

@implementation BXHops

+ (BXHops*)hopsFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXHops *object = [[BXHops alloc] init];
	
	if ([[data objectForKey:BXTagHop] isKindOfClass:[NSArray class]] ){ // many
		for (NSDictionary *o in [data objectForKey:BXTagHop]) {
			[object addObjectFromDictionary:o error:error];
			if( error && *error ) break;
		}
	} else if ([[data objectForKey:BXTagHop] isKindOfClass:[NSDictionary class]] ){ // one
		[object addObjectFromDictionary:[data objectForKey:BXTagHop] error:error];
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
	BXHop *object = [BXHop hopFromDictionary:data error:error];
	
	if( object )
		[self.objects addObject:object];
	else if( !error )// If error was nil and bxhop resulted in nil, unknown error
		*error = [NSError errorWithDomain:BeerXMLErrorDomain code:BeerXMLErrorUnknownError userInfo:nil];
}

- (NSUInteger)count {
	return self.objects.count;
}

- (BXHop*)objectAtIndex:(NSUInteger)index {
	return [self.objects objectAtIndex:index];
}

@end
