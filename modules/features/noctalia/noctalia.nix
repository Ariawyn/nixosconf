{ self, inputs, ... }: {
    perSystem = { pkgs, ... }: {
        packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
            inherit pkgs;
            settings = {
		settingsVersion = 59;
		bar = {
		    barType = "framed";
		    position = "left";
		    monitors = [];
		    density = "compact";
		    showOutline = false;
		    showCapsule = true;
		    capsuleOpacity = 1;
		    capsuleColorKey = "none";
		    widgetSpacing = 2;
		    contentPadding = 0;
		    fontScale = 0.75;
		    enableExclusionZoneInset = false;
 		    backgroundOpacity = 1;
		    useSeparateOpacity = false;
		    marginVertical = 5;
		    marginHorizontal = 5;
		    frameThickness = 4;
		    frameRadius = 10;
		    outerCorners = true;
		    hideOnOverview = true;
		    displayMode = "always_visible";
		    autoHideDelay = 500;
		    autoShowDelay = 150;
		    showOnWorkspaceSwitch = true;
		    widgets = {
			center = [
			    {
				characterCount = 2;
				colorizeIcons = false;
				emptyColor = "secondary";
				enableScrollWheel = true;
				focusedColor = "primary";
				followFocusedScreen = false;
				fontWeight = "bold";
				groupedBorderOpacity = 1;
				hideUnoccupied = false;
				iconScale = 0.8;
				id = "Workspace";
				labelMode = "index";
				occupiedColor = "secondary";
				pillSize = 0.6;
				showApplications = false;
				showApplicationsHover = false;
				showBadge = true;
				showLabelsOnlyWhenOccupied = true;
				unfocusedIconsOpacity = 1;
			    }
			];
			left = [
			    {
				clockColor = "none";
				customFont = "";
				formatHorizontal = "HH:mm ddd, MMM dd";
				formatVertical = "HH mm - dd MM";
				id = "Clock";
				tooltipFormat = "HH:mm ddd, MMM dd";
				useCustomFont = false;
			    }
			    {
				customMode = true;
				diskPath = "/";
				iconColor = "none";
				id = "SystemMonitor";
				showCpuCores = false;
				showCpuFreq = false;
				showCpuTemp = true;
				showCpuUsage = true;
				showDiskAvailable = false;
				showDiskUsage = false;
				showDiskUsageAsPercent = false;
				showGpuTemp = true;
				showLoadAverage = false;
				showMemoryAsPercent = false;
				showMemoryUsage = true;
				showNetworkStats = false;
				showSwapUsage = false;
				textColor = "none";
				useMonospaceFont = true;
				usePadding = false;
			    }
			    {
				hideWhenZero = false;
				hideWhenZeroUnread = false;
				iconColor = "none";
				id = "NotificationHistory";
				showUnreadBadge = true;
				unreadBadgeColor = "primary";
			    }
			    {
				compactMode = false;
				hideMode = "hidden";
				hideWhenIdle = false;
				id = "MediaMini";
				maxWidth = 145;
				panelShowAlbumArt = true;
				scrollingMode = "hover";
				showAlbumArt = true;
				showArtistFirst = true;
				showProgressRing = true;
				showVisualizer = false;
				textColor = "none";
				useFixedWidth = false;
				visualizerType = "linear";
			    }
			];
			right = [
			    {
				deviceNativePath = "__default__";
				displayMode = "graphic";
				hideIfIdle = false;
				hideIfNotDetected = false;
				id = "Battery";
				showNoctaliaPerformance = false;
				showPowerProfiles = true;
			    }
			    {
				displayMode = "onhover";
				iconColor = "none";
				id = "Volume";
				middleClickCommand = "pwvucontrol || pavucontrol";
				textColor = "none";
			    }
			    {
				applyToAllMonitors = false;
				displayMode = "onhover";
				iconColor = "none";
				id = "Brightness";
				textColor = "none";
			    }
			    {
				colorizeDistroLogo = false;
				colorizeSystemIcon = "none";
				colorizeSystemText = "none";
				customIconPath = "";
				enableColorization = false;
				icon = "noctalia";
				id = "ControlCenter";
				useDistroLogo = false;
			    }
			];
		    };
		    mouseWheelAction = "none";
		    reverseScroll = false;
		    mouseWheelWrap = true;
		    middleClickAction = "none";
		    middleClickFollowMouse = false;
		    middleClickCommand = "";
		    rightClickAction = "controlCenter";
		    rightClickFollowMouse = true;
		    rightClickCommand = "";
		    screenOverrides = [];
		};
	    };
        };
    };
}
