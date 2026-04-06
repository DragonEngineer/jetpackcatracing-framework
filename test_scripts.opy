#!mainFile "main.opy"

divider(test scripts) # seperate from rest because this scripts sometimes doesnt exist

rule "slowmo":
    @Disabled # enable slowmotion here
    setSlowMotion(100)


rule "test huds":
    wait(1)
    # position hud
    hudSubheader(getAllPlayers(), 
        "\n"
        "Position: {}\n"
        "Eye: {}\n"
        "Facing: {}\n"
        "Throthle: {}\n"
        "{}"
        "".format(
            localPlayer.getPosition(),
            localPlayer.getEyePosition(),
            localPlayer.getFacingDirection(),
            localPlayer.getThrottle(),
            LeftAlign100
        ), 
        HudPosition.LEFT, HudOrder.TEST_POSITION , Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT
    )

    # load hud
    hudSubheader(
        localPlayer,
        "Load: {}\n"
        "Avrg: {} \n"
        "Peak: {}\n"
        "{}"
        "".format(
            getServerLoad(),
            getAverageServerLoad(),
            getPeakServerLoad(),
            LeftAlign100
        ),
        HudPosition.LEFT, HudOrder.TEST_LOAD,
        Color.RED if getAverageServerLoad() > 220 else
        Color.ORANGE if getAverageServerLoad() > 190 else
        Color.YELLOW if getAverageServerLoad() > 160  else
        Color.BLUE if getAverageServerLoad() > 130 else
        Color.LIME_GREEN,
        HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.DEFAULT
    )

