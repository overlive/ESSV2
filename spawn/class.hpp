class ClassDialog
{
	idd = -1;
	movingenable = 0;
	class controlsBackground 
	{
		class ClassBackground: RscText
		{
			text = "";
			x = .3 * safezoneW + safezoneX; //.347367
			y = .317516 * safezoneH + safezoneY;
			w = .138504 * safezoneW; //.128504
			h = .32 * safezoneH;
			colorBackground[] = {.3,.3,.3,1}; //.3 alpha
			fixedWidth = 0;
		};
	};
	class Controls
	{
		class ClassSelect: RscText
		{
			text = "Class Selection";
			x = .3 * safezoneW + safezoneX;
			y = .286948 * safezoneH + safezoneY;
			w = .138504 * safezoneW;
			h = .0301 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {.384,.702,.886,.8};
			fixedWidth = 0;
			shadow = 1;
			sizeEx = .03;
		};
		class ClassList
		{
			idc = 8888;
			x = .3 * safezoneW + safezoneX;
			y = .32 * safezoneH + safezoneY; //.317516
			w = .138504 * safezoneW;
			h = .25 * safezoneH;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
			autoScrollSpeed = -1;
			colorSelect[] = {};
			colorSelectBackground[] = {.5,.5,.5,1};
			colorText[] = {.88,.88,.88,1};
			font = "Zeppelin32";
			maxHistoryDelay = 1;
			onLBSelChanged = "call classPreview;";
			rowHeight = 0;
			class ScrollBar
			{
				arrowEmpty = "\ca\ui\data\arrow_up_ca.paa";
				arrowFull = "\ca\ui\data\arrow_up_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
				color[] = {.5,.5,.5,.5};
				colorActive[] = {.5,.5,.5,.3};
				colorDisabled[] = {.5,.5,.5,.1};
				shadow = 0;
				thumb = "";
			};
			sizeEx = .03; //.04
			soundSelect[] = {"",.1,1};
			style = 16;
			type = 5;
		};
		class ClassButton
		{
			idc = 8889;
			text = "Select Class";
			x = .3135 * safezoneW + safezoneX; //.351534 //.304167
			y = .582 * safezoneH + safezoneY; //.585
			w = .11 * safezoneW; //.121195 //.131195
			h = .044 * safezoneH; //.048
			action = "call classPick;";
			borderSize = 0;
			colorBackground[] = {.4,.4,.4,1}; //.5 alpha
			colorBackgroundActive[] = {.5,.5,.5,1}; //.5 alpha
			colorBackgroundDisabled[] = {.2,.2,.2,1}; //.3 color .1 alpha
			colorBorder[] = {.88,.88,.88,1}; //.3 alpha			
			colorDisabled[] = {.2,.2,.2,1};//.4 color 
			colorFocused[] = {.4,.4,.4,1}; //.3 color
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = .002;
			offsetPressedY = .002;
			offsetX = .003;
			offsetY = .003;
			sizeEx = .03; //.04
			soundClick[] = {"\ca\ui\data\sound\onclick",.07,1};
			soundEnter[] = {"\ca\ui\data\sound\onover",.09,1};
			soundEscape[] = {"\ca\ui\data\sound\onescape",.09,1};
			soundPush[] = {"\ca\ui\data\sound\new1",0,0};			
			style = 2;
			type = 1;
		};
	};
};
