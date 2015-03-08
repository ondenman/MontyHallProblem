rounds = 999999				# number of rounds played
firstDoor = 0				# tally of number of times the car was selected on first pick
remainingDoor = 0			# number of times the car was behind remaining door

unshuffledArray = ["goat","goat","car"]

rounds.times do

	shuffledArray = unshuffledArray.shuffle
	chosen = []

	firstChoice = rand(3)
	chosen << firstChoice
	montyDoor = rand(3)

	while firstChoice == montyDoor or shuffledArray[montyDoor] == "car"
		montyDoor = rand(3)
	end

	chosen << montyDoor
	chosenAndChoices = chosen + [0,1,2]
	notChosen = chosenAndChoices - chosen

	case
		when shuffledArray[firstChoice] == "car"
			firstDoor += 1
		when shuffledArray[notChosen[0]] == "car"
			remainingDoor += 1
		when shuffledArray[montyDoor] == "car"
			puts "Error! Monty chose the car!"
	end

end

puts "The car was behind the first door #{firstDoor} times. \nIt was behind the remaing door, #{remainingDoor} times!"

if firstDoor > remainingDoor
	puts "The player has a better chance of winning the car by sticking with their first choice!"
elsif firstDoor == remainingDoor
	puts "It does not matter if the player sticks with their first choice or switches. The chance of winning the car is 50/50"
elsif remainingDoor > firstDoor
	puts "The player will more likely win the car if they switch their choice to the remaing door!"
else
	puts "Something's gone wrong!"
end


