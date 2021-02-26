package com.hbue.sys.utils;

import java.util.ArrayList;
import java.util.List;

public class TreeNodeBuilder {

    public static List<TreeNode> buildTreeNodes(List<TreeNode> nodes, Integer topPid) {
        List<TreeNode> treeNodes=new ArrayList<>();//工具用来存放父节点数据
        for (TreeNode n1 : nodes) {
            //if 和for先后顺序并没有影响
            //因为该数据类型为引用类型
            //add添加的是数据地址 for 和if先后并不会影响整个for循环结束后的数据
            //但是如果此时将数据在控制台打印则两种方式的打印结果会有所不同

            if (n1.getPid()==topPid){
                treeNodes.add(n1);
            }
            for (TreeNode n2 : nodes) {
                if (n2.getPid()==n1.getId()){
                    n1.getChildren().add(n2);
                }
            }
        }
        return treeNodes;
    }
}
