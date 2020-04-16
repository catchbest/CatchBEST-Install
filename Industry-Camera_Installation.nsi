!addincludedir include
!include  "WinVer.nsh"  
!include  "logiclib.nsh"
!include  "x64.nsh"
!include "WordFunc.nsh"

XPStyle on
AllowRootDirInstall true

;;
;; ��װ���汾�ţ�ÿ�η����µİ�װ��ʱ��Ҫ�ı�
;;
!define    SETUP_VERSION           "v2"   

;;
;; ��װ��ִ���ļ�ʹ�õ�ͼ��
;;
Icon                                           "resource\install.ico"

;;
;; ж�س���ͼ��
;;
UninstallIcon                              "resource\uninstall.ico"


;; ж�س������
;;
UninstallCaption                         "CatchBEST Industry Camera Uninstallation"

;;
;; ��˾��
;;
!define    COMPANY		   "CatchBEST"

;;
;; ж�س�������
;;
!define    UNINSTALL                   "Uninstall"

;;
;; ���⣬���Caption������${Caption}������
;;
!define    CAPTION                      "CatchBEST Industry Camera Installation"

;;
;; ���⣬��NSIS�ĳ������ԣ����Caption������${Caption}������
;;
Caption	                                   "CatchBEST Industry Camera Installation"

;;
;; ��װ������
;;
OutFile                                           "${CAPTION}_${SETUP_VERSION}.exe" 

;;
;; KSJShow�汾
;;
!define    KSJSHOW_VERSION           "2.8.0.0"                    ;; **KSJSHOW�İ汾�ţ��ļ��б�����˰汾��һ��
!define    KSJSHOW_EXE_NAME        "KSJShow"                ;; ^^ִ�г�����

;;
;; USB�����汾
;;
!define    KSJDRV_USB_VERSION      "10.0.0.0"                ;; **��������İ汾�ţ��ļ��б�����˰汾��һ��


;;
;; ����Ǹ��ݱ���github�Ľṹ����ġ�
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
;; ����ǰ�װ���Ŀ¼�ṹ��INSTDIR�ļ����µ����ļ������ơ�
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
;;�����InstallDir��ֵ������$INSTDIR��ֵ������Ĭ�ϰ�װ·��
;;
InstallDir                         $PROGRAMFILES\${COMPANY}

;;
;; ����Ϊ�������������ӵĳ�������·��
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
;;                       |----Samples                  link to��  ${LINK_DEVELOPMENT_SAMPLES}    
;;                       |----CHM                       link to:    $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc\���Ӽѹ�ҵ���API����˵����.chm
;;               |----Development-Android
;;               |----Development-Linux
;;               |----Uninstall
;;     |----Drivers                              $INSTDIR\${INSTALL_DIR_DRIVERS}
;;     |----Manual                             ����ϵ�в�Ʒ�ֲ�

;;
;; �������·��
;; 
!define    LINK_KSJSHOW_X86                      "$INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x86\${KSJSHOW_EXE_NAME}.exe"
!define    LINK_KSJSHOW_X64                      "$INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x64\${KSJSHOW_EXE_NAME}64.exe"

!define    LINK_DRIVERS                               "$INSTDIR\${INSTALL_DIR_DRIVERS}"


;;
;; ������ݲ˵�������
;;
!define   SHORTCUT_DEVELOPMENT_DIR                                                              "Development"
!define   SHORTCUT_DEVELOPMENT_LINKNAME_SAMPLES                                   "Samples"
!define   SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL                    "���Ӽѹ�ҵ���API����˵����"


;;
;; ������ݲ˵���Ӧ�����ӵ�ַ
;;
!define    LINK_DEVELOPMENT_SAMPLES                  "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples"
!define    LINK_DEVELOPMENT_DOC                         "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc"
!define    LINK_DEVELOPMENT_DOC_API_MANUAL   "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc\���Ӽѹ�ҵ���API����˵����.chm"


!define   SHORTCUT_LINKNAME_DEVELOPMENT_ANDROID                                   "Development-Android"
!define   SHORTCUT_LINKNAME_DEVELOPMENT_LINUX                                        "Development-Linux"

!define    LINK_DEVELOPMENT_ANDROID                 "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_ANDROID}"
!define    LINK_DEVELOPMENT_LINUX                       "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_LINUX}"

;;
;; �ֲ��ݼ�����
;;
!define   SHORTCUT_PDF_CATCHBEST_PRODUCTS    "���ӼѲ�Ʒ�����ֲ�"
!define   SHORTCUT_PDF_IC_PRODUCTS                   "���Ӽѹ�ҵ�����Ʒ�ֲ�"
!define   SHORTCUT_PDF_UC3D_PRODUCTS              "���Ӽ�UC3Dϵ���߼�������������������Ʒ�ֲ�"
!define   SHORTCUT_PDF_UC3D_PLATFORM             "���Ӽ�UC3Dϵ���߼�����������������ʵ��ƽ̨��Ʒ�ֲ�"
!define   SHORTCUT_PDF_VU2D_PRODUCTS             "���Ӽ�VU2Dϵ�����ܹ�ҵ�����Ʒ�ֲ�"
!define   SHORTCUT_PDF_VU2D_SETUP                     "���Ӽ�VU2Dϵ�����ܹ�ҵ������ٰ�װָ��"
!define   SHORTCUT_PDF_VU3D_PRODUCTS              "���Ӽ�VU3Dϵ���߼�������������������Ʒ�ֲ�"
!define   SHORTCUT_PDF_VU3D_SETUP                      "���Ӽ�VU3Dϵ���߼��������������������ٰ�װָ��"
!define   SHORTCUT_PDF_UHD_HDS800C                   "���Ӽ�UHDϵ��4KHDMIӰ��۲���HDS800C��Ʒ�ֲ�"
!define   SHORTCUT_PDF_UHD_HDS800CPLUS           "���Ӽ�UHDϵ��4KHDMIӰ��۲���HDS800CPLUS��Ʒ�ֲ�"


;;
;;
;; �ֲ�����
;;
!define    LINK_PDF_CATCHBEST_PRODUCTS    "$INSTDIR\${INSTALL_DIR_MANUAL}\���ӼѲ�Ʒ�����ֲ�.pdf"
!define    LINK_PDF_IC_PRODUCTS                   "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽѹ�ҵ�����Ʒ�ֲ�.pdf"
!define    LINK_PDF_UC3D_PRODUCTS              "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�UC3Dϵ���߼�������������������Ʒ�ֲ�.pdf"
!define    LINK_PDF_UC3D_PLATFORM              "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�UC3Dϵ���߼�����������������ʵ��ƽ̨��Ʒ�ֲ�.pdf"
!define    LINK_PDF_VU2D_PRODUCTS              "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�VU2Dϵ�����ܹ�ҵ�����Ʒ�ֲ�.pdf"
!define    LINK_PDF_VU2D_SETUP                     "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�VU2Dϵ�����ܹ�ҵ������ٰ�װָ��.pdf"
!define    LINK_PDF_VU3D_PRODUCTS              "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�VU3Dϵ���߼�������������������Ʒ�ֲ�.pdf"
!define    LINK_PDF_VU3D_SETUP                     "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�VU3Dϵ���߼��������������������ٰ�װָ��.pdf"
!define    LINK_PDF_UHD_HDS800C                   "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�UHDϵ��4KHDMIӰ��۲���HDS800C��Ʒ�ֲ�.pdf"
!define    LINK_PDF_UHD_HDS800CPLUS            "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽ�UHDϵ��4KHDMIӰ��۲���HDS800CPLUS��Ʒ�ֲ�.pdf"



!define    INSTALL_DIR_DRIVERS_USB            "${INSTALL_DIR_DRIVERS}\USB"   
!define    USB_DRIVER_WIN7_X64     "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN7\KSJDriversInst-64bit.exe" 
!define    USB_DRIVER_WIN7_X32     "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN7\KSJDriversInst-32bit.exe"

!define    USB_DRIVER_WIN10_X64    "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN10\KSJDriversInst-64bit.exe" 
!define    USB_DRIVER_WIN10_X32    "$INSTDIR\${INSTALL_DIR_DRIVERS_USB}\${KSJDRV_USB_VERSION}\WIN10\KSJDriversInst-32bit.exe"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ���尲װҳ��
;;
Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

;;
;; ��װ��������
;;
Function Win7Setup
    ${If} ${RunningX64}
            ;;MessageBox MB_OK "ϵͳΪwin7 64��"
            ExecShell "" ${USB_DRIVER_WIN7_X64} 
    ${Else}
            ;;MessageBox MB_OK "ϵͳΪwin7 32��"
            ExecShell "" ${USB_DRIVER_WIN7_X32}  
    ${EndIf}
FunctionEnd

Function Win10Setup
    ${If} ${RunningX64}
            ;;MessageBox MB_OK "${USB_DRIVER_WIN10_X64} "
            ExecShell "" ${USB_DRIVER_WIN10_X64} 
    ${Else}
            ;;MessageBox MB_OK "ϵͳΪwin10 32��"
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
;; Ӧ�ó���װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Application"
    ;;
    ;; ��������ļ�
    ;;
    SetOutPath                "$INSTDIR\${INSTALL_DIR_APPLICATION}"
    File /r    /x KSJApiLog "${GITHUB_DIR_APPLICATION}\*.*"

    ;;
    ;; �����س���˵���ݼ�
    ;;
    CreateDirectory "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}"           
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}.lnk"      ${LINK_KSJSHOW_X86} 

    ;;
    ;; ��������ݼ�
    ;;
    CreateShortCut  "$DESKTOP\${KSJSHOW_EXE_NAME}.lnk"                                                                                        ${LINK_KSJSHOW_X86}
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ������ذ�װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Development"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}"
    File /r      /x common_no_mfc /x ignore.bat /x KSJApiLog /x *.obj /x *.pch /x *.pdb /x *.sdf /x MTd* /x SMTd* /x UMTd* /x USMTd* /x Debug /x Release    "${GITHUB_DIR_DEVELOPMENT}\*.*"

    CreateDirectory "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_SAMPLES}.lnk"       ${LINK_DEVELOPMENT_SAMPLES} 
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL}.lnk"              ${LINK_DEVELOPMENT_DOC_API_MANUAL} 
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ��׿������ذ�װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section /o "Development-Android"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_ANDROID}"
    File /r      /x common_no_mfc  "${GITHUB_DIR_DEVELOPMENT_ANDROID}\*.*"

    CreateDirectory  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_ANDROID}.lnk"       ${LINK_DEVELOPMENT_ANDROID} 

SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linux������ذ�װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section /o "Development-Linux"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DEVELOPMENT_LINUX}"
    File /r      /x common_no_mfc  "${GITHUB_DIR_DEVELOPMENT_LINUX}\*.*"

    CreateDirectory  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_LINUX}.lnk"       ${LINK_DEVELOPMENT_LINUX} 

SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ������װ��
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
;; TWAIN��װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "TWAIN"
    SetOutPath               "$WINDIR\twain_32\KSJTwain"
    File  /r                       "${GITHUB_DIR_THIRDPART_TWAIN}\KSJTwain\*.*"

    SetOutPath               "$INSTDIR\${INSTALL_DIR_THIRDPART_TWAIN}"
    File /r                        "${GITHUB_DIR_THIRDPART_TWAIN}\*.*"
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Halcon��װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Halcon"
    ;; C:\Program Files\MVTec\HALCON-19.05-Progress������Ҫ��ȡC:\Program Files\MVTec������ΪOUTDIR
    StrCpy              $R0    "$%HALCONROOT%"        
    ;; ��ȡ��·��
    ${WordFind}    "$R0"   "\"  "E-2{*" $R0                 

    SetOutPath      "$R0"                     
    File /r    /x *.doc  /x *.txt   /x *.bat     "${GITHUB_DIR_THIRDPART_HALCON}\*.*" 
 

    SetOutPath       "$INSTDIR\${INSTALL_DIR_THIRDPART_HALCON}"
    File /r                "${GITHUB_DIR_THIRDPART_HALCON}\*.*"    
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIRECTSHOW��װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Section "DirectShow"

    SetOutPath               "$INSTDIR\${INSTALL_DIR_THIRDPART_DIRECTSHOW}"
    File /r                        "${GITHUB_DIR_THIRDPART_DIRECTSHOW}\*.*"

SetSilent silent
     ExecShell "" "$INSTDIR\${INSTALL_DIR_THIRDPART_DIRECTSHOW}\KSJDS\KSJDS.Register.bat"
SetSilent normal
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �ֲᰲװ��
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
;; ж�س���װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "-hidden section"
    WriteUninstaller "$INSTDIR\${INSTALL_DIR}\${UNINSTALL}.exe"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${UNINSTALL}.lnk"            "$INSTDIR\${INSTALL_DIR}\${UNINSTALL}.exe" 
SectionEnd

SectionGroupEnd




Section "Uninstall"
    ;;
    ;; ɾ�������ݼ�
    ;;
    Delete "$DESKTOP\${KSJSHOW_EXE_NAME}.lnk"

    ;;
    ;; ɾ������˵���ݼ�
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${UNINSTALL}.lnk" 
        
    ;;
    ;; ɾ��Development��صĿ�ݲ˵�
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL}.lnk"
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_SAMPLES}.lnk"
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}"

    Delete  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_ANDROID}.lnk"
    Delete  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_LINKNAME_DEVELOPMENT_LINUX}.lnk"

    ;;
    ;; ɾ��Application��ؿ�ݲ˵� 
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}.lnk"
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}"

    ;;
    ;; ɾ���ֲ���ؿ�ݲ˵�
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
    ;;ɾ��������ݲ˵�
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\Drivers.lnk"

    ;;
    ;; ɾ�������˵�
    ;;
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"

    ;;
    ;; ����ɾ��һ���˵��������������װ�����Զ�����
    ;; 
    RMDir  "$SMPROGRAMS\${COMPANY}"
               
    ;;MessageBox MB_OK "$INSTDIR"                                        

    ;;
    ;; ɾ����װ�������ļ�
    ;;
    ;;
    ;; ɾ��Twain
    ;;
    RMDir /r "$WINDIR\twain_32\KSJTwain"

    ;;
    ;; ע��DirectShow
    ;;
    SetSilent silent
    ExecShell "" "$INSTDIR\ThirdPart\DirectShow\KSJDS\KSJDS.Unregister.bat"
    SetSilent normal
    ;;
    ;; ɾ����װ�ļ���
    ;;
    Delete "$INSTDIR\Uninstall.exe"
    RMDir /r "$INSTDIR"

    ;;
    ;; �������ֲ��ļ��лᱣ��
    ;;

    ;;
    ;; �����UCĿ¼�Ѿ���ȫɾ���ˣ�����UC��Ŀ¼������CatchBESTĿ¼��û�б�ɾ��
    ;; ���CatchBESTĿ¼���Ѿ�û�������ļ��ˣ��Ϳ���ɾ��CatchBESTĿ¼������ɾ���ͳ�����
    ;; ע�⣬���ﲻҪ��/r
    ;;
    ;;RMDir $INSTDIR
 
SectionEnd




