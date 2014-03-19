#import "BXYeasts.h"
#import "OCBeerXML.h"

@interface BXYeasts()
@property (nonatomic, retain) NSMutableArray *objects;
@end

@implementation BXYeasts

+ (BXYeasts*)yeastsFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXYeasts *object = [[BXYeasts alloc] init];
	
	if ([[data objectForKey:BXTagYeast] isKindOfClass:[NSArray class]] ){ // many
		for (NSDictionary *o in [data objectForKey:BXTagYeast]) {
			[object addObjectFromDictionary:o error:error];
			if( error && *error ) break;
		}
	} else if ([[data objectForKey:BXTagYeast] isKindOfClass:[NSDictionary class]] ){ // one
		[object addObjectFromDictionary:[data objectForKey:BXTagYeast] error:error];
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
	BXYeast *object = [BXYeast yeastFromDictionary:data error:error];
	
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
