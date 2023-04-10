## 鸣谢

- [zonemeen/musicn](https://github.com/zonemeen/musicn)

## 概述

可播放及下载高品质音乐的命令行工具 [musicn](https://github.com/zonemeen/musicn) 的容器版本，支持 amd64/arm64 架构。

![image](https://user-images.githubusercontent.com/98247050/230909773-52d95ba7-e42e-4612-86dd-7cb363bc3f2f.png)


## 部署

  ```
  docker run -d --name=musicn --restart=unless-stopped -v ${PWD}/musicn:/data -p 7478:7478 ghcr.io/wy580477/musicn-container:latest msc -q
  ```
  ${PWD}/musicn 为命令行模式下载文件存放目录，默认当前目录下 musicn 文件夹。
  
  执行 musicn 命令:

  ```
  docker run -it musicn msc 周杰伦
  
  # 设置 bash 命令别名方便使用，重新登陆 shell 后生效
  echo "alias msc='docker exec -it musicn msc'" >> ~/.bashrc
  
  # 查看命令帮助
  msc -h
  ```
  更多命令用法详见： [musicn 文档](https://github.com/zonemeen/musicn#%E6%90%9C%E7%B4%A2%E7%9A%84%E9%A1%B5%E7%A0%81%E6%95%B0%E9%BB%98%E8%AE%A4%E6%98%AF%E7%AC%AC1%E9%A1%B5)
  
  访问 http://<宿主机 ip>:7478/music 可到达 Web 搜索和下载界面。(扫码访问功能不可用, 请手动输入网址访问)
  
  ![image](https://user-images.githubusercontent.com/98247050/230908384-99c5d283-26f6-4a9b-aa9f-104ccf7e4702.png)
  
### Docker-Compose 部署

  ```
version: '3.4'
services:

  musicn:
    image: ghcr.io/wy580477/musicn-container:latest
    container_name: musicn
    restart: unless-stopped
    entrypoint: ["msc", "-q"]
    ports:
      - "7478:7478"
    volumes:
      - ./musicn:/data
   ``` 
  
