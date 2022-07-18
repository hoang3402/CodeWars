// test cases
import { oddCount } from './solution';
import { assert } from "chai";

describe("Test Cases", function () {
    it('should work for random cases', () => {
        for (let i = 1; i <= 200; i += 1) {
            let n = Math.ceil(Math.random() * (Number as any).MAX_SAFE_INTEGER);

            var usoln = oddCount(n),
                soln = Math.floor(n / 2);

            assert.equal(usoln, soln);
        }
    })
});