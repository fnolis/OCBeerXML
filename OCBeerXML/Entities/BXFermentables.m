#import "BXFermentables.h"
#import "BXFermentable.h"
#import "BXXmlTags.h"
#import "OCBeerXML.h"

@interface BXFermentables()
@property (nonatomic, retain) NSMutableArray *objects;
@end

@implementation BXFermentables

+ (BXFermentables*)fermentablesFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXFermentables *object = [[BXFermentables alloc] init];
	
	if ([[data objectForKey:BXTagFermentable] isKindOfClass:[NSArray class]] ){ // many
		for (NSDictionary *o in [data objectForKey:BXTagFermentable]) {
			[object addObjectFromDictionary:o error:error];
			if( error && *error ) break;
		}
	} else if ([[data objectForKey:BXTagFermentable] isKindOfClass:[NSDictionary class]] ){ // one
		[object addObjectFromDictionary:[data objectForKey:BXTagFermentable] error:error];
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
	BXFermentable *object = [BXFermentable fermentableFromDictionary:data error:error];
	
	if( object )
		[self.objects addObject:object];
	else if( !error )// If error was nil and bxhop resulted in nil, unknown error
		*error = [NSError errorWithDomain:BeerXMLErrorDomain code:BeerXMLErrorUnknownError userInfo:nil];
}

- (NSUInteger)count {
	return self.objects.count;
}

- (BXFermentable*)objectAtIndex:(NSUInteger)index {
	return [self.objects objectAtIndex:index];
}

@end
