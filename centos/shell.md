1. docker导入当前目录下的tar包

   > ls *.tar | xargs -I {} docker load -i {}