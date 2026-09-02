class BlackMarketSoldierStats_Defaults extends Object config(BlackMarketSoldierStats_Defaults);

// Config version
var config int VERSION_CFG;

// Highlight above/below average stats
var config bool HIGHLIGHT_ABOVE_BELOW_AVERAGE;

// Stat display mode. The order must match STAT_DISPLAY_MODE_Strings in the localization file.
enum EStatDisplayMode
{
    eSDM_Absolute, // 0
    eSDM_Delta,    // 1
    eSDM_Combined  // 2
};
var config int STAT_DISPLAY_MODE;

// Panel location
var config int PANEL_X;
var config int PANEL_Y;

// Reveal cost
var config bool REVEAL_COST_ENABLED;
var config string REVEAL_COST_RESOURCE;
var config int REVEAL_COST_QUANTITY;

// Require Sectoid autopsy before showing Psi Offense stat
var config bool PSI_OFFENSE_REQUIRE_SECTOID_AUTOPSY;