export class PaginationHelper<T> {
    private itemsPerPage: number;
    private _itemCount: number;
    private _pageCount: number;

    constructor(collection: T[], itemsPerPage: number) {
        this.itemsPerPage = itemsPerPage;
        this._itemCount = collection.length;
        this._pageCount = Math.ceil(this._itemCount / this.itemsPerPage);
    }

    itemCount(): number {
        return this._itemCount;
    }

    pageCount(): number {
        return this._pageCount;
    }

    pageItemCount(pageIndex: number): number {
        if (pageIndex < 0 || pageIndex >= this._pageCount) {
            return -1;
        }
        if (pageIndex === this._pageCount - 1) {
            return this._itemCount % this.itemsPerPage || this.itemsPerPage;
        }
        return this.itemsPerPage;
    }

    pageIndex(itemIndex: number): number {
        if (itemIndex < 0 || itemIndex >= this._itemCount) {
            return -1;
        }
        return Math.floor(itemIndex / this.itemsPerPage);
    }
}