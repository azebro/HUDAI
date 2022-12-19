
; dungeon domain that follows the rules depicted in the 
;assignment 2 brief
(define (domain dungeon)

;I need to be able to assign types
; in the initial version I was using negative pre-conditions as well
; but based on the advise from 04/04/2020, I have modified the domain not to 
;include the negative pre-conditions
(:requirements :strips :typing)

(:types 
    hero ; the here that is lost and needs to find way out
    room  ; rooms that make the dungeon
    monster  ; monsters that reside in the dungeon
    trap ; traps in the rooms
    sword ; the sword that can be used to deal with the monster
)


(:predicates
    ;hero predicates
    (at ?h - hero ?r - room) ; the hero in the room r
    (hand-empty ?h - hero) ; hero is holding a sword
    (is-alive ?h - hero) ; hero is still alive
    ;room predicates
    (room-intact ?r - room); room is not destroyed
    (room-connected ?r1 ?r2 - room) ;hero can move, rooms are connected
    (room-can-leave ?r - room ?h - hero) ;hero can leave the room, there are no pre-reqs
    ;monster predicates
    (monster-at ?m - monster ?r - room) ; monster in in room r
    (monster-confident ?m - monster ?h - hero) ;monster is not afraid of here
    (monster-afraid ?m - monster ?h - hero) ; monster is afraid of here
    ;trap predicates
    (trap-at ?t - trap ?r - room) ; trap t is in in room r
    (trap-armed ?t - trap ?r - room) ; trap is armed in the room
    (trap-disarmed ?t - trap ?r - room) ; trap is disarmed in the room
    ;sword predicates
    (sword-at ?s - sword ?r - room) ;there is a sword in room 
    (sword-destroyed ?s - sword) ;sword is destroyed
    (sword-holding ?h - hero ?s - sword) ;hero is holding the sword 

)

(:action move ; the hero can move between rooms.
    ;pre-conditions:
    ;   1. hero is alive
    ;   2. dstination room is intact (it is not destroyed)
    ;   3. hero is in the 'from' room
    ;   4. rooms are connected
    ;   5. hero can leave the room, traps are disarmed and no confident mosters
    ;effects:
    ;   1. hero is still alice
    ;   2. hero is in the destination room
    ;   3. hero is not in the 'from' room
    ;   4. room is now destroyed (it is not intact)
    :parameters (?h - hero ?from - room ?to - room)
    :precondition (and 
        (is-alive ?h)
        (room-intact ?to)
        (at ?h ?from)
        (room-connected ?from ?to)
        (room-can-leave ?from ?h)
        )
    :effect (and 
        (at ?h ?to)
        (is-alive ?h)
        (not (at ?h ?from))
        (not (room-intact ?from))
    )

)

(:action pickup-sword  ; the hero picks up sword
    ;pre-conditions:
    ;   1. here is in the room r
    ;   2. hero is alive
    ;   3. hero has an empty hand
    ;   4. there is a sword in the same room
    ;effects:
    ;   1. hero is still alive
    ;   2. hero is still in the same room
    ;   3. hero is holding a sword (and thus his hand is not empty)
    ;   4. sword is not destroyed
    ;   5. there is no more sword to be picked up
    ;   6. the hero is allowed to leave the room
    :parameters (?r - room ?h - hero ?s - sword)
    :precondition (and
        (is-alive ?h)
        (at ?h ?r)
        (hand-empty ?h)
        (sword-at ?s ?r)
     )
    :effect (and 
        (is-alive ?h)
        (at ?h ?r)
        (not (hand-empty ?h))
        (not (sword-at ?s ?r))
        (not (sword-destroyed ?s))
        (sword-holding ?h ?s)
        (room-can-leave ?r ?h)
        )
)

(:action destroy-sword ;hero destorys the sword
    ;pre-conditions:
    ;   1. hero is alive
    ;   2. hero is holding the sword
    ;effects:
    ;   1. hero is still alive
    ;   2. sword is destroyed
    ;   3. hero is now empty handed, he is not holding sword
    :parameters (?h - hero ?s - sword)
    :precondition (and 
        (is-alive ?h)
        (sword-holding ?h ?s)
    )
    :effect (and 
        (is-alive ?h)
        (sword-destroyed ?s)
        (not (sword-holding ?h ?s))
        (hand-empty ?h)
    )
)

(:action disarm-trap ; hero disarms the trap
    ;pre-conditions:
    ;   1. hero is still alive
    ;   2. here is in the room r
    ;   3. here has nothing in his hand
    ;   4. trap is in the room
    ;   5. trap is armed
    ;effects:
    ;   1. hero is still alive
    ;   2. here is still in room r
    ;   3. here still has empty hand
    ;   4. trap is still in the room r
    ;   5. trap is now disarmed
    ;   6. here can now leave the room
    :parameters (?h - hero ?r - room ?t - trap)
    :precondition (and 
        (is-alive ?h)
        (at ?h ?r)
        (hand-empty ?h)
        (trap-at ?t ?r)
        (trap-armed ?t ?r)
        ;(not (trap-disarmed ?t ?r))
    )
    :effect (and 
        (is-alive ?h)
        (at ?h ?r)
        (hand-empty ?h)
        (trap-at ?t ?r)
        (not (trap-armed ?t ?r))
        (trap-disarmed ?t ?r)
        (room-can-leave ?r ?h)
    )
)

(:action meet-monster ;the here encounters a monster
    ;pre-conditions:
    ;   1. hero is alive
    ;   2. here is in the room r
    ;   3. hero is holding a sword
    ;   4. monster is in the same room
    ;   5. monster is not afraid of the here (monster is confident)
    ;effects:
    ;   1. here is still alive
    ;   2. here is still in the room
    ;   3. here is still holding the sword
    ;   4. monster is not afraid of the hero
    ;   5. hero can now leave the room
    :parameters (?h - hero ?s - sword ?r - room ?m - monster)
    :precondition (and 
        (is-alive ?h)
        (at ?h ?r)
        (sword-holding ?h ?s )
        (monster-at ?m ?r)
        (monster-confident ?m ?h)

    )
    :effect (and 
        (is-alive ?h)
        (at ?h ?r)
        (sword-holding ?h ?s)
        (monster-at ?m ?r)
        (monster-afraid ?m ?h)
        (not (monster-confident ?m ?h))
        (room-can-leave ?r ?h)
    )
)
)


