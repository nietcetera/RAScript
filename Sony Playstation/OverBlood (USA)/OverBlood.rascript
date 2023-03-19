// OverBlood
// #ID = 11656
// MD5: 248e739606f2fe50a8ddf914ad48e040 - OverBlood (USA)
//
// GameFAQs: https://gamefaqs.gamespot.com/ps/198246-overblood/faqs/4072
//
// Items
// -----------------
// Jacket x1
// Memory Chip x1
// Voice Recorder x1
// Silver Card Key x1
// Memo x1
// Laser Knife x1
// Anti-Gravity Device x1
// Sample Case x1
// Broken Thermostat x1
// Oil Container x1
// Capsule x1
// Hand Gun x1
// Silver Key x1
// Iron Rods x1
// Stun Gun x1
// Metal Grate x1
// Burner x1
// Red Card Key x1
// Compact Data Disc x1
// Gold Card Key x1
// Allen Wrench x1
// Dead Battery x1
// Charged Battery x1
// Identification Card x1
// Clip x8
// - Atrium
// - Cave Room (Lounge)
// - R38-6
// - Gold Key Card cavern
// - Compact Disc Control Room (machine right of door)
// - Suit Hangar
// - Trash Compactor, underground
// - ID card room (body)
// Emergency Spray x5
// - Chemical Storage Area
// - Research Lab (red tank before testing virus)
// - Kitchen (strawberries)
// - Compact Disc Control Room (back right corner)
// - ID card room (under table)
// Total: 37 Items
//
// Encounters
// -----------------
// Refrigeration Room
// Anti-Gravity Crush
// Earthquake
// Enemy - Laboratory
// Enemy - Hallway after water encounter
// Enemy - Hovercraft Room
// Enemy - Personnel Quarters
// Enemy - Cave walkway
// Runaway train
// Rushing water
// Hovercraft scene
// Final Boss Part 1
// Final Boss Part 2
//
// Codes
// -----------------
// First passcode door: 61891
// Lasers: 91861
//
// Achievements
// -----------------
// Progression:
// - Unlock the refrigeration room (5 points)
// - Obtain the laser knife (2 points)
// - Obtain the anti-gravity device (2 points)
// - Give full power to the doors (2 points)
// - Platform through the generator (5 points)
// - Timed door (2 points)
// - Pipo (2 points)
// - Got the capsule (2 points)
// - Blew up the wall (2 points)
// - Opened the 3 openable vents (2 points)
// - Atrium scene (5 points)
// - Watch the laptop in the personnel quarters (2 points)
// - Extract the virus from Raz (2 points)
// - Use the disc in the data room (2 points)
// - Enter the top floor of the complex (5 points)
// - Insert Pipo's chip into the computer (2 points)
// - Complete the game (10 points)
//
// Challenges:
// - Refrigeration Room over 90% health (5 points)
// - Door event over 80% health (5 points)
// - Laboratory encounter no damage (5 points)
// - Sewer exit encounter no damage (5 points)
// - Personnel quarters hall encounter no damage (5 points)
// - Hovercraft storage encounter no damage (5 points)
// - Hovercraft event no damage no jumping (10 points)
// - Cave Walkway event no damage (5 points)
// - Director fight I no damage (10 points)
// - Director fight II no damage (25 points)
// - All items (10 points)
// - Beat the game in under 2 hours (10 points)
// - Beat the game without firing the hand gun (25 points)
// - Beat the game in first-person (25 points)
// 
// Misc: 
// - Give full power to the lights (1 point)
// - Give full power to the air conditioning (1 point)
// - Discover Raz's favorite snack in the kitchen (1 point)
// - Read the name on the painting in the lounge (1 point)


// Code Notes and Functions
// ----------------------------------
//
// $08148C: [8-bit]
//          Hundreds place of the finale timer
function finale_hundreds() => byte(0x08148C)

// $081490: [8-bit]
//          Tens place of the finale timer
function finale_tens() => byte(0x081490)

// $081494: [8-bit]
//          Ones place of the finale timer
function finale_ones() => byte(0x081494)

function finale_time()
{
    return finale_hundreds() * 100 +
           finale_tens() * 10 +
           finale_ones()
}

// $0CF8E4: Bit 0 - In Combat
function in_combat() => bit0(0x0CF8E4)

// $0CF8F4: [8-bit] Life meter value
//          0x00 - 0x64
function current_health() => byte(0x0CF8F4)

// $0CF8FC: [8-bit] Enemy life meter value
//          0x00 - 0x64
function enemy_health_one() => byte(0xCF8FC)

// $0CF8FD: [8-bit] Enemy life meter value 
// (Part 2, used when total health greater than 0xff)
function enemy_health_two() => byte(0xCF8FD)

// $0CF934: [Upper4] Face Buttons
//          Bit 4 - Triangle
//          Bit 5 - Circle
//          Bit 6 - Cross
//          Bit 7 - Square
function square_pressed() => bit7(0x0CF934)

// $0CF935: [Upper4] D-Pad
//          Bit 4 - Up
//          Bit 5 - Right
//          Bit 6 - Down
//          Bit 7 - Left
// $0CFC1C: [8-bit] Door Control Puzzle - Highlighted Option
//          0x00, 0x01, 0x02

// $0CF834: [8-bit] Frame Counter part 1
function time_one() => byte(0x0CF834)

// $0CF835: [8-bit] Frame Counter part 2
function time_two() => byte(0x0CF835)

// $0CF836: [8-bit] Frame Counter part 3
function time_three() => byte(0x0CF836)

// $0EE7D8: [8-bit] Part 1 of ID of interaction being performed
//          Interactions are unique per room ID (0x0ee7e4)
//          Paired with Part 2 (0x0ee7dc) to form a full interaction ID
//          Values: 0x00, 0x01, 0x02
function interaction_id_part_one() => byte(0x0EE7D8)
int_finished_one = 0x00
int_door_crush_one = 0x00
int_switches_one = 0x01
int_top_floor_one = 0x01
int_food_one = 0x01
int_sig_one = 0x01
int_beat_game_one = 0x00
int_sterilization_one = 0x01
int_rock_dodge_one = 0x02
int_dodge_finished_one = 0x00

// $0EE7DC: [8-bit] Part 2 of ID of interaction being performed
//          Interactions are unique per room ID (0x0ee7e4)
//          Paired with Part 1 (0x0ee7d8) to form a full interaction ID
//          
//          Broken Door Room:
//          0x00 0x0b - Door crush scene
//          0x01 0x0c - Switches
//          0x00 0x0e - Earthquake scene
//          0x00 0x0f - Falling platforms
//          
//          Laboratory:
//          0x00 0x0a - Pre encounter 1
//          
//          Cafeteria:
//          0x01 0x10 - "It's a strawberry flavor."
//          
//          Hovercraft Event:
//          0x02 0x0d - Beginning of event
//          0x00 0x0f - End of event
//          
//          Cave Walkway:
//          0x01 0x0b - "Milly!"
//          
//          Hangar:
//          0x01 0x0b - Final confrontation
//          0x00 0x0c - Fried the final boss (beat the game)
//
//          Lounge:
//          0x01 0x11 - "There's a signature here."
function interaction_id_part_two() => byte(0x0EE7DC)
int_finished_two = 0x00
int_door_crush_two = 0x0b
int_switches_two = 0x0c
int_top_floor_two = 0x0b
int_food_two = 0x10
int_sig_two = 0x11
int_beat_game_two = 0x0c
int_sterilization_two = 0x0b
int_rock_dodge_two = 0x0d
int_dodge_finished_two = 0x0f

// $0EE7E4: [8-bit] Room ID
//          0x00 - Title/Intro
//          0x01 - Refrigeration Room
//          0x02 - Outfit Room
//          0x03 - Power Room
//          0x04 - Elevator Room
//          0x05 - Biological Storage Room
//          0x06 - Statue Room
//          0x07 - 2F Walkway
//          0x09 - Generator
//          0x0b - Ventilation Control Room
//          0x0c - Laboratory Hallway
//          0x0d - Laboratory
//          0x0e - Chemical Storage Room
//          0x0f - Railway Station
//          0x10 - Sterilization Room
//          0x11 - Sterilization Control Room
//          0x12 - Ventilation Shaft - Control Room
//          0x13 - Atrium
//          0x14 - Sewer Entrance
//          0x15 - Sewer
//          0x16 - Sewer Intake Tunnel
//          0x17 - Maintenance Elevator
//          0x18 - Fan Room
//          0x20 - Cafeteria
//          0x27 - Cave Walkway
//          0x28 - Hovercraft Launchpad South
//          0x2b - Cloning Chamber Entrance
//          0x2c - Cloning Chamber
//          0x2d - Director's Hallway
//          0x2e - Staff Room
//          0x1b - Lounge
//          0x1c - Broken Walkway
//          0x1d - Virus Extraction Room
//          0x1e - Security Room
//          0x1f - Biohazard Suit Room
//          0x23 - Hovercraft Launchpad South
//          0x24 - Hovercraft Storage Room
//          0x26 - Personnel Maintenance Tunnel
//          0x29 - Personnel Quarters Hallway
//          0x31 - Hangar
//          0x32 - Director's Elevator
//          0x2f - Director's Room
//          0x66 - Refrigeration Room Hallway
//          0x67 - Elevator T Hallway
//          0x68 - Elevator Entrance Hallway
//          0x69 - Alarm Hallway
//          0x6a - Passcode Door Hallway
//          0x6b - Y Shaped Hallway
//          0x6c - Generator Hallway
//          0x6d - Generator Pipe Walkway
//          0x6e - Generator Auxiliary Shaft
//          0x6f - Broken Door Hallway
//          0x71 - Generator Interior Hallway
//          0x79 - Timed Door Hallway
//          0x7b - Sterilization Room Hallway
//          0x7c - Sewer Exit Hallway
//          0x7d - Elevator Room 2F
//          0x83 - Personnel R38-1
//          0x84 - Personnel R38-2
//          0x85 - Personnel R38-3
//          0x86 - Personnel R38-4
//          0x87 - Personnel R38-5
//          0x88 - Personnel R38-6
//          0x89 - Personnel R38-7
//          0x8a - Personnel R38-8
//          0x8c - Doorway
//          0x8e - Cave Elevator Entrance
//          0x91 - Maintenance Elevator 2F
//          0x92 - Cave Elevator
//          0x93 - Hovercraft Cave
function current_room() => byte(0x0EE7E4)
title_screen = 0x00
room_refrigeration = 0x01
room_power = 0x03
room_biological = 0x05
room_statue = 0x06
room_generator = 0x09
room_broken_door = 0x6f
room_timed_door = 0x79
room_laboratory_hallway = 0x0c
room_laboratory = 0x0d
room_railway = 0x0f
room_vent_control = 0x0b
room_atrium = 0x13
room_laptop_quarters = 0x84
room_virus_extraction = 0x1d
room_security = 0x1e
room_cloning_entrance = 0x2b
room_director = 0x2f
room_hangar = 0x31
room_sewer_hall = 0x7c
room_personnel_quarters = 0x29
room_hovercraft_storage = 0x24
room_cave_walkway = 0x27
room_cave_dodge = 0x93
room_hover_north = 0x28
room_cafeteria = 0x20
room_lounge = 0x1b
room_sterilization = 0x10

// $0EE7E8: [8-bit] Previous Room ID

// $0EE7EC: [8-bit] Selected character ID
//          0x01 - Raz
//          0x02 - Milly
//          0x03 - Pipo
function current_character() => byte(0x0EE7EC)
character_raz = 0x01
character_milly = 0x02
character_pipo = 0x03
character_none = 0x00

// $0EE7F0: [8-bit] Companion ID
//          0x01 - Raz
//          0x02 - Milly
//          0x03 - Pipo
function current_companion() => byte(0x0EE7F0)

// $0EE7F4: [8-bit] Camera view setting
//          0x00 - Default/Overhead
//          0x01 - Third Person/Behind Player
//          0x02 - First Person
function perspective() => byte(0x0EE7F4)

// $0EE820: [Puzzle]
//          Bit 0 - Vent 1 closed
function event_left_vent() => bit0(0x0EE820)

// $0EE824: [Puzzle]
//          Bit 0 - Vent 2 closed

// $0EE828: [Puzzle]
//          Bit 0 - Vent 3 closed
function event_middle_vent() => bit0(0x0EE820)

// $0EE82C: [Puzzle]
//          Bit 0 - Vent 4 closed
function event_right_vent() => bit0(0x0EE82C)

// Helper for readability when dealing with items
function has_item(item)
{
    return item() == 1
}

// $0EECD8: [Items]
//          Bit 1 - Jacket
//          Bit 2 - Memory Chip
//          Bit 3 - Silver Card Key
//          Bit 4 - Memo
//          Bit 5 - Laser Knife
//          Bit 6 - Anti-Gravity Device
//          Bit 7 - Sample Case
function item_jacket() => bit1(0x0EECD8)
function item_mem_chip() => bit2(0x0EECD8)
function item_cardkey_silver() => bit3(0x0EECD8)
function item_memo() => bit4(0x0EECD8)
function item_laser_knife() => bit5(0x0EECD8)
function item_anti_gravity() =>bit6(0x0EECD8)
function item_sample() => bit7(0x0EECD8)

// $0EECD9: [Items]
//          Bit 0 - Oil Can
//          Bit 1 - Broken Thermostat
//          Bit 3 - Capsule
//          Bit 4 - Hand Gun
//          Bit 5 - Silver Key
//          Bit 6 - Voice Recorder
//          Bit 7 - Iron Rods
function item_oil() => bit0(0x0EECD9)
function item_thermostat() => bit1(0x0EECD9)
function item_capsule() => bit3(0x0EECD9)
function item_gun() => bit4(0x0EECD9)
function item_silver_key() => bit5(0x0EECD9)
function item_voice_recorder() => bit6(0x0EECD9)
function item_capsule() => bit3(0x0EECD9)

// $0EECDA: [Items]
//          Bit 0 - Stun Gun
//          Bit 1 - Metal Grate
//          Bit 2 - Burner
//          Bit 3 - Clip (any)
//          Bit 4 - Red Card Key
//          Bit 5 - Data Disc
//          Bit 6 - Gold Card Key
//          Bit 7 - Emergency Spray (any)
function item_stungun() => bit0(0x0EECDA)
function item_metalgrate() => bit1(0x0EECDA)
function item_burner() => bit2(0x0EECDA)
function item_cardkey_red() => bit4(0x0EECDA)
function item_disc() => bit5(0x0EECDA)
function item_cardkey_gold() => bit6(0x0EECDA)

// $0EECDB: [Items]
//          Bit 0 - Allen Wrench
//          Bit 3 - Dead Battery
//          Bit 4 - Charged Battery
//          Bit 5 - ID Card
function item_allenwrench() => bit0(0x0EECDA)
function item_deadbattery() => bit0(0x0EECDA)
function item_charged_battery() => bit0(0x0EECDA)
function item_idcard() => bit0(0x0EECDA)

// $0EF1A1: [Events]
//          Bit 0 - Start of Player Control
//          Bit 1 - Turned on Auxiliary Power
//          Bit 2 - Used Door Control with Pipo
//          Bit 4 - Got the Jacket
//          Bit 5 - Told about main generator
//          Bit 6 - Unlocked doors from Control Room
//          Bit 7 - Entered the passcode
function event_player_control() => bit0(0x0EF1A1)
function event_aux_power() => bit1(0x0EF1A1)
function event_door_control() => bit2(0x0EF1A1)
function event_obtained_jacket() => bit4(0x0EF1A1)

// $0EF1A2: [Events]
//          Bit 0 - Crossed the big jump
//          Bit 2 - Turned the switch in the Storage Room off
//          Bit 3 - Opened the Storage Room container
//          Bit 5 - Obtained the Laser Knife
//          Bit 6 - Observed the Elevator body
// $0EF1A3: [Events]
//          Bit 0 - Saved Raz from closing door
//          Bit 1 - Activated generator thing with Pipo
//          Bit 2 - Powered the control console in the generator
//          Bit 3 - Saw the Silver Card Key
//          Bit 6 - Obtained the Silver Card Key
// $0EF1A4: [Events]
//          Bit 0 - Statue fell
//          Bit 1 - Triggered the earthquake
//          Bit 3 - Survived the earthquake
//          Bit 4 - Discussed the big jump with Pipo
//          Bit 5 - Cut through the metal grate
//          Bit 6 - Used AGD on big jump
//          Bit 7 - Alerted to Memo item by Pipo
// $0EF1A5: [Events]
//          Bit 6 - Asked Pipo to use the door unlock
// $0EF1A6: [Events]
//          Bit 0 - In generator grate as Pipo (reverts to 0 after leaving)
//          Bit 1 - "Hey, it closed."
//          Bit 2 - "Is there anything I can do to lift it?"
//          Bit 3 - Got through the timed door as Raz
//          Bit 4 - Got through the timed door as Pipo
//          Bit 5 - Saw someone run away
//          Bit 6 - Used the allen wrench in the underground hallway
//          Bit 7 - Pushed the cabinet to reach the door in personnel quarters
function event_timed_door_raz() => bit3(0x0EF1A6)
function event_timed_door_pipo() => bit4(0x0EF1A6)

// $0EF1A7: [Events]
//          Bit 0 - "There is someone here, someone alive!"
//          Bit 3 - Memory Chip (post pipo)
//          Bit 4 - Solved control room power puzzle
//          Bit 5 - Viewed Unlocked Doors from Control Room
//          Bit 7 - Sewer door is open
function event_pipo_death() => bit3(0x0EF1A7)

// $0EF1A8: [Events]
//          Bit 0 - Met Milly
//          Bit 2 - "This'll make you feel better"
//          Bit 4 - Survived the water rush
//          Bit 5 - Running from explosion
//          Bit 6 - Explosion has happened
function event_running_explosion() => bit5(0x0EF1A8)
function event_explosion() => bit6(0x0EF1A8)

// $0EF1A9: [Events]
//          Bit 1 - "This may be useful later." Oil can
//          Bit 2 - 1 when on the lower floor of the Chemical Storage room
//          Bit 3 - Sewer "It's kind of hard to walk here"
//          Bit 4 - Oil has been applied to the lift
//          Bit 5 - Dodging train
//          Bit 6 - "Locked up behind this metal grate"
// $0EF1AA: [Events]
//          Bit 0 - Interacted with the switches
//          Bit 3 - "Too heavy to open it"
//          Bit 5 - Used red key card
//          Bit 7 - "Where did that person go?"
// $0EF1AB: [Events]
//          Bit 0 - "What's the point of switches that you can't switch?"
//          Bit 1 - "That should stop the lift from shaking."
//          Bit 2 - Electrified by the security system
//          Bit 3 - Has interacted with the boxes in the Storage Room
//          Bit 4 - Observed the switch in the Storage Room
//          Bit 5 - "Did you turn something off?"
//          Bit 6 - "Pipo wait there."
//          Bit 7 - Applied oil to sewer valve
// $0EF1AC: [Events]
//          Bit 0 - "I'm coming!" vent
//          Bit 2 - "I must have unlocked this door..."
//          Bit 4 - Observed the door with no power
//          Bit 6 - Obtained the Voice Recorder
// $0EF1AD: [Events]
//          Bit 0 - Noticed the control console in the generator
//          Bit 2 - Sterilization room encounter/Atrium
//          Bit 3 - Turned off the fans
//          Bit 5 - Pressed the button in the atrium
//          Bit 0 - Drained the atrium
function event_atrium() => bit2(0x0EF1AD)

// $0EF1AE: [Events]
//          Bit 5 - Used the memory chip on the mainframe
//          Bit 6 - Traversed the generator room
//          Bit 7 - Placed the iron rods
function event_used_chip() => bit5(0x0EF1AE)
function event_traversed_generator() => bit6(0x0EF1AE)

// $0EF1AF: [Events]
//          Bit 0 - Confrontation with Milly about laptop
//          Bit 2 - "Maybe we can bridge the gap!"
//          Bit 4 - "It's out of order"  vending machine in cafeteria
//          Bit 5 - R38-1 door lock
//          Bit 6 - Used the stun gun on the box
//          Bit 7 - Personnel Laptop scene
function event_watched_laptop() => bit7(0x0EF1AF)

// $0EF1B0: [Events]
//          Bit 0 - R38-3 door lock
//          Bit 1 - Used the disc in the security room
//          Bit 2 - R38-7 door lock
//          Bit 3 - Checked broken laptop R38-8
//          Bit 5 - Unlocked door to suit room
function event_watched_disc() => bit1(0x0EF1B0)

// $0EF1B1: [Events]
//          Bit 0 - "There is another hall on the other side" (underground hallway)
//          Bit 1 - "There are halls to the left and right" (underground hallway)
//          Bit 3 - "This door doesn't have a switch"
//          Bit 4 - Operated the chem storage lift manually
//          Bit 6 - Switched to Milly while Raz is in the vents
//          Bit 7 - Lab hallway valve is open
// $0EF1B2: [Events]
//          Bit 2 - Made the jump across the broken walkway
//          Bit 5 - Lasers
//          Bit 6 - Unlocked Gold Card Key door
// $0EF1B3: [Events]
//          Bit 2 - Accessed ventilation control
//          Bit 3 - Timed door open
//          Bit 4 - Noticed grate in sewer
//          Bit 5 - Passed under sewer grate
//          Bit 6 - Control Room Lighting has power
//          Bit 7 - Control Room Door has power
function power_lights() => bit6(0x0EF1B3)
function power_doors() => bit7(0x0EF1B3)

// $0EF1B4: [Events]
//          Bit 0 - Control Room Air Conditioning has power
//          Bit 1 - Start of Sewer Exit encounter
//          Bit 2 - Separated from Milly in cave walkway
//          Bit 3 - Opened Personnel Hall grate with burner
//          Bit 4 - Laboratory door lock unlocked
//          Bit 5 - Devirused
//          Bit 6 - "This battery's dead"
function power_ac() => bit0(0x0EF1B4)
function event_antivirus() => bit5(0xEF1B4)

// $0EF1B5: [Events]
//          Bit 0 - Beginning of personnel hall encounter
//          Bit 1 - Beginning of hovercraft storage encounter
//          Bit 2 - Beginning of cave walkway encounter
//          Bit 3 - Beginning of director's room encounter
//          Bit 5 - "Too many Raz Karcys"
//          Bit 7 - Pressed the timed door control
// $0EF1B6: [Events]
//          Bit 0 - Being pushed by the fans in the double fan room
//          Bit 1 - "The air duct vent opened!"
//          Bit 2 - Used ID card in director's hall
//          Bit 3 - "I'm going to find him."
//          Bit 4 - "He's been shot in the chest."
//          Bit 5 - "He's holding something"
//          Bit 7 - "Authorized personnel only" director's hall
// $0EF1B7: [Items/Events]
//          Bit 2 - "All the scientists dead!"
//          Bit 3 - "This was the security switch!"
//          Bit 4 - Told Milly to wait for your signal (final boss)
//          Bit 6 - Clip - Atrium
//          Bit 7 - Clip - Lounge
function event_queued_milly() => bit4(0x0EF1B7)
function item_clip_atrium() => bit6(0x0EF1B7)
function item_clip_lounge() => bit7(0x0EF1B7)

// $0EF1B8: [Items/Events]
//          Bit 0 - Clip (Personnel Quarters)
//          Bit 1 - Clip (Biohazard Suit Room)
//          Bit 2 - Clip (Trash Compactor)
//          Bit 3 - Clip (Staff Room)
//          Bit 4 - "A trash compactor."
//          Bit 6 - "He's holding something" (staff room)
//          Bit 7 - Dropped into underground corridor
function item_clip_personnel() => bit0(0x0EF1B8)
function item_clip_suit() => bit1(0x0EF1B8)
function item_clip_trash() => bit2(0x0EF1B8)
function item_clip_staff() => bit3(0x0EF1B8)

// $0EF1BA: [Items/Events]
//          Bit 0 - Emergency Spray - Chemical Storage room
//          Bit 1 - Emergency Spray - Sterilization Control Room
//          Bit 2 - Emergency Spray - Cafeteria
//          Bit 3 - Emergency Spray - Staff Room
//          Bit 4 - "It's a strawberry flavor"
//          Bit 5 - 1 when on the console platform in the generator room
function item_spray_chemical() => bit0(0x0EF1BA)
function item_spray_sterilization() => bit1(0x0EF1BA)
function item_spray_cafeteria() =>  bit2(0x0EF1BA)
function item_spray_staff() => bit3(0x0EF1BA)

// $0EF1BB: [Items]
//          Bit 0 - Clip (Underground Lake, Personnel Hall)
//          Bit 2 - Clip (Security Room)
//          Bit 3 - Emergency Spray (Security Room)
function item_clip_underground() => bit0(0x0EF1BB)
function item_clip_security() => bit2(0x0EF1BB)
function item_spray_security() => bit3(0x0EF1BB)

all_items = [
    item_clip_underground(),
    item_clip_security(),
    item_clip_staff(),
    item_clip_trash(),
    item_clip_suit(),
    item_clip_personnel(),
    item_clip_lounge(),
    item_clip_atrium(),
    item_spray_security(),
    item_spray_staff(),
    item_spray_cafeteria(),
    item_spray_sterilization(),
    item_spray_chemical(),
    item_jacket(),
    item_mem_chip(),
    item_cardkey_silver(),
    item_memo(),
    item_laser_knife(),
    item_anti_gravity(),
    item_sample(),
    item_oil(),
    item_thermostat(),
    item_capsule(),
    item_gun(),
    item_silver_key(),
    item_voice_recorder(),
    item_capsule(),
    item_stungun(),
    item_metalgrate(),
    item_burner(),
    item_cardkey_red(),
    item_disc(),
    item_cardkey_gold(),
    item_allenwrench(),
    item_deadbattery(),
    item_charged_battery(),
    item_idcard()
]

all_clips = [
    item_clip_underground(),
    item_clip_security(),
    item_clip_staff(),
    item_clip_trash(),
    item_clip_suit(),
    item_clip_personnel(),
    item_clip_lounge(),
    item_clip_atrium(),
]

all_sprays = [
    item_spray_security(),
    item_spray_staff(),
    item_spray_cafeteria(),
    item_spray_sterilization(),
    item_spray_chemical(),
]

// $0EDFF4: [8-bit] Number of bullets left in hand gun
// 0x00-0x0a
function loaded_bullets() => byte(0x0EDFF4)

// $0EF524: [Inventory]
//          8-bit - Number of Clips in inventory
//          0x00 - 0x09
function clips_remaining() => byte(0x0EF524)

// $0EF534: [Inventory]
//          8-bit - Number of Emergency Sprays in inventory
//          0x00 - 0x09
function sprays_remaining() => byte(0x0EF534)

// Function for checking that all flags in an array have been complete
function check_complete(items)
{
    return sum_of(items, i => prev(i)) == length(items) - 1 &&
           measured(sum_of(items, i => i) == length(items))
}

// Use for achievements with "complete event" requirement
function achievement_trigger_event(title, points, description, room, event)
{
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room &&
                  event() == 1 &&
                  prev(event()) == 0
    )
}
achievement_trigger_event(
    "For-e-ver. For-e-ver.",
    5,
    "Unlock the door of the refrigeration room.",
    room_refrigeration,
    event_door_control
)
achievement_trigger_event(
    "Raz Bandicoot",
    5,
    "Platform your way through the generator.",
    room_generator,
    event_traversed_generator
)
achievement_trigger_event(
    "Funeral for a Friend",
    5,
    "Mourn the death of a companion.",
    room_laboratory_hallway,
    event_pipo_death
)
achievement_trigger_event(
    "Deconaminated",
    5,
    "Survive a near-fatal encounter with Milly.",
    room_atrium,
    event_atrium
)
achievement_trigger_event(
    "Igpay Atinlay",
    2,
    "Discover Milly's secret.",
    room_laptop_quarters,
    event_watched_laptop
)
achievement_trigger_event(
    "Good Luck, I've got Norton",
    2,
    "Save Raz from a terrible fate.",
    room_virus_extraction,
    event_antivirus
)
achievement_trigger_event(
    "Found Footage",
    2,
    "Watch the data disc.",
    room_security,
    event_watched_disc
)
achievement_trigger_event(
    "Random Access Memories",
    2,
    "Receive help from an old friend.",
    room_director,
    event_used_chip
)

// Use when multiple events need to be checked
function achievement_trigger_event_AND(title, points, description, room, event_one, event_two)
{
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room &&
                  event_one() == 1 &&
                  event_two() == 1 &&
                  (prev(event_one()) == 0 || prev(event_two()) == 0)
    )
}
achievement_trigger_event_AND(
    "Short Stuff", 
    2, 
    "Traverse the timed door with Raz and Pipo.", 
    room_timed_door, 
    event_timed_door_raz,
    event_timed_door_pipo
)

// One-off, one flag needs to be set and another not set to trigger properly
achievement(
    title="Chemical Engineering",
    description="Blast a hole through the wall of the railway and survive.",
    points=2,
    trigger = current_room() == room_railway && 
              event_running_explosion() == 0 &&
              event_explosion() == 1 && 
              prev(event_explosion()) == 0
)
    
// Use for achievements with "obtain item" requirement.
function achievement_got_item(title, room, item, item_name)
{
    achievement(
        title = title,
        description = "Obtain the " + item_name + ".",
        points = 2,
        trigger = current_room() == room && item() == 1 && prev(item()) == 0
    )
}
achievement_got_item("Rune Dagger (p)", room_biological, item_laser_knife, "Laser Knife")
achievement_got_item("Top Heavy", room_statue, item_anti_gravity, "Anti-Gravity Device")
achievement_got_item("Ay-Ar-En-Ay", room_laboratory, item_capsule, "Capsule")

// One-off achievement for opening all 3 vents in the vent puzzle
// SCRAPPED: there is a small chance the player will switch back and forth
// between characters opening one vent at a time to progress.
// achievement(
//     title = "Emergency Meeting",
//     description = "Open all three vents for Raz.",
//     points = 2,
//     trigger = current_room() == room_vent_control &&
//               event_left_vent() == 0 &&
//               event_middle_vent() == 0 &&
//               event_right_vent() == 0 &&
//               (
//                   prev(event_left_vent()) == 1 ||
//                   prev(event_middle_vent()) == 1 ||
//                   prev(event_right_vent()) == 1
//               )
// )

// Use for achievements related to triggering x event,
// when x is not represented by an event flag.
function achievement_triggered_interaction(title, description, points, room, int_one, int_two)
{
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room &&
                  interaction_id_part_one() == int_finished_one &&
                  interaction_id_part_two() == int_finished_two &&
                  prev(interaction_id_part_one()) == int_one &&
                  prev(interaction_id_part_two()) == int_two
    )
}

achievement_triggered_interaction(
    "Top Floor!",
    "Reach the top floor of the facility.",
    5,
    room_cloning_entrance,
    int_top_floor_one,
    int_top_floor_two
)
achievement_triggered_interaction(
    "Picky Eater [m]",
    "Discover Raz's favorite food in the cafeteria.",
    1,
    room_cafeteria,
    int_food_one,
    int_food_two
)
achievement_triggered_interaction(
    "Original Ra Ka [m]",
    "Read the signature on the painting in the Lounge.",
    1,
    room_lounge,
    int_sig_one,
    int_sig_two
)
achievement_triggered_interaction(
    "Lystran no Longer",
    "Complete the game.",
    10,
    room_hangar,
    int_beat_game_one,
    int_beat_game_two
)
// Use for achievements related to the power puzzle in the control room
function achievement_power(title, power_name, points, power_on, power_off_one, power_off_two)
{
    achievement(
        title = title,
        description = "Give full power to the " + power_name + ".",
        points = points,
        trigger = current_room() == room_power &&
                  power_on() == 1 &&
                  power_off_one() == 0 &&
                  power_off_two() == 0 &&
                  (
                      prev(power_on()) == 0 ||
                      prev(power_off_one()) == 1 ||
                      prev(power_off_two()) == 1
                  )
    )
}
achievement_power("Master of Unlocking", "doors", 2, power_doors, power_lights, power_ac)
achievement_power("Master of Harsh Lighting [m]", "lights", 1, power_lights, power_doors, power_ac)
achievement_power("Master of Not Breathing [m]", "air conditioner", 1, power_ac, power_lights, power_doors)

// Use for achievements with "complete event x with y health remaining" requirement.
function achievement_underpar_event(title, remaining, room, start_event, end_event)
{
    achievement(
        title = "OverAchiever: " + title + " [m]",
        description = "Complete the " + title + " event with " + 
                      remaining + "% or more life remaining.",
        points = 5,
        trigger = once(current_room() == room &&
                       start_event() == 1 &&
                       prev(start_event()) == 0
                  ) &&
                  trigger_when(
                      end_event() == 1 && 
                      prev(end_event()) == 0
                  ) &&
                  disable_when(
                      current_health() < remaining, 
                      until=current_room() == title_screen
                  )
    )
}
achievement_underpar_event(
    "Room Temperature", 
    90, 
    room_refrigeration, 
    event_player_control, 
    event_obtained_jacket
)

// Use for achievements with "complete event x with y health remaining" requirement
function achievement_underpar_interaction(title, remaining, room)
{
    achievement(
        title = "OverAchiever: " + title + " [m]",
        description = "Complete the " + title + " event with " + 
                      remaining + "% or more life remaining.",
        points = 5,
        trigger = once(
                      current_room() == room &&
                      in_combat() == 1 &&
                      prev(in_combat()) == 0
                  ) &&
                  trigger_when(
                      current_room() == room && 
                      in_combat() == 0 &&
                      prev(in_combat()) == 1
                  ) &&
                  disable_when(
                      current_health() < remaining, 
                      until=current_room() == title_screen
                  )
    )
}
achievement_underpar_interaction(
    "Raz Sandwich", 
    80, 
    room_broken_door
)

// Use for damageless achievements
function achievement_nodamage(title, location, points, room)
{
    achievement(
        title = "OverAchiever: " + title + " [m]",
        description = "Complete the " + location + " encounter without taking damage.",
        points = points,
        trigger = once(
                      current_room() == room && 
                      in_combat() == 1 &&
                      prev(in_combat()) == 0
                  ) &&
                  trigger_when(
                      current_room() == room && 
                      in_combat() == 0 && 
                      prev(in_combat()) == 1
                  ) &&
                  disable_when(
                      current_health() < prev(current_health()),
                      until=current_room() == title_screen
                  )
    )
}
achievement_nodamage("Lab Battle", "laboratory", 5, room_laboratory)
achievement_nodamage("Swamp Thing", "sewer hallway", 5, room_sewer_hall)
achievement_nodamage("Nothing Personnel", "personnel quarters", 5, room_personnel_quarters)
achievement_nodamage("Hovercraft Hoedown", "hovercraft storage", 5, room_hovercraft_storage)
achievement_nodamage("Cave Shooter", "cave walkway", 5, room_cave_walkway)
achievement_nodamage("Director's Cut", "director's room", 10, room_director)

// One-off for final boss, slightly different trigger timing
achievement(
    title = "OverAchiever: Nitro Fueled [m]",
    description = "Complete the hangar encounter without taking damage.",
    points = 25,
    trigger = once(
                  current_room() == room_hangar && 
                  in_combat() == 1 && 
                  prev(in_combat()) == 0 &&
                  event_queued_milly() != 1
              ) &&
              trigger_when(
                  current_room() == room_hangar && 
                  interaction_id_part_one() == int_beat_game_one &&
                  interaction_id_part_two() == int_beat_game_two &&
                  (
                      prev(interaction_id_part_one()) != int_beat_game_one ||
                      prev(interaction_id_part_two()) != int_beat_game_two
                  )
              ) &&
              disable_when(
                  current_health() < prev(current_health()), 
                  until=current_room() == title_screen
              )
)

// One-off for hovercraft event, stricter requirements
achievement(
    title = "OverAchiever: Nerves of Stone [m]",
    description = "Complete the cave dodge event without taking damage or jumping.",
    points = 10,
    trigger = once(
                  current_room() == room_cave_dodge && 
                  interaction_id_part_one() == int_finished_one &&
                  interaction_id_part_two() == int_finished_two &&
                  prev(interaction_id_part_one()) == int_rock_dodge_one &&
                  prev(interaction_id_part_two()) == int_rock_dodge_two &&
                  in_combat() == 1
              ) &&
              trigger_when(
                  current_room() == room_cave_dodge &&
                  interaction_id_part_one() == int_dodge_finished_one &&
                  interaction_id_part_two() == int_dodge_finished_two &&
                  in_combat() == 0
              ) &&
              disable_when(      
                  current_health() < prev(current_health()) || 
                  square_pressed() == 1,
                  until=current_room() == title_screen
              )
)

// One-off for finale, different logic
achievement(
    title = "OverAchiever: Frantic Finale [m]",
    description = "Complete the finale with 250 or more seconds remaining.",
    points = 10,
    trigger = current_room() == room_hangar && 
              interaction_id_part_one() == int_beat_game_one &&
              interaction_id_part_two() == int_beat_game_two &&
              (
                  prev(interaction_id_part_one()) != int_beat_game_one ||
                  prev(interaction_id_part_two()) != int_beat_game_two
              ) &&
              finale_time() >= 250
)


// Use for "obtain all of x item type" achievement
function achievement_all_items(title, item_name, points, item_list)
{
    achievement(
        title = title + " [m]",
        description = "Obtain every " + item_name + " in the game.",
        points = points,
        trigger = check_complete(item_list)
    )
}
achievement_all_items("OverEncumbered", "item pickup", 10, all_items)
achievement_all_items("Up Your Arsenal", "hand gun clip", 3, all_clips)
achievement_all_items("Pharmacist", "emergency spray", 3, all_sprays)

// Control all three characters in one session
// Updated: control changes to Milly by default for a couple of seconds during a cutscene.
// added an unless call to prevent that from happening.
achievement(
    title = "Three Gadgeteers [m]",
    description = "In a single session, take control of every playable character.",
    points = 5,
    trigger = measured(
                  tally(3,
                      once(current_character() == character_raz),
                      once(current_character() == character_pipo),
                      once(current_character() == character_milly)
                  )
              ) &&
              unless(
                  current_room() == room_sterilization &&
                  interaction_id_part_one() == int_sterilization_one &&
                  interaction_id_part_two() == int_sterilization_two
              ) &&
              never(current_room() == title_screen)
)

// Helper for getting time spent in game
function elapsed_time()
{
    return time_three() * 65536 +
           time_two() * 255 +
           time_one()
}

two_hours_in_frames = 43200

// Speedrun achievement
achievement(
    title = "UnderPar [m]",
    description = "Beat the game in under 2 hours.",
    points = 10,
    trigger = current_room() == room_hangar &&
              interaction_id_part_one() == int_finished_one &&
              interaction_id_part_two() == int_finished_two &&
              prev(interaction_id_part_one()) == int_beat_game_one &&
              prev(interaction_id_part_two()) == int_beat_game_two &&
              elapsed_time() < two_hours_in_frames
)

// First person achievement
achievement(
    title = "King's Blood [m]",
    description = "In a single session, complete the game without leaving first-person (forced perspective rooms OK).",
    points = 25,
    trigger = once(
                  current_room() == room_refrigeration && 
                  event_player_control() == 1
              ) &&
              trigger_when(
                  current_room() == room_hangar && 
                  interaction_id_part_one() == int_finished_one &&
                  interaction_id_part_two() == int_finished_two &&
                  prev(interaction_id_part_one()) == int_beat_game_one &&
                  prev(interaction_id_part_two()) == int_beat_game_two
              ) &&
              disable_when(
                  perspective() != 2 && event_aux_power() == 1,
                  until=current_room() == title_screen
              )
)

// Fists only achievement
achievement(
    title = "Big Trouble in Little Lystra [m]",
    description = "In a single session, complete the game without using the hand gun (cutscenes OK).",
    points = 25,
    trigger = once(current_room() == room_refrigeration && event_player_control() == 1) &&
              trigger_when(
                  current_room() == room_hangar &&
                  interaction_id_part_one() == int_finished_one &&
                  interaction_id_part_two() == int_finished_two &&
                  prev(interaction_id_part_one()) == int_beat_game_one &&
                  prev(interaction_id_part_two()) == int_beat_game_two
              ) &&
              disable_when(
                  in_combat() == 1 &&
                  (
                      clips_remaining() < prev(clips_remaining()) || 
                      loaded_bullets() < prev(loaded_bullets())
                  ),
                  until=current_room() == title_screen
              )
)

// Rich presence lookup for player location
location_lookup = {
    0x00: "Title Screen",
    0x01: "Refrigeration Room",
    0x02: "Outfit Room",
    0x03: "Power Room",
    0x04: "Elevator Room",
    0x05: "Biological Storage Room",
    0x06: "Statue Room",
    0x07: "2F Walkway",
    0x09: "Generator",
    0x0b: "Ventilation Control Room",
    0x0c: "Laboratory Hallway",
    0x0d: "Laboratory",
    0x0e: "Chemical Storage Room",
    0x0f: "Railway Station",
    0x10: "Sterilization Room",
    0x11: "Sterilization Control Room",
    0x12: "Ventilation Shaft - Control Room",
    0x13: "Atrium",
    0x14: "Sewer Entrance",
    0x15: "Sewer",
    0x16: "Sewer Intake Tunnel",
    0x17: "Maintenance Elevator",
    0x18: "Fan Room",
    0x20: "Cafeteria",
    0x27: "Cave Walkway",
    0x28: "Hovercraft Launchpad South",
    0x2b: "Cloning Chamber Entrance",
    0x2c: "Cloning Chamber",
    0x2d: "Director's Hallway",
    0x2e: "Staff Room",
    0x1b: "Lounge",
    0x1c: "Broken Walkway",
    0x1d: "Virus Extraction Room",
    0x1e: "Security Room",
    0x1f: "Biohazard Suit Room",
    0x23: "Hovercraft Launchpad South",
    0x24: "Hovercraft Storage Room",
    0x26: "Personnel Maintenance Tunnel",
    0x29: "Personnel Quarters Hallway",
    0x31: "Hangar",
    0x32: "Director's Elevator",
    0x2f: "Director's Room",
    0x66: "Refrigeration Room Hallway",
    0x67: "Elevator T Hallway",
    0x68: "Elevator Entrance Hallway",
    0x69: "Alarm Hallway",
    0x6a: "Passcode Door Hallway",
    0x6b: "Y Shaped Hallway",
    0x6c: "Generator Hallway",
    0x6d: "Generator Pipe Walkway",
    0x6e: "Generator Auxiliary Shaft",
    0x6f: "Broken Door Hallway",
    0x71: "Generator Interior Hallway",
    0x79: "Timed Door Hallway",
    0x7b: "Sterilization Room Hallway",
    0x7c: "Sewer Exit Hallway",
    0x7d: "Elevator Room 2F",
    0x83: "Personnel R38-1",
    0x84: "Personnel R38-2",
    0x85: "Personnel R38-3",
    0x86: "Personnel R38-4",
    0x87: "Personnel R38-5",
    0x88: "Personnel R38-6",
    0x89: "Personnel R38-7",
    0x8a: "Personnel R38-8",
    0x8c: "Doorway",
    0x8e: "Cave Elevator Entrance",
    0x91: "Maintenance Elevator 2F",
    0x92: "Cave Elevator",
    0x93: "Hovercraft Cave"
}

// All characters
character_lookup = {
    0x00: "None",
    0x01: "Raz",
    0x02: "Milly",
    0x03: "Pipo"
}

rich_presence_conditional_display(current_room() == title_screen, "Title Screen")
rich_presence_display("{0} is in the {1} [⏰: {2}] [🚶: {3}] [🔫: {4}] [🩹: {5}]",
    rich_presence_lookup("Character", current_character(), character_lookup),
    rich_presence_lookup("Location", current_room(), location_lookup, fallback="Lystra Laboratory"),
    rich_presence_value("Time", elapsed_time(), "FRAMES"),
    rich_presence_lookup("Companion", current_companion(), character_lookup),
    rich_presence_macro("Number", clips_remaining()),
    rich_presence_macro("Number", sprays_remaining())
)

// Leaderboards
function leaderboard_fastest_encounter(title, location, room)
{
    leaderboard(
        title="UnderPar: " + title, 
        description="Complete the " + location + " encounter as fast as possible.",
        start=current_room() == room && in_combat() == 1 && prev(in_combat()) == 0, 
        cancel=current_room() == title_screen || current_health() == 0, 
        submit=current_room() == room && in_combat() == 0 && prev(in_combat()) == 1,
        value=measured(
            tally(0,
                time_one() > prev(time_one())
            )
        ),
        format="FRAMES",
        lower_is_better=true
    )    
}
leaderboard_fastest_encounter(
    "Lab Battle",
    "laboratory",
    room_laboratory
)
leaderboard_fastest_encounter(
    "Swamp Thing",
    "sewer hallway",
    room_sewer_hall
)
leaderboard_fastest_encounter(
    "Nothing Personnel",
    "personnel quarters",
    room_personnel_quarters
)
leaderboard_fastest_encounter(
    "Hovercraft Hoedown",
    "hovercraft storage",
    room_hovercraft_storage
)
leaderboard_fastest_encounter(
    "Cave Shooter",
    "cave walkway",
    room_cave_walkway
)
leaderboard_fastest_encounter(
    "Director's Cut",
    "director's room",
    room_director
)

// One-off for final boss
leaderboard(
    title="UnderPar: Nitro Fueled",
    description="Complete the hangar encounter as fast as possible.",
    start=current_room() == room_hangar && in_combat() == 1 && prev(in_combat()) == 0 && event_queued_milly() == 0,
    cancel=current_room() == title_screen || current_health() == 0,
    submit=current_room() == room_hangar && 
           interaction_id_part_one() == int_beat_game_one && 
           interaction_id_part_two() == int_beat_game_two &&
           (
               prev(interaction_id_part_one()) != int_beat_game_one ||
               prev(interaction_id_part_two()) != int_beat_game_two
           ),
    value=measured(
        tally(0,
            time_one() > prev(time_one())
        )
    ),
    format="FRAMES",
    lower_is_better=true
)

//  Game completion time leaderboard
leaderboard(
    title="UnderPar: Lystra Labyrinth",
    description="Complete the game as fast as possible.",
    start=current_room() == room_hangar && 
          interaction_id_part_one() == int_finished_one && 
          interaction_id_part_two() == int_finished_two &&
          prev(interaction_id_part_one()) == int_beat_game_one &&
          prev(interaction_id_part_two()) == int_beat_game_two,
    cancel=always_false(),
    submit=current_room() == room_hangar && 
          interaction_id_part_one() == int_finished_one && 
          interaction_id_part_two() == int_finished_two &&
          prev(interaction_id_part_one()) == int_beat_game_one &&
          prev(interaction_id_part_two()) == int_beat_game_two,
    value=elapsed_time(),
    format="FRAMES",
    lower_is_better=true
)