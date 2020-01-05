;; SICP Exercise 1.14

(define (count-change amount) (cc amount 5))
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
      ((or (< amount 0) (= kinds-of-coins 0)) 0)
      (else (+ (cc amount
                   (- kinds-of-coins 1))
               (cc (- amount
                      (first-denomination kinds-of-coins))
                   kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;; Tree for 11 cents (count-change 11)

11 cents: (cc 11 5)
              |
     (11 4)   +   (-39 5) = 0
        \
         \
          \_________________________________
                                            \
                                            |
                          (11 3) -----------+-------------------- (-14 4)=0
                            |
             (11 2) --------+------------------------- (1 3)
                |                                        |
      (11 1) ---+------ (6 2)                      (1 2) + (-9 3)=0
       / \               /  \                        / \
(11 0)=0 (10 1)    (6 1)     (1 2)               (1 1) (-4 2)=0
           |         |         / \                / \
           |      see below   /   \              /   \
  (10 0)=0 + (9 1)         (1 1) (-4 2)=0   (1 0)=0 (0 1)=1
            /  |           /   \                    =======
     (9 0)=0 (8 1)     (1 0)=0 (0 1)=1
            /  |               =======
     (8 0)=0 (7 1)
            /  |
     (7 0)=0 (6 1)
            /  |
     (6 0)=0 (5 1)
            /  |
     (5 0)=0 (4 1)
            /  |
     (4 0)=0 (3 1)
            /  |
     (3 0)=0 (2 1)
            /  |
     (2 0)=0 (1 1)
            /  |
     (1 0)=0 (0 1)=1
             =======

(count-change 11) = 4,including the redundant (cc 6 1) subtree)4

Order of growth

Space:
The height of the tree is proportional to the amount to be changed since we remove at least 1 cent after each step, except for leaf nodes. Hence space required by count-change procedure grows linearly with amount and is O(n). 

Time:

O(n^k) where k is the number of kinds of coins. This can be demonstrated by induction:

- Starting with the observation of (cc 6 1) node (n=6, k=1, value=1) above, generating 2*n + 1 = 13 calls.

Computing (cc n k) with highest coin value v has a complexity of

X(n, k, v) (n/v)*(X(n, k-1, u) + 1) + 1 => O(n^(k+1))

Two beautiful demonstrations with more details:
- http://www.ysagade.nl/2015/04/12/sicp-change-growth/
- https://billthelizard.blogspot.com/2009/12/sicp-exercise-114-counting-change.html


