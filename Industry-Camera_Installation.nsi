!addincludedir include
!include  "WinVer.nsh"  
!include  "logiclib.nsh"
!include  "x64.nsh"
!include "WordFunc.nsh"

XPStyle on
AllowRootDirInstall true

;;
;; 安装包版本号，每次发布新的安装包时需要改变
;;
!define    SETUP_VERSION           "v2"   

;;
;; 安装包执行文件使用的图标
;;
Icon                                           "resource\install.ico"

;;
;; 卸载程序图标
;;
UninstallIcon                              "resource\uninstall.ico"


;; 卸载程序标题
;;
UninstallCaption                         "CatchBEST Industry Camera Uninstallation"

;;
;; 公司名
;;
!define    COMPANY		   "CatchBEST"

;;
;; 卸载程序名称
;;
!define    UNINSTALL                   "Uninstall"

;;
;; 标题，这个Caption不能用${Caption}来引用
;;
!define    CAPTION                      "CatchBEST Industry Camera Installation"

;;
;; 标题，是NSIS的常规属性，这个Caption不能用${Caption}来引用
;;
Caption	                                   "CatchBEST Industry Camera Installation"

;;
;; 安装包名称
;;
OutFile                                           "${CAPTION}_${SETUP_VERSION}.exe" 

;;
;; KSJShow版本
;;
!define    KSJSHOW_VERSION           "2.8.0.0"                    ;; **KSJSHOW的版本号，文件夹必须与此版本号一致
!define    KSJSHOW_EXE_NAME        "KSJShow"                ;; ^^执行程序名

;;
;; USB驱动版本
;;
!define    KSJDRV_USB_VERSION      "10.0.0.0"                ;; **驱动程序的版本号，文件夹必须与此版本号一致


;;
;; 这个是根据本地github的结构定义的。
;;
!define    GITHUB_DIR_DRIVERS                                "..\github.CatchBEST-Drivers\Drivers" 
!define    GITHUB_DIR_APPLICATION                        "..\github.Industry-Camera-Applications\Applications"        
!define    GITHUB_DIR_DEVELOPMENT                      "..\github.Industry-Camera-Development\Development"     
!define    GITHUB_DIR_DEVELOPMENT_ANDROID     "..\github.Industry-Camera-Development-Android\Development-Android" 
!define    GITHUB_DIR_DEVELOPMENT_LINUX          "..\github.Industry-Camera-Development-Linux\Development-Linux" 
!define    GITHUB_DIR_THIRDPART                            "..\github.Industry-Camera-ThirdPart\ThirdPart"                
!define    GITHUB_DIR_TOOLS                                   "..\github.Indestry-Camera-Tools\Tools"
!define    GITHUB_DIR_MANUAL                               "..\github.CatchBEST-Manual\Manual"

!define    GITHUB_DIR_THIRDPART_TWAIN                  "${GITHUB_DIR_THIRDPART}\Twain" 
!define    GITHUB_DIR_THIRDPART_HALCON               "${GITHUB_DIR_THIRDPART}\Halcon" 
!define    GITHUB_DIR_THIRDPART_DIRECTSHOW        "${GITHUB_DIR_THIRDPART}\DirectShow"
;;
;; 这个是安装后的目录结构及INSTDIR文件夹下的子文件夹名称。
;;
!define    INSTALL_DIR                                               "IndustryCamera"    
!define    INSTALL_DIR_DRIVERS                                "Drivers"                        
!define    INSTALL_DIR_APPLICATION                        "IndustryCamera\Applications"        
!define    INSTALL_DIR_DEVELOPMENT                     "IndustryCamera\Development" 
!define    INSTALL_DIR_DEVELOPMENT_ANDROID     "IndustryCamera\Development-Android"   
!define    INSTALL_DIR_DEVELOPMENT_LINUX          "IndustryCamera\Development-Linux" 
!define    INSTALL_DIR_THIRDPART                            "IndustryCamera\ThirdPart"                
!define    INSTALL_DIR_TOOLS                                   "IndustryCamera\Tools"
!define    INSTALL_DIR_MANUAL                               "Manual"           

!define    INSTALL_DIR_THIRDPART_TWAIN                "${INSTALL_DIR_THIRDPART}\Twain"
!define    INSTALL_DIR_THIRDPART_HALCON             "${INSTALL_DIR_THIRDPART}\Halcon"
!define    INSTALL_DIR_THIRDPART_DIRECTSHOW      "${INSTALL_DIR_THIRDPART}\DirectShow"
;;
;;这里的InstallDir的值，就是$INSTDIR的值，设置默认安装路径
;;
InstallDir                         $PROGRAMFILES\${COMPANY}

;;
;; 如下为程序启动项链接的程序完整路径
;; CatchBEST
;;     |----Industry Camera
;;               |----Applications
;;                       |----KSJShow                  link to:             $INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x86\${KSJSHOW_EXE_NAME}.exe
;;                                                            or $INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x64\${KSJSHOW_EXE_NAME}64.exe
;;               |----Development                          
;;                       |----VC                           link to: $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\VC
;;                       |----VB                           link to:  $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\VB
;;                       |----C#                           link to:  $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\C#
;;                       |----Halcon                     link to:     $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\Halcon
;;                       |----OpenCV                   link to:      $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\OpenCV
;;                       |----Labview                   link to:    $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\Labview
;;                       |----...                             link to:  $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\...
;;                       |----Doc                         link to:    $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc
;;                       |----Samples                  link to：  ${LINK_DEVELOPMENT_SAMPLES}    
;;                       |----CHM                       link to:    $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc\凯视佳工业相机API函数说明书.chm
;;               |----Development-Android
;;               |----Development-Linux
;;               |----Uninstall
;;     |----Drivers                              $INSTDIR\${INSTALL_DIR_DRIVERS}
;;     |----Manual                             所有系列产品手册

;;
;; 相关链接路径
;; 
!define    LINK_KSJSHOW_X86                      "$INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x86\${KSJSHOW_EXE_NAME}.exe"
!define    LINK_KSJSHOW_X64                      "$INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x64\${KSJSHOW_EXE_NAME}64.exe"

!define    LINK_DRIVERS                               "$INSTDIR\${INSTALL_DIR_DRIVERS}"


;;
;; 开发快捷菜单链接名
;;
!define   SHORTCUT_DEVELOPMENT_DIR                                                              "Development"
!define   SHORTCUT_DEVELOPMENT_LINKNAME_SAMPLES                                   "Samples"
!define   SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL                    "凯视佳工业相机API函数说明书"


;;
;; 开发快捷菜单对应的链接地址
;;
!define    LINK_DEVELOPMENT_SAMPLES                  "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples"
!define    LINK_DEVELOPMENT_DOC                         "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc"
!define    LINK_DEVELOPMENT_DOC_API_MANUAL   "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc\凯视佳工业相机API函数说明书.chm"


!define   SHORTCUT_LINKNAME_DEVELOPMENT_ANDROID                                   "Development-Android"
!define   SHORTCUT_LINKNAME_DEVELOPMENT_LINUX                                        "Development-Linux"

!define    LINK_DEVELOPMENT_ANDROID                 "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_ANDROID}"
!define    LINK_DEVELOPMENT_LINUX                       "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_LINUX}"

;;
;; 手册快捷键名称
;;
!define   SHORTCUT_PDF_CATCHBEST_PRODUCTS    "凯视佳产品宣传手册"
!define   SHORTCUT_PDF_IC_PRODUCTS                   "凯视佳工业相机产品手册"
!define   SHORTCUT_PDF_UC3D_PRODUCTS              "凯视佳UC3D系列线激光轮廓测量传感器产品手册"
!define   SHORTCUT_PDF_UC3D_PLATFORM             "凯视佳UC3D系列线激光轮廓测量传感器实验平台产品手册"
!define   SHORTCUT_PDF_VU2D_PRODUCTS             "凯视佳VU2D系列智能工业相机产品手册"
!define   SHORTCUT_PDF_VU2D_SETUP                     "凯视佳VU2D系列智能工业相机快速安装指南"
!define   SHORTCUT_PDF_VU3D_PRODUCTS              "凯视佳VU3D系列线激光轮廓测量传感器产品手册"
!define   SHORTCUT_PDF_VU3D_SETUP                      "凯视佳VU3D系列线激光轮廓测量传感器快速安装指南"
!define   SHORTCUT_PDF_UHD_HDS800C                   "凯视佳UHD系列4KHDMI影像观测仪HDS800C产品手册"
!define   SHORTCUT_PDF_UHD_HDS800CPLUS           "凯视佳UHD系列4KHDMI影像观测仪HDS800CPLUS产品手册"


;;
;;
;; 手册链接
;;
!define    LINK_PDF_CATCHBEST_PRODUCTS    "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳产品宣传手册.pdf"
!define    LINK_PDF_IC_PRODUCTS                   "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳工业相机产品手册.pdf"
!define    LINK_PDF_UC3D_PRODUCTS              "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳UC3D系列线激光轮廓测量传感器产品手册.pdf"
!define    LINK_PDF_UC3D_PLATFORM              "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳UC3D系列线激光轮廓测量传感器实验平台产品手册.pdf"
!define    LINK_PDF_VU2D_PRODUCTS              "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳VU2D系列智能工业相机产品手册.pdf"
!define    LINK_PDF_VU2D_SETUP                     "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳VU2D系列智能工业相机快速安装指南.pdf"
!define    LINK_PDF_VU3D_PRODUCTS              "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳VU3D系列线激光轮廓测量传感器产品手册.pdf"
!define    LINK_PDF_VU3D_SETUP                     "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳VU3D系列线激光轮廓测量传感器快速安装指南.pdf"
!define    LINK_PDF_UHD_HDS800C                   "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳UHD系列4KHDMI影像观测仪HDS800C产品手册.pdf"
!define    LINK_PDF_UHD_HDS800CPLUS            "$INSTDIR\${INSTALL_DIR_MANUAL}\凯视佳UHD系列4KHDMI影像观测仪HDS800CPLUS产品手册.pdf"



!define    INSTALL_DIR_DRIVERS_USB            "${INSTALL_DIR_DRIVERS}\USB"   
!define    USB_DRIVER_WIN7_X64     "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN7\KSJDriversInst-64bit.exe" 
!define    USB_DRIVER_WIN7_X32     "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN7\KSJDriversInst-32bit.exe"

!define    USB_DRIVER_WIN10_X64    "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN10\KSJDriversInst-64bit.exe" 
!define    USB_DRIVER_WIN10_X32    "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN10\KSJDriversInst-32bit.exe"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 定义安装页面
;;
Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

;;
;; 安装驱动函数
;;
Function Win7Setup
    ${If} ${RunningX64}
            ;;MessageBox MB_OK "系统为win7 64！"
            ExecShell "" ${USB_DRIVER_WIN7_X64} 
    ${Else}
            ;;MessageBox MB_OK "系统为win7 32！"
            ExecShell "" ${USB_DRIVER_WIN7_X32}  
    ${EndIf}
FunctionEnd

Function Win10Setup
    ${If} ${RunningX64}
            ;;MessageBox MB_OK "${USB_DRIVER_WIN10_X64} "
            ExecShell "" ${USB_DRIVER_WIN10_X64} 
    ${Else}
            ;;MessageBox MB_OK "系统为win10 32！"
            ExecShell "" ${USB_DRIVER_WIN10_X32}
    ${EndIf}
FunctionEnd

Function .onVerifyInstDir

FunctionEnd

;;
;; 
;;
SectionGroup  /e "CatchBEST Industry Camera Installation"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 应用程序安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Application"
    ;;
    ;; 拷贝相关文件
    ;;
    SetOutPath                "$INSTDIR\${INSTALL_DIR_APPLICATION}"
    File /r    /x KSJApiLog "${GITHUB_DIR_APPLICATION}\*.*"

    ;;
    ;; 添加相关程序菜单快捷键
    ;;
    CreateDirectory "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}"           
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}.lnk"      ${LINK_KSJSHOW_X86} 

    ;;
    ;; 添加桌面快捷键
    ;;
    CreateShortCut  "$DESKTOP\${KSJSHOW_EXE_NAME}.lnk"                                                                                        ${LINK_KSJSHOW_X86}
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 开发相关安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Development"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}"
    File /r      /x common_no_mfc /x ignore.bat /x KSJApiLog /x *.obj /x *.pch /x *.pdb /x *.sdf /x MTd* /x SMTd* /x UMTd* /x USMTd* /x Debug /x Release    "${GITHUB_DIR_DEVELOPMENT}\*.*"

    CreateDirectory "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_SAMPLES}.lnk"       ${LINK_DEVELOPMENT_SAMPLES} 
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL}.lnk"              ${LINK_DEVELOPMENT_DOC_API_MANUAL} 
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 安卓开发相关安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section /o "Development-Android"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_ANDROID}"
    File /r      /x common_no_mfc  "${GITHUB_DIR_DEVELOPMENT_ANDROID}\*.*"

    CreateDirectory  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_ANDROID}.lnk"       ${LINK_DEVELOPMENT_ANDROID} 

SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linux开发相关安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section /o "Development-Linux"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_LINUX}"
    File /r      /x common_no_mfc  "${GITHUB_DIR_DEVELOPMENT_LINUX}\*.*"

    CreateDirectory  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_LINUX}.lnk"       ${LINK_DEVELOPMENT_LINUX} 

SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 驱动安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Drivers"
    ; SectionIn RO
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DRIVERS}"
    File /r                        "${GITHUB_DIR_DRIVERS}\*.*"

    CreateDirectory "$SMPROGRAMS\${COMPANY}\"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\Drivers.lnk"                  ${LINK_DRIVERS}

    ${If} ${IsWin10}   
        Call Win10Setup

    ${Else}
        Call Win7Setup
    ${EndIf} 
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TWAIN安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "TWAIN"
    SetOutPath               "$WINDIR\twain_32\KSJTwain"
    File  /r                       "${GITHUB_DIR_THIRDPART_TWAIN}\KSJTwain\*.*"

    SetOutPath               "$INSTDIR\${INSTALL_DIR_THIRDPART_TWAIN}"
    File /r                        "${GITHUB_DIR_THIRDPART_TWAIN}\*.*"
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Halcon安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Halcon"
    ;; C:\Program Files\MVTec\HALCON-19.05-Progress我们需要截取C:\Program Files\MVTec并设置为OUTDIR
    StrCpy              $R0    "$%HALCONROOT%"        
    ;; 获取父路径
    ${WordFind}    "$R0"   "\"  "E-2{*" $R0                 

    SetOutPath      "$R0"                     
    File /r    /x *.doc  /x *.txt   /x *.bat     "${GITHUB_DIR_THIRDPART_HALCON}\*.*" 
 

    SetOutPath       "$INSTDIR\${INSTALL_DIR_THIRDPART_HALCON}"
    File /r                "${GITHUB_DIR_THIRDPART_HALCON}\*.*"    
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIRECTSHOW安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Section "DirectShow"

    SetOutPath               "$INSTDIR\${INSTALL_DIR_THIRDPART_DIRECTSHOW}"
    File /r                        "${GITHUB_DIR_THIRDPART_DIRECTSHOW}\*.*"

SetSilent silent
     ExecShell "" "$INSTDIR\${INSTALL_DIR_THIRDPART_DIRECTSHOW}\KSJDS\KSJDS.Register.bat"
SetSilent normal
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 手册安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Manual"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_MANUAL}"
    File /r                        "${GITHUB_DIR_MANUAL}\*.*"

    CreateDirectory "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_CATCHBEST_PRODUCTS}.lnk"         ${LINK_PDF_CATCHBEST_PRODUCTS}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_IC_PRODUCTS}.lnk"                        ${LINK_PDF_IC_PRODUCTS}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_UC3D_PRODUCTS}.lnk"                  ${LINK_PDF_UC3D_PRODUCTS}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_UC3D_PLATFORM}.lnk"                  ${LINK_PDF_UC3D_PLATFORM}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU2D_PRODUCTS}.lnk"                  ${LINK_PDF_VU2D_PRODUCTS}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU2D_SETUP}.lnk"                         ${LINK_PDF_VU2D_SETUP}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU3D_PRODUCTS}.lnk"                  ${LINK_PDF_VU3D_PRODUCTS}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU3D_SETUP}.lnk"                         ${LINK_PDF_VU3D_SETUP}

    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}l\${SHORTCUT_PDF_UHD_HDS800C}.lnk"                       ${LINK_PDF_UHD_HDS800C}
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_UHD_HDS800CPLUS}.lnk"               ${LINK_PDF_UHD_HDS800CPLUS}


SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 卸载程序安装段
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "-hidden section"
    WriteUninstaller "$INSTDIR\${INSTALL_DIR}\${UNINSTALL}.exe"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${UNINSTALL}.lnk"            "$INSTDIR\${INSTALL_DIR}\${UNINSTALL}.exe" 
SectionEnd

SectionGroupEnd




Section "Uninstall"
    ;;
    ;; 删除桌面快捷键
    ;;
    Delete "$DESKTOP\${KSJSHOW_EXE_NAME}.lnk"

    ;;
    ;; 删除程序菜单快捷键
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${UNINSTALL}.lnk" 
        
    ;;
    ;; 删除Development相关的快捷菜单
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_SAMPLES}.lnk"
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}"

    Delete  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_ANDROID}.lnk"
    Delete  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_LINUX}.lnk"

    ;;
    ;; 删除Application相关快捷菜单 
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}.lnk"
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}"

    ;;
    ;; 删除手册相关快捷菜单
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_CATCHBEST_PRODUCTS}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_IC_PRODUCTS}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_UC3D_PRODUCTS}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_UC3D_PLATFORM}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU2D_PRODUCTS}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU2D_SETUP}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU3D_PRODUCTS}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_VU3D_SETUP}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_UHD_HDS800C}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}\${SHORTCUT_PDF_UHD_HDS800CPLUS}.lnk"
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_MANUAL}"

    ;;
    ;;删除驱动快捷菜单
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\Drivers.lnk"

    ;;
    ;; 删除二级菜单
    ;;
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"

    ;;
    ;; 尝试删除一级菜单，如果有其他安装，会自动保留
    ;; 
    RMDir  "$SMPROGRAMS\${COMPANY}"
               
    ;;MessageBox MB_OK "$INSTDIR"                                        

    ;;
    ;; 删除安装的所有文件
    ;;
    ;;
    ;; 删除Twain
    ;;
    RMDir /r "$WINDIR\twain_32\KSJTwain"

    ;;
    ;; 注销DirectShow
    ;;
    SetSilent silent
    ExecShell "" "$INSTDIR\ThirdPart\DirectShow\KSJDS\KSJDS.Unregister.bat"
    SetSilent normal
    ;;
    ;; 删除安装文件夹
    ;;
    Delete "$INSTDIR\Uninstall.exe"
    RMDir /r "$INSTDIR"

    ;;
    ;; 驱动和手册文件夹会保留
    ;;

    ;;
    ;; 到这里，UC目录已经完全删除了，包括UC的目录，但是CatchBEST目录还没有被删除
    ;; 如果CatchBEST目录下已经没有其他文件了，就可以删除CatchBEST目录，这样删除就彻底了
    ;; 注意，这里不要加/r
    ;;
    ;;RMDir $INSTDIR
 
SectionEnd




