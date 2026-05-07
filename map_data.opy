#!mainFile "main.opy"

rule "Map Data - Example":
    # Paste your map data here and change the condition to the correct map.
    @Condition getCurrentMap() == Map.HANAMURA
    @Delimiter


rule "After 3s if the checkpoints are empty then provide a warning":
	@Condition len(Checkpoints) == 0

	wait(3, Wait.ABORT_WHEN_FALSE)
	hudHeader(null if localPlayer == hostPlayer and hostPlayer.WsEditorOn else localPlayer, " {0} Warning: Map has no data ".format(iconString(Icon.WARNING)), HudPosition.TOP, 5, Color.RED, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)