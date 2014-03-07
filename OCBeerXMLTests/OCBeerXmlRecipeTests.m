#import <XCTest/XCTest.h>
#import "OCBeerXml.h"
#import "BXRecipe.h"
#import "BXStyle.h"

@interface BeerXmlRecipeTests : XCTestCase
@property (nonatomic, retain) NSError *error;
@property (nonatomic, retain) NSArray *recipes;
@property (nonatomic, retain) BXRecipe *recipe;
@end

@implementation BeerXmlRecipeTests

- (void)setUp {
    [super setUp];
	NSError *error;
	NSString *xml = @"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?> <RECIPES> <RECIPE> <NAME>Dry Stout</NAME> <VERSION>1</VERSION> <NOTES>Famous Irish Stout.</NOTES><TYPE>All Grain</TYPE> <BREWER>Brad Smith</BREWER> <BATCH_SIZE>18.93</BATCH_SIZE> <BOIL_SIZE>20.82</BOIL_SIZE> <BOIL_TIME>60.0</BOIL_TIME> <EFFICIENCY>72.0</EFFICIENCY> <TASTE_NOTES>Nice dry Irish stout with a warm body but low starting gravity much like the famous drafts.</TASTE_NOTES> <TASTE_RATING>41</TASTE_RATING> <DATE>3 Jan 04</DATE> <OG>1.036</OG> <FG>1.012</FG> <CARBONATION>2.1</CARBONATION> <CARBONATION_USED>Kegged</CARBONATION_USED> <AGE>24.0</AGE> <AGE_TEMP>17.0</AGE_TEMP> <FERMENTATION_STAGES>2</FERMENTATION_STAGES> <STYLE> <NAME>Dry Stout</NAME> <CATEGORY>Stout</CATEGORY> <CATEGORY_NUMBER>16</CATEGORY_NUMBER> <STYLE_LETTER>A</STYLE_LETTER> <STYLE_GUIDE>BJCP</STYLE_GUIDE> <VERSION>1</VERSION> <TYPE>Ale</TYPE> <OG_MIN>1.035</OG_MIN> <OG_MAX>1.050</OG_MAX> <FG_MIN>1.007</FG_MIN> <FG_MAX>1.011</FG_MAX> <IBU_MIN>30.0</IBU_MIN> <IBU_MAX>50.0</IBU_MAX> <COLOR_MIN>35.0</COLOR_MIN> <COLOR_MAX>200.0</COLOR_MAX> <ABV_MIN>3.2</ABV_MIN> <ABV_MAX>5.5</ABV_MAX> <CARB_MIN>1.6</CARB_MIN> <CARB_MAX>2.1</CARB_MAX> <NOTES>Famous Irish Stout. Dry, roasted, almost coffee like flavor. Often soured with pasteurized sour beer. Full body perception due to flaked barley, though starting gravity may be low. Dry roasted flavor.</NOTES> </STYLE> <HOPS> <HOP> <NAME>Goldings, East Kent</NAME> <VERSION>1</VERSION> <ALPHA>5.0</ALPHA> <AMOUNT>0.0638</AMOUNT> <USE>Boil</USE> <TIME>60.0</TIME> <NOTES>Great all purpose UK hop for ales, stouts, porters</NOTES> </HOP> </HOPS> <FERMENTABLES> <FERMENTABLE> <NAME>Pale Malt (2 row) UK</NAME> <VERSION>1</VERSION> <AMOUNT>2.27</AMOUNT> <TYPE>Grain</TYPE> <YIELD>78.0</YIELD> <COLOR>3.0</COLOR> <ORIGIN>United Kingdom</ORIGIN> <SUPPLIER>Fussybrewer Malting</SUPPLIER> <NOTES>All purpose base malt for English styles</NOTES> <COARSE_FINE_DIFF>1.5</COARSE_FINE_DIFF> <MOISTURE>4.0</MOISTURE> <DIASTATIC_POWER>45.0</DIASTATIC_POWER> <PROTEIN>10.2</PROTEIN> <MAX_IN_BATCH>100.0</MAX_IN_BATCH> </FERMENTABLE> <FERMENTABLE> <NAME>Barley, Flaked</NAME> <VERSION>1</VERSION> <AMOUNT>0.91</AMOUNT> <TYPE>Grain</TYPE> <YIELD>70.0</YIELD> <COLOR>2.0</COLOR> <ORIGIN>United Kingdom</ORIGIN> <SUPPLIER>Fussybrewer Malting</SUPPLIER> <NOTES>Adds body to porters and stouts, must be mashed</NOTES> <COARSE_FINE_DIFF>1.5</COARSE_FINE_DIFF> <MOISTURE>9.0</MOISTURE> <DIASTATIC_POWER>0.0</DIASTATIC_POWER> <PROTEIN>13.2</PROTEIN> <MAX_IN_BATCH>20.0</MAX_IN_BATCH> <RECOMMEND_MASH>TRUE</RECOMMEND_MASH> </FERMENTABLE> <FERMENTABLE> <NAME>Black Barley</NAME> <VERSION>1</VERSION> <AMOUNT>0.45</AMOUNT> <TYPE>Grain</TYPE> <YIELD>78.0</YIELD> <COLOR>500.0</COLOR> <ORIGIN>United Kingdom</ORIGIN> <SUPPLIER>Fussybrewer Malting</SUPPLIER> <NOTES>Unmalted roasted barley for stouts, porters</NOTES> <COARSE_FINE_DIFF>1.5</COARSE_FINE_DIFF> <MOISTURE>5.0</MOISTURE> <DIASTATIC_POWER>0.0</DIASTATIC_POWER> <PROTEIN>13.2</PROTEIN> <MAX_IN_BATCH>10.0</MAX_IN_BATCH> </FERMENTABLE> </FERMENTABLES> <MISCS> <MISC> <NAME>Irish Moss</NAME> <VERSION>1</VERSION> <TYPE>Fining</TYPE> <USE>Boil</USE> <TIME>15.0</TIME> <AMOUNT>0.010</AMOUNT> <NOTES>Used as a clarifying agent during the last few minutes of the boil</NOTES> </MISC> </MISCS> <WATERS> <WATER> <NAME>Burton on Trent, UK</NAME> <VERSION>1</VERSION> <AMOUNT>20.0</AMOUNT> <CALCIUM>295.0</CALCIUM> <MAGNESIUM>45.0</MAGNESIUM> <SODIUM>55.0</SODIUM> <SULFATE>725.0</SULFATE> <CHLORIDE>25.0</CHLORIDE> <BICARBONATE>300.0</BICARBONATE> <PH>8.0</PH> <NOTES> Use for distinctive pale ales strongly hopped. Very hard water accentuates the hops flavor. Example: Bass Ale </NOTES> </WATER> </WATERS> <YEASTS> <YEAST> <NAME>Irish Ale</NAME> <TYPE>Ale</TYPE> <VERSION>1</VERSION> <FORM>Liquid</FORM> <AMOUNT>0.250</AMOUNT> <LABORATORY>Wyeast Labs</LABORATORY> <PRODUCT_ID>1084</PRODUCT_ID> <MIN_TEMPERATURE>16.7</MIN_TEMPERATURE> <MAX_TEMPERATURE>22.2</MAX_TEMPERATURE> <ATTENUATION>73.0</ATTENUATION> <NOTES>Dry, fruity flavor characteristic of stouts. Full bodied, dry, clean flavor. </NOTES> <BEST_FOR>Irish Dry Stouts</BEST_FOR> <FLOCCULATION>Medium</FLOCCULATION> </YEAST> </YEASTS> <MASH> <NAME>Single Step Infusion, 68 C</NAME> <VERSION>1</VERSION> <GRAIN_TEMP>22.0</GRAIN_TEMP> <MASH_STEPS> <MASH_STEP> <NAME>Conversion Step, 68C </NAME> <VERSION>1</VERSION> <TYPE>Infusion</TYPE> <STEP_TEMP>68.0</STEP_TEMP> <STEP_TIME>60.0</STEP_TIME> <INFUSE_AMOUNT>10.0</INFUSE_AMOUNT> </MASH_STEP> </MASH_STEPS> </MASH> </RECIPE> </RECIPES> ";
	self.recipes = [OCBeerXML parseRecipes:xml error:&error];
	self.recipe = [self.recipes objectAtIndex:0];
	self.error = error;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testParseRecipe {
	// RECIPES
	XCTAssertTrue(self.recipes.count == 1, @"Recipes are '%d' should be '1'", (int)self.recipes.count);
	
	// RECIPE
	BXRecipe *recipe = [self.recipes objectAtIndex:0];
	XCTAssertTrue([recipe.name isEqualToString:@"Dry Stout"], @"Recipe name is '%@', should be 'Dry Stout'", recipe.name);
	XCTAssertTrue(recipe.version == 1, @"Version is '%d', should be '1'",recipe.version);
	XCTAssertTrue([recipe.type isEqualToString:@"All Grain"], @"Type is '%@', should be 'All Grain'",recipe.type);
	XCTAssertTrue(recipe.batchSize == 18.93f, @"Batch size is '%f', should be 18.93",recipe.batchSize);
	XCTAssertTrue(recipe.boilSize == 20.82f, @"Boil size is '%f', should be 20.82",recipe.boilSize);
	XCTAssertTrue([recipe.brewer isEqualToString:@"Brad Smith"], @"Brewer is '%@', should be 'Brad Smith'", recipe.brewer);
	XCTAssertTrue(recipe.boilTime == 60.0f, @"Boil time is not correct");
	XCTAssertTrue([recipe.notes isEqualToString:@"Famous Irish Stout."], @"Notes '%@' is not correct",recipe.notes);
	XCTAssertTrue([recipe.tasteNotes isEqualToString:@"Nice dry Irish stout with a warm body but low starting gravity much like the famous drafts."], @"Taste notes is not correct");
	XCTAssertTrue(recipe.tasteRating == 41, @"Taste rating is '%f', should be '41'", recipe.tasteRating);
	XCTAssertTrue(recipe.fermentationStages == 2, @"Fermentation stages is '%d', should be '2'", recipe.fermentationStages);
	XCTAssertTrue(recipe.age == 24.0f, @"Age is not correct");
	XCTAssertTrue(recipe.ageTemperature == 17.0f, @"Age temperature is not correct");
	XCTAssertTrue([recipe.date isEqualToString:@"3 Jan 04"], @"Date is not correct");
	XCTAssertTrue(recipe.carbonation == 2.1f, @"Carbonation is '%f', should be 2.1",recipe.carbonation);
}

- (void)testRecipeStyle {
	// STYLE
	BXStyle *style = self.recipe.style;
	XCTAssertTrue([style.name isEqualToString:@"Dry Stout"], @"Style name is '%@', should be 'Dry Stout'",style.name);
	XCTAssertTrue([style.category isEqualToString:@"Stout"], @"Category is '%@', should be 'Stout'",style.category);
	XCTAssertTrue([style.categoryNumber isEqualToString:@"16"], @"Style category name is wrong");
	XCTAssertTrue([style.letter isEqualToString:@"A"], @"Style letter is '%@, should be 'A'",style.letter);
	XCTAssertTrue([style.guide isEqualToString:@"BJCP"], @"Style guide is '%@, should be 'BJCP'",style.letter);
	XCTAssertTrue(style.minimumABV == 3.2f, @"Min ABV is '%f', should be '3.2'",style.minimumABV);
	XCTAssertTrue(style.maximumABV == 5.5f, @"Max ABV is not correct");
	XCTAssertTrue(style.minimumIBU == 30.0f, @"Min IBU is not correct");
	XCTAssertTrue(style.maximumIBU == 50.0f, @"Max IBU is not correct");
}

- (void)testRecipeHops {
	// HOPS
	BXHops *hops = self.recipe.hops;
	XCTAssertTrue(self.recipe.hops.count == 1, @"Hops count is '%d', should be '7'",self.recipe.hops.count);
	
	//HOP
	BXHop *hop = [hops objectAtIndex:0];
	XCTAssertTrue([hop.name isEqualToString:@"Goldings, East Kent"], @"Hop name is '%@', should be 'Goldings, East Kent'",hop.name);
	XCTAssertTrue([hop.use isEqualToString:@"Boil"], @"Hop use is '%@', should be 'Boil'",hop.use);
	XCTAssertTrue(hop.time == 60.0f, @"Hop time is '%f', should be '60.0'",hop.time);
	XCTAssertTrue(hop.alpha == 5.0f, @"Hop alpha is '%f', should be '5.0'",hop.alpha);
	XCTAssertTrue(hop.amount == 0.0638f, @"Hop amount is '%f', should be '0.0638'",hop.amount);
}

@end