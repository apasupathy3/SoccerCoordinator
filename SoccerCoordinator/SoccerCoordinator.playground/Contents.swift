import Foundation

/*
 Courses this project covers:
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
 heightInInches: The height of the soccer player in inches as an Int
 hasSoccerExperience: Bool indicating whether or not player has previous soccer experience
 guardianNames: Array of the name(s) of the player's guardian(s) as String(s)
 Returns Soccer Player as NSDictionary in format specified by Model for Soccer Players below
 */
func buildSoccerPlayer(playerName: String, heightInInches: Int, hasSoccerExperience: Bool, guardianNames: [String]) -> NSDictionary {
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
    - Each soccer player contains the following keys and value-types:
        "playerName": String
        "heightInInches": Int
        "hasSoccerExperience": Bool
        "guardianNames": [String]
*/
// Build Soccer Players Model
var soccerPlayers = [
    buildSoccerPlayer("Joe Smith", heightInInches: 42, hasSoccerExperience: true, guardianNames: ["Jim Smith", "Jan Smith"]),
    buildSoccerPlayer("Jill Tanner", heightInInches: 36, hasSoccerExperience: true, guardianNames: ["Clara Tanner"]),
    buildSoccerPlayer("Bill Bon", heightInInches: 43, hasSoccerExperience: true, guardianNames: ["Sara Bon", "Jenny Bon"]),
    buildSoccerPlayer("Eva Gordon", heightInInches: 45, hasSoccerExperience: false, guardianNames: ["Wendy Gordon", "Mike Gordon"]),
    buildSoccerPlayer("Matt Gill", heightInInches: 40, hasSoccerExperience: false, guardianNames: ["Charles Gill", "Sylvia Gill"]),
    buildSoccerPlayer("Kimmy Stein", heightInInches: 41, hasSoccerExperience: false, guardianNames: ["Bill Stein", "Hillary Stein"]),
    buildSoccerPlayer("Sammy Adams", heightInInches: 45, hasSoccerExperience: false, guardianNames: ["Jeff Adams"]),
    buildSoccerPlayer("Karl Saygan", heightInInches: 42, hasSoccerExperience: true, guardianNames: ["Heather Bledsoe"]),
    buildSoccerPlayer("Suzane Greenberg", heightInInches: 44, hasSoccerExperience: true, guardianNames: ["Henrietta Dumas"]),
    buildSoccerPlayer("Sal Dali", heightInInches: 41, hasSoccerExperience: false, guardianNames: ["Gala Dali"]),
    buildSoccerPlayer("Joe Kavalier", heightInInches: 39, hasSoccerExperience: false, guardianNames: ["Sam Kavalier", "Elaine Kavalier"]),
    buildSoccerPlayer("Ben Finkelstein", heightInInches: 44, hasSoccerExperience: false, guardianNames: ["Aaron Finkelstein", "Jill Finkelstein"]),
    buildSoccerPlayer("Diego Soto", heightInInches: 41, hasSoccerExperience: true, guardianNames: ["Robin Soto", "Sarika Soto"]),
    buildSoccerPlayer("Chloe Alaska", heightInInches: 47, hasSoccerExperience: false, guardianNames: ["David Alaska", "Jamie Alaska"]),
    buildSoccerPlayer("Arnold Willis", heightInInches: 43, hasSoccerExperience: false, guardianNames: ["Claire Willis"]),
    buildSoccerPlayer("Phillip Helm", heightInInches: 44, hasSoccerExperience: true, guardianNames: ["Thomas Helm", "Eva Jones"]),
    buildSoccerPlayer("Les Clay", heightInInches: 42, hasSoccerExperience: true, guardianNames: ["Wynonna Brown"]),
    buildSoccerPlayer("Herschel Krustofski", heightInInches: 45, hasSoccerExperience: true, guardianNames: ["Hyman Krustofski", "Rachel Krustofski"])
]











