;Doing (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) m))
;Instead of (square (expmod base (/ exp 2) m))
;Will cause the algorithm to run in θ(n) instead of θ(log n)
;because we are running expmod twice at each iteration instead of once.
;Since expmod makes recursive call, we will double the work each time the branch is executed
;=> θ(log 2**n) => θ(n log 2) => θ(n)