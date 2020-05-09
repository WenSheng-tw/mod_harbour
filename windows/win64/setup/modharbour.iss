; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "modharbour"
#define MyAppVersion "2.0"
#define MyAppPublisher "FiveTech Software (c) 2019,2020"
#define MyAppURL "http://www.modharbour.org"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B86542BD-ECFF-4834-B9D6-62771476D533}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={localappdata}\{#MyAppName}
DisableDirPage=no
DefaultGroupName={#MyAppName}
LicenseFile=..\..\..\LICENSE
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=modharbour
SetupIconFile=..\..\..\docs\favicon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "armenian"; MessagesFile: "compiler:Languages\Armenian.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "icelandic"; MessagesFile: "compiler:Languages\Icelandic.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "slovak"; MessagesFile: "compiler:Languages\Slovak.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Files]
Source: "..\..\..\windows\win64\mod_harbour.so"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\..\windows\win64\libharbour.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]
var
  ServersPage: TInputQueryWizardPage;
  ApacheCheckBox: TNewCheckBox;
  XamppCheckBox: TNewCheckBox;
  IISCheckBox: TNewCheckBox;

procedure AddServersPage();
begin
  ServersPage := CreateInputQueryPage(
    wpWelcome,
    'Please select the server(s) to use',
    '',
    'mod_harbour supports Apache, Xampp and Windows IIS');

  ApacheCheckBox         := TNewCheckBox.Create( ServersPage );
  ApacheCheckBox.Parent  := ServersPage.Surface;
  ApacheCheckBox.Top     := ApacheCheckBox.Top + 30; 
  ApacheCheckBox.Caption := 'Apache';

  XamppCheckBox          := TNewCheckBox.Create( ServersPage );
  XamppCheckBox.Parent   := ServersPage.Surface;
  XamppCheckBox.Top      := XamppCheckBox.Top + 60; 
  XamppCheckBox.Caption  := 'Xampp';  

  IISCheckBox            := TNewCheckBox.Create( ServersPage );
  IISCheckBox.Parent     := ServersPage.Surface;
  IISCheckBox.Top        := IISCheckBox.Top + 90; 
  IISCheckBox.Caption    := 'Microsoft IIS';  
end;

procedure InitializeWizard();
begin
  AddServersPage();
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    { Read custom value }
    MsgBox('Custom Value = ' + ServersPage.Values[0], mbInformation, MB_OK);
  end;
end;

[Run]
Filename: http://localhost/modharbour_samples/; Description: "Review mod_harbour samples"; Flags: postinstall shellexec
