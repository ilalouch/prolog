/*
All 6 girls in the junior cabin at camp sleep in bunk beds.
Each girl has a different color blanket on her bed.
The beds are lined up in a row with red, black, yellow, brown, blue and green blankets.
1. Reeva and Haley is closest to the door.
2. The color of the blankets on the bottom bunks all begin with the same letter
3. The color of Beth's blanket doesn't begin with the same letter as the beginning of her name
4. The blue blanket is under the red blanket.
5. Liza and Kayla like their lower bunks.
6. Kayla is in the middle bed.
7. Zoe doesn't share a bunk with Kayla.
8. The brown blanket is at the end of a row.
9. The yellow is above the black blanket.

They are in the following order bottom, up, bottom, up
from left to right
*************************************************************/

% up = 1, 3, 5
% down = 2, 4, 6

solution(Names, Colors, Beds):-
    Names = [Liza, Kayla, Zoe, Reeva, Hayley, Beth],
    Names ins 1..6,
    all_different(Names),
    Colors = [Black, Blue, Yellow, Red, Brown, _Geen],
    Colors ins 1..6,
    all_different(Colors),
    Beds = [Up, Down, Up1, Down1, Up2, Down2],
    Beds ins 1..6,
    %all_distinct(Beds),
    Up #= 1,
    Down #= 2,
    Up1 #= 3,
    Down1 #= 4,
    Up2 #= 5,
    Down2 #= 6,
    Reeva #= 1 #/\ Hayley #= 2 #<==> G1, %1
    Reeva #= 2 #/\ Hayley #= 1 #<==> G2, %1
    G1 + G2 #= 1,
    Beth #\= Blue,
    Beth #\= Black,
    Beth #\= Brown,  %3
    Blue #= Down #==> Red #= Up #<==>Ex1,
    Blue #= Down1 #==> Red #= Up1 #<==>Ex2,
    Ex1 + Ex2 #= 1,   %4
    Yellow #= Up #==> Black #= Down  #<==> E1,
    Yellow #= Up1 #==> Black #= Down1 #<==> E2,
    E1 + E2 #= 1, %9
    Black #= Down #<==> Bl1,
    Black #= Down1 #<==> Bl2,
    Bl1 + Bl2 #= 1,   %2
    Blue #= Down #<==> B1,
    Blue #= Down1 #<==> B2,  %2
    B1 + B2 #= 1,
    Liza #= Down #<==> L1,
    Liza #= Down2 #<==> L2,
    L1 + L2 #= 1,  %5
    Kayla #= Down1, %6,5
    Brown #= Down2, %8
    Zoe #\= Up1,  %7
    labeling([], Names),
    labeling([], Colors),
    labeling([], Beds).
