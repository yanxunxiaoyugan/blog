1. git合并一个分支的部门代码

   > 找出B上需要的commit
   > 1)git checkout A;git cherry-pick $commit
   > 2)git checkout B;git format-patch $commit^..$commit;git checkout A;git am $patch
   >
   > 第一种方式比较直接，第二种方式在本地操作的话有点多此一举，但你可以把patch分享给别人
   >
   > 此外，还有一些其它的方式，你对git常用命令理解之后，可以自己尝试下。
  
   name 