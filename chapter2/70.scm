(load "chapter2/67")
(load "chapter2/68")
(load "chapter2/69")

(define lyrics-frequency '(
                            (A 2)
                            (BOOM 1)
                            (GET 2)
                            (JOB 2)
                            (NA 16)
                            (SHA 3)
                            (YIP 9)
                            (WAH 1)
                            ))

(define song-tree (generate-huffman-tree lyrics-frequency))

(define song '(Get a job
                Sha na na na na na na na na
                Get a job
                Sha na na na na na na na na
                Wah yip yip yip yip yip yip yip yip yip
                Sha boom))

(define encoded-song (encode song song-tree))
encoded-song ; Obtained: (0 1 1 1 1 1 0 1 1 0 0 0 1 1 1 1 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 1 1 0 0 0 1 1 1 1 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 1 1 0 0 1 1 0 1 1)

(length encoded-song) ; Obtained: 84
(length song) ; Obtained: 36
;With a fixed-length encoding (3 bits for each of the 8 words), the encoded song would be 3 * 36 = 108 bits
