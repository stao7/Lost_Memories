VAR gender = ""

-> question

=== question ===
Before the game start, what are your pronouns?
*   [He]
    ~ gender = "boy"
    ** [start game]
        -> top_loop
*   [She]
    ~ gender = "girl"
    ** [start game]
        -> top_loop
*   [They]
    ~ gender = "child"
    ** [start game]
        -> top_loop
->top_loop

=== top_loop ===
{DescribeLocation()}
<- storylets(->top_loop)
<- travel_actions(->top_loop)
-> DONE

LIST locations = jungle, route1, route2, left, right, house, room
VAR currentLocation = jungle
VAR locationsAvailable = (jungle)
VAR oldMan = 0

== function CanTravel(location) ==
~return locationsAvailable ? location

=== travel_actions(->ret)
+ {CanTravel(jungle)}[Proceed]
  You walk into the jungle, trying to catch something in your memory. 
  The visibility in the jungle is very poor. You can barely see the view from ten meters away, because of the fog ahead. Even so, your curiosity keeps you continuing to proceed. You see a mouse staring at you in a tree not far away. After you notice it, the mouse slips away. Everything here all looks very strange. You walked on, watching every footstep carefully. There are dried leaves everywhere, and apart from the movement of animals in the jungle, you can even hear your footsteps and breathing in the darkness. It is cold and windy here.
  ** [You are shivering.] -> meet_someone
+ {oldMan == 0 && CanTravel(left)}[Enter the path on the left.]
-> enter_the_left_alone
+ {oldMan == 0 && CanTravel(right)}[Enter the path on the right.]
-> enter_the_right_alone
+ {oldMan == 1 && CanTravel(right)}[Agree] -> agree
+ {oldMan == 1 && CanTravel(left)}[Disagree] -> disagree

- -> ret

== function DescribeLocation() ==
{ currentLocation:
    - house: 
        You step into the house, and suddenly, every light in the mansion is on, and the whole house is filled with bright lights. After staying in the dark for too long, you are stunned when there are lights everywhere. Then, after you get used to the surroundings, you start to look at the structure and everything in this house. Although it must be a long time since this mansion was built, the decorations inside are beautiful and delicate.
    - jungle:
        It is almost twelve o’clock, and it is time to go to bed. The weather is bad today, it is heavily raining outside of the window. You lie on your bed. You often feel lost these days. You are thinking about your future, career, life, etc. You fall asleep gradually. After a while, you begin to feel awake again, you are a little disappointed, thinking if it will be another sleepless night. You slowly open your eyes, but what comes into your sight is not your room. It is a jungle! You are standing in the middle of the jungle, when you look at your back, all that comes into your sight is trees. You can hear the howl of wolves from the deep. You feel strangely familiar with what you see in front of you, but you are not sure. 
    - route1:
        After about 30 minutes of walking, you finally see the fork.
        {oldMan == 1: Man: I remember the path on the right leads to the mansion. Shall we go this way? I mean, we may need to pass by the mansion, but it is better than being chased by wolves and getting lost.}
    - route2:
        You decide that as you continue to traverse in this world, you’re still unsure of things. You must continue to explore in order to know more. You take the key and open the gate. As you walk in you’re surprised. 

        You’re now inside a house and you see people. Just as the feeling you got earlier with the cloaked stranger, you start to gain similar feelings to these folks. The people in the house recognize you, they welcome you in to open arms and escort you over to the dining room.

        The kind lady asks you if you’re hungry and offers food.
    - left: 
        After another fifteen minutes of walking, all of a sudden, you stop because you think you hear some footsteps. The footsteps were intermittent, suggesting that some creature was walking or watching nearby. You feel as if you can hear some breathing and footsteps that aren't your own, or there are not. You can not tell if they are just illusions of fear or if they're real. You slow down trying to listen carefully, and move on. Gradually, you look at the scene in front of you and you start to feel familiar. You have no idea about what is going on. Have you been here before? Has it ever been in your dreams? You feel that something flashes through your mind, and you're trying to catch that little clue or memory. Wondering what is ahead of you, you try to calm your mind and move on. 
        Suddenly you hear the sound of footsteps moving rapidly to your position from far to near, and you panic as you feel something will soon get closer. You begin to run as hard as you can toward the opposite direction of the footsteps, and more and more fear and uneasiness come over you.
    - right: 
        You see a sense of oddness because fogs make you not see anything around, but the estate is still obvious. The desire to go closer to the mansion increases, and you can't help to run to the front of the gate.
	    Now You are at the front of the gate and are shocked at how significant the mansion is while looking closely. Not a single light is coming out of the house, and everything here is so dark and mysterious. There are many windows that can't count the number. Are you going into the mansion?
}

== meet_someone
You shiver, zip up your coat and walk on. Suddenly, you hear the sound of wood grinding and notice the lighting. You see a light flickering ahead, and you are not quite sure what it is. With doubt, you slowly walk towards the light.
* [Get closer and check out what is over there.] -> check_out_light

== check_out_light
As you get closer and closer to the light, you see a small fire and an old man sits next to it. 
This jungle is so wild. Why are people here? 
The man's clothes are a little messy and he looks exhausted and desperate. He is huddling by the fire, trying to warm his hands. There was some solid food by his side. You gently step forward, and as you get closer, the person finally sees you and slowly looks up at you. All you can see from his eyes is confusion and helplessness.
* [You feel weird.] -> feel_weired
* [Take a close look!] -> take_a_close_look
* [You want to get some information from him.] -> talk_to_man
* Follow the stranger -> Follow
* Stay put and wait for help -> Stay_put

=== Stay_put ===
- You decide to just stand there and wait for more help or options. After waiting for a while, you start to get a little impatient. You start to remember the path that the stranger went out to. Since you don't really know where you are, you figure it might be best just to tag along with the stranger and see where that gets you.
* Follow the stranger -> Follow

=== Follow ===
- You figured that since you don’t really know anything, it might be best to tag along with the stranger so you’ll get more answers of what’s going on.

- As you make an effort to catch up with the stranger, you notice their appearance. They seem oddly familiar. You can’t really make out their appearance since they’re cloaked, but just somehow you feel like you know this person. As you and the stranger continue to walk, you come across a weird gate-like tunnel. The stranger stops and faces you. They present to you a key like they’re almost insisting for you to go in. You seem to be hesitant about this decision.
* Go in with the stranger
~ currentLocation = route2
~ locationsAvailable = ()
->top_loop
* Stay put and wait for help -> Decline

=== Decline ===
- You decide not to take the key. It seems very suspicious so you just decide to hold out until you come up with a more reasonable answer. After waiting for a while, you don’t really know what to do. The stranger still presents to you a key to the gate. What will you do?
* Go in with the stranger
~ currentLocation = route2
~ locationsAvailable = ()
->top_loop

== feel_weired
You feel weird about seeing the man in the jungle, so you decide to leave shortly after. 
* [You want to leave.]
You then continue proceeding alone out of caution.
It was so quiet that no sound was heard except your own footsteps and breathing. You are nervous.
~ currentLocation = route1
~ locationsAvailable = (left, right)
->top_loop

== take_a_close_look
The man looks so terrifying that you get scared and walk past the fire and the man
* [You want to leave.]
You then continue proceeding alone out of caution.
It was so quiet that no sound was heard except your own footsteps and breathing. You are nervous.
~ currentLocation = route1
~ locationsAvailable = (left, right)
->top_loop
* [You want to get some information from him.] -> talk_to_man

== talk_to_man
You were the first to say hello. The man did not answer, he was a little slow on the uptake, not knowing whether it was because he had not seen a human in the jungle for so long, or something else. You are waiting for the old man to respond, quietly looking at each other.
* [Wait for his response.] -> having_conversation

== having_conversation
After a while, the man began to talk. 
Man: Would you like to warm your hands? 
You hesitate. 
You: Ok. 
You sit across from the man, reaching out your hand and rubbing them by the fire.
Man: Why are you here?
* [ I don't know. Maybe I forgot.] -> conversation_continue
* [ I am lost.] -> conversation_continue
* [ I just fell asleep in bed and woke up standing in the jungle.] -> conversation_continue

== conversation_continue
The man did not question what I said, but frowned. He went on talking.
Man: I have been stuck here for five days. Five days ago, I was supposed to walk through this jungle and have an adventure. Before I came in, I prepared enough food to last for a week. After entering the jungle, I found that I was lost, no matter how hard I tried, I never found the way to get out of the jungle.
You listen to the man's story in silence without interrupting him.
The man continued.
Man: If you go on, you will come to a fork in the road. I have been through both ways. One of them, when I went in, there was a very old mansion. Inside the mansion, there was often a wailing, and it sounded very frightening. Though a light could be faintly seen, and a few voices could be heard, the terrible wailing made me afraid and not dare to enter, due to fear of danger. Every time I passed by, I deliberately trod with light steps, since I was afraid of being found by the people inside. I also tried to go on another path at the fork, although there was no eerie whining, but it was possible to encounter a group of wolves. They would flock for food. Whenever I encountered them, I would panic to avoid or run away, causing me to lose directions again. Every time I wake up exhausted looking for a way out, the sight of the jungle in front of me is endless, I get really tired. I regret it. I should not have embarked on this adventure.
* [alas] -> after_listening_his_story

== after_listening_his_story
After listening to the man's story, you have a lot of questions, but you don't say so. You think this man is held prisoner inside the jungle, both psychologically and physically. 
* [You decide to move on and find your own way.]
You then continue proceeding alone out of caution.
It was so quiet that no sound was heard except your own footsteps and breathing. You are nervous.
~ currentLocation = route1
~ locationsAvailable = (left, right)
->top_loop
* [You want to know more about the mansion.] -> ask_more_questions

== ask_more_questions
You: When you passed by the mansion, did you see anything special in the light? Like some machines, or tools, or something else?
Man: No, I am afraid to go in. I could not tell what the danger was. I did not dare go close to it. I always try to walk that way without making any noticeable sounds. Once, near the house, I fell down carelessly and made some noises. I quickly hid behind a large rock and cautiously watched the house. I saw the shadow of someone inside. The man made his way to the door, probably to come out and have a look. Because I was so panicked, I did not look, so I just quietly hid behind a rock.
* [You want to invite him to join.] -> invitation
* [You decide to move on and find your own way.]
You then continue proceeding alone out of caution.
It was so quiet that no sound was heard except your own footsteps and breathing. You are nervous.
~ currentLocation = route1
~ locationsAvailable = (left, right)
->top_loop

== invitation
~oldMan = 1
You: Okay, but we can not just sit back and do nothing. Do you want to find a way out with me?
Man: Aren't you scared? I am so desperate. I have been here for five days.
You: Me too, but I want to try. Maybe we can find a way out?
Man: Well, I can not give up. Let us try again together.
You decide to go forward together. You kept silent with each other and walked on. It was so quiet that no sound was heard except the sound of each other's footsteps and breathing. You are nervous. The old man seemed nervous, too.
* [Continue proceeding.] -> continue_proceeding

== continue_proceeding
You see a lot of moldy food on the road, but there is also edible food. You want to pick it up.
* [Ask if the man want some food.] -> ask_for_suggestions

== ask_for_suggestions
You: There is food here. Do you need it? We can split it evenly, so we will have more food to last us a few more days.
Man: Don't pick it up! These are the remains of those who came to take risks.
You: What do you mean? But these are complete, maybe they just want to reduce the burden on the road.
Man: Look over there. There are some bones.
You look in the direction the man is talking about, and the first thing you see is a thin section of bone. As you look further and further, you see more and more bones on the ground, and you can not tell whether they are animal bones or human bones. The air became heavier and weirder. You are a little lost for words.

After a while.

You: It is okay. Maybe we will make it. No matter what the food source is, we are going to need more food for the rest of the trip.
* [Continue proceeding.]
~ currentLocation = route1
~ locationsAvailable = (left, right)
->top_loop

== enter_the_right_alone
You have no idea what to expect after entering the path on the right.
After ten minutes of walking, you see a mansion which is ten meters away.
* [Continue proceeding]
~ currentLocation = right
~ locationsAvailable = ()
->top_loop

== enter_the_left_alone
You have no idea what to expect after entering the path on the left.
You can hear howls of wolves shortly after.
When you walk down the path, not knowing if you get hallucinations or not, you always think that there are eyes staring at you, and you feel a chill on your back. You can see more and more bones on the path, and you can tell that some of them look like bones of small animals, and some of them are human bones. 
* [Continue proceeding.]
~ currentLocation = left
~ locationsAvailable = ()
->top_loop

== agree
You: OK, let us take this road on the right.
You have a little plan in your mind, you always think that there might be a clue inside the house to help you get out of the jungle.
* [Continue proceeding.] -> enter_the_right_with_man

== enter_the_right_with_man
You continue proceeding together toward the darkness ahead.
After ten minutes of walking, you see a mansion which is ten meters away. You believe this is the mansion the old man mentioned during your early conversation.
* [Continue proceeding]
~ currentLocation = right
~ locationsAvailable = ()
->top_loop

== disagree
You: Although if we enter the path on the left, we may be chased by wolves. However, compared with the possibility of meeting cruel people or terrible human nature, I'd rather take the path on the left.
Man: Are you sure?
You have a disagreement about which path to take.
You: Yes, I want to take the path on the left.
* [Wait for response from the old man.] -> part_ways

== part_ways
Man: I don’t want to take the risk. I think here is where we part ways. Good Luck to you!
The man enters the path on the right, and you enter the path on the left. 
* [Continue proceeding.] -> enter_the_left_after_part_ways

== enter_the_left_after_part_ways
You know that there may be wolves after entering the path on the left, but you want to try. If you can not find a way out, you can always come back and check out the path on the right. The man really gave a terrible description of the mansion.
When you walk down the path, not knowing if you get hallucinations or not, you always think that there are eyes staring at you, and you feel a chill on your back. You can see more and more bones on the path, and you can tell that some of them look like bones of small animals, and some of them are human bones. 
* [Continue proceeding.]
~ currentLocation = left
~ locationsAvailable = ()
->top_loop

=== storylets(->ret) ===
<- route_two_description(ret)
<- left_description(ret)
<- right_description(ret)
<- mansion_description(ret)
-> DONE

=== route_two_description(->ret) ===
{ currentLocation == route2:
    //+ [Vist the fortune teller.]
      -> route_two_body ->
    -> ret
}
-> DONE

=== route_two_body ===
* Kindly accept her offer -> Accept
* Decline -> Saying_no
- ->->

=== Saying_no ===
- You declined her offer and decided not to eat. She seems upset at you, she scolds you telling you that you haven’t been eating a lot and offers again. She asks you once again if you’re hungry.
* Kindly accept her offer -> Accept

=== Accept ===
- You accepted her offer, she seems delighted. She told you that she made your favorite food. You proceed to eat with these folks. The man and woman are enjoying their time with you. 

- After the meal, the man asks if you want to do an activity together. He proposes that you and him both do something together because it has been a while.
* Go do an activity with him -> Play
* Pass on the offer -> No



=== No ===
- You decline his offer and he seems greatly saddened by the rejection. He explains that he finally has time off from work and thought you would like to do something together. A feeling of guilt builds up within you.
* Go do an activity with him -> Play

=== Play ===
- You decide to go do something physical with him. You guys decide to play catch with each other. As you throw around the ball back and forth, the man starts talking about what’s been going on with his life. You and the man converse about what's been going on in each others’ lives. 

- After a while, you need to go use the restroom. You tell the man that you will be right back. Once you arrive at the restroom, you see the cloaked stranger right next to the door. You don’t pay any attention to the stranger and try to open the door. You notice that the door is locked and the cloaked stranger hands out a key. You get a feeling of deja vu and you feel like you know where this will lead. You know that if you take this key you won’t be at this very place anymore. You’re hesitant but you are presented with two options.
* Take the key and open the door -> Continue
* Stay here at the house -> Stay

=== Stay ===
- You decide to stay here at the house where the two people accompanying you are kind but yet familiar people. But you can’t help to feel that you can’t stay here forever. Your mind is hazy and you still don't know too much about this world still. You feel like you need to rethink your decision.
* Take the key and open the door -> Continue

=== Continue ===
- You took the key and opened the door. You enter the room, you notice that you’re now in a different house. You see a lot of familiar but yet unrecognizable faces. You get the same feeling as you did before then. The people in the house seem to be young and around your age. 

- The people in the house notice you and come invite you to hangout with them. You notice that they’re playing your favorite game: Super Smash Bros. As you’re watching them, they come invite you to join them and play.
* Play with them -> Play_With_Them
* Keep watching -> Watch

=== Watch ===
- You explain that you rather just watch them play since it’s funny watching them play anyways. You notice that they have dissatisfaction on their faces and keep nudging you to play.
* Play with them -> Play_With_Them

=== Play_With_Them ===
- You take the controller and join in on the fun. As you’re playing, your mind starts to clear up a little. As you look around the rooms, you actually start to remember their names and their faces become more familiar to you. You can’t quite tell why you feel this way but you don’t pay much attention to it and continue to have fun.

- After a while you remember that you needed to use the restroom. You tell the folks that you were playing with that you needed to go use the restroom. On the way to the restroom, you noticed a cloaked figure next to the door. This time you understand what’s going to happen. You only looked at the cloaked stranger as he hands out the key to you.
* Take the key and move on -> Take_key
* Stay here and continue having fun -> Decide_stay

=== Decide_stay ===
- You decided to continue to stay here. As much fun as that sounds to you, you realize that this journey has only led you to greater things. You slowly start to regain some sense of where you are and who you’re with. The stranger continues to offer the key.
* Take the key and move on -> Take_key

=== Take_key ===
- You take the key and proceed to move on. As you entered through the door, you entered an unknown building. You don’t really know where you are but all you see is a ton of people working in cubicles. 

- As you’re walking around you get some funny looks around from others. Suddenly you’re stopped by someone who seems to be important. He tells you that you have a ton of work due this upcoming week and that you need to get started on it right away. He hands you a stack of paper.
* Take the stack of paper and get to work -> Yes_work
* Decline the work -> No_work

=== No_work ===
- You decline taking the stack of paper from this person. The man handing out the stack of paper seems to be furious, he tells you that if you don’t take this work, you will be in big trouble. He hands the stack of paper to you again.
* Take the stack of paper and get to work -> Yes_work

=== Yes_work ===
- You take the stack of paper and start heading to an empty cubicle you see.

- Once you arrive at the cubicle you notice that there are picture frames of people. You look closer and you recognize that the people in the picture are you and the people you met earlier. There are two picture frames. One with you and the folks in the first house and one with you and the people from the second house. You get hit with a rush of nostalgia and you feel like more memories are starting to unlock.

- You proceed to do what you were told and got right to work. In front of you there is a computer and a stack of paper. Without any hesitation you got straight to typing and filling out information that was on the paper like it was second nature to you.

- After hours of continuous typing, you managed to finish the work that was assigned to you. You notice that you’re the only one in the building, so you decide to head out. After heading out of the building you walk around and you start to realize the things that have been going on. The people you’ve met so far share some sort of familiarity to you.

- After walking for a while, the cloaked stranger appears in front of you. You begin to ask him:
* What am I doing here? -> Realize
* Where am I? -> Realize
* Why am I here? -> Realize

=== Realize ===
- The cloaked stranger reveals himself. When he took off his hood, you couldn’t believe it. You had a surge of memories rushing to you all at once. You see his face, the cloaked person was none other than yourself. Suddenly it all makes sense, the people that you’ve met were none other than your family and friends. But it only leaves for one more question, “what am I doing here?” All of this burst of realization and memories made you light-headed and you blacked out suddenly.

- You start to open your eyes. It’s faint but you can see many people surrounding you. As your vision starts to get clearer you can visibly recognize your friends and family. You were informed that you were in a coma and you didn’t show signs of waking up for years.

- The doctor comes to you and tells you that it was a miracle that you had woken up. The doctor tells you that your situation was incredibly dire as you suffered a concussion which led to the coma and during that time it could have permanently wiped your memories. Usually not many are able to retain their memories nor would they be able to wake up from that coma. The doctor tells you that you’re incredibly lucky to be in the situation where you are right now.

- However, all you know remember is that, not once did you ever forget about your memories


-> END
=== left_description(->ret) ===
{ currentLocation == left:
    //+ [Play on the river.]
      -> left_body ->
    -> ret
}
-> DONE

=== left_body ===
* [You struggle to wake up.] -> die_suffer
* [You are trying to run as fast as you can.] -> memories_regain
->->

== memories_regain
You are trying to run as fast as you can, attempting to get away from the chasing. You see more of the jungle, and you begin to slowly unblock some of the memories that you've forgotten somewhere in your brain. You remember the view because you were lost in these woods when you were a child. At that time, you met a wounded wolf, you got close to it, regardless of the danger, stroked its knee wound and bandaged it.
Three days after that, your parents found you fainting due to hunger and took you home. You were very ill and forgot the memory of being lost in the jungle after you recovered.
The wolf catches up, it is the one you saved many years ago. It stops in front of you. It looks at your eyes, waiting for you to sort out the memories in your brain. 
After a while, you feel that your consciousness is gradually recovered.
* [Wake up.] -> wake_up

== wake_up
The forest in front of you is gradually disappearing, your consciousness becomes blurred, and you can't tell whether what you just experienced is real or not. At this time, a piece of familiar music suddenly rang, and everything around you became dark. Soon the sound filled the entire space, and a huge sense of oppression was taking your breath away. 
*   [Continue walking forward.] -> walk_forward

== die_suffer
You fall into the darkness and struggle hard, your consciousness becomes blurred, and you can't tell whether what you just experienced is real or not. At this time, a piece of familiar music suddenly rang, and everything around you became dark. Soon the sound filled the entire space, and a huge sense of oppression was taking your breath away. 
*   [Continue walking forward.] -> walk_forward

== walk_forward
You endure the discomfort and keep walking forward. Suddenly, a light spot appeared at the end of the front, and many familiar voices came to your mind. You seem to hear the old man in the jungle telling you to go there, your parents anxiously calling you to wake up, and your friends calling for you to come back quickly. Everyone keeps urging you.
*   [RUN!] -> run
*   [Take a rest.] -> rest

== run
You run as fast as you can, even though you feel tired and thirsty. At this time, you suddenly see a little {gender}, sitting not far in front of the light spot, crying. {gender == "boy":He seems}{gender == "girl":She seems}{gender == "child":They seem} to have fallen and {gender == "boy":his}{gender == "girl":her}{gender == "child":their} knees are still bleeding.
~temp if_run = 1
*   [Ignore the {gender}.] -> ignore(if_run)
*   [Go to help.] -> help(if_run)

== rest
You're so tired, sitting on the ground panting. You look around yourself and find that there is nothing that can continue threatening your safety, so you soon feel relaxed. Suddenly, you hear the cry of a child not far away, you quickly start searching in the dark. There! You see a {gender} sitting not far in front of the light spot, crying. {gender == "boy":He seems}{gender == "girl":She seems}{gender == "child":They seem} to have fallen and {gender == "boy":his}{gender == "girl":her}{gender == "child":their} knees are still bleeding.
~temp if_run = 0
*   [Ignore the {gender}.] -> ignore(if_run)
*   [Go to help.] -> help(if_run)

== ignore(if_run)
{
- if_run == 0:
    However, you didn't stand up. The large amount of exercise earlier had left your legs almost unconscious. After sitting for a while, the {gender}'s cry became quieter and quieter, until it gradually disappeared.
    You look in that direction again, and you are shocked to see that the light spot is also slowly disappearing. A sense of unease rushes into your head, and you feel as if the way home is about to disappear.
*   [As time pass by]    -> dark
- if_run == 1:
    You want to escape this place so much that you really don't have the time or energy to help this little {gender}, you want to go back to your warm cot and tell your family and friends about your fantastic experience.
    Finally, you jumped hard at the last time, at the moment your finger touched the light spot, everything around you disintegrated. The sound around you, the cry of the {gender}, and the endless darkness all disappeared.
    *   [get up.] -> get_up
}

== help(if_run)
{
- if_run == 0:
    You try to run towards the {gender}, but with so much exercise followed by a sudden long break, you can barely move your legs. After only a few steps, you fell heavily to the ground.
    You get up and look forward, the {gender} is still crying, but the spot of light behind {gender == "boy":him}{gender == "girl":her}{gender == "child":them} is gradually disappearing. “No!”, you shout loudly.
*   [As time pass by] -> dark
- if_run == 1:
    After struggling for a long time, you still choose to run towards the {gender}, you want to ask if there is anything you can do to help. However, the {gender} is just crying, you can only hold {gender == "boy":him}{gender == "girl":her}{gender == "child":them} in your arms and try to take {gender == "boy":him}{gender == "girl":her}{gender == "child":them} out of here. 
    When you want to keep trying to move towards the light, you suddenly find that the light is getting smaller and blurrier. You run as fast as you can, “No!”, you shout loudly. Eventually, the light disappears just before you arrive, and you sit on the ground in a collapsed.
    *   [feel regret.] -> regret
}

== dark
Everything around you is dark, there is no light, no sound, and you are sleeping like this for a really long time. 
You don't know how long it's been like this, 
* "but it's fine"
you say to yourself, you haven't had a good night's sleep for a long time, haven't you? At least here, you don't need to worry about your future, work, and life. Right?
-> END

== get_up
You sit up quickly, rubbing your blurry eyes. You see a familiar environment, your warm bed, a messy desk, the unfinished glass of milk at the bedside, and the alarm clock that is still tirelessly telling the time, you realize that…
* [It's all just a dream.]
But your heartbeat is abnormally fast, you touch your sweat-soaked hair, and what you’ve just experienced is so real.
-> get_out_of_bed

* [All of this...is it really just a dream?]
You feel a little headache, those memories in the dream keep entering your head, it is just the memory you once lost.
-> get_out_of_bed

== get_out_of_bed
You get out of bed, put on your coat, and open the door to the room.
* "Mom? Dad?"
No one responds, you keep trying to find your parents. After a while, you realize that something wrong happens. Everyone seemed to disappear into thin air, no matter how much you shout, no one responds.
** [explore your home] -> explore

== explore
You decide to explore your home to see if you can find any clues about your parents.
+ [your parents' room] -> parents
+ [kitchen] -> home_kitchen
+ [restroom] -> home_restroom
+ {drawer}{cabinet}{home_restroom}[your room] -> your_room

== parents
You go to your parent’s room, not surprisingly, there's no one in the room, so you try to start searching the room for usable clues. You went to the bedside cabinet, picked up the photo of you and your parents, and looked at it for a moment. In the photo, you are about the same age as the little {gender} you just saw in the dark. You and your parents are hugging each other and smiling happily.
+ [Open the drawer] -> drawer
+ [Go back] -> explore

== drawer
You opened the drawer and inside was an old photo album. The album is full of photos of you when you were young. Strangely, there are some strange marks on each photo, like drying out after getting wet with water. Also, you found that there is no photo of you when you grow up.
+  [Go back] -> explore

== home_kitchen
You come to the kitchen and find that there are far fewer utensils than before you went to sleep today. And you notice that the milk you took out to drink before going to bed has strangely disappeared.
+ [Open the cabinet] -> cabinet
+ [Go back] -> explore

== cabinet
On the one side, the plates and bowls were neatly stacked together and looked very clean. However, on the other side is a set of tableware that seems to belong to a child, which has been covered with dust and looks like it has not been used for a long time.
+ [Go back] -> explore

== home_restroom
You come to the restroom, and the sink quickly catches your attention. There are only two sets of toiletries. Dad, Mom, and me. One, two, three...
+ [Go back] -> explore

== your_room
You go back to your room. As soon as you open the door, you are startled. Your room is completely different from the one you just left. A cold bed, a tidy desk, and the glass of milk at the bedside is also gone. The whole room has completely lost the breath of your existence.
* [What happened?]
Suddenly, you feel dizzy, and when you open your eyes, you are back in the darkness you just experienced. It was that {gender} again, but there was another cry. You walked slowly toward the {gender} and found that there were two more adults sitting beside the {gender} and crying, they are {gender == "boy":his}{gender == "girl":her}{gender == "child":their} parents. They kept shaking the {gender}, calling {gender == "boy":his}{gender == "girl":her}{gender == "child":their} name, begging {gender == "boy":him}{gender == "girl":her}{gender == "child":them} to wake up, but everything is useless. The {gender} is getting quieter, and you suddenly find yourself gradually becoming transparent. You look at the {gender} in fear, and when the two adults turn around, you scream:
** [!]
"Mom?Dad?"
But your voice was lost with you in the endless darkness.
-> END

== regret
You feel so regretful, looking at the {gender} in your arms. At this time, the {gender} suddenly smiled at you. At the same time, everything around you begins to collapse, and soon you find yourself sitting on the bed in your own room, and the {gender} has disappeared. You look around in disbelief, your warm bed, a messy desk, the unfinished glass of milk at the bedside, and the alarm clock that is still tirelessly telling the time.
*   [Get out of bed.]
You realize that this is definitely your own room. You pinched your thigh hard, it hurts so much, it's not a dream, you're back. You walk out of your room excitedly.
**   "Mom? Dad?"
While you are looking for your parents at home, thinking about how to tell them about the dream, you found that no one responds. 
*** [“Where are they?”]
"Wake up baby!"
"Don't leave us"
"Baby."
"Wake up please."
You heard a conversation between two people, Mom and Dad? 
"I'm here!" You shout loudly.
You still get no response, but your head hurts more and more.
**** [Go to your parents' room]
You decide to go find your parents, while you just want to reach out to open the door, you are surprised to find that your hand has shrunk several times, just look like a child. You shrieked and sat on the ground, becoming more and more conscious.
You don't know how long it took, you gradually wake up, and your parents are sitting in front of you, smiling, although they are younger than you remember.
When your parents are celebrating your waking up, you see another you watching you behind them. The you who lost sleep at night, the you who was exploring the jungle, the you who try to rescue you from the dark. And you, became the child who broke {gender == "boy":his}{gender == "girl":her}{gender == "child":their} knee and cried before the light spot.
***** [You remembered...]-> ending

== ending
It turned out that you were predicted when you were a {gender} that you might die in a dream, and the prophet said that the person who save you would be the person closest and strangest to you. Over the years, your parents have never stopped protecting you by your side. But who would have thought that the person who saved you was yourself?
-> END

=== right_description(->ret) ===
{ currentLocation == right:
    //+ [Play on the river.]
      -> right_body ->
    -> ret
}
-> DONE

=== right_body ===
*{oldMan == 1}
[No, this makes me feel uncomfortable about everything here. It is terrifying.] ->NotGoing
*{oldMan == 1}
[Yes, the mansion is attractive, and I have feelings that tell me I have to explore this house!] ->Going
*{oldMan == 0}
[No, this makes me feel uncomfortable about everything here. It is terrifying.] ->NotGoing2
*{oldMan == 0}
[Yes, the mansion is attractive, and I have feelings that tell me I have to explore this house!] ->Going2
->->

===NotGoing2===
- You find the mansion scary. Therefore you decide to leave this place. 
*[Keep walking in the forest.] -> Keep2

===Keep2===
- You keep walking on the road for a very long time, and the road seems infinite long that there is no crossing, intersection, or anything. After a while, you got shocked because the mansion appeared again! 
    Also, you vaguely see my partner is in front of the gate. It can not go the wrong way because there is only a single-way road all the time. It is so confusing. You run to the front of the mansion, but my partner suddenly disappears like a shadow when you come close. Do you want to go to the mansion to check what is happening?
    *[No, I am still afraid of what is going on here.] ->KeepNotGoing
    *[Yes, there must be something wrong with the mansion, and I must check it out]  ->Going2
    
===Going2===

- After serious consideration, you still decided to walk into the mansion. The heavy gate automatically opens with big sounds when your hand touches the doorknob. The wind behind the gate suddenly blew away all the dust on the ground. The gate is fully opened, and you are still standing outside it because it is dark inside, and winds are still coming out of the house. You are a little worried about what will happen next.
*[Step into the house.]
~ currentLocation = house
~ locationsAvailable = (room)
->top_loop

===NotGoing===
- You find the mansion scary. Therefore you decide to leave this place. When you turn around to find the person who came with you all way long, "Yo, I think we should leave." My voice surrounds the echo in the forest, but he seems to have disappeared. It didn’t bother you. You believed he might just be scared and run away.
*[Keep walking in the forest.] -> Keep

===Keep===
- You keep walking on the road for a very long time, and the road seems infinite long that there is no crossing, intersection, or anything. After a while, you got shocked because the mansion appeared again! 
    Also, you vaguely see my partner is in front of the gate. It can not go the wrong way because there is only a single-way road all the time. It is so confusing. You run to the front of the mansion, but my partner suddenly disappears like a shadow when you come close. Do you want to go to the mansion to check what is happening?
    *[No, I am still afraid of what is going on here.] ->KeepNotGoing
    *[Yes, there must be something wrong with the mansion, and I must check it out]  ->Going

===KeepNotGoing===
- You still find it challenging to check the mansion, even though you are already feeling tired, and you don’t know how long you can keep going forward. With the remaining consciousness, you decided to keep going forward. You lose awareness of time and don’t know how long you have walked. Finally, you became exhausted and lay down and closed your eyes.
* [You are so tired] -> dark

===Going===

- You turned to your back, looking for the man. You found that the man was gone. After serious consideration, you still decided to walk into the mansion. The heavy gate automatically opens with big sounds when your hand touches the doorknob. The wind behind the gate suddenly blew away all the dust on the ground. The gate is fully opened, and you are still standing outside it because it is dark inside, and winds are still coming out of the house. You are a little worried about what will happen next.
*[Step into the house.]
~ currentLocation = house
~ locationsAvailable = (room)
->top_loop

=== mansion_description(->ret) ===
{ currentLocation == house:
    In this house, there are a couple of places you can go.
      -> mansion_body ->
    -> ret
}
-> DONE

=== mansion_body ===
+[Go to the living room.] ->Livingroom
+[Go to the main bedroom.] ->Mainbedroom
+[Go to the guest bedroom.] ->Guestbedroom
+[Go to the restroom.] -> Restroom
+[Go to the kitchen.] ->Kitchen
+{Livingroom}{Mainbedroom}{Guestbedroom}{Restroom}{Kitchen}[Go out of the house.] ->GoOut
- ->->

===GoOut===
- You've explored the whole house, and when you're about to go out, suddenly you feel your head is heavy as hell. Then your eyes is closed and you feel the world is spinning.
* [Trying to wake up.]-> wake_up2

===Livingroom===
- You walk into the living room, and it is spacious. There is some fresh fruit and biscuits, which you think is impossible with the antiquated looking of everything else. “No way. Why is there food?” You are questioning. Also, there are a few things that you find attractive in this room.
    * {not Clock}[Check the clock.] ->Clock
    +{Clock} [Check the clock.] ->ClockC
    +[Check the bookshelf.] ->Bookshelf
    +[Go back.] -> mansion_description(->top_loop)
===Clock===
- The trace of time did not eliminate the charm it has, and you are feeling more and more familiar with this clock. The clock must not have been working for a very long time. When you touch it, the clock magically starts to work, and the sound pulls you to the memory: A young {gender} just returned home from school. After {gender == "boy":he}{gender == "girl":she}{gender == "child":they} put down the backpack and sat on the sofa, the clock’s pointer perfectly said 3 PM: “Tick-tock.” You come back from that piece of memory. You are breathing fastly and trying to rethink what just happened, then “tick-tock,” the clock makes the same sound in the memory. You watch the clock closely, and it says 3 PM. You are confused and get back to the middle of the room.
    *[Go back.] -> Livingroom
===ClockC===
- You have been here. It keeps running, and it will make the sound every hour.
+[Go back.] -> Livingroom

===Bookshelf===
This is probably the most enormous bookshelf you have ever seen. And you can find everything you know on this shelf, and all the books are put in order of alphabetical and chronological. You keep looking up and the top of the shelf is really high, but your mind tells you that there is something up there. However, you can not reach it because it is too high unless you have something to climb on.
    *{not Top} {StepLadder}[Check the top of the Bookshelf.] ->Top
    +{Top}[Check the top of the Bookshelf.] ->TopC
    +[Go back.] ->Livingroom

===Top===
 You finally climb to the top of the shell and get the mysterious book. The book’s cover has its big name, but you can not understand the word's language; every letter on the surface is shining, and you can not wait to open it to see what is going on. When you open the book, all the paper in the book starts to be shining first and then fly around you and slowly turn into ashes. These ashes seem to have the realization to gather around your hand and stick together to form a shiny key.
    +[Go back.] ->Livingroom
===TopC===
You climb up to the shell with the step ladder again. However, there are no more special books here.
    +[Go back.] ->Livingroom

===Mainbedroom===
You opened the main bedroom door, and the room's sense is warming. A king-size bed with bedside tables on the left side. You sit on the bed after running around the jungle, and the light from the hanging lamp at the top makes you feel better and sleepy. You lie down on the bed, the comfort and happiness surrounding you. You turn around and see the bedside table, and there is a picture sitting on the top of the table, and vaguely you see something like a box under the table.
    *[Check the picture.] ->Pic
    +[Check the box under the table.] ->Table
    *{Open}[Go back.] -> find
    +{not Open}[Go back.] -> mansion_description(->top_loop)
===Pic===
In the photo, a pair of parents are holding a little {gender} in front of this mansion, and you can tell they are happy and fulfilled at that moment. Then the picture starts to shine, and you suddenly get dragged into a piece of memory, that this family just moved into this house, and the parents hold their {gender} to take this lovely picture. The {gender} was first confused and wondering about the new environment, but when {gender == "boy":his}{gender == "girl":her}{gender == "child":their} parents held {gender == "boy":his}{gender == "girl":her}{gender == "child":their} hands, {gender == "boy":he}{gender == "girl":she}{gender == "child":they} started to smile nicely.
    +[Go back.] ->Mainbedroom
    
===Table===
You look down closely and find out that the box is a locked chest. “Looks like I have to find a key to open it.” You said.
    *{Top} {not Open}[Open the chest.] ->Open
    +{Open}[Open the chest.] ->OpenC
    +[Go back.] ->Mainbedroom

===Open===
You take the key from the bookshelf and wish the key would work. You twist the key into the lock, and the chest slowly opens up after a sound. The lights shine from the inside of the chest as it opens. You look into the chest, and there is an old diary. You take the diary out, and the moment you open it up, the memories flow into your mind that one day a {gender} decided to write something in {gender == "boy":his}{gender == "girl":her}{gender == "child":their} diary and chose not to let anyone know what was in it. Therefore {gender == "boy":he}{gender == "girl":she}{gender == "child":they} locked the journal in a chest and hid the key in the highest book place he could find.
    + [Go back.] ->Table

===OpenC===
You already have the diary. There is nothing more in the chest.
+ [Go back.] ->Table

===Guestbedroom===
You enter the guest bedroom, and the first thing you see is the box with many toys inside it. You think this must be the room for children because there is also a tiny bed in the middle of the room. 
    *{not Toy} [Check the toy box.] ->Toy
    +{Toy} [Check the toy box.] ->ToyC
    +[Go back.] -> mansion_description(->top_loop)

===Toy===
With the opening of the toy box, lights flash out from each of the toys, and you are suddenly got drag into memory: The young {gender} used to collect all the toys {gender == "boy":he}{gender == "girl":she}{gender == "child":they} loved in this box, and every time {gender == "boy":he}{gender == "girl":she}{gender == "child":they} gets free, {gender == "boy":he}{gender == "girl":she}{gender == "child":they} will come to this room and play with {gender == "boy":his}{gender == "girl":her}{gender == "child":their} toys.
    +[Go back.] ->Guestbedroom
===ToyC===
You have already checked the box. The toys still sit there and wait till their owner grabs them up.	
    +[Go back.] ->Guestbedroom

===Restroom===
You walk into the restroom, and the clean white floor with crystal clear tub makes the room bright and fresh. On the table, there are some toiletries, and it is like a family is still living there. Though there is something that makes you want to look closely.
    *{not Bath}[Look closely at the bathtub.] ->Bath
    +{Bath}[Look closely at the bathtub.] ->BathC
    *{not Cologne}[Check the cologne on the table.] ->Cologne
    +{Cologne}[Check the table.] ->CologneC
    +[Go back.] -> mansion_description(->top_loop)
===Bath===
You walk closer to the tub, and someone in your mind tells you: “Closer, touch it.” Then you take another step and touch the tub, and all of a sudden, the faucet starts to run warm water, and as the water fills half of the tub, a piece of memory begins to take over your mind: The little {gender} loves to take a shower in the tub, and play the water with {gender == "boy":his}{gender == "girl":her}{gender == "child":their} duck toy. {gender == "boy":His}{gender == "girl":Her}{gender == "child":Their} mom always comes and gently asks {gender == "boy":him}{gender == "girl":her}{gender == "child":them} not to spend too long in the tub. Coming back from memory, you noticed that the water in the tub was all gone.
    +[Go back.] ->Restroom

===BathC===
The tub’s water has gone, and you still can not believe how it could run and go like it was all dream
    +[Go back.] ->Restroom

===Cologne===
You walk to the table and grab the cologne. The sweet smell of the cologne attracts you to smell closer. Then your mind is filled with the recall. In the memory, the young {gender} always asks {gender == "boy":his}{gender == "girl":her}{gender == "child":their} mother why she smells like an angel, and she will answer because she uses the cologne of angels. After the memory, the cologne turns into ashes.
    +[Go back.] ->Restroom
===CologneC===
The cologne is gone, but that sweet smell is still in the air you can smell and feel.
    +[Go back.] ->Restroom

===Kitchen===
You walk into the kitchen, and the view does not surprise you too much, just like any nice family kitchen. You noticed that there is a step ladder on the side. Maybe it will be useful. One thing that is interesting to you is the fridge. 
    *{not Magnets}[Walk closer and check the fridge.] ->Magnets
    +{Magnets}[Walk closer and check the fridge.] ->MagnetsC
    *[Grab the step ladder on the side.] ->StepLadder
    +[Go back.] -> mansion_description(->top_loop)
    
===Magnets===
You see that there are many magnets out there, and they are all in different colors and shapes. You walk closer and try to touch the magnets. When you touch magnets, you are stunned, like there is electricity coming out of the magnets. All the memory of the {gender} sticking every piece of magnets suddenly flows all over your brain. Then you get back from the memory and breath hardly, and see all the stickers fly around you and gradually disappear.
    +[Go back] ->Kitchen

===MagnetsC===
 You come to the fridge again, but there is not much to explore. The magnets on the refrigerator are gone, but the piece of the memory stays.
    +[Go back] ->Kitchen

===StepLadder===
You now have the step ladder. Maybe it can be used for climbing something high.
+[Go back] ->Kitchen

===find===
Before you leave the room, you look to the left and find a hidden door, which is very inconspicuous. The keyhole on the door looks very strange. However you can't do anything unless you find the key.
+[Go back.] -> mansion_description(->top_loop)

== wake_up2
The mansion is gradually disappearing, your consciousness becomes blurred, and you can't tell whether what you just experienced is real or not. At this time, a piece of familiar music suddenly rang, and everything around you became dark. Soon the sound filled the entire space, and a huge sense of oppression was taking your breath away. 
*   [Continue walking forward.] -> walk_forward2

== walk_forward2
You just keep walking in the dark like this, and gradually, you feel the ground under your feet getting softer and warmer. You just feel like lying on a cloud.
You feel more and more relax, and slowly, the environment light up and your vision becomes clear. Later, you find that you are lying on your own warm bed.
* [I am back?]
You look around in disbelief, your warm bed, a messy desk, the unfinished glass of milk at the bedside, and the alarm clock that is still tirelessly telling the time.
**   [Get out of bed.]
You realize that this is definitely your own room. You pinched your thigh hard, it hurts so much, it's not a dream, you're back. You walk out of your room excitedly.
***  "Mom? Dad?"
No one responds, you keep trying to find your parents. After a while, you realize that something wrong happens. Everyone seemed to disappear into thin air, no matter how much you shout, no one responds.
**** [explore your home] -> go_out

== go_out
As soon as you left your room, your foot hit something soft.
* [Peanut?]
It's Peanut, a cute little white cat in your family, it's also the fourth member of your family. You decide to take him with you to check out the rooms in your house.
-> explore2

== explore2
Your room is on the second floor, after a few moments of thinking, you decide to go to:
+ [Go to your parents' room.] -> parents_room
+ [Go to the study room.] -> study_room
+ [Go to the kitchen.] -> kitchen2
+ [Go to the living room.] -> living_room
+ {parents_room}{study_room}{kitchen2}{living_room}[Go to the backyard.] -> backyard

== parents_room
You went to your parent’s room, not surprisingly, there's no one in the room, so you try to start searching the room for usable clues. You went to the bedside cabinet, picked up the picture of you and your parents, and looked at it for a moment. You remembered that your parents are both archaeologists. When you were young, you often followed them on archaeological excavations, which made you have a strong interest in Archaeology when you were a child.
+ [Look carefully at the photo.]
Suddenly a place in the photo caught your attention. You took a look and found that the archaeological excavation house in the photo was exactly the same as the mansion in your dream. Can it be said that everything in the dream was real? You start to hesitate and try to analyze the reality of it all.
++ [Look at the back of the frame.]
When you look at the back of the frame, you find something in the middle. When you open it, it turns out to be a map of the mansion, which must have been drawn by your father.
+++ [Leave the room.] -> explore2

== study_room
You come to the study room, most of the things here are your father's research documents and materials. You don't come to this place usually, so you feel a little strange.
+ [Go find useful documets.]
You try to find information about the mansion in a wall of historical documents, but after a long time, you find nothing useful. 
Just as you are about to leave the study, Peanut drops a set of keys to the floor from the top of one bookshelf.
++ [Pickup the keys.]
You pick up the set of keys and find that one of the keys is as strange as the keyhole of the hidden door in the mansion's mainbedroom in your dream. You guess that this may be the key to open that door. You complimented Peanut by touching his head.
+++ [Leave the room.] -> explore2

== kitchen2
You go to the kitchen on the ground floor, and you find a weird thing that although there is no one in the house except you, the oven is running. And it's grilling your favorite grilled ribs, which is also your mother's specialty.
+ [Check the kitchen.]
After replenishing Peanut and yourself with food and water, you grab a pan and use it as a self-defense weapon, because you don't know if a monster will suddenly appear in front of you. Then you look at the clock on the wall, it's twelve o 'clock at midnight.
++ [Leave the room.] -> explore2

== living_room
You come to the living room, which is usually where most people stay. You remember the family of three sitting in front of the round table, sharing the interesting things they have met, this feeling is very pleasant.
+ [Look at the roaring fireplace.]
Looking at the roaring fireplace, you suddenly remember that you brought back an egg-sized unknown ore from the mansion of the archaeological site. You didn't pay much attention to it at that time, thinking that it was just an ordinary broken stone and put it in the living room as a decoration. 
++ [Find that stone.]
Just as you are trying to find the stone, something amazing happened. The stone suddenly gave off a brilliant green light as if to remind you of its location. You are now more convinced that this stone must have some connections with the mansion.
+++ [Leave the room.] -> explore2

== backyard
You walk out the main gate of the house and there's a little backyard, your mom used to grow various kinds of vegetables and fruits in the backyard. There is also a strange little tree in the backyard, planted by the previous owner of the house. You heard Dad say that the man used to be your Grandpa's partner, and they worked together. There is a tombstone under the tree, it's the grave of that man's dog. You walk over and take a look, it say in memory of my partner Jacob.
At this time, Peanut, who usually dared not approach the tombstone suddenly rushed over, staring at the tombstone and howling, as if something was about to come out.
+ [Step back.]
Suddenly, a crack appeared from the ground, and then a brilliant white light shot up into the sky from the ground. The tombstone in front of you becomes something like a portal.
++ [Jump into the portal.]
You want to know what's going on here so much and you're anxious to find your parents, so you jump into the portal without hesitation.
In a moment, you arrive at a mysterious place. Just as you were feel this place is a bit like your dream and thinking about how to find your parents, there was a thunderous growl behind you. 
+++ [Look back.]
You looked back and find that there is a giant bear standing behind you. You don't have time to fear, you have to run away as fast as you can. Soon, you come to a fork in the road, it's time to decide. There are unknown difficulties and dangers ahead, and beasts behind. You choose:
**** [the first route] -> 1st
**** [the second route] ->2nd
**** [the third route] ->3rd

== 1st
As you walk along the first route, you come to a waterfall. There is no way out ahead, only a huge tree with thick branches. You suddenly have an idea, tie the rattan on the rock wall together to make a rope. Thwb you tie one end of the rope to the branch, grasp the other end with one hand, use the principle of the pendulum and the weight of the body, swing to the other side of the waterfall, temporarily get rid of the danger.
-> mansion

== 2nd
As you walk along the second route, you encounter a thick bush blocking your way. Just when you don't know what to do, a boulder suddenly falls, and you dodge in a hurry. Fortunately, the falling boulder has also opened up a path you can follow.
-> mansion

== 3rd
As you walk along the third route to escape, you came to a steep rift. Just when you have no choice, you suddenly remember the frying pan you took from the kitchen at home. So you stick the pan firmly in the cracks of the rock and climb up bit by bit. Finally, you reach the top slowly and laboriously.
-> mansion

== mansion
* [You feel so tired and exhausted.]
At this time, you look forward, it is unbelievable that you have finally overcome all difficulties, escaped the beast, and reach the mansion in your dreams. This time, you carefully discovered the words and murals on the wall beside the gate, which you ignored when you came here in your dream last time. You understand that the stone you brought back is the key used by the castle owner to open the hyperspace tunnel, and only the brave can activate this key.
** [Enter the mansion.]
Although you find that the structure inside the castle is much more complicated than in your dreams, with your father's map, you quickly find the hidden door in your dream.
*** [Open the door.]
There is only one big table in the room with a frame on it. It is your parents in the photo.
-> hidden_room

== hidden_room
You try to figure out where are your real parents.
+ [Approach the frame with the key.]
Nothing happens.
->hidden_room
+ [Approach the frame with the stone.]
The frame has a dazzling light, and when you open your eyes again, your parents are looking at you while crying and smiling. You rushed to them and gave them a deep hug.
Under the magic of the stone, your family finally come together and soon returned to your home. At night, you are sitting on the couch with your parents, each with a glass of hot milk, and you're excitedly sharing what happened in your dream.
-> END