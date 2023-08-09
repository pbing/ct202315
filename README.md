# c't puzzle 2023/15

## Installation
```shell
git clone https://github.com/pbing/ct202315.git
cd ct202315
cabal build
```

## Usage
Calculate the solution with brute-force.
```shell
time cabal run ct202315 slow > solution-slow.txt
```

Calculate the solution with fast algorithm.
```shell
time cabal run ct202315 fast > solution-fast.txt
```

Decode the solution.
```shell
cabal run ct202315 decode > decode.txt
```

## Results
with Macbook Pro 14-inch 2021 (Apple M1 Pro processor)

* Brute force solution: 45 min
* Fast solution: < 0.1 s

## References
* [Oliver Lau, Georg Schnurer, "Homeoffice-Bundle", c't 2023, Heft 15, S. 74 ff.](https://www.heise.de/select/ct/2023/15/2314415160191260453)
* [Oliver Lau, "Klein, aber oho²", c't 2023, Heft 17, S. 130 ff.](https://www.heise.de/select/ct/2023/17/2314312462028898745)
* [Puzzle as PDF](https://ct.de/ypg7)
* [Keith Brandt et al, "Using backtracking to solve the Scramble Squares Puzzle".](https://www.heise.de/s/Vx6M)
* [Lior Sinai, "Scramble Puzzle Solver in Python", posted on 26 June 2016.](https://liorsinai.github.io/coding/2020/06/26/scramble-puzzle.html)
* ["Edge-matching puzzle", https://en.wikipedia.org/wiki/Edge-matching_puzzle](https://en.wikipedia.org/wiki/Edge-matching_puzzle)
