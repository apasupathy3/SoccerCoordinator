import Foundation

/*
 TOOLBOX:
    Swift 2.0 Basics
    Swift 2.0 Collections and Control Flow
    Swift 2.0 Functions
*/



//--------------------------------------------------
//---------------SOCCER PLAYERS MODEL---------------
//--------------------------------------------------

/*
 Parameters: values required to build a Soccer Player element
 playerName: The name of the soccer player as a String
 heightInInches: The height of the soccer player in inches as the String of an Int
 hasSoccerExperience: String "YES" or "NO" indicating whether or not player has previous soccer experience
 guardianNames: The name(s) of the player's guardian(s) as a String
 Returns Soccer Player as [String:String] in format specified by Model for Soccer Players below
 */
func buildSoccerPlayer(playerName: String, heightInInches: String, hasSoccerExperience: String, guardianNames: String) -> [String:String] {
    return [
        "playerName": playerName,
        "heightInInches": heightInInches,
        "hasSoccerExperience": hasSoccerExperience,
        "guardianNames": guardianNames
    ]
}

/*
 Model for Soccer Players: Array of Dictionaries
    - Each element of array represents a soccer player
    - Each soccer player contains the following keys: "playerName", "heightInInches", "hasSoccerExperience", and "guardianNames"
*/
/*
 MORE ADVANCED TOOLS:
    - Rather than using [String:String], it would be better to use [String:AnyObject] so 
        that the properties can hold values of the following types:
            "playerName": String
            "heightInInches": Int
            "hasSoccerExperience": Bool
            "guardianNames": String
        * Using [String:AnyObject] would require casting AnyObject to the proper value and
            unwrapping optionals, which isn't in the Toolbox available to me for this project
    - Instead of using a Dictionary type, creating a struct for SoccerPlayer with the 
        properties being the keys in the Dictionary would be better
    - Rather than typing in all the data from SoccerPlayerInfo, it would be better to read 
        the file into the playground, extract the data from that file, and build a Soccer
        Player Array from that data
*/
var soccerPlayers = [
    buildSoccerPlayer("Joe Smith", heightInInches: "42", hasSoccerExperience: "YES", guardianNames: "Jim and Jan Smith"),
    buildSoccerPlayer("Jill Tanner", heightInInches: "36", hasSoccerExperience: "YES", guardianNames: "Clara Tanner"),
    buildSoccerPlayer("Bill Bon", heightInInches: "43", hasSoccerExperience: "YES", guardianNames: "Sara and Jenny Bon"),
    buildSoccerPlayer("Eva Gordon", heightInInches: "45", hasSoccerExperience: "NO", guardianNames: "Wendy and Mike Gordon"),
    buildSoccerPlayer("Matt Gill", heightInInches: "40", hasSoccerExperience: "NO", guardianNames: "Charles and Sylvia Gill"),
    buildSoccerPlayer("Kimmy Stein", heightInInches: "41", hasSoccerExperience: "NO", guardianNames: "Bill and Hillary Stein"),
    buildSoccerPlayer("Sammy Adams", heightInInches: "45", hasSoccerExperience: "NO", guardianNames: "Jeff Adams"),
    buildSoccerPlayer("Karl Saygan", heightInInches: "42", hasSoccerExperience: "YES", guardianNames: "Heather Bledsoe"),
    buildSoccerPlayer("Suzane Greenberg", heightInInches: "44", hasSoccerExperience: "YES", guardianNames: "Henrietta Dumas"),
    buildSoccerPlayer("Sal Dali", heightInInches: "41", hasSoccerExperience: "NO", guardianNames: "Gala Dali"),
    buildSoccerPlayer("Joe Kavalier", heightInInches: "39", hasSoccerExperience: "NO", guardianNames: "Sam and Elaine Kavalier"),
    buildSoccerPlayer("Ben Finkelstein", heightInInches: "44", hasSoccerExperience: "NO", guardianNames: "Aaron and Jill Finkelstein"),
    buildSoccerPlayer("Diego Soto", heightInInches: "41", hasSoccerExperience: "YES", guardianNames: "Robin and Sarika Soto"),
    buildSoccerPlayer("Chloe Alaska", heightInInches: "47", hasSoccerExperience: "NO", guardianNames: "David and Jamie Alaska"),
    buildSoccerPlayer("Arnold Willis", heightInInches: "43", hasSoccerExperience: "NO", guardianNames: "Claire Willis"),
    buildSoccerPlayer("Phillip Helm", heightInInches: "44", hasSoccerExperience: "YES", guardianNames: "Thomas Helm and Eva Jones"),
    buildSoccerPlayer("Les Clay", heightInInches: "42", hasSoccerExperience: "YES", guardianNames: "Wynonna Brown"),
    buildSoccerPlayer("Herschel Krustofski", heightInInches: "45", hasSoccerExperience: "YES", guardianNames: "Hyman and Rachel Krustofski")
]

//--------------------------------------------------
//----------------SOCCER TEAMS MODEL----------------
//--------------------------------------------------

/*
 SORTING SOCCER PLAYERS INTO TEAMS:
    - Each team has the same number of players
    - Each team has the same number of experienced players
    - Each team has an average height within 1.5 inches of the average heights of the other teams
*/

// Each team is an array of Soccer Players from the Soccer Players Model
var sharks = []
var dragons = []
var raptors = []

// Before creating teams, split Soccer Players into experienced and unexperienced arrays
// Use Quick Sort to sort arrays by Soccer Player heightInInches in ascending order
var sortedInexperiencedPlayers: [[String:String]] = []
var sortedExperiencedPlayers:[[String:String]] = []

/*
 NOTE:
 In Swift Collection Types documentation (referenced by Swift 2.0 Collections and Control Flow),
 Optional types are briefly mentioned and if-let statements are used in the examples.
 Because of this, I'm going to assume that I can use them, despite the fact that Optional types
 and if-let statements are officially introduced in a later lesson.
*/
/*
 MORE ADVANCED TOOLS:
    - Given we're using a [String:String] type for soccerPlayer, the as keyword would be
        useful for shortening up those stacked if-lets
    - Using a struct instead of a Dictionary would be even more useful because we wouldn't
        have to deal with unwrapping Optionals of values we know for sure exist
*/
for soccerPlayer in soccerPlayers {
    if soccerPlayer["hasSoccerExperience"] == "YES" {
        var insertPlayer = false
        var index = 0
        repeat {
            if sortedExperiencedPlayers.isEmpty {
                insertPlayer = true
            } else {
                if let experiencedPlayerHeight = sortedExperiencedPlayers[index]["heightInInches"],
                   let experiencedPlayerHeightInt = Int(experiencedPlayerHeight),
                   let soccerPlayerHeight = soccerPlayer["heightInInches"],
                   let soccerPlayerHeightInt = Int(soccerPlayerHeight) {
                    if soccerPlayerHeightInt <= experiencedPlayerHeightInt {
                        insertPlayer = true
                    } else {
                        index += 1
                    }
                }
            }
        } while index < sortedExperiencedPlayers.count && !insertPlayer
        sortedExperiencedPlayers.insert(soccerPlayer, atIndex: index)
    } else {
        var insertPlayer = false
        var index = 0
        repeat {
            if sortedInexperiencedPlayers.isEmpty {
                insertPlayer = true
            } else {
                if let inexperiencedPlayerHeight = sortedInexperiencedPlayers[index]["heightInInches"],
                    let inexperiencedPlayerHeightInt = Int(inexperiencedPlayerHeight),
                    let soccerPlayerHeight = soccerPlayer["heightInInches"],
                    let soccerPlayerHeightInt = Int(soccerPlayerHeight) {
                    if soccerPlayerHeightInt <= inexperiencedPlayerHeightInt {
                        insertPlayer = true
                    } else {
                        index += 1
                    }
                }
            }
        } while index < sortedInexperiencedPlayers.count && !insertPlayer
        sortedInexperiencedPlayers.insert(soccerPlayer, atIndex: index)
    }
}





