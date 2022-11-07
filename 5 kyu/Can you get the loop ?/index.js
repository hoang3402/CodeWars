function loop_size(node) {
    if (node == node.next) return 1;

    for (var slow = node, fast = node.next, count = 0; ;) {
        if (slow === fast) {
            while (fast.next !== slow) {
                count++;
                fast = fast.next;
            }
            return count;
        }
        slow = slow.next;
        fast = fast.next.next;
    }
}

function loop_size(node) {
    var map = new WeakMap(), i = 0;

    while (map.get(node) === void 0) {
        map.set(node, ++i);
        node = node.getNext();
    }

    return i - map.get(node) + 1;
}

function loop_size(node) {
    let lastIndex = 0;
    let indices = new WeakMap();
    while (indices.get(node) == null) {
        indices.set(node, lastIndex++);
        node = node.next;
    }
    return lastIndex - indices.get(node);
}

function loop_size(node) {
    var len = 2,
        current = node;
    while (true) {
        for (var i = 1; i <= len; i++) {
            node = node.getNext();
            if (node == current) {
                return i;
            }
        }
        current = node;
        len *= 2;
    }
}