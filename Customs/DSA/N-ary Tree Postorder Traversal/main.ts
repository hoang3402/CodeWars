function postorder(root: _Node | null): number[] {
	const result: number[] = [];

	function traverse(node: _Node | null) {
			if (node === null) return;

			for (let child of node.children) {
					traverse(child);
			}

			result.push(node.val);
	}

	traverse(root);
	return result;
}