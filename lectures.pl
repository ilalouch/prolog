/* The week before the Christmas break was made varied by a series of
special lectures,one each day (Monday through Friday). The lectures had the following topics:
bioinformatics, physical hygiene, modern art, nutrition, and study habits.
The lecturers were two women named Alice and Bernadette,
and three men named Charles, Duance, and Eddie.
The last names of the lecturers were Felicidad, Garber, Haller, Itakura, and Jeffreys.

You also know the following facts:
1. Alice lectured on Monday.
2. Charles' lecture on physical hygience wasn't given on Friday.
3. Dietician Jeffreys gave the lecture on nutrition.
4. A man gave the lecture on modern art.
5. Miss Itakura and the lecturer on proper study habits spoke on consecutive days,
in one order or the other.
6. Haller gave a lecture sometime after Eddie did.
7. Duane Felicidad gave his lecture sometime before the modern art lecture.

************************************************************/

solution(FNs, LNs, Topics, Days):-
    FNs = [Alice, Bernadette, Charles, Duance, Eddie],
    FNs ins 1..5,
    all_different(FNs),
    LNs = [Felicidad, _Garber, Haller, Itakura, Jeffreys],
    LNs ins 1..5,
    all_different(LNs),
    Topics = [_Bioinformatics, PhysicalHygiene, ModernArt, Nutrition, StudyHabits],
    Topics ins 1..5,
    all_different(Topics),
    Days = [Monday, Tuesday, Wednesday, Thursday, Friday],
    Days ins 1..5,
    %all_different(Days),
    Monday #= 1,
    Tuesday #= 2,
    Wednesday #= 3,
    Thursday #= 4,
    Friday #= 5,
    Alice #= Monday,  %1
    Charles #= PhysicalHygiene,  %2
    PhysicalHygiene #\= Friday,  %2
    Jeffreys #= Nutrition,  %3
    ModernArt #= Charles #<==> To1,
    ModernArt #= Duance #<==> To2,
    ModernArt #= Eddie #<==> To3,
    To1 + To2 + To3 #= 1,  %4
    Itakura #= Alice #<==> Wo1,
    Itakura #= Bernadette #<==> Wo2,
    Wo1 + Wo2 #= 1,  %5
    Itakura #= StudyHabits + 1 #<==> Day1,
    Itakura #= StudyHabits - 1 #<==> Day2,
    Day1 + Day2 #= 1,   %5
    Haller #>= Eddie + 1,  %6
    Duance #= Felicidad,   %7
    Duance #=< ModernArt - 1,  %7
    labeling([], FNs),
    labeling([], LNs),
    labeling([], Topics),
    labeling([], Days).
