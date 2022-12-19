(define (domain gripper)  
   (:requirements :adl :typing)
   (:types room ball gripper)
   (:predicates 
        (at-robby ?r - room) 
        (at ?b - ball ?r - room)
    	(free ?g - gripper)		
        (carry ?b - ball ?g - gripper)
        
   )

   (:action move       
   :parameters  (?from - room ?to - room)
   :precondition (and (at-robby ?from ))      
   :effect (and  (at-robby ?to )
	     (not (at-robby ?from ))))

    (:action pick       
    :parameters (?obj - ball ?room - room ?gripper - gripper)       
    :precondition  (and  (at ?obj ?room) (at-robby ?room) (free ?gripper))      
    :effect (and (carry ?obj ?gripper) 
                    (not (at ?obj ?room)) 
                    (not (free ?gripper))))
    (:action drop
        :parameters (?b - ball ?r - room ?g - gripper)
        :precondition (and (not (at ?b ?r)) (at-robby ?r) (carry ?b ?g))
        :effect (and (free ?g) (at ?b ?r) (not (carry ?b ?g))))

)
