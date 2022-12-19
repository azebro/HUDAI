(define (problem problem2) (:domain dungeon)
(:objects 
    hh - hero ; the HUD hero
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 - room ; rooms as per map in the assignment
    m1 m2 m3 - monster ; monsters
    t1 t2 t3 t4 t5 - trap ; traps
    s1 s2 - sword ; sword
)

(:init ; initial state
    (is-alive hh) ; the hero is alive
    (at hh r1) ; hero is in room 1
    (hand-empty hh) ; hero has nothing in his hand

    ;monster inital state:
    ; 1. monster in the room r
    ; 2. monster is not afraid of the hero
    ; 3. moster is confident it can kill the hero
    (monster-at m1 r3)
    (not (monster-afraid m1 hh))
    (monster-confident m1 hh)
    
    (monster-at m2 r4)
    (not (monster-afraid m2 hh))
    (monster-confident m2 hh)
    
    (monster-at m3 r9)
    (not (monster-afraid m3 hh))
    (monster-confident m3 hh)

    ;sword inital state
    ;   1. sword in in the room r
    ;   2. hero is not holding sword
    ;   3. sword is not destroyed
    (sword-at s1 r2)
    (not (sword-holding hh s1))
    (not (sword-destroyed s1))

    (sword-at s2 r7)
    (not (sword-holding hh s2))
    (not (sword-destroyed s2))

     ;trap initial state
    ; 1. trap is in the room r
    ; 2. trap is armed
    ; 3. trap is not disarmed
    (trap-at t1 r3)
    (trap-armed t1 r3)
    (not (trap-disarmed t1 r3))

    (trap-at t2 r5)
    (trap-armed t2 r5)
    (not (trap-disarmed t2 r5))

    (trap-at t3 r8)
    (trap-armed t3 r8)
    (not (trap-disarmed t3 r8))

    (trap-at t4 r10)
    (trap-armed t4 r10)
    (not (trap-disarmed t4 r10))

    (trap-at t5 r11)
    (trap-armed t5 r11)
    (not (trap-disarmed t5 r11))

    ;room initial state
    ;   1. room is not destoryes (it is intact)
    ;   2. here can/cannot leave the room based on the rules
    ;   3. room is connected to another one, based on the map - please refer to the report for the map
    (room-intact r1)
    (room-intact r2)
    (room-intact r3)
    (room-intact r4)
    (room-intact r5)
    (room-intact r6)
    (room-intact r7)
    (room-intact r8)
    (room-intact r9)
    (room-intact r10)
    (room-intact r11)
    (room-intact r12)
 
    (room-can-leave r1 hh)
    (room-can-leave r2 hh)
    (room-can-leave r7 hh)
    (not (room-can-leave r3 hh))
    (not (room-can-leave r4 hh))
    (not (room-can-leave r5 hh))
    (not (room-can-leave r6 hh))
    (not (room-can-leave r8 hh))
    (not (room-can-leave r9 hh))
    (not (room-can-leave r10 hh))
    (not (room-can-leave r11 hh))


    (room-connected r1 r2)
    (room-connected r1 r3)

    (room-connected r2 r1)
    (room-connected r2 r4)
    (room-connected r2 r5)

    (room-connected r3 r1)
    (room-connected r3 r4)
    (room-connected r3 r5)

    (room-connected r4 r2)
    (room-connected r4 r3)
    (room-connected r4 r6)
    (room-connected r4 r7)

    (room-connected r5 r2)
    (room-connected r5 r3)
    (room-connected r5 r6)
    (room-connected r5 r7)

    (room-connected r6 r4)
    (room-connected r6 r5)
    (room-connected r6 r8)
    (room-connected r6 r9)

    (room-connected r7 r4)
    (room-connected r7 r5)
    (room-connected r7 r8)
    (room-connected r7 r9)

    (room-connected r8 r8)
    (room-connected r8 r7)
    (room-connected r8 r10)
    (room-connected r8 r11)

    (room-connected r9 r6)
    (room-connected r9 r7)
    (room-connected r9 r10)
    (room-connected r9 r11)

    (room-connected r10 r8)
    (room-connected r10 r9)
    (room-connected r10 r12)

    (room-connected r11 r8)
    (room-connected r11 r9)
    (room-connected r11 r12)

    (room-connected r12 r10)
    (room-connected r12 r11)
    
    (room-connected r8 r6)
    
)
; goal - hero is alive and he reached room 12
(:goal (and
    (at hh r12)
    (is-alive hh)

))


)
