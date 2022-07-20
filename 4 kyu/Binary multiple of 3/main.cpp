#include <bits/stdc++.h>

// https://math.stackexchange.com/questions/140283/why-does-this-fsm-accept-binary-numbers-divisible-by-three
// Eliminate C: transition from B to B becomes: t = 01*0
// Eliminate B: transition from A to A via B becomes: T = 1t*1
// Single transition from A to A via B or not: r = 0|T*
// Result is transition from A (initial) to A (final) any number of times: R = r*

const std::string multiple_of_3_regex = "(0|(1(01*0)*1)*)*";