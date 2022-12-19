;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain BLOCKS)
  (:requirements :strips :typing)
  (:types 
      block hand 
  )
  (:predicates (on ?x - block ?y - block)
	       (ontable ?x - block)
	       (clear ?x - block)
	       (handempty ?h - hand)
	       (holding ?x - block ?h - hand)
	       )

  (:action pick-up
	     :parameters (?x - block ?h - hand)
	     :precondition (and (clear ?x) (ontable ?x) (handempty ?h))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (handempty ?h))
		   (holding ?x ?h)))

  (:action put-down
	     :parameters (?x - block ?h - hand)
	     :precondition (holding ?x ?h)
	     :effect
	     (and (not (holding ?x ?h))
		   (clear ?x)
		   (handempty ?h)
		   (ontable ?x)))
  (:action stack
	     :parameters (?x - block ?y - block ?h - hand)
	     :precondition (and (holding ?x ?h) (clear ?y))
	     :effect
	     (and (not (holding ?x ?h))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty ?h)
		   (on ?x ?y)))
  (:action unstack
	     :parameters (?x - block ?y - block ?h - hand)
	     :precondition (and (on ?x ?y) (clear ?x) (handempty ?h))
	     :effect
	     (and (holding ?x ?h)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty ?h))
		   (not (on ?x ?y)))))
