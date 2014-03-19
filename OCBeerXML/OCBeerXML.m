#import "OCBeerXML.h"
#import "BXXmlTags.h"
#import "XmlReader.h"
#import "BXRecipe.h"

@implementation OCBeerXML

#pragma mark - Recipes

+ (NSArray*)parseRecipes:(NSString*)xml error:(NSError**)error {
	NSError *xmlerror = nil;
	NSDictionary *data = [XMLReader dictionaryForXMLString:xml error:&xmlerror];
	NSMutableArray *recipes = nil;
	
	if( !xmlerror ) {
		recipes = [NSMutableArray array];
		BXRecipe *bxrecipe;
		
		if( [[data objectForKey:BXTagRecipes] isKindOfClass:[NSDictionary class]] ) {
			if ([[[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe] isKindOfClass:[NSArray class]] ){ // many
				for (NSDictionary *recipe in [[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe]) {
					bxrecipe = [BXRecipe recipeFromDictionary:recipe error:&xmlerror];
					
					if( bxrecipe )
						[recipes addObject:bxrecipe];
					else if( !xmlerror ) // If error was nil and bxhop resulted in nil, unknown error
						xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
					
					if( error && *error ) break;
				}
			} else if ([[[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe] isKindOfClass:[NSDictionary class]] ){ // one
				bxrecipe = [BXRecipe recipeFromDictionary:[[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe] error:error];
				
				if( bxrecipe)
					[recipes addObject:bxrecipe];
				else if( !xmlerror )// If error was nil and bxhop resulted in nil, unknown error
					xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
			}
		} else {
			NSLog(@"Unexpected data: %@",data);
			//TODO:Unexpected error
			NSLog(@"error class %@",[[data objectForKey:BXTagRecipes] class]);
		}
	}
	
	if( xmlerror ) {
		recipes = nil;
		
		if( error )
			*error = xmlerror;
	}
	
	return recipes;
}

@end
