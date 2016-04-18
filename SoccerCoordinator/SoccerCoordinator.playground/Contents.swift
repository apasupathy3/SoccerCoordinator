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
    - Using a custom Comparable type (struct or class) for Soccer Player where experience,
        and then height, determines their sort order instead of a Dictionary would be even
        more useful:
            * Wouldn't have to deal with unwrapping Optionals of values we know for sure exist
            * Could simply call sort() on the array of Soccer Players to sort by experience
                and height
*/
/*
 Parameters:
    player: Soccer Player to be inserted into sorted array
    array: Array of Soccer Players sorted by height
 Returns index at which player should be inserted into array
*/
func indexToInsertPlayer(player: [String:String], forSortedArray array: [[String:String]]) -> Int {
    var insertPlayer = false
    var index = 0
    repeat {
        if array.isEmpty {
            insertPlayer = true
        } else {
            if let insertedPlayerHeight = array[index]["heightInInches"],
                let insertedPlayerHeightInt = Int(insertedPlayerHeight),
                let soccerPlayerHeight = player["heightInInches"],
                let soccerPlayerHeightInt = Int(soccerPlayerHeight) {
                if soccerPlayerHeightInt <= insertedPlayerHeightInt {
                    insertPlayer = true
                } else {
                    index += 1
                }
            }
        }
    } while index < array.count && !insertPlayer
    return index
}

for soccerPlayer in soccerPlayers {
    if soccerPlayer["hasSoccerExperience"] == "YES" {
        sortedExperiencedPlayers.insert(soccerPlayer, atIndex: indexToInsertPlayer(soccerPlayer, forSortedArray: sortedExperiencedPlayers))
    } else {
        sortedInexperiencedPlayers.insert(soccerPlayer, atIndex: indexToInsertPlayer(soccerPlayer, forSortedArray: sortedInexperiencedPlayers))
    }
}

// Each team is an array of Soccer Players from the Soccer Players Model
var sharks:[[String:String]] = []
var dragons:[[String:String]] = []
var raptors:[[String:String]] = []

/*
 SORT EXPERIENCED PLAYERS INTO TEAMS BY HEIGHT
    - GOALS:
        1. Evenly divide experienced players among Sharks, Dragons, and Raptors
        2. Make the average heights of each team as close to each other as possible given above constraint
    - METHODOLOGY:
        Experienced players have already been sorted by height in ascending order. Thus, for every consecutive
        three players, player_n["heightInInches"] <= player_n+1["heightInInches"] <= player_n+2["heightInInches"].
        The total number of experienced players is divisible by 3, so each team should get the same number of
        experienced players.
 
        I am going to consider a single iteration to be when three players in a row have been placed on a team.
        With every iteration, each team has a single player placed on its team. The order in which the three teams
        receive a player is determined by their average heights after the previous iteration is complete. The team
        with the largest average receives the first player because that player has the smallest height of all the
        players in this iteration. Likewise, the team with the second-largest average receives the second player,
        and the team with the smallest average receives the last player (the player with the largest height).
 
        For this particular algorithm, when two or more teams have the same average, the following conditions are used:
            - Raptors have priority over Dragons and Sharks
            - Dragons have priority over Sharks
        These conditions should not influence the effectiveness of the algorithm.
 */

/*
 Parameter: Soccer Team Array
 Returns average height of team, or 0 if team is empty
 */
func averageHeight(forTeam team: [[String:String]]) -> Double {
    var totalHeight:Double = 0
    if team.isEmpty {
        return totalHeight
    }
    for player in team {
        if let playerHeight = player["heightInInches"],
            let playerHeightDouble = Double(playerHeight) {
            totalHeight += playerHeightDouble
        }
    }
    return totalHeight / Double(team.count)
}

/*
 MORE ADVANCED TOOLS:
    - An enum for the team names would be useful for populating the orderByHeightDesc Array
    - Tools to implement a sort method for the teams:
        * Creating a custom Comparable type for Soccer Team where number of experienced players,
            and then average height, determines their sort order
        * Recursion (if I want to make my own sort function)
*/
/*
 NOTE: The sorting method below works for a small number of teams, but it requires switching on
 a tuple with n*(n-1)/2 Bool values for n! cases and a default to deal with the cases that
 can't occur, where n is the number of teams. That gets large pretty quickly as n increases,
 so a different sorting method should be implemented for a large number of teams.
 */
/*
 Parameter: array: Array of Soccer Players
 Sorts Soccer Players from array into every team, evenly distributing the number of players for 
    each team and keeping the average height of each team as close to one another as possible
*/
func appendPlayerToTeams(fromArray array: [[String:String]]) {
    var subIteration = 0
    var orderByHeightDesc: [String] = []
    for player in array {
        if subIteration == 0 {
            let sharksGreaterDragons = averageHeight(forTeam: sharks) > averageHeight(forTeam: dragons)
            let sharksGreaterRaptors = averageHeight(forTeam: sharks) > averageHeight(forTeam: raptors)
            let dragonsGreaterRaptors = averageHeight(forTeam: dragons) > averageHeight(forTeam: raptors)
            
            switch (sharksGreaterDragons, sharksGreaterRaptors, dragonsGreaterRaptors) {
                case (false, false, false): orderByHeightDesc = ["raptors", "dragons", "sharks"]
                case (false, false, true): orderByHeightDesc = ["dragons", "raptors", "sharks"]
                case (false, true, true): orderByHeightDesc = ["dragons", "sharks", "raptors"]
                case (true, false, false): orderByHeightDesc = ["raptors", "sharks", "dragons"]
                case (true, true, false): orderByHeightDesc = ["sharks", "raptors", "dragons"]
                case (true, true, true): orderByHeightDesc = ["sharks", "dragons", "raptors"]
                default: break
            }
        }
        
        switch orderByHeightDesc[subIteration] {
            case "sharks": sharks.append(player)
            case "dragons": dragons.append(player)
            case "raptors": raptors.append(player)
            default: break
        }
        subIteration = (subIteration + 1) % orderByHeightDesc.count
    }
}

appendPlayerToTeams(fromArray: sortedExperiencedPlayers)
appendPlayerToTeams(fromArray: sortedInexperiencedPlayers)

//--------------------------------------------------
//------------------LETTERS MODEL-------------------
//--------------------------------------------------

/*
 Parameters:
    player: Soccer Player to whose guardian(s) the letter is being sent
    team: Name of Soccer Player's team in String format
 Prints a letter for the guardian(s) of the Soccer Player in question to the console
    Letter includes player name, team name, guardian names, and date/time of first practice
    Letter also includes player height in inches, and indicates whether the player has prior experience
*/
func sendLetter(toPlayer player: [String:String], fromTeam team: String) {
    if let guardianNames = player["guardianNames"],
       let playerName = player["playerName"],
       let hasSoccerExperience = player["hasSoccerExperience"],
       let heightInInches = player["heightInInches"] {
        var practiceTime = ""
        switch team {
            case "Sharks": practiceTime = "March 17 at 3:00 PM"
            case "Dragons": practiceTime = "March 17 at 1:00 PM"
            case "Raptors": practiceTime = "March 18 at 1:00 PM"
            default: practiceTime = "unknown"
        }
        
        let experienceResponse = hasSoccerExperience == "YES" ?
            "This feat is particularly impressive for \(playerName), who appears to be vertically challenged with a mere \(heightInInches) inches in height to their name. However, \(playerName)'s level of experience no doubt placed them a cut above the rest of their teammates!\n\n" :
            "We can't help but note \(playerName)'s obvious lack of experience. They often attempted to pick up the ball with their hands, and nearly kicked their teammate in the head due to their wild inaccuracy when it comes to kicking. However, their height of \(heightInInches) inches is an incredibly ideal height for a soccer player, particularly at their age. Because of this, \(playerName) managed to make the cut!\n\n"
        
        var script = "DOCUMENT DATED: 20 MAR 2016\n\n"
        script += "Hello, \(guardianNames)!\n\n"
        script += "We are proud to say that your child, \(playerName), has managed to earn a place among the \(team)!\n\n"
        script += experienceResponse
        script += "We do have a strict attendance policy. \(playerName) must attend every practice, and arrive at least 20 minutes early to every practice. If they don't, they will be kicked off the team and their former teammates will be forced to shun them until the end of time. There can be no exceptions without notice at least a Neptunian year in advance. Please do not put \(playerName) or their teammates through such an ordeal. \(playerName)'s first practice is \(practiceTime). Don't be late. No one will like it if \(playerName) is late.\n\n"
        script += "We look forward to seeing \(playerName) 20 minutes before practice, every single practice!\n\n"
        script += "Thank you for signing \(playerName) up for Soccer Practice from Hell. We hope you and your child have a pleasant day!\n\n"
        script += "P.S.\nIf you've received this letter, \(guardianNames), you know that we know where you live. We also know that \(playerName) did not attend practice 20 minutes before \(practiceTime). We now have no choice but to shun \(playerName) until eternity itself winds to a stop. We told you to attend. We told you not to be late. Now no one is happy, and it is entirely your fault, \(guardianNames). We hope you and \(playerName) are satisfied with your poor decision."
        print(script)
    }
}

// Prints letters for all Soccer Players to console
print("LETTERS TO THE SHARKS\n--------------------------------------------------------")
for shark in sharks {
    print("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
    sendLetter(toPlayer: shark, fromTeam: "Sharks")
}
print("\n--------------------------------------------------------\n")
print("LETTERS TO THE DRAGONS\n--------------------------------------------------------")
for dragon in dragons {
    print("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
    sendLetter(toPlayer: dragon, fromTeam: "Dragons")
}
print("\n--------------------------------------------------------\n")
print("LETTERS TO THE RAPTORS\n--------------------------------------------------------")
for raptor in raptors {
    print("\n-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-\n")
    sendLetter(toPlayer: raptor, fromTeam: "Raptors")
}






