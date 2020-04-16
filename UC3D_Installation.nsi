!addincludedir include
!include  "WinVer.nsh"  
!include  "logiclib.nsh"
!include  "x64.nsh"
!include "WordFunc.nsh"

XPStyle on
AllowRootDirInstall true

;;
;; ��װ���汾��
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
UninstallCaption                         "UC3D Uninstallation"

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
!define    CAPTION                      "CatchBEST UC3D Installation"

;;
;; ���⣬��NSIS�ĳ������ԣ����Caption������${Caption}������
;;
Caption	                                   "CatchBEST UC3D Installation"


;;
;; ��װ������
;;
OutFile                                           "${CAPTION}_${SETUP_VERSION}.exe" 

;;
;; KSJShow�汾
;;
!define    KSJSHOW_VERSION           "2.8.0.0"                    ;; **KSJSHOW�İ汾�ţ��ļ��б�����˰汾��һ��
!define    KSJSHOW_EXE_NAME        "KSJShow3D"                ;; ^^ִ�г�����

;;
;; USB�����汾
;;
!define    KSJDRV_USB_VERSION      "10.0.0.0"                ;; **��������İ汾�ţ��ļ��б�����˰汾��һ��


;;
;; ����Ǹ��ݱ���github�Ľṹ����ġ�
;;
!define    GITHUB_DIR_DRIVERS               "..\github.CatchBEST-Drivers\Drivers" 
!define    GITHUB_DIR_APPLICATION       "..\github.UC3D-Applications\Applications"        
!define    GITHUB_DIR_DEVELOPMENT     "..\github.UC3D-Development\Development"      
!define    GITHUB_DIR_THIRDPART           "..\github.UC3D-ThirdPart\ThirdPart"                
!define    GITHUB_DIR_TOOLS                   "..\github.UC3D-Tools\Tools"
!define    GITHUB_DIR_MANUAL               "..\github.CatchBEST-Manual\Manual"

!define    GITHUB_DIR_THIRDPART_TWAIN                  "${GITHUB_DIR_THIRDPART}\Twain" 
!define    GITHUB_DIR_THIRDPART_HALCON               "${GITHUB_DIR_THIRDPART}\Halcon" 
!define    GITHUB_DIR_THIRDPART_DIRECTSHOW        "${GITHUB_DIR_THIRDPART}\DirectShow"
;;
;; ����ǰ�װ���Ŀ¼�ṹ��INSTDIR�ļ����µ����ļ������ơ�
;;
!define    INSTALL_DIR                             "UC3D"    
!define    INSTALL_DIR_DRIVERS               "Drivers"                        
!define    INSTALL_DIR_APPLICATION       "UC3D\Applications"        
!define    INSTALL_DIR_DEVELOPMENT     "UC3D\Development"      
!define    INSTALL_DIR_THIRDPART           "UC3D\ThirdPart"                
!define    INSTALL_DIR_TOOLS                   "UC3D\Tools"      
!define    INSTALL_DIR_MANUAL               "Manual"    

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
;;     |----UC3D
;;               |----Applications
;;                       |----KSJShow3D             link to:             $INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x86\${KSJSHOW_EXE_NAME}.exe
;;                                                            or $INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x64\${KSJSHOW_EXE_NAME}64.exe
;;               |----Development                          
;;                       |----VC                           link to: $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\VC
;;                       |----VB                           link to:  $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\VB
;;                       |----C#                           link to:  $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\C#
;;                       |----Halcon                     link to:     $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\Halcon
;;                       |----OpenCV                   link to:      $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\OpenCV
;;                       |----Labview                   link to:    $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\Labview
;;                       |----...                             link to:  $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples\...
;;                       |----���Ӽѹ�ҵ���API����˵����-3D���ƪ    link to: $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc\���Ӽѹ�ҵ���API����˵����-3D���ƪ.CHM
;;                       |----Doc                         link to:    $INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc
;;               |----Uninstall
;;     |----Drivers                                      link to: $INSTDIR\${INSTALL_DIR_DRIVERS}
;;              
;;     |----Manual
;;               |----��Ʒ�����ֲ�                   link to��"$INSTDIR\${INSTALL_DIR_MANUAL}\���ӼѲ�Ʒ�����ֲ�.pdf"                                       
;;               |----��ҵ�����Ʒ�ֲ�             link to:  "$INSTDIR\${INSTALL_DIR_MANUAL}\���Ӽѹ�ҵ�����Ʒ�ֲ�.pdf"

;;
;; ������ݲ˵�������
;;
!define   SHORTCUT_DEVELOPMENT_DIR                                                              "Development"
!define   SHORTCUT_DEVELOPMENT_LINKNAME_SAMPLES                                   "Samples"
!define   SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL                    "���Ӽѹ�ҵ���API����˵����-3D���ƪ"

;;
;; ������ݲ˵���Ӧ�����ӵ�ַ
;;
!define    LINK_DEVELOPMENT_SAMPLES    "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Samples"
!define    LINK_DEVELOPMENT_DOC           "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc"
!define   LINK_DEVELOPMENT_DOC_API_MANUAL                                                 "$INSTDIR\${INSTALL_DIR_DEVELOPMENT}\Doc\���Ӽѹ�ҵ���API����˵����-3D���ƪ.chm"
;;
;; �������·��
;; 
!define    LINK_KSJSHOW_X86                      "$INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x86\${KSJSHOW_EXE_NAME}.exe"
!define    LINK_KSJSHOW_X64                      "$INSTDIR\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}\x64\${KSJSHOW_EXE_NAME}64.exe"
!define    LINK_DRIVERS                               "$INSTDIR\${INSTALL_DIR_DRIVERS}"

;;
;; �ֲ��ݼ�����
;;
;!define   SHORTCUT_PDF_CATCHBEST_PRODUCTS    "CatchBEST Brochure"
;!define   SHORTCUT_PDF_IC_PRODUCTS                   "Industry Camera Manual"
;!define   SHORTCUT_PDF_UC3D_PRODUCTS              "UC3D Manual"
;!define   SHORTCUT_PDF_UC3D_PLATFORM             "UC3D Platform Manual"
;!define   SHORTCUT_PDF_VU2D_PRODUCTS             "VU2D Manual"
;!define   SHORTCUT_PDF_VU2D_SETUP                     "VU2D Setup"
;!define   SHORTCUT_PDF_VU3D_PRODUCTS              "VU3D Manual"
;!define   SHORTCUT_PDF_VU3D_SETUP                      "VU3D Setup"
;!define   SHORTCUT_PDF_UHD_HDS800C                   "UHD HDS800C Manual"
;!define   SHORTCUT_PDF_UHD_HDS800CPLUS           "UHD HDS800CPLUS Manual"


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
SectionGroup  /e "CatchBEST UC3D Installation"

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
    File /r      /x common_no_mfc /x KSJApiLog /x *.obj /x ignore.bat /x *.pch /x *.pdb /x *.sdf /x MTd* /x SMTd* /x UMTd* /x USMTd* /x Debug /x Release    "${GITHUB_DIR_DEVELOPMENT}\*.*"

    CreateDirectory "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\Development"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\Development\Samples.lnk"        ${LINK_DEVELOPMENT_SAMPLES} 
    ;;CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\Development\Doc.lnk"              ${LINK_DEVELOPMENT_DOC} 
   CreateShortCut  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\${SHORTCUT_DEVELOPMENT_DIR}\${SHORTCUT_DEVELOPMENT_LINKNAME_DOC_API_MANUAL}.lnk"              ${LINK_DEVELOPMENT_DOC_API_MANUAL} 
SectionEnd

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ������װ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Section "Drivers"
    SetOutPath               "$INSTDIR\${INSTALL_DIR_DRIVERS}"
    File /r                        "${GITHUB_DIR_DRIVERS}\*.*"

    CreateDirectory "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"
    CreateShortCut  "$SMPROGRAMS\${COMPANY}\Drivers.lnk"                  ${LINK_DRIVERS}

    ${If} ${IsWin10}   
        Call Win10Setup

    ${Else}
        Call Win7Setup
    ${EndIf} 
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ж��ҳ��
;;
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
    ;; ����ɾ��Doc.lnk���Է���ǰv1���û�û��ж�ص�����°�װv2���޷�ɾ���˿�ݲ˵�
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\Development\Doc.lnk"     

    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\Development\Samples.lnk"
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}\Development"

    ;;
    ;; ɾ��Application��ؿ�ݲ˵� 
    ;;
    Delete "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}\${KSJSHOW_EXE_NAME}.lnk"
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR_APPLICATION}"

    ;;
    ;;ɾ���ֲ���ؿ�ݲ˵�
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
    ;;
    ;;
    RMDir  "$SMPROGRAMS\${COMPANY}\${INSTALL_DIR}"
    RMDir  "$SMPROGRAMS\${COMPANY}"
               
    ;;MessageBox MB_OK "$INSTDIR"                                        

    ;;
    ;; ɾ����װ�������ļ�(����װ����ɾ��Drivers��Manual�ļ���)
    ;;
 
    ;;
    ;; ɾ����װ�ļ���
    ;;
    RMDir /r "$INSTDIR"


    ;;
    ;; �������װĿ¼�Ѿ���ȫɾ���ˣ�����INSTALL_DIR��Ŀ¼������CatchBESTĿ¼��û�б�ɾ��
    ;; ���CatchBESTĿ¼���Ѿ�û�������ļ��ˣ��Ϳ���ɾ��CatchBESTĿ¼������ɾ���ͳ�����
    ;; ע�⣬���ﲻҪ��/r
    ;;
    ;;RMDir $INSTDIR
 
SectionEnd




