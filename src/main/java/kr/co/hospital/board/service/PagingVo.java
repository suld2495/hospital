package kr.co.hospital.board.service;

public class PagingVo {
    private int pageCount;
    private int blockStartNum;
    private int blockLastNum;
    private int lastPageNum;
    private int currentPage;
    private int start;
    private int end;
    private int total;
    private String title;
    private String search_text;
    private String type;
    private String tableName;
    private int boardNum;
    private String id;
    private String tab;

    public PagingVo(int pageCount, int currentPage, String tableName, String search_text, String type) {
        this.pageCount = pageCount;
        this.currentPage = currentPage;
        this.tableName = tableName;
        this.search_text = search_text;
        this.type = type;
        this.start = (this.currentPage - 1) * this.pageCount;
        this.end = this.pageCount;
    }

    public PagingVo(String tableName, int boardNum) {
        this.tableName = tableName;
        this.boardNum = boardNum;
    }

    public String getTab() {
        return tab;
    }

    public void setTab(String tab) {
        this.tab = tab;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getBlockStartNum() {
        return blockStartNum;
    }

    public void setBlockStartNum(int blockStartNum) {
        this.blockStartNum = blockStartNum;
    }

    public int getBlockLastNum() {
        return blockLastNum;
    }

    public void setBlockLastNum(int blockLastNum) {
        this.blockLastNum = blockLastNum;
    }

    public int getLastPageNum() {
        return lastPageNum;
    }

    public void setLastPageNum(int lastPageNum) {
        this.lastPageNum = lastPageNum;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getSearch_text() {
        return search_text;
    }

    public void setSearch_text(String search_text) {
        this.search_text = search_text;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void makeLastPageNum(int total) {
        int blockNum = 0;
        this.total = total;

        blockNum = (int)Math.floor((this.currentPage-1)/ pageCount);
        blockStartNum = (pageCount * blockNum) + 1;
        blockLastNum = blockStartNum + (pageCount-1);

        if( total % pageCount == 0 ) {
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else {
            lastPageNum = (int)Math.floor(total/pageCount) + 1;
        }

        if (blockLastNum > lastPageNum) {
            blockLastNum = lastPageNum;
        }

        if (total == 0) {
            blockLastNum = lastPageNum = 1;
        }
    }
}
