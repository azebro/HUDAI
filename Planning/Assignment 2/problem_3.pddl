(define (problem problem3) (:domain dungeon)
(:objects 
    hh - hero ; the HUD hero
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 - room ; rooms as per map in the assignment
    m1 m2 m3 m4 m5 m6 m7 - monster ; monsters
    t1 t2 t3 t4 t5 t6 - trap ; trap
    s1 s2 s3 s4 - sword ; sword
)

(:init ; initial state
    (is-alive hh) ; the hero is alive
    (at hh r1) ; hero is in room 1
    (hand-empty hh) ; hero has nothing in his hand

    ;monster inital state:
    ; 1. monster in the room r
    ; 2. monster is not afraid of the hero
    ; 3. moster is confident it can kill the hero
    (monster-at m1 r5)
    (not (monster-afraid m1 hh))
    (monster-confident m1 hh)

    (monster-at m2 r7)
    (not (monster-afraid m2 hh))
    (monster-confident m2 hh)
    
    (monster-at m3 r8)
    (not (monster-afraid m3 hh))
    (monster-confident m3 hh)

    (monster-at m4 r12)
    (not (monster-afraid m4 hh))
    (monster-confident m4 hh)

    (monster-at m5 r14)
    (not (monster-afraid m5 hh))
    (monster-confident m5 hh)

    (monster-at m6 r15)
    (not (monster-afraid m6 hh))
    (monster-confident m6 hh)

    (monster-at m7 r16)
    (not (monster-afraid m7 hh))
    (monster-confident m7 hh)

     ;sword inital state
    ;   1. sword in in the room r
    ;   2. hero is not holding sword
    ;   3. sword is not destroyed
    (sword-at s1 r4)
    (not (sword-holding hh s1))
    (not (sword-destroyed s1))
    

    (sword-at s2 r9)
    (not (sword-holding hh s2))
    (not (sword-destroyed s2))
    
    (sword-at s3 r11)
    (not (sword-holding hh s3))
    (not (sword-destroyed s3))

    (sword-at s4 r18)
    (not (sword-holding hh s4))
    (not (sword-destroyed s4))

    ;trap initial state
    ; 1. trap is in the room r
    ; 2. trap is armed
    ; 3. trap is not disarmed
    (trap-at t1 r3)
    (trap-armed t1 r3)
    (not (trap-disarmed t1 r3))

    (trap-at t2 r6)
    (trap-armed t2 r6)
    (not (trap-disarmed t2 r6))

    (trap-at t3 r10)
    (trap-armed t3 r10)
    (not (trap-disarmed t3 r10))

    (trap-at t4 r13)
    (trap-armed t4 r13)
    (not (trap-disarmed t4 r13))

    (trap-at t5 r17)
    (trap-armed t5 r17)
    (not (trap-disarmed t5 r17))

    (trap-at t6 r19)
    (trap-armed t6 r19)
    (not (trap-disarmed t6 r19))

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
    (room-intact r13)
    (room-intact r14)
    (room-intact r15)
    (room-intact r16)
    (room-intact r17)
    (room-intact r18)
    (room-intact r19)
    (room-intact r20)
    

    (room-can-leave r1 hh)
    (room-can-leave r2 hh)
    (room-can-leave r4 hh)
    (room-can-leave r9 hh)
    (room-can-leave r11 hh)
    (room-can-leave r18 hh)
    
    
    (not (room-can-leave r3 hh))
    (not (room-can-leave r5 hh))
    (not (room-can-leave r6 hh))
    (not (room-can-leave r7 hh))
    (not (room-can-leave r8 hh))
    (not (room-can-leave r10 hh))
    (not (room-can-leave r12 hh))
    (not (room-can-leave r13 hh))
    (not (room-can-leave r14 hh))
    (not (room-can-leave r15 hh))
    (not (room-can-leave r16 hh))
    (not (room-can-leave r17 hh))
    (not (room-can-leave r10 hh))
    (not (room-can-leave r19 hh))


    (room-connected r1 r2)
    (room-connected r1 r8)

    (room-connected r2 r1)
    (room-connected r2 r3)
    (room-connected r2 r7)

    (room-connected r3 r2)
    (room-connected r3 r4)
    (room-connected r3 r6)

    (room-connected r4 r3)
    (room-connected r4 r5)

    (room-connected r5 r4)
    (room-connected r5 r6)
    (room-connected r5 r12)
    
    (room-connected r6 r3)
    (room-connected r6 r5)
    (room-connected r6 r7)
    (room-connected r6 r11)

    (room-connected r7 r2)
    (room-connected r7 r6)
    (room-connected r7 r8)
    (room-connected r7 r10)

    (room-connected r8 r1)
    (room-connected r8 r7)
    (room-connected r8 r9)

    (room-connected r9 r8)
    (room-connected r9 r10)
    (room-connected r9 r16)
    
    (room-connected r10 r7)
    (room-connected r10 r9)
    (room-connected r10 r11)
    (room-connected r10 r15)

    (room-connected r11 r6)
    (room-connected r11 r10)
    (room-connected r11 r12)
    (room-connected r11 r14)

    (room-connected r12 r5)
    (room-connected r12 r11)
    (room-connected r12 r13)

    (room-connected r13 r12)
    (room-connected r13 r14)
    (room-connected r13 r20)

    (room-connected r14 r11)
    (room-connected r14 r13)
    (room-connected r14 r15)
    (room-connected r14 r19)

    (room-connected r15 r10)
    (room-connected r15 r14)
    (room-connected r15 r16)
    (room-connected r15 r18)

    (room-connected r16 r9)
    (room-connected r16 r15)
    (room-connected r16 r17)

    (room-connected r17 r16)
    (room-connected r17 r18)

    (room-connected r18 r15)
    (room-connected r18 r17)
    (room-connected r18 r19)

    (room-connected r19 r14)
    (room-connected r19 r18)
    (room-connected r19 r20)

    (room-connected r20 r13)
    (room-connected r20 r19)
   
    
)
; goal - hero is alive and he reached room 20
(:goal (and
    (at hh r20)
    (is-alive hh)

))


)
