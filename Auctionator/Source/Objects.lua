Auctionator = {
  Debug = {},
  Constants = {},
<<<<<<< HEAD
  Util = {},
  Filters = {},
  FilterLookup = {},

  SearchUI = {}
}

-- TODO: Move this to Utilities when re-organizing code
function Auctionator.Debug.IsOn()
  return AUCTIONATOR_SAVEDVARS and AUCTIONATOR_SAVEDVARS.DEBUG_MODE
end

function Auctionator.Debug.Toggle()
  AUCTIONATOR_SAVEDVARS.DEBUG_MODE = not AUCTIONATOR_SAVEDVARS.DEBUG_MODE
end

function Auctionator.Debug.Message(message, ...)
  if Auctionator.Debug.IsOn() then
    print( message, ... )
  end
end

function Auctionator.Debug.Override( message, ... )
  -- Note this ignore Debug.IsOn(), so REMEMBER TO REMOVE
  print( message, ... )
end
=======
  Utilities = {},
  Events = {},
  SlashCmd = {},

  State = {
    Loaded = false,
    CurrentVersion = nil,
  },

  SavedState = {},
  Search = {
    CategoryLookup = {},
    Filters = {},
  },
  Tooltip = {},
  Locales = {},
  Config = {},
  Variables = {},
  Shopping = { Tab = {}, Lists = {} },
  Cancelling = {},
  Enchant = {},
  Selling = {},
  Components = {},
  CraftingInfo = {},
  IncrementalScan = {},
  FullScan = {},
  PostingHistory = {},
  Groups = {},

  Tabs = {
    State = {
      knownTabs= {}
    },
  },

  API = {
    v1 = {}
  },
  
  AH = {}
}
>>>>>>> classic_hardcore
