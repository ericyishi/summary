# ubuntuϵͳ

### ��������
1. û������root�û�����
   1. �������� "sudo passwd root"����ʾ���뵱ǰ�û����롣
   2. ��ʾ"�����µ�UNIX����"����ʱ����Ҫ���õ�root���룬��ʾ"���������µ�UNIX����"��ʱ������һ��root����
   3. ��ʾ "passwd���ѳɹ���������"���������� ��su root������ʾ�����룺"��ʱ����ո����õ�root����س����л�root�û��ɹ���

2. ʹ��xshell�޷���¼
   * Ĭ��û��װssh
      ```html
        sudo apt-get install openssh-server
        ssh localhost����������ͱ�ʾ��װ�ɹ���
      ```
3. filezilla��xshell root�û���¼����
   * ����������ʾ���£�
     ```html
      ����: Pass: **********
      ����: ��֤ʧ�ܡ�
      ����: ���ش���: �޷����ӵ�������
     ```
   * ԭ��Ubuntu�ܾ�root�û�sshԶ�̵�¼
   * ����������޸������ļ�
     1. sudo vim /etc/ssh/sshd_config
     2. �ҵ�����#ע�͵����У�PermitRootLogin prohibit-password
     3. �½�һ�� ��ӣ�PermitRootLogin yes
     4. ��������sudo service ssh restart

4. vi�༭ģʽ��������ʹ�ü��̵�����
   * �������󣺡�ʹ��vi���ļ�����������i����༭ģʽ����ʹ�÷�������������ң������ƶ����ʱ����������������µȵ���ĸ��ɾ����Ҳ��������
   * ԭ��ubuntuĬ�ϰ�װ����vim-tiny�汾
   * �������������װvim-full�汾
     1. ж��vim-tiny�������sudo apt-get remove vim-common
     2. ��װvim-full�����sudo apt-get install vim     
     
5. �л����ڵľ���Դ
   1. ���ƾ�������
      * [�廪����]��https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/�����Ҷ�Ӧ�İ汾
      * ����Ϊ16.04
      ```html
         # Ĭ��ע����Դ�뾵������� apt update �ٶȣ�������Ҫ������ȡ��ע��
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
         
         # Ԥ�������Դ������������
         # deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
      
      ```
   2. �����ļ�
      ```html
        ubuntu:~$ cd /etc/apt
        ubuntu:/etc/apt$ sudo cp sources.list sources.list.bak
        ubuntu:/etc/apt$ vim sources.list  
      ```  
      * ����ģʽ����: %d Ϊ�����������
   3. ����Դ��ʹ������Ч
      ```html
        ubuntu:~$ sudo apt-get update 
      ```   