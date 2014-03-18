#import "BXMiscs.h"
#import "BXXmlTags.h"
#import "OCBeerXML.h"

@interface BXMiscs()
@property (nonatomic, retain) NSMutableArray *objects;
@end

@implementation BXMiscs

+ (BXMiscs*)miscsFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXMiscs *object = [[BXMiscs alloc] init];
	
	if ([[data objectForKey:BXTagMisc] isKindOfClass:[NSArray class]] ){ // many
		for (NSDictionary *o in [data objectForKey:BXTagMisc]) {
			[object addObjectFromDictionary:o error:error];
			if( error && *error ) break;
		}
	} else if ([[data objectForKey:BXTagMisc] isKindOfClass:[NSDictionary class]] ){ // one
		[object addObjectFromDictionary:[data objectForKey:BXTagMisc] error:error];
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
	BXMisc *object = [BXMisc miscFromDictionary:data error:error];
	
	if( object )
		[self.objects addObject:object];
	else if( !error )// If error was nil and bxhop resulted in nil, unknown error
		*error = [NSError errorWithDomain:BeerXMLErrorDomain code:BeerXMLErrorUnknownError userInfo:nil];
}

- (NSUInteger)count {
	return self.objects.count;
}

- (BXMisc*)objectAtIndex:(NSUInteger)index {
	return [self.objects objectAtIndex:index];
}

@end
