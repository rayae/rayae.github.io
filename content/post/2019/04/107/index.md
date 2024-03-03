---
title: "本站KMS激活Windows和Office"
categories: [ "资源分享" ]
tags: [ None ]
draft: true
slug: "107"
date: "2019-04-27T18:39:00.000000"
---

本站KMS服务器激活Windows和Office

#Windows 激活命令
管理员身份运行 `cmd` 执行下列命令
```
slmgr.vbs -upk
slmgr.vbs -ipk "从下方选择对应的Windows的GVLK"
slmgr.vbs -skms bavelee.cn
slmgr.vbs -ato
slmgr.vbs -dlv
```

#Office 激活命令
同样以管理员身份运行
```
cd /d "%ProgramFiles%\Microsoft Office\Office*"
cscript ospp.vbs /sethst:bavelee.cn
cscript ospp.vbs /act
cscript ospp.vbs /dstatus
slmgr /ipk "从下方选择对应的Office的GVLK"
```







### KMS GVLK:
#### 常用的Key
**Windows 10 Enterprise LTSC 2019 ** : **` M7XTQ-FN8P6-TTKYV-9D4CC-J462D`**
**Windows 10 Home / Core ** : **` TX9XD-98N7V-6WMQ6-BX7FG-H8Q99`**
**Windows 10 Professional ** : **` W269N-WFGWX-YVC9B-4J6C9-T83GX`**
**Windows 7 Professional ** : **` FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4`**

**Office Word 2019 ** : **` PBX3G-NWMT6-Q7XBW-PYJGG-WXD33`**
**Office Professional Plus 2019 ** : **` NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP`**



**Windows Server 2019 ARM64 ** : **` GRFBW-QNDC4-6QBHG-CCK3B-2PR88`**
**Windows Server 2019 Azure Core ** : **` FDNH6-VW9RW-BXPJ7-4XTYG-239TB`**
**Windows Server 2019 Datacenter ** : **` WMDGN-G9PQG-XVVXX-R3X43-63DFG`**
**Windows Server 2019 Essentials ** : **` WVDHN-86M7X-466P6-VHXV7-YY726`**
**Windows Server 2019 Standard ** : **` N69G4-B89J2-4G8F4-WWYCC-J464C`**
**Windows Server 2019 Datacenter (Semi-Annual Channel v.1809) ** : **` 6NMRW-2C8FM-D24W7-TQWMY-CWH2D`**
**Windows Server 2019 Standard (Semi-Annual Channel v.1809) ** : **` N2KJX-J94YW-TQVFB-DG9YT-724CC`**
**Windows Server 2019 Standard [Preview] ** : **` MFY9F-XBN2F-TYFMP-CCV49-RMYVH`**
**Windows Server 2019 Datacenter [Preview] ** : **` 6XBNX-4JQGW-QX6QG-74P76-72V67`**
**Windows 10 Enterprise LTSC 2019 N ** : **` 92NFX-8DJQP-P6BBQ-THF9C-7CG2H`**
**Windows 10 Enterprise G ** : **` YYVX9-NTFWV-6MDM3-9PT4T-4M68B`**
**Windows 10 Enterprise G N ** : **` 44RPN-FTY23-9VTTB-MP9BX-T84FV`**
**Windows 10 Enterprise 2016 LTSB ** : **` DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ`**
**Windows 10 Enterprise 2016 LTSB N ** : **` QFFDN-GRT3P-VKWWX-X7T3R-8B639`**
**Windows 10 Home / Core Country Specific ** : **` PVMJN-6DFY6-9CCP6-7BKTT-D3WVR`**
**Windows 10 Home / Core N ** : **` 3KHY7-WNT83-DGQKR-F7HPR-844BM`**
**Windows 10 Home / Core Single Language ** : **` 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH`**
**Windows 10 Education N ** : **` 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ`**
**Windows 10 Education ** : **` NW6C2-QMPVW-D7KKK-3GKT6-VCFB2`**
**Windows 10 Enterprise ** : **` NPPR9-FWDCX-D2C8J-H872K-2YT43`**
**Windows 10 Enterprise [Preview] ** : **` QNMXX-GCD3W-TCCT4-872RV-G6P4J`**
**Windows 10 Enterprise S ** : **` H76BG-QBNM7-73XY9-V6W2T-684BJ`**
**Windows 10 Enterprise 2015 LTSB ** : **` WNMTR-4C88C-JK8YV-HQ7T2-76DF9`**
**Windows 10 Enterprise 2015 LTSB N ** : **` 2F77B-TNFGY-69QQF-B8YKP-D69TJ`**
**Windows 10 Enterprise N ** : **` DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4`**
**Windows 10 Enterprise S N ** : **` X4R4B-NV6WD-PKTVK-F98BH-4C2J8`**
**Windows 10 Professional Workstation ** : **` NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J`**
**Windows 10 Professional Workstation N ** : **` 9FNHH-K3HBT-3W4TD-6383H-6XYWF`**
**Windows 10 Professional Education ** : **` 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y`**
**Windows 10 Professional Education N ** : **` YVWGF-BXNMC-HTQYQ-CPQ99-66QFC`**
**Windows 10 Professional N ** : **` MH37W-N47XK-V7XM9-C7227-GCQG9`**
**Windows 10 Professional [Preview] ** : **` XQHPH-N4D9W-M8P96-DPDFP-TMVPY`**
**Windows 10 Professional WMC [Pre-Release] ** : **` NKPM6-TCVPT-3HRFX-Q4H9B-QJ34Y`**
**Windows 10 Enterprise for Virtual Desktops ** : **` CPWHC-NT2C7-VYW78-DHDB2-PG3GK`**
**Windows 10 Remote Server ** : **` 7NBT4-WGBQX-MP4H7-QXFF8-YP3KX`**
**Windows 10 S (Lean) ** : **` NBTWJ-3DR69-3C4V8-C26MC-GQ9M6`**
**Windows 10 IoT Core [Pre-Release] ** : **` 7NX88-X6YM3-9Q3YT-CCGBF-KBVQF`**
**Windows 10 Core Connected [Pre-Release] ** : **` DJMYQ-WN6HG-YJ2YX-82JDB-CWFCW`**
**Windows 10 Core Connected N [Pre-Release] ** : **` JQNT7-W63G4-WX4QX-RD9M9-6CPKM`**
**Windows 10 Core Connected Single Language [Pre-Release] ** : **` QQMNF-GPVQ6-BFXGG-GWRCX-7XKT7`**
**Windows 10 Core Connected Country Specific [Pre-Release] ** : **` FTNXM-J4RGP-MYQCV-RVM8R-TVH24`**
**Windows 10 Professional S [Pre-Release] ** : **` 3NF4D-GF9GY-63VKH-QRC3V-7QW8P`**
**Windows 10 Professional S N [Pre-Release] ** : **` KNDJ3-GVHWT-3TV4V-36K8Y-PR4PF`**
**Windows 10 Professional Student [Pre-Release] ** : **` YNXW3-HV3VB-Y83VG-KPBXM-6VH3Q`**
**Windows 10 Professional Student N [Pre-Release] ** : **` 8G9XJ-GN6PJ-GW787-MVV7G-GMR99`**
**Windows 7 Enterprise ** : **` 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH`**
**Windows 7 Enterprise E ** : **` C29WB-22CC8-VJ326-GHFJW-H9DH4`**
**Windows 7 Enterprise N ** : **` YDRBP-3D83W-TY26F-D46B2-XCKRJ`**
**Windows 7 Professional E ** : **` W82YF-2Q76Y-63HXB-FGJG9-GF7QX`**
**Windows 7 Professional N ** : **` MRPKT-YTG23-K7D7T-X2JMM-QY7MG`**
**Windows 7 Embedded POSReady ** : **` YBYF6-BHCR3-JPKRB-CDW7B-F9BK4`**
**Windows 7 Embedded Standard ** : **` XGY72-BRBBT-FF8MH-2GG8H-W7KCW`**
**Windows 7 ThinPC ** : **` 73KQT-CD9G6-K7TQG-66MRP-CQ22C`**
**Windows 8 Core / Server 2012 ** : **` BN3D2-R7TKB-3YPBD-8DRP2-27GG4`**
**Windows 8 Core / Server 2012 Country Specific ** : **` 4K36P-JN4VD-GDC6V-KDT89-DYFKP`**
**Windows 8 Core / Server 2012 N ** : **` 8N2M2-HWPGY-7PGT9-HGDD8-GVGGY`**
**Windows 8 Core / Server 2012 Single Language ** : **` 2WN2H-YGCQR-KFX6K-CD6TF-84YXQ`**
**Windows 8 Professional WMC ** : **` GNBB8-YVD74-QJHX6-27H4K-8QHDG`**
**Windows 8 Embedded Industry Professional ** : **` RYXVT-BNQG7-VD29F-DBMRY-HT73M`**
**Windows 8 Embedded Industry Enterprise ** : **` NKB3R-R2F8T-3XCDP-7Q2KW-XWYQ2`**
**Windows 8 Enterprise ** : **` 32JNW-9KQ84-P47T8-D8GGY-CWCK7`**
**Windows 8 Enterprise N ** : **` JMNMF-RHW7P-DMY6X-RF3DR-X2BQT`**
**Windows 8 Professional ** : **` NG4HW-VH26C-733KW-K6F98-J8CK4`**
**Windows 8 Professional N ** : **` XCVCF-2NXM9-723PB-MHCB7-2RYQQ`**
**Windows 8.1 Core ** : **` M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK`**
**Windows 8.1 Core ARM64 ** : **` XYTND-K6QKT-K2MRH-66RTM-43JKP`**
**Windows 8.1 Core Country Specific ** : **` NCTT7-2RGK8-WMHRF-RY7YQ-JTXG3`**
**Windows 8.1 Core N ** : **` 7B9N3-D94CG-YTVHR-QBPX3-RJP64`**
**Windows 8.1 Core Single Language ** : **` BB6NG-PQ82V-VRDPW-8XVD2-V8P66`**
**Windows 8.1 Professional Student ** : **` MX3RK-9HNGX-K3QKC-6PJ3F-W8D7B`**
**Windows 8.1 Professional Student N ** : **` TNFGH-2R6PB-8XM3K-QYHX2-J4296`**
**Windows 8.1 Professional WMC ** : **` 789NJ-TQK6T-6XTH8-J39CJ-J8D3P`**
**Windows 8.1 Core Connected ** : **` 3PY8R-QHNP9-W7XQD-G6DPH-3J2C9`**
**Windows 8.1 Core Connected Country Specific ** : **` R962J-37N87-9VVK2-WJ74P-XTMHR`**
**Windows 8.1 Core Connected N ** : **` Q6HTR-N24GM-PMJFP-69CD8-2GXKR`**
**Windows 8.1 Core Connected Single Language ** : **` KF37N-VDV38-GRRTV-XH8X6-6F3BB`**
**Windows 8.1 Enterprise ** : **` MHF9N-XY6XB-WVXMC-BTDCT-MKKG7`**
**Windows 8.1 Enterprise N ** : **` TT4HM-HN7YT-62K67-RGRQJ-JFFXW`**
**Windows 8.1 Professional ** : **` GCRJD-8NW9H-F2CDX-CCM8D-9D6T9`**
**Windows 8.1 Professional N ** : **` HMCNV-VVBFX-7HMBH-CTY9B-B4FXY`**
**Windows 8.1 Embedded Industry Professional ** : **` NMMPB-38DD4-R2823-62W8D-VXKJB`**
**Windows 8.1 Embedded Industry Automotive ** : **` VHXM3-NR6FT-RY6RT-CK882-KW2CJ`**
**Windows 8.1 Embedded Industry Enterprise ** : **` FNFKF-PWTVT-9RC8H-32HB2-JB34X`**
**Windows 8.1 Enterprise [Preview] ** : **` 2MP7K-98NK8-WPVF3-Q2WDG-VMD98`**
**Windows 8.1 Professional (Blue) [Preview] ** : **` MTWNQ-CKDHJ-3HXW9-Q2PFX-WB2HQ`**
**Windows 8 Professional WMC [RC] ** : **` MY4N9-TGH34-4X4VY-8FG2T-RRDPV`**
**Windows 8.x [Preview] ** : **` MPWP3-DXNP9-BRD79-W8WFP-3YFJ6`**
**Windows Server Next HI [Preview] ** : **` 7VX4N-3VDHQ-VYGHB-JXJVP-9QB26`**
**Windows Server 2008 Web ** : **` WYR28-R7TFJ-3X2YQ-YCY4H-M249D`**
**Windows Server 2008 HPC Edition ** : **` RCTX3-KWVHP-BR6TB-RB6DM-6X7HP`**
**Windows Server 2008 Standard ** : **` TM24T-X9RMF-VWXK6-X8JC9-BFGM2`**
**Windows Server 2008 Standard without Hyper-V ** : **` W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ`**
**Windows Server 2008 Enterprise ** : **` YQGMW-MPWTJ-34KDK-48M3W-X4Q6V`**
**Windows Server 2008 Enterprise without Hyper-V ** : **` 39BXF-X8Q23-P2WWT-38T2F-G3FPG`**
**Windows Server 2008 Datacenter ** : **` 7M67G-PC374-GR742-YH8V4-TCBY3`**
**Windows Server 2008 Datacenter without Hyper-V ** : **` 22XQ2-VRXRG-P8D42-K34TD-G3QQC`**
**Windows Server 2008 for Itanium Systems ** : **` 4DWFP-JF3DJ-B7DTH-78FJB-PDRHK`**
**Windows MultiPoint Server 2010 ** : **` 736RG-XDKJK-V34PF-BHK87-J6X3K`**
**Windows Server 2008 R2 Web ** : **` 6TPJF-RBVHG-WBW2R-86QPH-6RTM4`**
**Windows Server 2008 R2 HPC Edition ** : **` TT8MH-CG224-D3D7Q-498W2-9QCTX`**
**Windows Server 2008 R2 Standard ** : **` YC6KT-GKW9T-YTKYR-T4X34-R7VHC`**
**Windows Server 2008 R2 Enterprise ** : **` 489J6-VHDMP-X63PK-3K798-CPX3Y`**
**Windows Server 2008 R2 Datacenter ** : **` 74YFP-3QFB3-KQT8W-PMXWJ-7M648`**
**Windows Server 2008 R2 for Itanium Systems ** : **` GT63C-RJFQ3-4GMB6-BRFB9-CB83V`**
**Windows Server 2012 Datacenter ** : **` 48HP8-DN98B-MYWDG-T2DCC-8W83P`**
**Windows Server 2012 MultiPoint Premium ** : **` XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G`**
**Windows Server 2012 MultiPoint Standard ** : **` HM7DN-YVMH3-46JC3-XYTG7-CYQJJ`**
**Windows Server 2012 Standard ** : **` XC9B7-NBPP2-83J2H-RHMBY-92BT4`**
**Windows Server 2012 R2 Cloud Storage ** : **` 3NPTF-33KPT-GGBPR-YX76B-39KDD`**
**Windows Server 2012 R2 Datacenter ** : **` W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9`**
**Windows Server 2012 R2 Essentials ** : **` KNC87-3J2TX-XB4WP-VCPJV-M4FWM`**
**Windows Server 2012 R2 Standard ** : **` D2N9P-3P6X9-2R39C-7RTCD-MDVJX`**
**Windows Server 2016 Azure Core ** : **` VP34G-4NPPG-79JTQ-864T4-R3MQX`**
**Windows Server 2016 Cloud Storage ** : **` QN4C6-GBJD2-FB422-GHWJK-GJG2R`**
**Windows Server 2016 Datacenter ** : **` CB7KF-BWN84-R7R2Y-793K2-8XDDG`**
**Windows Server 2016 Essentials ** : **` JCKRF-N37P4-C2D82-9YXRT-4M63B`**
**Windows Server 2016 Standard ** : **` WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY`**
**Windows Server 2016 ARM64 ** : **` K9FYF-G6NCK-73M32-XMVPY-F9DRR`**
**Windows Server 2016 Datacenter (Semi-Annual Channel v.1803) ** : **` 2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG`**
**Windows Server 2016 Standard (Semi-Annual Channel v.1803) ** : **` PTXN8-JFHJM-4WC78-MPCBR-9W4KR`**
**Windows Server 2016 Datacenter [Preview] ** : **` VRDD2-NVGDP-K7QG8-69BR4-TVFHB`**
**Windows Vista Business ** : **` YFKBB-PQJJV-G996G-VWGXY-2V3X8`**
**Windows Vista Business N ** : **` HMBQG-8H2RH-C77VX-27R82-VMQBT`**
**Windows Vista Enterprise ** : **` VKK3X-68KWM-X2YGT-QR4M6-4BWMV`**
**Windows Vista Enterprise N ** : **` VTC42-BM838-43QHV-84HX6-XJXKV`**
**Windows Vista Business [Preview 1] ** : **` XQYF4-QVCMY-YXQRD-9QPV8-3YP9V`**
**Windows Vista Business [Preview 2] ** : **` YVT36-YVCP2-J97GQ-7T22R-RWV8P`**
**Windows Vista Business N [Preview] ** : **` HGBJ9-RWD6M-6HDGW-6T2XD-JQ66F`**
**Windows Vista Enterprise [Preview 1] ** : **` 3JHG3-Y66GP-B7F3K-JFVX2-VBH7K`**
**Windows Vista Enterprise [Beta-2 build 5384] ** : **` MF9PG-RQK7R-26BPJ-TWFYK-RHXCM`**
**Windows Longhorn Web [Preview] ** : **` MDRCM-4WKCW-J93FF-J9Q48-M6KBB`**
**Windows Longhorn Standard ** : **` Q37JX-P3HHB-GKRH2-PDBKG-GGXPW`**
**Windows Longhorn Enterprise ** : **` 7KYMQ-R788Q-4RF69-KTWKM-92PFJ`**
**Windows Longhorn Datacenter [Preview] ** : **` HR8VD-7DHG2-48378-M9D73-28F4T`**
**Windows Longhorn for Itanium Systems [Preview] ** : **` CWV9H-PHGPW-V93WV-QBQV9-8V336`**
**Office Access 2010 ** : **` V7Y44-9T38C-R2VJK-666HK-T7DDX`**
**Office Excel 2010 ** : **` H62QG-HXVKF-PP4HP-66KMR-CW9BM`**
**Office Groove (SharePoint Workspace) 2010 ** : **` QYYW6-QP4CB-MBV6G-HYMCJ-4T3J4`**
**Office InfoPath 2010 ** : **` K96W8-67RPQ-62T9Y-J8FQJ-BT37T`**
**Office Mondo 1 2010 ** : **` YBJTT-JG6MD-V9Q7P-DBKXJ-38W9R`**
**Office Mondo 2 2010 ** : **` 7TC2V-WXF6P-TD7RT-BQRXR-B8K32`**
**Office OneNote 2010 ** : **` Q4Y4M-RHWJM-PY37F-MTKWH-D3XHX`**
**Office OutLook 2010 ** : **` 7YDC2-CWM8M-RRTJC-8MDVC-X3DWQ`**
**Office PowerPoint 2010 ** : **` RC8FX-88JRY-3PF7C-X8P67-P4VTT`**
**Office Professional Plus 2010 ** : **` VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB`**
**Office Project Professional 2010 ** : **` YGX6F-PGV49-PGW3J-9BTGG-VHKC6`**
**Office Project Standard 2010 ** : **` 4HP3K-88W3F-W2K3D-6677X-F9PGB`**
**Office Publisher 2010 ** : **` BFK7F-9MYHM-V68C7-DRQ66-83YTP`**
**Office Small Business Basics 2010 ** : **` D6QFG-VBYP2-XQHM7-J97RH-VVRCK`**
**Office Standard 2010 ** : **` V7QKV-4XVVR-XYV4D-F7DFM-8R6BM`**
**Office Visio Premium 2010 ** : **` D9DWC-HPYVV-JGF4P-BTWQB-WX8BJ`**
**Office Visio Professional 2010 ** : **` 7MCW8-VRQVK-G677T-PDJCM-Q8TCP`**
**Office Visio Standard 2010 ** : **` 767HD-QGMWX-8QTDB-9G3R2-KHFGJ`**
**Office Word 2010 ** : **` HVHB3-C6FV7-KQX9W-YQG79-CRY7T`**
**Office Starter 2010 Retail ** : **` VXHHB-W7HBD-7M342-RJ7P8-CHBD6`**
**Office SharePoint Designer (Frontpage) 2010 Retail ** : **` H48K6-FB4Y6-P83GH-9J7XG-HDKKX`**
**Office Access 2013 ** : **` NG2JY-H4JBT-HQXYP-78QH9-4JM2D`**
**Office Excel 2013 ** : **` VGPNG-Y7HQW-9RHP7-TKPV3-BG7GB`**
**Office InfoPath 2013 ** : **` DKT8B-N7VXH-D963P-Q4PHY-F8894`**
**Office Lync 2013 ** : **` 2MG3G-3BNTT-3MFW9-KDQW3-TCK7R`**
**Office Mondo 2013 ** : **` 42QTK-RN8M7-J3C4G-BBGYM-88CYV`**
**Office OneNote 2013 ** : **` TGN6P-8MMBC-37P2F-XHXXK-P34VW`**
**Office OutLook 2013 ** : **` QPN8Q-BJBTJ-334K3-93TGY-2PMBT`**
**Office PowerPoint 2013 ** : **` 4NT99-8RJFH-Q2VDH-KYG2C-4RD4F`**
**Office Professional Plus 2013 ** : **` YC7DK-G2NP3-2QQC3-J6H88-GVGXT`**
**Office Project Professional 2013 ** : **` FN8TT-7WMH6-2D4X9-M337T-2342K`**
**Office Project Standard 2013 ** : **` 6NTH3-CW976-3G3Y2-JK3TX-8QHTT`**
**Office Publisher 2013 ** : **` PN2WF-29XG2-T9HJ7-JQPJR-FCXK4`**
**Office Standard 2013 ** : **` KBKQT-2NMXY-JJWGP-M62JB-92CD4`**
**Office Visio Professional 2013 ** : **` C2FG9-N6J68-H8BTJ-BW3QX-RM3B3`**
**Office Visio Standard 2013 ** : **` J484Y-4NKBF-W2HMG-DBMJC-PGWR7`**
**Office Word 2013 ** : **` 6Q7VD-NX8JD-WJ2VH-88V73-4GBJ7`**
**Office SharePoint Workspace (Groove) 2013 ** : **` H7R7V-WPNXQ-WCYYC-76BGV-VT7GH`**
**Office SharePoint Designer (Frontpage) 2013 Retail ** : **` GYJRG-NMYMF-VGBM4-T3QD4-842DW`**
**Office Access 2013 [Pre-Release] ** : **` DJBH8-RGN7Q-836KD-DMP3M-DM9MF`**
**Office Excel 2013 [Pre-Release] ** : **` Q3BNP-3WXDT-GG8HF-24KMW-HMDBK`**
**Office SharePoint Workspace (Groove) 2013 [Pre-Release] ** : **` WVCGG-NK4FG-7XKXM-BD4WF-3C624`**
**Office InfoPath 2013 [Pre-Release] ** : **` 7KPJJ-N8TT7-CK3KR-QTV98-YPVXQ`**
**Office Lync 2013 [Pre-Release] ** : **` XNVD3-RYC7T-7R6BT-WX6CF-8BYH7`**
**Office Mondo 2013 [Pre-Release] ** : **` GCGCN-6FJRM-TR9Q3-BGMWJ-78KQV`**
**Office OneNote 2013 [Pre-Release] ** : **` VYNYX-8GPBC-7FQMD-D6B7B-7MDFD`**
**Office Outlook 2013 [Pre-Release] ** : **` X2KNB-FRRG2-WXDPH-739DM-DM9RH`**
**Office PowerPoint 2013 [Pre-Release] ** : **` B8CT8-BTNFQ-XQXBK-BFWV8-HMDFQ`**
**Office Professional Plus 2013 [Pre-Release] ** : **` PGD67-JN23K-JGVWV-KTHP4-GXR9G`**
**Office Project Professional 2013 [Pre-Release] ** : **` NFKVM-DVG7F-TYWYR-3RPHY-F872K`**
**Office Project Standard 2013 [Pre-Release] ** : **` N89QF-GGB8J-BKD28-C4V28-W4XTK`**
**Office Publisher 2013 [Pre-Release] ** : **` NB67P-J8XP4-XDK9B-V73VH-M4CKR`**
**Office Visio Professional 2013 [Pre-Release] ** : **` B3C7Q-D6NH2-2VRFW-HHWDG-FVQB6`**
**Office Visio Standard 2013 [Pre-Release] ** : **` 9MKNF-J9XQ6-JV4XB-FJQPY-43F43`**
**Office Word 2013 [Pre-Release] ** : **` JBGD4-3JNG7-JWWGV-CR6TP-DC62Q`**
**Office Access 2016 ** : **` GNH9Y-D2J4T-FJHGG-QRVH7-QPFDW`**
**Office Excel 2016 ** : **` 9C2PK-NWTVB-JMPW8-BFT28-7FTBF`**
**Office Mondo 2016 ** : **` HFTND-W9MK4-8B7MJ-B6C4G-XQBR2`**
**Office Mondo Retail 2016 ** : **` DMTCJ-KNRKX-26982-JYCKT-P7KB6`**
**Office OneNote 2016 ** : **` DR92N-9HTF2-97XKM-XW2WJ-XW3J6`**
**Office Outlook 2016 ** : **` R69KK-NTPKF-7M3Q4-QYBHW-6MT9B`**
**Office Powerpoint 2016 ** : **` J7MQP-HNJ4Y-WJ7YM-PFYGF-BY6C6`**
**Office Professional Plus 2016 ** : **` XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99`**
**Office Project Professional 2016 ** : **` YG9NW-3K39V-2T3HJ-93F3Q-G83KT`**
**Office Project Professional 2016 C2R [Preview] ** : **` WGT24-HCNMF-FQ7XH-6M8K7-DRTW9`**
**Office Project Standard 2016 ** : **` GNFHQ-F6YQM-KQDGJ-327XX-KQBVC`**
**Office Project Standard 2016 C2R [Preview] ** : **` D8NRQ-JTYM3-7J2DX-646CT-6836M`**
**Office Publisher 2016 ** : **` F47MM-N3XJP-TQXJ9-BP99D-8K837`**
**Office Skype for Business 2016 ** : **` 869NQ-FJ69K-466HW-QYCP2-DDBV6`**
**Office Standard 2016 ** : **` JNRGM-WHDWX-FJJG3-K47QV-DRTFM`**
**Office Visio Professional 2016 ** : **` PD3PC-RHNGV-FXJ29-8JK7D-RJRJK`**
**Office Visio Professional 2016 C2R [Preview] ** : **` 69WXN-MBYV6-22PQG-3WGHK-RM6XC`**
**Office Visio Standard 2016 ** : **` 7WHWN-4T7MP-G96JF-G33KR-W8GF4`**
**Office Visio Standard 2016 C2R [Preview] ** : **` NY48V-PPYYH-3F4PX-XJRKJ-W4423`**
**Office Word 2016 ** : **` WXY84-JN2Q9-RBCCQ-3Q3J3-3PFJ6`**
**Office Professional Plus 2019 C2R [Preview] ** : **` VQ9DP-NVHPH-T9HJC-J9PDT-KTQRG`**
**Office Project Professional 2019 C2R [Preview] ** : **` XM2V9-DN9HH-QB449-XDGKC-W2RMW`**
**Office Visio Professional 2019 C2R [Preview] ** : **` N2CG9-YD3YK-936X4-3WR82-Q3X4H`**
**Office Access 2019 ** : **` 9N9PT-27V4Y-VJ2PD-YXFMF-YTFQT`**
**Office Excel 2019 ** : **` TMJWT-YYNMB-3BKTF-644FC-RVXBD`**
**Office Outlook 2019 ** : **` 7HD7K-N4PVK-BHBCQ-YWQRW-XW4VK`**
**Office Powerpoint 2019 ** : **` RRNCX-C64HY-W2MM7-MCH9G-TJHMQ`**
**Office Project Professional 2019 ** : **` B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B`**
**Office Project Standard 2019 ** : **` C4F7P-NCP8C-6CQPT-MQHV9-JXD2M`**
**Office Publisher 2019 ** : **` G2KWX-3NW6P-PY93R-JXK2T-C9Y9V`**
**Office Skype for Business 2019 ** : **` NCJ33-JHBBY-HTK98-MYCV8-HMKHJ`**
**Office Standard 2019 ** : **` 6NWWJ-YQWMR-QKGCB-6TMB3-9D9HK`**
**Office Visio Professional 2019 ** : **` 9BGNQ-K37YR-RQHF2-38RQ3-7VCBB`**
**Office Visio Standard 2019 ** : **` 7TQNQ-K3YQQ-3PFH7-CCPPM-X4VQ2`**



