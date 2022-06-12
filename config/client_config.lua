Config = {}
----FRAMEWORK----
Config.vehicle = 'esx' -- qb/esx
Config.boat = 0x3FD5AA2F --use only for QB
Config.progressbar = 'esx' --qb/esx progressbar type
----ALERT----
Config.successpdtime = 120000--Time to notify pd after success hacking in ms
Config.failpdtime = 60000 --Time to notify pd after failed hacking in ms
Config.moneyprop = `hei_prop_hei_cash_trolly_01` -- prop for money trolley
----COORDS/DISTANCE----
Config.distance = 3 -- distance to see marker and text
Config.Locations = {
  Start = vector3(131.76, -1184.77, 28.5),
  Boat = vector3(-1186.53, -1021.04, 1.17),
  Yacht = vector3(-2018.84, -1040.0, 1.45),
  Ending = vector3(-2085.7, -1018.02, 12.1),
  hacking = vector3(-2031.19, -1038.06, 2),
  Collect = {
    vector3(-2094.4231, -1008.6356, 4.8843), --money
    vector3(-2071.4775, -1019.6768, 4.8841), --money
  }
}

----TEXTS----
Config.progressbartext = { --text for progressbar
    "Deleting camera files",
    "Taking money"
}
Config.DrawTexts = {-- texts for drawtext
"[E] Start heist",
"[E] Spawn Boat",
"[E] Rob",
"[E] Hack",
"[E] Take money",
"[E] Delete files",
}
Config.blips = { -- blip names
  "Boat",
  "Yacht"
}