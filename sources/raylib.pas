
{==============================================================================
                _ _ _    
  _ _ __ _ _  _| (_) |__ 
 | '_/ _` | || | | | '_ \
 |_| \__,_|\_, |_|_|_.__/
           |__/          

 A simple and easy-to-use library to enjoy
 videogames programming

 Pascal bindings that allow you to use raylib with Delphi.
      
 Included:
   - raylib (https://github.com/raysan5/raylib)
      
 Minimum Requirements:
   - Windows 10+ (64 bits)
   - Delphi Community Edition (Win64 platform only)
   
 Usage:
   You simply add raylib to your uses section and everything will be linked in
   and ready for use. You will have direct access to all the aforementioned
   libraries.

 Copyright © 2021-2022 tinyBigGAMES™ LLC
 All Rights Reserved.

 Website: https://tinybiggames.com
 Email  : support@tinybiggames.com

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software in
    a product, an acknowledgment in the product documentation would be
    appreciated but is not required.
 2. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.

 3. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in
    the documentation and/or other materials provided with the
    distribution.

 4. Neither the name of the copyright holder nor the names of its
    contributors may be used to endorse or promote products derived
    from this software without specific prior written permission.

 5. All video, audio, graphics and other content accessed through the
    software in this distro is the property of the applicable content owner
    and may be protected by applicable copyright law. This License gives
    Customer no rights to such content, and Company disclaims any liability
    for misuse of content.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
============================================================================= }

{$IFNDEF WIN64}
  {$MESSAGE Error 'Unsupported platform'}
{$ENDIF}

{$Z4}
{$A8}

unit raylib;

interface

uses
  WinAPI.Windows;

const
  RAYLIB_VERSION = '4.1-dev';
  PI = 3.14159265358979323846;
  DEG2RAD = (PI/180.0);
  RAD2DEG = (180.0/PI);
  RAYGUI_VERSION = '3.0';
  PHYSAC_MAX_BODIES = 64;
  PHYSAC_MAX_MANIFOLDS = 4096;
  PHYSAC_MAX_VERTICES = 24;
  PHYSAC_DEFAULT_CIRCLE_VERTICES = 24;
  PHYSAC_COLLISION_ITERATIONS = 100;
  PHYSAC_PENETRATION_ALLOWANCE = 0.05;
  PHYSAC_PENETRATION_CORTRectION = 0.4;
  PHYSAC_PI = 3.14159265358979323846;
  PHYSAC_DEG2RAD = (PHYSAC_PI/180.0);
  RMEM_VERSION = 'v1.3';
  FLAG_VSYNC_HINT = 64;
  FLAG_FULLSCREEN_MODE = 2;
  FLAG_WINDOW_RESIZABLE = 4;
  FLAG_WINDOW_UNDECORATED = 8;
  FLAG_WINDOW_HIDDEN = 128;
  FLAG_WINDOW_MINIMIZED = 512;
  FLAG_WINDOW_MAXIMIZED = 1024;
  FLAG_WINDOW_UNFOCUSED = 2048;
  FLAG_WINDOW_TOPMOST = 4096;
  FLAG_WINDOW_ALWAYS_RUN = 256;
  FLAG_WINDOW_TRANSPARENT = 16;
  FLAG_WINDOW_HIGHDPI = 8192;
  FLAG_MSAA_4X_HINT = 32;
  FLAG_INTERLACED_HINT = 65536;
  LOG_ALL = 0;
  LOG_TRACE = 1;
  LOG_DEBUG = 2;
  LOG_INFO = 3;
  LOG_WARNING = 4;
  LOG_ERROR = 5;
  LOG_FATAL = 6;
  LOG_NONE = 7;
  KEY_NULL = 0;
  KEY_APOSTROPHE = 39;
  KEY_COMMA = 44;
  KEY_MINUS = 45;
  KEY_PERIOD = 46;
  KEY_SLASH = 47;
  KEY_ZERO = 48;
  KEY_ONE = 49;
  KEY_TWO = 50;
  KEY_THREE = 51;
  KEY_FOUR = 52;
  KEY_FIVE = 53;
  KEY_SIX = 54;
  KEY_SEVEN = 55;
  KEY_EIGHT = 56;
  KEY_NINE = 57;
  KEY_SEMICOLON = 59;
  KEY_EQUAL = 61;
  KEY_A = 65;
  KEY_B = 66;
  KEY_C = 67;
  KEY_D = 68;
  KEY_E = 69;
  KEY_F = 70;
  KEY_G = 71;
  KEY_H = 72;
  KEY_I = 73;
  KEY_J = 74;
  KEY_K = 75;
  KEY_L = 76;
  KEY_M = 77;
  KEY_N = 78;
  KEY_O = 79;
  KEY_P = 80;
  KEY_Q = 81;
  KEY_R = 82;
  KEY_S = 83;
  KEY_T = 84;
  KEY_U = 85;
  KEY_V = 86;
  KEY_W = 87;
  KEY_X = 88;
  KEY_Y = 89;
  KEY_Z = 90;
  KEY_LEFT_BRACKET = 91;
  KEY_BACKSLASH = 92;
  KEY_RIGHT_BRACKET = 93;
  KEY_GRAVE = 96;
  KEY_SPACE = 32;
  KEY_ESCAPE = 256;
  KEY_ENTER = 257;
  KEY_TAB = 258;
  KEY_BACKSPACE = 259;
  KEY_INSERT = 260;
  KEY_DELETE = 261;
  KEY_RIGHT = 262;
  KEY_LEFT = 263;
  KEY_DOWN = 264;
  KEY_UP = 265;
  KEY_PAGE_UP = 266;
  KEY_PAGE_DOWN = 267;
  KEY_HOME = 268;
  KEY_END = 269;
  KEY_CAPS_LOCK = 280;
  KEY_SCROLL_LOCK = 281;
  KEY_NUM_LOCK = 282;
  KEY_PRINT_SCREEN = 283;
  KEY_PAUSE = 284;
  KEY_F1 = 290;
  KEY_F2 = 291;
  KEY_F3 = 292;
  KEY_F4 = 293;
  KEY_F5 = 294;
  KEY_F6 = 295;
  KEY_F7 = 296;
  KEY_F8 = 297;
  KEY_F9 = 298;
  KEY_F10 = 299;
  KEY_F11 = 300;
  KEY_F12 = 301;
  KEY_LEFT_SHIFT = 340;
  KEY_LEFT_CONTROL = 341;
  KEY_LEFT_ALT = 342;
  KEY_LEFT_SUPER = 343;
  KEY_RIGHT_SHIFT = 344;
  KEY_RIGHT_CONTROL = 345;
  KEY_RIGHT_ALT = 346;
  KEY_RIGHT_SUPER = 347;
  KEY_KB_MENU = 348;
  KEY_KP_0 = 320;
  KEY_KP_1 = 321;
  KEY_KP_2 = 322;
  KEY_KP_3 = 323;
  KEY_KP_4 = 324;
  KEY_KP_5 = 325;
  KEY_KP_6 = 326;
  KEY_KP_7 = 327;
  KEY_KP_8 = 328;
  KEY_KP_9 = 329;
  KEY_KP_DECIMAL = 330;
  KEY_KP_DIVIDE = 331;
  KEY_KP_MULTIPLY = 332;
  KEY_KP_SUBTRACT = 333;
  KEY_KP_ADD = 334;
  KEY_KP_ENTER = 335;
  KEY_KP_EQUAL = 336;
  KEY_BACK = 4;
  KEY_MENU = 82;
  KEY_VOLUME_UP = 24;
  KEY_VOLUME_DOWN = 25;
  MOUSE_BUTTON_LEFT = 0;
  MOUSE_BUTTON_RIGHT = 1;
  MOUSE_BUTTON_MIDDLE = 2;
  MOUSE_BUTTON_SIDE = 3;
  MOUSE_BUTTON_EXTRA = 4;
  MOUSE_BUTTON_FORWARD = 5;
  MOUSE_BUTTON_BACK = 6;
  MOUSE_CURSOR_DEFAULT = 0;
  MOUSE_CURSOR_ARROW = 1;
  MOUSE_CURSOR_IBEAM = 2;
  MOUSE_CURSOR_CROSSHAIR = 3;
  MOUSE_CURSOR_POINTING_HAND = 4;
  MOUSE_CURSOR_RESIZE_EW = 5;
  MOUSE_CURSOR_RESIZE_NS = 6;
  MOUSE_CURSOR_RESIZE_NWSE = 7;
  MOUSE_CURSOR_RESIZE_NESW = 8;
  MOUSE_CURSOR_RESIZE_ALL = 9;
  MOUSE_CURSOR_NOT_ALLOWED = 10;
  GAMEPAD_BUTTON_UNKNOWN = 0;
  MOUSE_MIDDLE_BUTTON = MOUSE_BUTTON_MIDDLE;
  MOUSE_RIGHT_BUTTON = MOUSE_BUTTON_RIGHT;
  MOUSE_LEFT_BUTTON = MOUSE_BUTTON_LEFT;
  GAMEPAD_BUTTON_LEFT_FACE_UP = 1;
  GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2;
  GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3;
  GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4;
  GAMEPAD_BUTTON_RIGHT_FACE_UP = 5;
  GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6;
  GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7;
  GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8;
  GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9;
  GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10;
  GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11;
  GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12;
  GAMEPAD_BUTTON_MIDDLE_LEFT = 13;
  GAMEPAD_BUTTON_MIDDLE = 14;
  GAMEPAD_BUTTON_MIDDLE_RIGHT = 15;
  GAMEPAD_BUTTON_LEFT_THUMB = 16;
  GAMEPAD_BUTTON_RIGHT_THUMB = 17;
  GAMEPAD_AXIS_LEFT_X = 0;
  GAMEPAD_AXIS_LEFT_Y = 1;
  GAMEPAD_AXIS_RIGHT_X = 2;
  GAMEPAD_AXIS_RIGHT_Y = 3;
  GAMEPAD_AXIS_LEFT_TRIGGER = 4;
  GAMEPAD_AXIS_RIGHT_TRIGGER = 5;
  MATERIAL_MAP_ALBEDO = 0;
  MATERIAL_MAP_METALNESS = 1;
  MATERIAL_MAP_NORMAL = 2;
  MATERIAL_MAP_ROUGHNESS = 3;
  MATERIAL_MAP_OCCLUSION = 4;
  MATERIAL_MAP_EMISSION = 5;
  MATERIAL_MAP_HEIGHT = 6;
  MATERIAL_MAP_CUBEMAP = 7;
  MATERIAL_MAP_IRRADIANCE = 8;
  MATERIAL_MAP_PREFILTER = 9;
  MATERIAL_MAP_BRDF = 10;
  SHADER_LOC_VERTEX_POSITION = 0;
  MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;
  MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;
  SHADER_LOC_VERTEX_TEXCOORD01 = 1;
  SHADER_LOC_VERTEX_TEXCOORD02 = 2;
  SHADER_LOC_VERTEX_NORMAL = 3;
  SHADER_LOC_VERTEX_TANGENT = 4;
  SHADER_LOC_VERTEX_COLOR = 5;
  SHADER_LOC_MATRIX_MVP = 6;
  SHADER_LOC_MATRIX_VIEW = 7;
  SHADER_LOC_MATRIX_PROJECTION = 8;
  SHADER_LOC_MATRIX_MODEL = 9;
  SHADER_LOC_MATRIX_NORMAL = 10;
  SHADER_LOC_VECTOR_VIEW = 11;
  SHADER_LOC_COLOR_DIFFUSE = 12;
  SHADER_LOC_COLOR_SPECULAR = 13;
  SHADER_LOC_COLOR_AMBIENT = 14;
  SHADER_LOC_MAP_ALBEDO = 15;
  SHADER_LOC_MAP_METALNESS = 16;
  SHADER_LOC_MAP_NORMAL = 17;
  SHADER_LOC_MAP_ROUGHNESS = 18;
  SHADER_LOC_MAP_OCCLUSION = 19;
  SHADER_LOC_MAP_EMISSION = 20;
  SHADER_LOC_MAP_HEIGHT = 21;
  SHADER_LOC_MAP_CUBEMAP = 22;
  SHADER_LOC_MAP_IRRADIANCE = 23;
  SHADER_LOC_MAP_PREFILTER = 24;
  SHADER_LOC_MAP_BRDF = 25;
  SHADER_UNIFORM_FLOAT = 0;
  SHADER_UNIFORM_VEC2 = 1;
  SHADER_UNIFORM_VEC3 = 2;
  SHADER_UNIFORM_VEC4 = 3;
  SHADER_UNIFORM_INT = 4;
  SHADER_UNIFORM_IVEC2 = 5;
  SHADER_UNIFORM_IVEC3 = 6;
  SHADER_UNIFORM_IVEC4 = 7;
  SHADER_UNIFORM_SAMPLER2D = 8;
  SHADER_ATTRIB_FLOAT = 0;
  SHADER_ATTRIB_VEC2 = 1;
  SHADER_ATTRIB_VEC3 = 2;
  SHADER_ATTRIB_VEC4 = 3;
  PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1;
  SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;
  SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;
  PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2;
  PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3;
  PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4;
  PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5;
  PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6;
  PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7;
  PIXELFORMAT_UNCOMPRESSED_R32 = 8;
  PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9;
  PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10;
  PIXELFORMAT_COMPRESSED_DXT1_RGB = 11;
  PIXELFORMAT_COMPRESSED_DXT1_RGBA = 12;
  PIXELFORMAT_COMPRESSED_DXT3_RGBA = 13;
  PIXELFORMAT_COMPRESSED_DXT5_RGBA = 14;
  PIXELFORMAT_COMPRESSED_ETC1_RGB = 15;
  PIXELFORMAT_COMPRESSED_ETC2_RGB = 16;
  PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 17;
  PIXELFORMAT_COMPRESSED_PVRT_RGB = 18;
  PIXELFORMAT_COMPRESSED_PVRT_RGBA = 19;
  PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 20;
  PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 21;
  TEXTURE_FILTER_POINT = 0;
  TEXTURE_FILTER_BILINEAR = 1;
  TEXTURE_FILTER_TRILINEAR = 2;
  TEXTURE_FILTER_ANISOTROPIC_4X = 3;
  TEXTURE_FILTER_ANISOTROPIC_8X = 4;
  TEXTURE_FILTER_ANISOTROPIC_16X = 5;
  TEXTURE_WRAP_REPEAT = 0;
  TEXTURE_WRAP_CLAMP = 1;
  TEXTURE_WRAP_MIRROR_REPEAT = 2;
  TEXTURE_WRAP_MIRROR_CLAMP = 3;
  CUBEMAP_LAYOUT_AUTO_DETECT = 0;
  CUBEMAP_LAYOUT_LINE_VERTICAL = 1;
  CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2;
  CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3;
  CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4;
  CUBEMAP_LAYOUT_PANORAMA = 5;
  FONT_DEFAULT = 0;
  FONT_BITMAP = 1;
  FONT_SDF = 2;
  BLEND_ALPHA = 0;
  BLEND_ADDITIVE = 1;
  BLEND_MULTIPLIED = 2;
  BLEND_ADD_COLORS = 3;
  BLEND_SUBTRACT_COLORS = 4;
  BLEND_CUSTOM = 5;
  GESTURE_NONE = 0;
  GESTURE_TAP = 1;
  GESTURE_DOUBLETAP = 2;
  GESTURE_HOLD = 4;
  GESTURE_DRAG = 8;
  GESTURE_SWIPE_RIGHT = 16;
  GESTURE_SWIPE_LEFT = 32;
  GESTURE_SWIPE_UP = 64;
  GESTURE_SWIPE_DOWN = 128;
  GESTURE_PINCH_IN = 256;
  GESTURE_PINCH_OUT = 512;
  CAMERA_CUSTOM = 0;
  CAMERA_FREE = 1;
  CAMERA_ORBITAL = 2;
  CAMERA_FIRST_PERSON = 3;
  CAMERA_THIRD_PERSON = 4;
  CAMERA_PERSPECTIVE = 0;
  CAMERA_ORTHOGRAPHIC = 1;
  NPATCH_NINE_PATCH = 0;
  NPATCH_THREE_PATCH_VERTICAL = 1;
  NPATCH_THREE_PATCH_HORIZONTAL = 2;
  GUI_STATE_NORMAL = 0;
  GUI_STATE_FOCUSED = 1;
  GUI_STATE_PRESSED = 2;
  GUI_STATE_DISABLED = 3;
  GUI_TEXT_ALIGN_LEFT = 0;
  GUI_TEXT_ALIGN_CENTER = 1;
  GUI_TEXT_ALIGN_RIGHT = 2;
  DEFAULT = 0;
  _LABEL = 1;
  BUTTON = 2;
  TOGGLE = 3;
  SLIDER = 4;
  PROGRESSBAR = 5;
  CHECKBOX = 6;
  COMBOBOX = 7;
  DROPDOWNBOX = 8;
  TEXTBOX = 9;
  VALUEBOX = 10;
  SPINNER = 11;
  LISTVIEW = 12;
  COLORPICKER = 13;
  SCROLLBAR = 14;
  STATUSBAR = 15;
  BORDER_COLOR_NORMAL = 0;
  BASE_COLOR_NORMAL = 1;
  TEXT_COLOR_NORMAL = 2;
  BORDER_COLOR_FOCUSED = 3;
  BASE_COLOR_FOCUSED = 4;
  TEXT_COLOR_FOCUSED = 5;
  BORDER_COLOR_PRESSED = 6;
  BASE_COLOR_PRESSED = 7;
  TEXT_COLOR_PRESSED = 8;
  BORDER_COLOR_DISABLED = 9;
  BASE_COLOR_DISABLED = 10;
  TEXT_COLOR_DISABLED = 11;
  BORDER_WIDTH = 12;
  TEXT_PADDING = 13;
  TEXT_ALIGNMENT = 14;
  RESERVED = 15;
  TEXT_SIZE = 16;
  TEXT_SPACING = 17;
  LINE_COLOR = 18;
  BACKGROUND_COLOR = 19;
  GROUP_PADDING = 16;
  SLIDER_WIDTH = 16;
  SLIDER_PADDING = 17;
  PROGRESS_PADDING = 16;
  CHECK_PADDING = 16;
  COMBO_BUTTON_WIDTH = 16;
  COMBO_BUTTON_PADDING = 17;
  ARROW_PADDING = 16;
  DROPDOWN_ITEMS_PADDING = 17;
  TEXT_INNER_PADDING = 16;
  TEXT_LINES_PADDING = 17;
  COLOR_SELECTED_FG = 18;
  COLOR_SELECTED_BG = 19;
  SPIN_BUTTON_WIDTH = 16;
  SPIN_BUTTON_PADDING = 17;
  ARROWS_SIZE = 16;
  ARROWS_VISIBLE = 17;
  SCROLL_SLIDER_PADDING = 18;
  SCROLL_SLIDER_SIZE = 19;
  SCROLL_PADDING = 20;
  SCROLL_SPEED = 21;
  SCROLLBAR_LEFT_SIDE = 0;
  SCROLLBAR_RIGHT_SIDE = 1;
  LIST_ITEMS_HEIGHT = 16;
  LIST_ITEMS_PADDING = 17;
  SCROLLBAR_WIDTH = 18;
  SCROLLBAR_SIDE = 19;
  COLOR_SELECTOR_SIZE = 16;
  HUEBAR_WIDTH = 17;
  HUEBAR_PADDING = 18;
  HUEBAR_SELECTOR_HEIGHT = 19;
  HUEBAR_SELECTOR_OVERFLOW = 20;
  PHYSICS_CIRCLE = 0;
  PHYSICS_POLYGON = 1;
  MEMPOOL_BUCKET_SIZE = 8;
  MEMPOOL_BUCKET_BITS = 5;
  MEM_SPLIT_THRESHOLD = 32;

type

  { bool  }
  bool = WordBool;

  { Pbool  }
  Pbool = ^bool;

  { ConfigFlags  }
  ConfigFlags = Integer;

  { PConfigFlags  }
  PConfigFlags = ^ConfigFlags;

  { TraceLogLevel  }
  TraceLogLevel = Integer;

  { PTraceLogLevel  }
  PTraceLogLevel = ^TraceLogLevel;

  { KeyboardKey  }
  KeyboardKey = Integer;

  { PKeyboardKey  }
  PKeyboardKey = ^KeyboardKey;

  { MouseButton  }
  MouseButton = Integer;

  { PMouseButton  }
  PMouseButton = ^MouseButton;

  { MouseCursor  }
  MouseCursor = Integer;

  { PMouseCursor  }
  PMouseCursor = ^MouseCursor;

  { GamepadButton  }
  GamepadButton = Integer;

  { PGamepadButton  }
  PGamepadButton = ^GamepadButton;

  { GamepadAxis  }
  GamepadAxis = Integer;

  { PGamepadAxis  }
  PGamepadAxis = ^GamepadAxis;

  { MaterialMapIndex  }
  MaterialMapIndex = Integer;

  { PMaterialMapIndex  }
  PMaterialMapIndex = ^MaterialMapIndex;

  { ShaderLocationIndex  }
  ShaderLocationIndex = Integer;

  { PShaderLocationIndex  }
  PShaderLocationIndex = ^ShaderLocationIndex;

  { ShaderUniformDataType  }
  ShaderUniformDataType = Integer;

  { PShaderUniformDataType  }
  PShaderUniformDataType = ^ShaderUniformDataType;

  { ShaderAttributeDataType  }
  ShaderAttributeDataType = Integer;

  { PShaderAttributeDataType  }
  PShaderAttributeDataType = ^ShaderAttributeDataType;

  { PixelFormat  }
  PixelFormat = Integer;

  { PPixelFormat  }
  PPixelFormat = ^PixelFormat;

  { TextureFilter  }
  TextureFilter = Integer;

  { PTextureFilter  }
  PTextureFilter = ^TextureFilter;

  { TextureWrap  }
  TextureWrap = Integer;

  { PTextureWrap  }
  PTextureWrap = ^TextureWrap;

  { CubemapLayout  }
  CubemapLayout = Integer;

  { PCubemapLayout  }
  PCubemapLayout = ^CubemapLayout;

  { FontType  }
  FontType = Integer;

  { PFontType  }
  PFontType = ^FontType;

  { BlendMode  }
  BlendMode = Integer;

  { PBlendMode  }
  PBlendMode = ^BlendMode;

  { Gesture  }
  Gesture = Integer;

  { PGesture  }
  PGesture = ^Gesture;

  { CameraMode  }
  CameraMode = Integer;

  { PCameraMode  }
  PCameraMode = ^CameraMode;

  { CameraProjection  }
  CameraProjection = Integer;

  { PCameraProjection  }
  PCameraProjection = ^CameraProjection;

  { NPatchLayout  }
  NPatchLayout = Integer;

  { PNPatchLayout  }
  PNPatchLayout = ^NPatchLayout;

  { GuiControlState  }
  GuiControlState = Integer;

  { PGuiControlState  }
  PGuiControlState = ^GuiControlState;

  { GuiTextAlignment  }
  GuiTextAlignment = Integer;

  { PGuiTextAlignment  }
  PGuiTextAlignment = ^GuiTextAlignment;

  { GuiControl  }
  GuiControl = Integer;

  { PGuiControl  }
  PGuiControl = ^GuiControl;

  { GuiControlProperty  }
  GuiControlProperty = Integer;

  { PGuiControlProperty  }
  PGuiControlProperty = ^GuiControlProperty;

  { GuiDefaultProperty  }
  GuiDefaultProperty = Integer;

  { PGuiDefaultProperty  }
  PGuiDefaultProperty = ^GuiDefaultProperty;

  { GuiToggleProperty  }
  GuiToggleProperty = Integer;

  { PGuiToggleProperty  }
  PGuiToggleProperty = ^GuiToggleProperty;

  { GuiSliderProperty  }
  GuiSliderProperty = Integer;

  { PGuiSliderProperty  }
  PGuiSliderProperty = ^GuiSliderProperty;

  { GuiProgressBarProperty  }
  GuiProgressBarProperty = Integer;

  { PGuiProgressBarProperty  }
  PGuiProgressBarProperty = ^GuiProgressBarProperty;

  { GuiCheckBoxProperty  }
  GuiCheckBoxProperty = Integer;

  { PGuiCheckBoxProperty  }
  PGuiCheckBoxProperty = ^GuiCheckBoxProperty;

  { GuiComboBoxProperty  }
  GuiComboBoxProperty = Integer;

  { PGuiComboBoxProperty  }
  PGuiComboBoxProperty = ^GuiComboBoxProperty;

  { GuiDropdownBoxProperty  }
  GuiDropdownBoxProperty = Integer;

  { PGuiDropdownBoxProperty  }
  PGuiDropdownBoxProperty = ^GuiDropdownBoxProperty;

  { GuiTextBoxProperty  }
  GuiTextBoxProperty = Integer;

  { PGuiTextBoxProperty  }
  PGuiTextBoxProperty = ^GuiTextBoxProperty;

  { GuiSpinnerProperty  }
  GuiSpinnerProperty = Integer;

  { PGuiSpinnerProperty  }
  PGuiSpinnerProperty = ^GuiSpinnerProperty;

  { GuiScrollBarProperty  }
  GuiScrollBarProperty = Integer;

  { PGuiScrollBarProperty  }
  PGuiScrollBarProperty = ^GuiScrollBarProperty;

  { GuiScrollBarSide  }
  GuiScrollBarSide = Integer;

  { PGuiScrollBarSide  }
  PGuiScrollBarSide = ^GuiScrollBarSide;

  { GuiListViewProperty  }
  GuiListViewProperty = Integer;

  { PGuiListViewProperty  }
  PGuiListViewProperty = ^GuiListViewProperty;

  { GuiColorPickerProperty  }
  GuiColorPickerProperty = Integer;

  { PGuiColorPickerProperty  }
  PGuiColorPickerProperty = ^GuiColorPickerProperty;

  { PhysicsShapeType  }
  PhysicsShapeType = Integer;

  { PPhysicsShapeType  }
  PPhysicsShapeType = ^PhysicsShapeType;

  { _anonymous_type_1  }
  _anonymous_type_1 = Integer;

  { P_anonymous_type_1  }
  P_anonymous_type_1 = ^_anonymous_type_1;
  // Forward declarations

  { PPUTF8Char  }
  PPUTF8Char = ^PUTF8Char;

  { PVector2  }
  PVector2 = ^Vector2;

  { PVector3  }
  PVector3 = ^Vector3;

  { PVector4  }
  PVector4 = ^Vector4;

  { PMatrix  }
  PMatrix = ^Matrix;

  { PColor  }
  PColor = ^Color;

  { PRectangle  }
  PRectangle = ^Rectangle;

  { PPRectangle  }
  PPRectangle = ^PRectangle;

  { PImage  }
  PImage = ^Image;

  { PTexture  }
  PTexture = ^Texture;

  { PRenderTexture  }
  PRenderTexture = ^RenderTexture;

  { PNPatchInfo  }
  PNPatchInfo = ^NPatchInfo;

  { PGlyphInfo  }
  PGlyphInfo = ^GlyphInfo;

  { PFont  }
  PFont = ^Font;

  { PCamera3D  }
  PCamera3D = ^Camera3D;

  { PCamera2D  }
  PCamera2D = ^Camera2D;

  { PMesh  }
  PMesh = ^Mesh;

  { PShader  }
  PShader = ^Shader;

  { PMaterialMap  }
  PMaterialMap = ^MaterialMap;

  { PMaterial  }
  PMaterial = ^Material;

  { PTransform  }
  PTransform = ^Transform;

  { PPTransform  }
  PPTransform = ^PTransform;

  { PBoneInfo  }
  PBoneInfo = ^BoneInfo;

  { PModel  }
  PModel = ^Model;

  { PModelAnimation  }
  PModelAnimation = ^ModelAnimation;

  { PRay  }
  PRay = ^Ray;

  { PRayCollision  }
  PRayCollision = ^RayCollision;

  { PBoundingBox  }
  PBoundingBox = ^BoundingBox;

  { PWave  }
  PWave = ^Wave;

  { PAudioStream  }
  PAudioStream = ^AudioStream;

  { PSound  }
  PSound = ^Sound;

  { PMusic  }
  PMusic = ^Music;

  { PVrDeviceInfo  }
  PVrDeviceInfo = ^VrDeviceInfo;

  { PVrStereoConfig  }
  PVrStereoConfig = ^VrStereoConfig;

  { PGuiStyleProp  }
  PGuiStyleProp = ^GuiStyleProp;

  { PMatrix2x2  }
  PMatrix2x2 = ^Matrix2x2;

  { PPhysicsVertexData  }
  PPhysicsVertexData = ^PhysicsVertexData;

  { PPhysicsShape  }
  PPhysicsShape = ^PhysicsShape;

  { PPhysicsBodyData  }
  PPhysicsBodyData = ^PhysicsBodyData;

  { PPhysicsManifoldData  }
  PPhysicsManifoldData = ^PhysicsManifoldData;

  { PMemNode  }
  PMemNode = ^MemNode;

  { PAllocList  }
  PAllocList = ^AllocList;

  { PArena  }
  PArena = ^Arena;

  { PMemPool  }
  PMemPool = ^MemPool;

  { PObjPool  }
  PObjPool = ^ObjPool;

  { PBiStack  }
  PBiStack = ^BiStack;

  { Vector2  }
  Vector2 = record
    x: Single;
    y: Single;
  end;

  { Vector3  }
  Vector3 = record
    x: Single;
    y: Single;
    z: Single;
  end;

  { Vector4  }
  Vector4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  { Quaternion  }
  Quaternion = Vector4;

  { Matrix  }
  Matrix = record
    m0: Single;
    m4: Single;
    m8: Single;
    m12: Single;
    m1: Single;
    m5: Single;
    m9: Single;
    m13: Single;
    m2: Single;
    m6: Single;
    m10: Single;
    m14: Single;
    m3: Single;
    m7: Single;
    m11: Single;
    m15: Single;
  end;

  { Color  }
  Color = record
    r: Byte;
    g: Byte;
    b: Byte;
    a: Byte;
  end;

  { Rectangle  }
  Rectangle = record
    x: Single;
    y: Single;
    width: Single;
    height: Single;
  end;

  { Image  }
  Image = record
    data: Pointer;
    width: Integer;
    height: Integer;
    mipmaps: Integer;
    format: Integer;
  end;

  { Texture  }
  Texture = record
    id: Cardinal;
    width: Integer;
    height: Integer;
    mipmaps: Integer;
    format: Integer;
  end;

  { Texture2D  }
  Texture2D = Texture;

  { PTexture2D  }
  PTexture2D = ^Texture2D;

  { TextureCubemap  }
  TextureCubemap = Texture;

  { RenderTexture  }
  RenderTexture = record
    id: Cardinal;
    texture: Texture;
    depth: Texture;
  end;

  { RenderTexture2D  }
  RenderTexture2D = RenderTexture;

  { NPatchInfo  }
  NPatchInfo = record
    source: Rectangle;
    left: Integer;
    top: Integer;
    right: Integer;
    bottom: Integer;
    layout: Integer;
  end;

  { GlyphInfo  }
  GlyphInfo = record
    value: Integer;
    offsetX: Integer;
    offsetY: Integer;
    advanceX: Integer;
    image: Image;
  end;

  { Font  }
  Font = record
    baseSize: Integer;
    glyphCount: Integer;
    glyphPadding: Integer;
    texture: Texture2D;
    recs: PRectangle;
    glyphs: PGlyphInfo;
  end;

  { Camera3D  }
  Camera3D = record
    position: Vector3;
    target: Vector3;
    up: Vector3;
    fovy: Single;
    projection: Integer;
  end;

  { Camera  }
  Camera = Camera3D;

  { PCamera  }
  PCamera = ^Camera;

  { Camera2D  }
  Camera2D = record
    offset: Vector2;
    target: Vector2;
    rotation: Single;
    zoom: Single;
  end;

  { Mesh  }
  Mesh = record
    vertexCount: Integer;
    triangleCount: Integer;
    vertices: PSingle;
    texcoords: PSingle;
    texcoords2: PSingle;
    normals: PSingle;
    tangents: PSingle;
    colors: PByte;
    indices: PWord;
    animVertices: PSingle;
    animNormals: PSingle;
    boneIds: PByte;
    boneWeights: PSingle;
    vaoId: Cardinal;
    vboId: PCardinal;
  end;

  { Shader  }
  Shader = record
    id: Cardinal;
    locs: PInteger;
  end;

  { MaterialMap  }
  MaterialMap = record
    texture: Texture2D;
    color: Color;
    value: Single;
  end;

  { Material  }
  Material = record
    shader: Shader;
    maps: PMaterialMap;
    params: array [0..3] of Single;
  end;

  { Transform  }
  Transform = record
    translation: Vector3;
    rotation: Quaternion;
    scale: Vector3;
  end;

  { BoneInfo  }
  BoneInfo = record
    name: array [0..31] of UTF8Char;
    parent: Integer;
  end;

  { Model  }
  Model = record
    transform: Matrix;
    meshCount: Integer;
    materialCount: Integer;
    meshes: PMesh;
    materials: PMaterial;
    meshMaterial: PInteger;
    boneCount: Integer;
    bones: PBoneInfo;
    bindPose: PTransform;
  end;

  { ModelAnimation  }
  ModelAnimation = record
    boneCount: Integer;
    frameCount: Integer;
    bones: PBoneInfo;
    framePoses: PPTransform;
  end;

  { Ray  }
  Ray = record
    position: Vector3;
    direction: Vector3;
  end;

  { RayCollision  }
  RayCollision = record
    hit: bool;
    distance: Single;
    point: Vector3;
    normal: Vector3;
  end;

  { BoundingBox  }
  BoundingBox = record
    min: Vector3;
    max: Vector3;
  end;

  { Wave  }
  Wave = record
    frameCount: Cardinal;
    sampleRate: Cardinal;
    sampleSize: Cardinal;
    channels: Cardinal;
    data: Pointer;
  end;

  { PrAudioBuffer  }
  PrAudioBuffer = Pointer;

  { PPrAudioBuffer  }
  PPrAudioBuffer = ^PrAudioBuffer;

  { AudioStream  }
  AudioStream = record
    buffer: PrAudioBuffer;
    sampleRate: Cardinal;
    sampleSize: Cardinal;
    channels: Cardinal;
  end;

  { Sound  }
  Sound = record
    stream: AudioStream;
    frameCount: Cardinal;
  end;

  { Music  }
  Music = record
    stream: AudioStream;
    frameCount: Cardinal;
    looping: bool;
    ctxType: Integer;
    ctxData: Pointer;
  end;

  { VrDeviceInfo  }
  VrDeviceInfo = record
    hResolution: Integer;
    vResolution: Integer;
    hScreenSize: Single;
    vScreenSize: Single;
    vScreenCenter: Single;
    eyeToScreenDistance: Single;
    lensSeparationDistance: Single;
    interpupillaryDistance: Single;
    lensDistortionValues: array [0..3] of Single;
    chromaAbCorrection: array [0..3] of Single;
  end;

  { VrStereoConfig  }
  VrStereoConfig = record
    projection: array [0..1] of Matrix;
    viewOffset: array [0..1] of Matrix;
    leftLensCenter: array [0..1] of Single;
    rightLensCenter: array [0..1] of Single;
    leftScreenCenter: array [0..1] of Single;
    rightScreenCenter: array [0..1] of Single;
    scale: array [0..1] of Single;
    scaleIn: array [0..1] of Single;
  end;

  { TraceLogCallback  }
  TraceLogCallback = procedure(logLevel: Integer; const text: PUTF8Char; args: Pointer); cdecl;

  { LoadFileDataCallback  }
  LoadFileDataCallback = function(const fileName: PUTF8Char; bytesRead: PCardinal): PByte; cdecl;

  { SaveFileDataCallback  }
  SaveFileDataCallback = function(const fileName: PUTF8Char; data: Pointer; bytesToWrite: Cardinal): bool; cdecl;

  { LoadFileTextCallback  }
  LoadFileTextCallback = function(const fileName: PUTF8Char): PUTF8Char; cdecl;

  { SaveFileTextCallback  }
  SaveFileTextCallback = function(const fileName: PUTF8Char; text: PUTF8Char): bool; cdecl;

  { GuiStyleProp  }
  GuiStyleProp = record
    controlId: Word;
    propertyId: Word;
    propertyValue: Integer;
  end;

  { PhysicsBody  }
  PhysicsBody = PPhysicsBodyData;

  { Matrix2x2  }
  Matrix2x2 = record
    m00: Single;
    m01: Single;
    m10: Single;
    m11: Single;
  end;

  { PhysicsVertexData  }
  PhysicsVertexData = record
    vertexCount: Cardinal;
    positions: array [0..23] of Vector2;
    normals: array [0..23] of Vector2;
  end;

  { PhysicsShape  }
  PhysicsShape = record
    _type: PhysicsShapeType;
    body: PhysicsBody;
    vertexData: PhysicsVertexData;
    radius: Single;
    transform: Matrix2x2;
  end;

  { PhysicsBodyData  }
  PhysicsBodyData = record
    id: Cardinal;
    enabled: bool;
    position: Vector2;
    velocity: Vector2;
    force: Vector2;
    angularVelocity: Single;
    torque: Single;
    orient: Single;
    inertia: Single;
    inverseInertia: Single;
    mass: Single;
    inverseMass: Single;
    staticFriction: Single;
    dynamicFriction: Single;
    restitution: Single;
    useGravity: bool;
    isGrounded: bool;
    freezeOrient: bool;
    shape: PhysicsShape;
  end;

  { PhysicsManifoldData  }
  PhysicsManifoldData = record
    id: Cardinal;
    bodyA: PhysicsBody;
    bodyB: PhysicsBody;
    penetration: Single;
    normal: Vector2;
    contacts: array [0..1] of Vector2;
    contactsCount: Cardinal;
    restitution: Single;
    dynamicFriction: Single;
    staticFriction: Single;
  end;

  { PhysicsManifold  }
  PhysicsManifold = PPhysicsManifoldData;

  { MemNode  }
  MemNode = record
    size: NativeUInt;
    next: PMemNode;
    prev: PMemNode;
  end;

  { AllocList  }
  AllocList = record
    head: PMemNode;
    tail: PMemNode;
    len: NativeUInt;
  end;

  { Arena  }
  Arena = record
    mem: UIntPtr;
    offs: UIntPtr;
    size: NativeUInt;
  end;

  { MemPool  }
  MemPool = record
    large: AllocList;
    buckets: array [0..7] of AllocList;
    arena: Arena;
  end;

  { ObjPool  }
  ObjPool = record
    mem: UIntPtr;
    offs: UIntPtr;
    objSize: NativeUInt;
    freeBlocks: NativeUInt;
    memSize: NativeUInt;
  end;

  { BiStack  }
  BiStack = record
    mem: UIntPtr;
    front: UIntPtr;
    back: UIntPtr;
    size: NativeUInt;
  end;

{$REGION 'Common Colors'}
const
  ALICEBLUE           : Color = (r:$F0; g:$F8; b:$FF; a:$FF);
  ANTIQUEWHITE        : Color = (r:$FA; g:$EB; b:$D7; a:$FF);
  AQUA                : Color = (r:$00; g:$FF; b:$FF; a:$FF);
  AQUAMARINE          : Color = (r:$7F; g:$FF; b:$D4; a:$FF);
  AZURE               : Color = (r:$F0; g:$FF; b:$FF; a:$FF);
  BEIGE               : Color = (r:$F5; g:$F5; b:$DC; a:$FF);
  BISQUE              : Color = (r:$FF; g:$E4; b:$C4; a:$FF);
  BLACK               : Color = (r:$00; g:$00; b:$00; a:$FF);
  BLANCHEDALMOND      : Color = (r:$FF; g:$EB; b:$CD; a:$FF);
  BLUE                : Color = (r:$00; g:$00; b:$FF; a:$FF);
  BLUEVIOLET          : Color = (r:$8A; g:$2B; b:$E2; a:$FF);
  BROWN               : Color = (r:$A5; g:$2A; b:$2A; a:$FF);
  BURLYWOOD           : Color = (r:$DE; g:$B8; b:$87; a:$FF);
  CADETBLUE           : Color = (r:$5F; g:$9E; b:$A0; a:$FF);
  CHARTREUSE          : Color = (r:$7F; g:$FF; b:$00; a:$FF);
  CHOCOLATE           : Color = (r:$D2; g:$69; b:$1E; a:$FF);
  CORAL               : Color = (r:$FF; g:$7F; b:$50; a:$FF);
  CORNFLOWERBLUE      : Color = (r:$64; g:$95; b:$ED; a:$FF);
  CORNSILK            : Color = (r:$FF; g:$F8; b:$DC; a:$FF);
  CRIMSON             : Color = (r:$DC; g:$14; b:$3C; a:$FF);
  CYAN                : Color = (r:$00; g:$FF; b:$FF; a:$FF);
  DARKBLUE            : Color = (r:$00; g:$00; b:$8B; a:$FF);
  DARKCYAN            : Color = (r:$00; g:$8B; b:$8B; a:$FF);
  DARKGOLDENROD       : Color = (r:$B8; g:$86; b:$0B; a:$FF);
  DARKGRAY            : Color = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKGREEN           : Color = (r:$00; g:$64; b:$00; a:$FF);
  DARKGREY            : Color = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKKHAKI           : Color = (r:$BD; g:$B7; b:$6B; a:$FF);
  DARKMAGENTA         : Color = (r:$8B; g:$00; b:$8B; a:$FF);
  DARKOLIVEGREEN      : Color = (r:$55; g:$6B; b:$2F; a:$FF);
  DARKORANGE          : Color = (r:$FF; g:$8C; b:$00; a:$FF);
  DARKORCHID          : Color = (r:$99; g:$32; b:$CC; a:$FF);
  DARKRED             : Color = (r:$8B; g:$00; b:$00; a:$FF);
  DARKSALMON          : Color = (r:$E9; g:$96; b:$7A; a:$FF);
  DARKSEAGREEN        : Color = (r:$8F; g:$BC; b:$8F; a:$FF);
  DARKSLATEBLUE       : Color = (r:$48; g:$3D; b:$8B; a:$FF);
  DARKSLATEGRAY       : Color = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKSLATEGREY       : Color = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKTURQUOISE       : Color = (r:$00; g:$CE; b:$D1; a:$FF);
  DARKVIOLET          : Color = (r:$94; g:$00; b:$D3; a:$FF);
  DEEPPINK            : Color = (r:$FF; g:$14; b:$93; a:$FF);
  DEEPSKYBLUE         : Color = (r:$00; g:$BF; b:$FF; a:$FF);
  DIMGRAY             : Color = (r:$69; g:$69; b:$69; a:$FF);
  DIMGREY             : Color = (r:$69; g:$69; b:$69; a:$FF);
  DODGERBLUE          : Color = (r:$1E; g:$90; b:$FF; a:$FF);
  FIREBRICK           : Color = (r:$B2; g:$22; b:$22; a:$FF);
  FLORALWHITE         : Color = (r:$FF; g:$FA; b:$F0; a:$FF);
  FORESTGREEN         : Color = (r:$22; g:$8B; b:$22; a:$FF);
  FUCHSIA             : Color = (r:$FF; g:$00; b:$FF; a:$FF);
  GAINSBORO           : Color = (r:$DC; g:$DC; b:$DC; a:$FF);
  GHOSTWHITE          : Color = (r:$F8; g:$F8; b:$FF; a:$FF);
  GOLD                : Color = (r:$FF; g:$D7; b:$00; a:$FF);
  GOLDENROD           : Color = (r:$DA; g:$A5; b:$20; a:$FF);
  GRAY                : Color = (r:$80; g:$80; b:$80; a:$FF);
  GREEN               : Color = (r:$00; g:$80; b:$00; a:$FF);
  GREENYELLOW         : Color = (r:$AD; g:$FF; b:$2F; a:$FF);
  GREY                : Color = (r:$80; g:$80; b:$80; a:$FF);
  HONEYDEW            : Color = (r:$F0; g:$FF; b:$F0; a:$FF);
  HOTPINK             : Color = (r:$FF; g:$69; b:$B4; a:$FF);
  INDIANRED           : Color = (r:$CD; g:$5C; b:$5C; a:$FF);
  INDIGO              : Color = (r:$4B; g:$00; b:$82; a:$FF);
  IVORY               : Color = (r:$FF; g:$FF; b:$F0; a:$FF);
  KHAKI               : Color = (r:$F0; g:$E6; b:$8C; a:$FF);
  LAVENDER            : Color = (r:$E6; g:$E6; b:$FA; a:$FF);
  LAVENDERBLUSH       : Color = (r:$FF; g:$F0; b:$F5; a:$FF);
  LAWNGREEN           : Color = (r:$7C; g:$FC; b:$00; a:$FF);
  LEMONCHIFFON        : Color = (r:$FF; g:$FA; b:$CD; a:$FF);
  LIGHTBLUE           : Color = (r:$AD; g:$D8; b:$E6; a:$FF);
  LIGHTCORAL          : Color = (r:$F0; g:$80; b:$80; a:$FF);
  LIGHTCYAN           : Color = (r:$E0; g:$FF; b:$FF; a:$FF);
  LIGHTGOLDENRODYELLOW: Color = (r:$FA; g:$FA; b:$D2; a:$FF);
  LIGHTGRAY           : Color = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTGREEN          : Color = (r:$90; g:$EE; b:$90; a:$FF);
  LIGHTGREY           : Color = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTPINK           : Color = (r:$FF; g:$B6; b:$C1; a:$FF);
  LIGHTSALMON         : Color = (r:$FF; g:$A0; b:$7A; a:$FF);
  LIGHTSEAGREEN       : Color = (r:$20; g:$B2; b:$AA; a:$FF);
  LIGHTSKYBLUE        : Color = (r:$87; g:$CE; b:$FA; a:$FF);
  LIGHTSLATEGRAY      : Color = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSLATEGREY      : Color = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSTEELBLUE      : Color = (r:$B0; g:$C4; b:$DE; a:$FF);
  LIGHTYELLOW         : Color = (r:$FF; g:$FF; b:$E0; a:$FF);
  LIME                : Color = (r:$00; g:$FF; b:$00; a:$FF);
  LIMEGREEN           : Color = (r:$32; g:$CD; b:$32; a:$FF);
  LINEN               : Color = (r:$FA; g:$F0; b:$E6; a:$FF);
  MAGENTA             : Color = (r:$FF; g:$00; b:$FF; a:$FF);
  MAROON              : Color = (r:$80; g:$00; b:$00; a:$FF);
  MEDIUMAQUAMARINE    : Color = (r:$66; g:$CD; b:$AA; a:$FF);
  MEDIUMBLUE          : Color = (r:$00; g:$00; b:$CD; a:$FF);
  MEDIUMORCHID        : Color = (r:$BA; g:$55; b:$D3; a:$FF);
  MEDIUMPURPLE        : Color = (r:$93; g:$70; b:$DB; a:$FF);
  MEDIUMSEAGREEN      : Color = (r:$3C; g:$B3; b:$71; a:$FF);
  MEDIUMSLATEBLUE     : Color = (r:$7B; g:$68; b:$EE; a:$FF);
  MEDIUMSPRINGGREEN   : Color = (r:$00; g:$FA; b:$9A; a:$FF);
  MEDIUMTURQUOISE     : Color = (r:$48; g:$D1; b:$CC; a:$FF);
  MEDIUMVIOLETRED     : Color = (r:$C7; g:$15; b:$85; a:$FF);
  MIDNIGHTBLUE        : Color = (r:$19; g:$19; b:$70; a:$FF);
  MINTCREAM           : Color = (r:$F5; g:$FF; b:$FA; a:$FF);
  MISTYROSE           : Color = (r:$FF; g:$E4; b:$E1; a:$FF);
  MOCCASIN            : Color = (r:$FF; g:$E4; b:$B5; a:$FF);
  NAVAJOWHITE         : Color = (r:$FF; g:$DE; b:$AD; a:$FF);
  NAVY                : Color = (r:$00; g:$00; b:$80; a:$FF);
  OLDLACE             : Color = (r:$FD; g:$F5; b:$E6; a:$FF);
  OLIVE               : Color = (r:$80; g:$80; b:$00; a:$FF);
  OLIVEDRAB           : Color = (r:$6B; g:$8E; b:$23; a:$FF);
  ORANGE              : Color = (r:$FF; g:$A5; b:$00; a:$FF);
  ORANGERED           : Color = (r:$FF; g:$45; b:$00; a:$FF);
  ORCHID              : Color = (r:$DA; g:$70; b:$D6; a:$FF);
  PALEGOLDENROD       : Color = (r:$EE; g:$E8; b:$AA; a:$FF);
  PALEGREEN           : Color = (r:$98; g:$FB; b:$98; a:$FF);
  PALETURQUOISE       : Color = (r:$AF; g:$EE; b:$EE; a:$FF);
  PALEVIOLETRED       : Color = (r:$DB; g:$70; b:$93; a:$FF);
  PAPAYAWHIP          : Color = (r:$FF; g:$EF; b:$D5; a:$FF);
  PEACHPUFF           : Color = (r:$FF; g:$DA; b:$B9; a:$FF);
  PERU                : Color = (r:$CD; g:$85; b:$3F; a:$FF);
  PINK                : Color = (r:$FF; g:$C0; b:$CB; a:$FF);
  PLUM                : Color = (r:$DD; g:$A0; b:$DD; a:$FF);
  POWDERBLUE          : Color = (r:$B0; g:$E0; b:$E6; a:$FF);
  PURPLE              : Color = (r:$80; g:$00; b:$80; a:$FF);
  REBECCAPURPLE       : Color = (r:$66; g:$33; b:$99; a:$FF);
  RED                 : Color = (r:$FF; g:$00; b:$00; a:$FF);
  ROSYBROWN           : Color = (r:$BC; g:$8F; b:$8F; a:$FF);
  ROYALBLUE           : Color = (r:$41; g:$69; b:$E1; a:$FF);
  SADDLEBROWN         : Color = (r:$8B; g:$45; b:$13; a:$FF);
  SALMON              : Color = (r:$FA; g:$80; b:$72; a:$FF);
  SANDYBROWN          : Color = (r:$F4; g:$A4; b:$60; a:$FF);
  SEAGREEN            : Color = (r:$2E; g:$8B; b:$57; a:$FF);
  SEASHELL            : Color = (r:$FF; g:$F5; b:$EE; a:$FF);
  SIENNA              : Color = (r:$A0; g:$52; b:$2D; a:$FF);
  SILVER              : Color = (r:$C0; g:$C0; b:$C0; a:$FF);
  SKYBLUE             : Color = (r:$87; g:$CE; b:$EB; a:$FF);
  SLATEBLUE           : Color = (r:$6A; g:$5A; b:$CD; a:$FF);
  SLATEGRAY           : Color = (r:$70; g:$80; b:$90; a:$FF);
  SLATEGREY           : Color = (r:$70; g:$80; b:$90; a:$FF);
  SNOW                : Color = (r:$FF; g:$FA; b:$FA; a:$FF);
  SPRINGGREEN         : Color = (r:$00; g:$FF; b:$7F; a:$FF);
  STEELBLUE           : Color = (r:$46; g:$82; b:$B4; a:$FF);
  TAN                 : Color = (r:$D2; g:$B4; b:$8C; a:$FF);
  TEAL                : Color = (r:$00; g:$80; b:$80; a:$FF);
  THISTLE             : Color = (r:$D8; g:$BF; b:$D8; a:$FF);
  TOMATO              : Color = (r:$FF; g:$63; b:$47; a:$FF);
  TURQUOISE           : Color = (r:$40; g:$E0; b:$D0; a:$FF);
  VIOLET              : Color = (r:$EE; g:$82; b:$EE; a:$FF);
  WHEAT               : Color = (r:$F5; g:$DE; b:$B3; a:$FF);
  WHITE               : Color = (r:$FF; g:$FF; b:$FF; a:$FF);
  WHITESMOKE          : Color = (r:$F5; g:$F5; b:$F5; a:$FF);
  YELLOW              : Color = (r:$FF; g:$FF; b:$00; a:$FF);
  YELLOWGREEN         : Color = (r:$9A; g:$CD; b:$32; a:$FF);
  BLANK               : Color = (r:$00; g:$00; b:$00; a:$00);
  WHITE2              : Color = (r:$F5; g:$F5; b:$F5; a:$FF);
  RED22               : Color = (r:$7E; g:$32; b:$3F; a:255);
  COLORKEY            : Color = (r:$FF; g:$00; b:$FF; a:$FF);
  OVERLAY1            : Color = (r:$00; g:$20; b:$29; a:$B4);
  OVERLAY2            : Color = (r:$01; g:$1B; b:$01; a:255);
  DIMWHITE            : Color = (r:$10; g:$10; b:$10; a:$10);
  DARKSLATEBROWN      : Color = (r:30;  g:31;  b:30;  a:1);
  RAYWHITE            : Color = (r:245; g:245; b:245; a:255);
{$ENDREGION}

var
  BeginBlendMode: procedure(mode: Integer); cdecl;
  BeginDrawing: procedure(); cdecl;
  BeginMode2D: procedure(camera: Camera2D); cdecl;
  BeginMode3D: procedure(camera: Camera3D); cdecl;
  BeginScissorMode: procedure(x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
  BeginShaderMode: procedure(shader: Shader); cdecl;
  BeginTextureMode: procedure(target: RenderTexture2D); cdecl;
  BeginVrStereoMode: procedure(config: VrStereoConfig); cdecl;
  BiStackAllocBack: function(destack: PBiStack; len: NativeUInt): Pointer; cdecl;
  BiStackAllocFront: function(destack: PBiStack; len: NativeUInt): Pointer; cdecl;
  BiStackMargins: function(destack: BiStack): IntPtr; cdecl;
  BiStackResetAll: procedure(destack: PBiStack); cdecl;
  BiStackResetBack: procedure(destack: PBiStack); cdecl;
  BiStackResetFront: procedure(destack: PBiStack); cdecl;
  ChangeDirectory: function(const dir: PUTF8Char): bool; cdecl;
  CheckCollisionBoxes: function(box1: BoundingBox; box2: BoundingBox): bool; cdecl;
  CheckCollisionBoxSphere: function(box: BoundingBox; center: Vector3; radius: Single): bool; cdecl;
  CheckCollisionCircleRec: function(center: Vector2; radius: Single; rec: Rectangle): bool; cdecl;
  CheckCollisionCircles: function(center1: Vector2; radius1: Single; center2: Vector2; radius2: Single): bool; cdecl;
  CheckCollisionLines: function(startPos1: Vector2; endPos1: Vector2; startPos2: Vector2; endPos2: Vector2; collisionPoint: PVector2): bool; cdecl;
  CheckCollisionPointCircle: function(point: Vector2; center: Vector2; radius: Single): bool; cdecl;
  CheckCollisionPointLine: function(point: Vector2; p1: Vector2; p2: Vector2; threshold: Integer): bool; cdecl;
  CheckCollisionPointRec: function(point: Vector2; rec: Rectangle): bool; cdecl;
  CheckCollisionPointTriangle: function(point: Vector2; p1: Vector2; p2: Vector2; p3: Vector2): bool; cdecl;
  CheckCollisionRecs: function(rec1: Rectangle; rec2: Rectangle): bool; cdecl;
  CheckCollisionSpheres: function(center1: Vector3; radius1: Single; center2: Vector3; radius2: Single): bool; cdecl;
  ClearBackground: procedure(color: Color); cdecl;
  ClearDirectoryFiles: procedure(); cdecl;
  ClearDroppedFiles: procedure(); cdecl;
  ClearWindowState: procedure(flags: Cardinal); cdecl;
  CloseAudioDevice: procedure(); cdecl;
  ClosePhysics: procedure(); cdecl;
  CloseWindow: procedure(); cdecl;
  CodepointToUTF8: function(codepoint: Integer; byteSize: PInteger): PUTF8Char; cdecl;
  ColorAlpha: function(color: Color; alpha: Single): Color; cdecl;
  ColorAlphaBlend: function(dst: Color; src: Color; tint: Color): Color; cdecl;
  ColorFromHSV: function(hue: Single; saturation: Single; value: Single): Color; cdecl;
  ColorFromNormalized: function(normalized: Vector4): Color; cdecl;
  ColorNormalize: function(color: Color): Vector4; cdecl;
  ColorToHSV: function(color: Color): Vector3; cdecl;
  ColorToInt: function(color: Color): Integer; cdecl;
  CompressData: function(data: PByte; dataLength: Integer; compDataLength: PInteger): PByte; cdecl;
  CreateBiStack: function(len: NativeUInt): BiStack; cdecl;
  CreateBiStackFromBuffer: function(buf: Pointer; len: NativeUInt): BiStack; cdecl;
  CreateMemPool: function(bytes: NativeUInt): MemPool; cdecl;
  CreateMemPoolFromBuffer: function(buf: Pointer; bytes: NativeUInt): MemPool; cdecl;
  CreateObjPool: function(objsize: NativeUInt; len: NativeUInt): ObjPool; cdecl;
  CreateObjPoolFromBuffer: function(buf: Pointer; objsize: NativeUInt; len: NativeUInt): ObjPool; cdecl;
  CreatePhysicsBodyCircle: function(pos: Vector2; radius: Single; density: Single): PhysicsBody; cdecl;
  CreatePhysicsBodyPolygon: function(pos: Vector2; radius: Single; sides: Integer; density: Single): PhysicsBody; cdecl;
  CreatePhysicsBodyRectangle: function(pos: Vector2; width: Single; height: Single; density: Single): PhysicsBody; cdecl;
  DecodeDataBase64: function(data: PByte; outputLength: PInteger): PByte; cdecl;
  DecompressData: function(compData: PByte; compDataLength: Integer; dataLength: PInteger): PByte; cdecl;
  DestroyBiStack: procedure(destack: PBiStack); cdecl;
  DestroyMemPool: procedure(mempool: PMemPool); cdecl;
  DestroyObjPool: procedure(objpool: PObjPool); cdecl;
  DestroyPhysicsBody: procedure(body: PhysicsBody); cdecl;
  DirectoryExists: function(const dirPath: PUTF8Char): bool; cdecl;
  DisableCursor: procedure(); cdecl;
  DrawBillboard: procedure(camera: Camera; texture: Texture2D; position: Vector3; size: Single; tint: Color); cdecl;
  DrawBillboardPro: procedure(camera: Camera; texture: Texture2D; source: Rectangle; position: Vector3; up: Vector3; size: Vector2; origin: Vector2; rotation: Single; tint: Color); cdecl;
  DrawBillboardRec: procedure(camera: Camera; texture: Texture2D; source: Rectangle; position: Vector3; size: Vector2; tint: Color); cdecl;
  DrawBoundingBox: procedure(box: BoundingBox; color: Color); cdecl;
  DrawCircle: procedure(centerX: Integer; centerY: Integer; radius: Single; color: Color); cdecl;
  DrawCircle3D: procedure(center: Vector3; radius: Single; rotationAxis: Vector3; rotationAngle: Single; color: Color); cdecl;
  DrawCircleGradient: procedure(centerX: Integer; centerY: Integer; radius: Single; color1: Color; color2: Color); cdecl;
  DrawCircleLines: procedure(centerX: Integer; centerY: Integer; radius: Single; color: Color); cdecl;
  DrawCircleSector: procedure(center: Vector2; radius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawCircleSectorLines: procedure(center: Vector2; radius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawCircleV: procedure(center: Vector2; radius: Single; color: Color); cdecl;
  DrawCube: procedure(position: Vector3; width: Single; height: Single; length: Single; color: Color); cdecl;
  DrawCubeTexture: procedure(texture: Texture2D; position: Vector3; width: Single; height: Single; length: Single; color: Color); cdecl;
  DrawCubeTextureRec: procedure(texture: Texture2D; source: Rectangle; position: Vector3; width: Single; height: Single; length: Single; color: Color); cdecl;
  DrawCubeV: procedure(position: Vector3; size: Vector3; color: Color); cdecl;
  DrawCubeWires: procedure(position: Vector3; width: Single; height: Single; length: Single; color: Color); cdecl;
  DrawCubeWiresV: procedure(position: Vector3; size: Vector3; color: Color); cdecl;
  DrawCylinder: procedure(position: Vector3; radiusTop: Single; radiusBottom: Single; height: Single; slices: Integer; color: Color); cdecl;
  DrawCylinderEx: procedure(startPos: Vector3; endPos: Vector3; startRadius: Single; endRadius: Single; sides: Integer; color: Color); cdecl;
  DrawCylinderWires: procedure(position: Vector3; radiusTop: Single; radiusBottom: Single; height: Single; slices: Integer; color: Color); cdecl;
  DrawCylinderWiresEx: procedure(startPos: Vector3; endPos: Vector3; startRadius: Single; endRadius: Single; sides: Integer; color: Color); cdecl;
  DrawEllipse: procedure(centerX: Integer; centerY: Integer; radiusH: Single; radiusV: Single; color: Color); cdecl;
  DrawEllipseLines: procedure(centerX: Integer; centerY: Integer; radiusH: Single; radiusV: Single; color: Color); cdecl;
  DrawFPS: procedure(posX: Integer; posY: Integer); cdecl;
  DrawGrid: procedure(slices: Integer; spacing: Single); cdecl;
  DrawLine: procedure(startPosX: Integer; startPosY: Integer; endPosX: Integer; endPosY: Integer; color: Color); cdecl;
  DrawLine3D: procedure(startPos: Vector3; endPos: Vector3; color: Color); cdecl;
  DrawLineBezier: procedure(startPos: Vector2; endPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineBezierCubic: procedure(startPos: Vector2; endPos: Vector2; startControlPos: Vector2; endControlPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineBezierQuad: procedure(startPos: Vector2; endPos: Vector2; controlPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineEx: procedure(startPos: Vector2; endPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineStrip: procedure(points: PVector2; pointCount: Integer; color: Color); cdecl;
  DrawLineV: procedure(startPos: Vector2; endPos: Vector2; color: Color); cdecl;
  DrawMesh: procedure(mesh: Mesh; material: Material; transform: Matrix); cdecl;
  DrawMeshInstanced: procedure(mesh: Mesh; material: Material; transforms: PMatrix; instances: Integer); cdecl;
  DrawModel: procedure(model: Model; position: Vector3; scale: Single; tint: Color); cdecl;
  DrawModelEx: procedure(model: Model; position: Vector3; rotationAxis: Vector3; rotationAngle: Single; scale: Vector3; tint: Color); cdecl;
  DrawModelWires: procedure(model: Model; position: Vector3; scale: Single; tint: Color); cdecl;
  DrawModelWiresEx: procedure(model: Model; position: Vector3; rotationAxis: Vector3; rotationAngle: Single; scale: Vector3; tint: Color); cdecl;
  DrawPixel: procedure(posX: Integer; posY: Integer; color: Color); cdecl;
  DrawPixelV: procedure(position: Vector2; color: Color); cdecl;
  DrawPlane: procedure(centerPos: Vector3; size: Vector2; color: Color); cdecl;
  DrawPoint3D: procedure(position: Vector3; color: Color); cdecl;
  DrawPoly: procedure(center: Vector2; sides: Integer; radius: Single; rotation: Single; color: Color); cdecl;
  DrawPolyLines: procedure(center: Vector2; sides: Integer; radius: Single; rotation: Single; color: Color); cdecl;
  DrawPolyLinesEx: procedure(center: Vector2; sides: Integer; radius: Single; rotation: Single; lineThick: Single; color: Color); cdecl;
  DrawRay: procedure(ray: Ray; color: Color); cdecl;
  DrawRectangle: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color: Color); cdecl;
  DrawRectangleGradientEx: procedure(rec: Rectangle; col1: Color; col2: Color; col3: Color; col4: Color); cdecl;
  DrawRectangleGradientH: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color1: Color; color2: Color); cdecl;
  DrawRectangleGradientV: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color1: Color; color2: Color); cdecl;
  DrawRectangleLines: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color: Color); cdecl;
  DrawRectangleLinesEx: procedure(rec: Rectangle; lineThick: Single; color: Color); cdecl;
  DrawRectanglePro: procedure(rec: Rectangle; origin: Vector2; rotation: Single; color: Color); cdecl;
  DrawRectangleRec: procedure(rec: Rectangle; color: Color); cdecl;
  DrawRectangleRounded: procedure(rec: Rectangle; roundness: Single; segments: Integer; color: Color); cdecl;
  DrawRectangleRoundedLines: procedure(rec: Rectangle; roundness: Single; segments: Integer; lineThick: Single; color: Color); cdecl;
  DrawRectangleV: procedure(position: Vector2; size: Vector2; color: Color); cdecl;
  DrawRing: procedure(center: Vector2; innerRadius: Single; outerRadius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawRingLines: procedure(center: Vector2; innerRadius: Single; outerRadius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawSphere: procedure(centerPos: Vector3; radius: Single; color: Color); cdecl;
  DrawSphereEx: procedure(centerPos: Vector3; radius: Single; rings: Integer; slices: Integer; color: Color); cdecl;
  DrawSphereWires: procedure(centerPos: Vector3; radius: Single; rings: Integer; slices: Integer; color: Color); cdecl;
  DrawText: procedure(const text: PUTF8Char; posX: Integer; posY: Integer; fontSize: Integer; color: Color); cdecl;
  DrawTextCodepoint: procedure(font: Font; codepoint: Integer; position: Vector2; fontSize: Single; tint: Color); cdecl;
  DrawTextEx: procedure(font: Font; const text: PUTF8Char; position: Vector2; fontSize: Single; spacing: Single; tint: Color); cdecl;
  DrawTextPro: procedure(font: Font; const text: PUTF8Char; position: Vector2; origin: Vector2; rotation: Single; fontSize: Single; spacing: Single; tint: Color); cdecl;
  DrawTexture: procedure(texture: Texture2D; posX: Integer; posY: Integer; tint: Color); cdecl;
  DrawTextureEx: procedure(texture: Texture2D; position: Vector2; rotation: Single; scale: Single; tint: Color); cdecl;
  DrawTextureNPatch: procedure(texture: Texture2D; nPatchInfo: NPatchInfo; dest: Rectangle; origin: Vector2; rotation: Single; tint: Color); cdecl;
  DrawTexturePoly: procedure(texture: Texture2D; center: Vector2; points: PVector2; texcoords: PVector2; pointCount: Integer; tint: Color); cdecl;
  DrawTexturePro: procedure(texture: Texture2D; source: Rectangle; dest: Rectangle; origin: Vector2; rotation: Single; tint: Color); cdecl;
  DrawTextureQuad: procedure(texture: Texture2D; tiling: Vector2; offset: Vector2; quad: Rectangle; tint: Color); cdecl;
  DrawTextureRec: procedure(texture: Texture2D; source: Rectangle; position: Vector2; tint: Color); cdecl;
  DrawTextureTiled: procedure(texture: Texture2D; source: Rectangle; dest: Rectangle; origin: Vector2; rotation: Single; scale: Single; tint: Color); cdecl;
  DrawTextureV: procedure(texture: Texture2D; position: Vector2; tint: Color); cdecl;
  DrawTriangle: procedure(v1: Vector2; v2: Vector2; v3: Vector2; color: Color); cdecl;
  DrawTriangle3D: procedure(v1: Vector3; v2: Vector3; v3: Vector3; color: Color); cdecl;
  DrawTriangleFan: procedure(points: PVector2; pointCount: Integer; color: Color); cdecl;
  DrawTriangleLines: procedure(v1: Vector2; v2: Vector2; v3: Vector2; color: Color); cdecl;
  DrawTriangleStrip: procedure(points: PVector2; pointCount: Integer; color: Color); cdecl;
  DrawTriangleStrip3D: procedure(points: PVector3; pointCount: Integer; color: Color); cdecl;
  EnableCursor: procedure(); cdecl;
  EncodeDataBase64: function(const data: PByte; dataLength: Integer; outputLength: PInteger): PUTF8Char; cdecl;
  EndBlendMode: procedure(); cdecl;
  EndDrawing: procedure(); cdecl;
  EndMode2D: procedure(); cdecl;
  EndMode3D: procedure(); cdecl;
  EndScissorMode: procedure(); cdecl;
  EndShaderMode: procedure(); cdecl;
  EndTextureMode: procedure(); cdecl;
  EndVrStereoMode: procedure(); cdecl;
  ExportImage: function(image: Image; const fileName: PUTF8Char): bool; cdecl;
  ExportImageAsCode: function(image: Image; const fileName: PUTF8Char): bool; cdecl;
  ExportMesh: function(mesh: Mesh; const fileName: PUTF8Char): bool; cdecl;
  ExportWave: function(wave: Wave; const fileName: PUTF8Char): bool; cdecl;
  ExportWaveAsCode: function(wave: Wave; const fileName: PUTF8Char): bool; cdecl;
  Fade: function(color: Color; alpha: Single): Color; cdecl;
  FileExists: function(const fileName: PUTF8Char): bool; cdecl;
  GenImageCellular: function(width: Integer; height: Integer; tileSize: Integer): Image; cdecl;
  GenImageChecked: function(width: Integer; height: Integer; checksX: Integer; checksY: Integer; col1: Color; col2: Color): Image; cdecl;
  GenImageColor: function(width: Integer; height: Integer; color: Color): Image; cdecl;
  GenImageFontAtlas: function(const chars: PGlyphInfo; recs: PPRectangle; glyphCount: Integer; fontSize: Integer; padding: Integer; packMethod: Integer): Image; cdecl;
  GenImageGradientH: function(width: Integer; height: Integer; left: Color; right: Color): Image; cdecl;
  GenImageGradientRadial: function(width: Integer; height: Integer; density: Single; inner: Color; outer: Color): Image; cdecl;
  GenImageGradientV: function(width: Integer; height: Integer; top: Color; bottom: Color): Image; cdecl;
  GenImageWhiteNoise: function(width: Integer; height: Integer; factor: Single): Image; cdecl;
  GenMeshBinormals: procedure(mesh: PMesh); cdecl;
  GenMeshCone: function(radius: Single; height: Single; slices: Integer): Mesh; cdecl;
  GenMeshCube: function(width: Single; height: Single; length: Single): Mesh; cdecl;
  GenMeshCubicmap: function(cubicmap: Image; cubeSize: Vector3): Mesh; cdecl;
  GenMeshCylinder: function(radius: Single; height: Single; slices: Integer): Mesh; cdecl;
  GenMeshHeightmap: function(heightmap: Image; size: Vector3): Mesh; cdecl;
  GenMeshHemiSphere: function(radius: Single; rings: Integer; slices: Integer): Mesh; cdecl;
  GenMeshKnot: function(radius: Single; size: Single; radSeg: Integer; sides: Integer): Mesh; cdecl;
  GenMeshPlane: function(width: Single; length: Single; resX: Integer; resZ: Integer): Mesh; cdecl;
  GenMeshPoly: function(sides: Integer; radius: Single): Mesh; cdecl;
  GenMeshSphere: function(radius: Single; rings: Integer; slices: Integer): Mesh; cdecl;
  GenMeshTangents: procedure(mesh: PMesh); cdecl;
  GenMeshTorus: function(radius: Single; size: Single; radSeg: Integer; sides: Integer): Mesh; cdecl;
  GenTextureMipmaps: procedure(texture: PTexture2D); cdecl;
  GetCameraMatrix: function(camera: Camera): Matrix; cdecl;
  GetCameraMatrix2D: function(camera: Camera2D): Matrix; cdecl;
  GetCharPressed: function(): Integer; cdecl;
  GetClipboardText: function(): PUTF8Char; cdecl;
  GetCodepoint: function(const text: PUTF8Char; bytesProcessed: PInteger): Integer; cdecl;
  GetCodepointCount: function(const text: PUTF8Char): Integer; cdecl;
  GetCollisionRec: function(rec1: Rectangle; rec2: Rectangle): Rectangle; cdecl;
  GetColor: function(hexValue: Cardinal): Color; cdecl;
  GetCurrentMonitor: function(): Integer; cdecl;
  GetDirectoryFiles: function(const dirPath: PUTF8Char; count: PInteger): PPUTF8Char; cdecl;
  GetDirectoryPath: function(const filePath: PUTF8Char): PUTF8Char; cdecl;
  GetDroppedFiles: function(count: PInteger): PPUTF8Char; cdecl;
  GetFileExtension: function(const fileName: PUTF8Char): PUTF8Char; cdecl;
  GetFileModTime: function(const fileName: PUTF8Char): Integer; cdecl;
  GetFileName: function(const filePath: PUTF8Char): PUTF8Char; cdecl;
  GetFileNameWithoutExt: function(const filePath: PUTF8Char): PUTF8Char; cdecl;
  GetFontDefault: function(): Font; cdecl;
  GetFPS: function(): Integer; cdecl;
  GetFrameTime: function(): Single; cdecl;
  GetGamepadAxisCount: function(gamepad: Integer): Integer; cdecl;
  GetGamepadAxisMovement: function(gamepad: Integer; axis: Integer): Single; cdecl;
  GetGamepadButtonPressed: function(): Integer; cdecl;
  GetGamepadName: function(gamepad: Integer): PUTF8Char; cdecl;
  GetGestureDetected: function(): Integer; cdecl;
  GetGestureDragAngle: function(): Single; cdecl;
  GetGestureDragVector: function(): Vector2; cdecl;
  GetGestureHoldDuration: function(): Single; cdecl;
  GetGesturePinchAngle: function(): Single; cdecl;
  GetGesturePinchVector: function(): Vector2; cdecl;
  GetGlyphAtlasRec: function(font: Font; codepoint: Integer): Rectangle; cdecl;
  GetGlyphIndex: function(font: Font; codepoint: Integer): Integer; cdecl;
  GetGlyphInfo: function(font: Font; codepoint: Integer): GlyphInfo; cdecl;
  GetImageAlphaBorder: function(image: Image; threshold: Single): Rectangle; cdecl;
  GetImageColor: function(image: Image; x: Integer; y: Integer): Color; cdecl;
  GetKeyPressed: function(): Integer; cdecl;
  GetMemPoolFreeMemory: function(const mempool: MemPool): NativeUInt; cdecl;
  GetMeshBoundingBox: function(mesh: Mesh): BoundingBox; cdecl;
  GetModelBoundingBox: function(model: Model): BoundingBox; cdecl;
  GetMonitorCount: function(): Integer; cdecl;
  GetMonitorHeight: function(monitor: Integer): Integer; cdecl;
  GetMonitorName: function(monitor: Integer): PUTF8Char; cdecl;
  GetMonitorPhysicalHeight: function(monitor: Integer): Integer; cdecl;
  GetMonitorPhysicalWidth: function(monitor: Integer): Integer; cdecl;
  GetMonitorPosition: function(monitor: Integer): Vector2; cdecl;
  GetMonitorRefreshRate: function(monitor: Integer): Integer; cdecl;
  GetMonitorWidth: function(monitor: Integer): Integer; cdecl;
  GetMouseDelta: function(): Vector2; cdecl;
  GetMousePosition: function(): Vector2; cdecl;
  GetMouseRay: function(mousePosition: Vector2; camera: Camera): Ray; cdecl;
  GetMouseWheelMove: function(): Single; cdecl;
  GetMouseX: function(): Integer; cdecl;
  GetMouseY: function(): Integer; cdecl;
  GetMusicTimeLength: function(music: Music): Single; cdecl;
  GetMusicTimePlayed: function(music: Music): Single; cdecl;
  GetPhysicsBodiesCount: function(): Integer; cdecl;
  GetPhysicsBody: function(index: Integer): PhysicsBody; cdecl;
  GetPhysicsShapeType: function(index: Integer): Integer; cdecl;
  GetPhysicsShapeVertex: function(body: PhysicsBody; vertex: Integer): Vector2; cdecl;
  GetPhysicsShapeVerticesCount: function(index: Integer): Integer; cdecl;
  GetPixelColor: function(srcPtr: Pointer; format: Integer): Color; cdecl;
  GetPixelDataSize: function(width: Integer; height: Integer; format: Integer): Integer; cdecl;
  GetPrevDirectoryPath: function(const dirPath: PUTF8Char): PUTF8Char; cdecl;
  GetRandomValue: function(min: Integer; max: Integer): Integer; cdecl;
  GetRayCollisionBox: function(ray: Ray; box: BoundingBox): RayCollision; cdecl;
  GetRayCollisionMesh: function(ray: Ray; mesh: Mesh; transform: Matrix): RayCollision; cdecl;
  GetRayCollisionModel: function(ray: Ray; model: Model): RayCollision; cdecl;
  GetRayCollisionQuad: function(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3; p4: Vector3): RayCollision; cdecl;
  GetRayCollisionSphere: function(ray: Ray; center: Vector3; radius: Single): RayCollision; cdecl;
  GetRayCollisionTriangle: function(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3): RayCollision; cdecl;
  GetRenderHeight: function(): Integer; cdecl;
  GetRenderWidth: function(): Integer; cdecl;
  GetScreenHeight: function(): Integer; cdecl;
  GetScreenToWorld2D: function(position: Vector2; camera: Camera2D): Vector2; cdecl;
  GetScreenWidth: function(): Integer; cdecl;
  GetShaderLocation: function(shader: Shader; const uniformName: PUTF8Char): Integer; cdecl;
  GetShaderLocationAttrib: function(shader: Shader; const attribName: PUTF8Char): Integer; cdecl;
  GetSoundsPlaying: function(): Integer; cdecl;
  GetTime: function(): Double; cdecl;
  GetTouchPointCount: function(): Integer; cdecl;
  GetTouchPointId: function(index: Integer): Integer; cdecl;
  GetTouchPosition: function(index: Integer): Vector2; cdecl;
  GetTouchX: function(): Integer; cdecl;
  GetTouchY: function(): Integer; cdecl;
  GetWindowHandle: function(): Pointer; cdecl;
  GetWindowPosition: function(): Vector2; cdecl;
  GetWindowScaleDPI: function(): Vector2; cdecl;
  GetWorkingDirectory: function(): PUTF8Char; cdecl;
  GetWorldToScreen: function(position: Vector3; camera: Camera): Vector2; cdecl;
  GetWorldToScreen2D: function(position: Vector2; camera: Camera2D): Vector2; cdecl;
  GetWorldToScreenEx: function(position: Vector3; camera: Camera; width: Integer; height: Integer): Vector2; cdecl;
  GuiButton: function(bounds: Rectangle; const text: PUTF8Char): bool; cdecl;
  GuiCheckBox: function(bounds: Rectangle; const text: PUTF8Char; checked: bool): bool; cdecl;
  GuiCheckIconPixel: function(iconId: Integer; x: Integer; y: Integer): bool; cdecl;
  GuiClearIconPixel: procedure(iconId: Integer; x: Integer; y: Integer); cdecl;
  GuiColorBarAlpha: function(bounds: Rectangle; alpha: Single): Single; cdecl;
  GuiColorBarHue: function(bounds: Rectangle; value: Single): Single; cdecl;
  GuiColorPanel: function(bounds: Rectangle; color: Color): Color; cdecl;
  GuiColorPicker: function(bounds: Rectangle; color: Color): Color; cdecl;
  GuiComboBox: function(bounds: Rectangle; const text: PUTF8Char; active: Integer): Integer; cdecl;
  GuiDisable: procedure(); cdecl;
  GuiDrawIcon: procedure(iconId: Integer; posX: Integer; posY: Integer; pixelSize: Integer; color: Color); cdecl;
  GuiDropdownBox: function(bounds: Rectangle; const text: PUTF8Char; active: PInteger; editMode: bool): bool; cdecl;
  GuiDummyRec: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiEnable: procedure(); cdecl;
  GuiFade: procedure(alpha: Single); cdecl;
  GuiGetFont: function(): Font; cdecl;
  GuiGetIconData: function(iconId: Integer): PCardinal; cdecl;
  GuiGetIcons: function(): PCardinal; cdecl;
  GuiGetState: function(): Integer; cdecl;
  GuiGetStyle: function(control: Integer; _property: Integer): Integer; cdecl;
  GuiGrid: function(bounds: Rectangle; spacing: Single; subdivs: Integer): Vector2; cdecl;
  GuiGroupBox: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiIconText: function(iconId: Integer; const text: PUTF8Char): PUTF8Char; cdecl;
  GuiIsLocked: function(): bool; cdecl;
  GuiLabel: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiLabelButton: function(bounds: Rectangle; const text: PUTF8Char): bool; cdecl;
  GuiLine: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiListView: function(bounds: Rectangle; const text: PUTF8Char; scrollIndex: PInteger; active: Integer): Integer; cdecl;
  GuiListViewEx: function(bounds: Rectangle; text: PPUTF8Char; count: Integer; focus: PInteger; scrollIndex: PInteger; active: Integer): Integer; cdecl;
  GuiLoadStyle: procedure(const fileName: PUTF8Char); cdecl;
  GuiLoadStyleDefault: procedure(); cdecl;
  GuiLock: procedure(); cdecl;
  GuiMessageBox: function(bounds: Rectangle; const title: PUTF8Char; const _message: PUTF8Char; const buttons: PUTF8Char): Integer; cdecl;
  GuiPanel: procedure(bounds: Rectangle); cdecl;
  GuiProgressBar: function(bounds: Rectangle; const textLeft: PUTF8Char; const textRight: PUTF8Char; value: Single; minValue: Single; maxValue: Single): Single; cdecl;
  GuiScrollBar: function(bounds: Rectangle; value: Integer; minValue: Integer; maxValue: Integer): Integer; cdecl;
  GuiScrollPanel: function(bounds: Rectangle; content: Rectangle; scroll: PVector2): Rectangle; cdecl;
  GuiSetFont: procedure(font: Font); cdecl;
  GuiSetIconData: procedure(iconId: Integer; data: PCardinal); cdecl;
  GuiSetIconPixel: procedure(iconId: Integer; x: Integer; y: Integer); cdecl;
  GuiSetState: procedure(state: Integer); cdecl;
  GuiSetStyle: procedure(control: Integer; _property: Integer; value: Integer); cdecl;
  GuiSlider: function(bounds: Rectangle; const textLeft: PUTF8Char; const textRight: PUTF8Char; value: Single; minValue: Single; maxValue: Single): Single; cdecl;
  GuiSliderBar: function(bounds: Rectangle; const textLeft: PUTF8Char; const textRight: PUTF8Char; value: Single; minValue: Single; maxValue: Single): Single; cdecl;
  GuiSpinner: function(bounds: Rectangle; const text: PUTF8Char; value: PInteger; minValue: Integer; maxValue: Integer; editMode: bool): bool; cdecl;
  GuiStatusBar: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiTextBox: function(bounds: Rectangle; text: PUTF8Char; textSize: Integer; editMode: bool): bool; cdecl;
  GuiTextBoxMulti: function(bounds: Rectangle; text: PUTF8Char; textSize: Integer; editMode: bool): bool; cdecl;
  GuiTextInputBox: function(bounds: Rectangle; const title: PUTF8Char; const _message: PUTF8Char; const buttons: PUTF8Char; text: PUTF8Char): Integer; cdecl;
  GuiToggle: function(bounds: Rectangle; const text: PUTF8Char; active: bool): bool; cdecl;
  GuiToggleGroup: function(bounds: Rectangle; const text: PUTF8Char; active: Integer): Integer; cdecl;
  GuiUnlock: procedure(); cdecl;
  GuiValueBox: function(bounds: Rectangle; const text: PUTF8Char; value: PInteger; minValue: Integer; maxValue: Integer; editMode: bool): bool; cdecl;
  GuiWindowBox: function(bounds: Rectangle; const title: PUTF8Char): bool; cdecl;
  HideCursor: procedure(); cdecl;
  ImageAlphaClear: procedure(image: PImage; color: Color; threshold: Single); cdecl;
  ImageAlphaCrop: procedure(image: PImage; threshold: Single); cdecl;
  ImageAlphaMask: procedure(image: PImage; alphaMask: Image); cdecl;
  ImageAlphaPremultiply: procedure(image: PImage); cdecl;
  ImageClearBackground: procedure(dst: PImage; color: Color); cdecl;
  ImageColorBrightness: procedure(image: PImage; brightness: Integer); cdecl;
  ImageColorContrast: procedure(image: PImage; contrast: Single); cdecl;
  ImageColorGrayscale: procedure(image: PImage); cdecl;
  ImageColorInvert: procedure(image: PImage); cdecl;
  ImageColorReplace: procedure(image: PImage; color: Color; replace: Color); cdecl;
  ImageColorTint: procedure(image: PImage; color: Color); cdecl;
  ImageCopy: function(image: Image): Image; cdecl;
  ImageCrop: procedure(image: PImage; crop: Rectangle); cdecl;
  ImageDither: procedure(image: PImage; rBpp: Integer; gBpp: Integer; bBpp: Integer; aBpp: Integer); cdecl;
  ImageDraw: procedure(dst: PImage; src: Image; srcRec: Rectangle; dstRec: Rectangle; tint: Color); cdecl;
  ImageDrawCircle: procedure(dst: PImage; centerX: Integer; centerY: Integer; radius: Integer; color: Color); cdecl;
  ImageDrawCircleV: procedure(dst: PImage; center: Vector2; radius: Integer; color: Color); cdecl;
  ImageDrawLine: procedure(dst: PImage; startPosX: Integer; startPosY: Integer; endPosX: Integer; endPosY: Integer; color: Color); cdecl;
  ImageDrawLineV: procedure(dst: PImage; start: Vector2; _end: Vector2; color: Color); cdecl;
  ImageDrawPixel: procedure(dst: PImage; posX: Integer; posY: Integer; color: Color); cdecl;
  ImageDrawPixelV: procedure(dst: PImage; position: Vector2; color: Color); cdecl;
  ImageDrawRectangle: procedure(dst: PImage; posX: Integer; posY: Integer; width: Integer; height: Integer; color: Color); cdecl;
  ImageDrawRectangleLines: procedure(dst: PImage; rec: Rectangle; thick: Integer; color: Color); cdecl;
  ImageDrawRectangleRec: procedure(dst: PImage; rec: Rectangle; color: Color); cdecl;
  ImageDrawRectangleV: procedure(dst: PImage; position: Vector2; size: Vector2; color: Color); cdecl;
  ImageDrawText: procedure(dst: PImage; const text: PUTF8Char; posX: Integer; posY: Integer; fontSize: Integer; color: Color); cdecl;
  ImageDrawTextEx: procedure(dst: PImage; font: Font; const text: PUTF8Char; position: Vector2; fontSize: Single; spacing: Single; tint: Color); cdecl;
  ImageFlipHorizontal: procedure(image: PImage); cdecl;
  ImageFlipVertical: procedure(image: PImage); cdecl;
  ImageFormat: procedure(image: PImage; newFormat: Integer); cdecl;
  ImageFromImage: function(image: Image; rec: Rectangle): Image; cdecl;
  ImageMipmaps: procedure(image: PImage); cdecl;
  ImageResize: procedure(image: PImage; newWidth: Integer; newHeight: Integer); cdecl;
  ImageResizeCanvas: procedure(image: PImage; newWidth: Integer; newHeight: Integer; offsetX: Integer; offsetY: Integer; fill: Color); cdecl;
  ImageResizeNN: procedure(image: PImage; newWidth: Integer; newHeight: Integer); cdecl;
  ImageRotateCCW: procedure(image: PImage); cdecl;
  ImageRotateCW: procedure(image: PImage); cdecl;
  ImageText: function(const text: PUTF8Char; fontSize: Integer; color: Color): Image; cdecl;
  ImageTextEx: function(font: Font; const text: PUTF8Char; fontSize: Single; spacing: Single; tint: Color): Image; cdecl;
  ImageToPOT: procedure(image: PImage; fill: Color); cdecl;
  InitAudioDevice: procedure(); cdecl;
  InitPhysics: procedure(); cdecl;
  InitWindow: procedure(width: Integer; height: Integer; const title: PUTF8Char); cdecl;
  IsAudioDeviceReady: function(): bool; cdecl;
  IsAudioStreamPlaying: function(stream: AudioStream): bool; cdecl;
  IsAudioStreamProcessed: function(stream: AudioStream): bool; cdecl;
  IsCursorHidden: function(): bool; cdecl;
  IsCursorOnScreen: function(): bool; cdecl;
  IsFileDropped: function(): bool; cdecl;
  IsFileExtension: function(const fileName: PUTF8Char; const ext: PUTF8Char): bool; cdecl;
  IsGamepadAvailable: function(gamepad: Integer): bool; cdecl;
  IsGamepadButtonDown: function(gamepad: Integer; button: Integer): bool; cdecl;
  IsGamepadButtonPressed: function(gamepad: Integer; button: Integer): bool; cdecl;
  IsGamepadButtonReleased: function(gamepad: Integer; button: Integer): bool; cdecl;
  IsGamepadButtonUp: function(gamepad: Integer; button: Integer): bool; cdecl;
  IsGestureDetected: function(gesture: Integer): bool; cdecl;
  IsKeyDown: function(key: Integer): bool; cdecl;
  IsKeyPressed: function(key: Integer): bool; cdecl;
  IsKeyReleased: function(key: Integer): bool; cdecl;
  IsKeyUp: function(key: Integer): bool; cdecl;
  IsModelAnimationValid: function(model: Model; anim: ModelAnimation): bool; cdecl;
  IsMouseButtonDown: function(button: Integer): bool; cdecl;
  IsMouseButtonPressed: function(button: Integer): bool; cdecl;
  IsMouseButtonReleased: function(button: Integer): bool; cdecl;
  IsMouseButtonUp: function(button: Integer): bool; cdecl;
  IsMusicStreamPlaying: function(music: Music): bool; cdecl;
  IsSoundPlaying: function(sound: Sound): bool; cdecl;
  IsWindowFocused: function(): bool; cdecl;
  IsWindowFullscreen: function(): bool; cdecl;
  IsWindowHidden: function(): bool; cdecl;
  IsWindowMaximized: function(): bool; cdecl;
  IsWindowMinimized: function(): bool; cdecl;
  IsWindowReady: function(): bool; cdecl;
  IsWindowResized: function(): bool; cdecl;
  IsWindowState: function(flag: Cardinal): bool; cdecl;
  LoadAudioStream: function(sampleRate: Cardinal; sampleSize: Cardinal; channels: Cardinal): AudioStream; cdecl;
  LoadCodepoints: function(const text: PUTF8Char; count: PInteger): PInteger; cdecl;
  LoadFileData: function(const fileName: PUTF8Char; bytesRead: PCardinal): PByte; cdecl;
  LoadFileText: function(const fileName: PUTF8Char): PUTF8Char; cdecl;
  LoadFont: function(const fileName: PUTF8Char): Font; cdecl;
  LoadFontData: function(const fileData: PByte; dataSize: Integer; fontSize: Integer; fontChars: PInteger; glyphCount: Integer; _type: Integer): PGlyphInfo; cdecl;
  LoadFontEx: function(const fileName: PUTF8Char; fontSize: Integer; fontChars: PInteger; glyphCount: Integer): Font; cdecl;
  LoadFontFromImage: function(image: Image; key: Color; firstChar: Integer): Font; cdecl;
  LoadFontFromMemory: function(const fileType: PUTF8Char; const fileData: PByte; dataSize: Integer; fontSize: Integer; fontChars: PInteger; glyphCount: Integer): Font; cdecl;
  LoadImage: function(const fileName: PUTF8Char): Image; cdecl;
  LoadImageAnim: function(const fileName: PUTF8Char; frames: PInteger): Image; cdecl;
  LoadImageColors: function(image: Image): PColor; cdecl;
  LoadImageFromMemory: function(const fileType: PUTF8Char; const fileData: PByte; dataSize: Integer): Image; cdecl;
  LoadImageFromScreen: function(): Image; cdecl;
  LoadImageFromTexture: function(texture: Texture2D): Image; cdecl;
  LoadImagePalette: function(image: Image; maxPaletteSize: Integer; colorCount: PInteger): PColor; cdecl;
  LoadImageRaw: function(const fileName: PUTF8Char; width: Integer; height: Integer; format: Integer; headerSize: Integer): Image; cdecl;
  LoadMaterialDefault: function(): Material; cdecl;
  LoadMaterials: function(const fileName: PUTF8Char; materialCount: PInteger): PMaterial; cdecl;
  LoadModel: function(const fileName: PUTF8Char): Model; cdecl;
  LoadModelAnimations: function(const fileName: PUTF8Char; animCount: PCardinal): PModelAnimation; cdecl;
  LoadModelFromMesh: function(mesh: Mesh): Model; cdecl;
  LoadMusicStream: function(const fileName: PUTF8Char): Music; cdecl;
  LoadMusicStreamFromMemory: function(const fileType: PUTF8Char; data: PByte; dataSize: Integer): Music; cdecl;
  LoadRenderTexture: function(width: Integer; height: Integer): RenderTexture2D; cdecl;
  LoadShader: function(const vsFileName: PUTF8Char; const fsFileName: PUTF8Char): Shader; cdecl;
  LoadShaderFromMemory: function(const vsCode: PUTF8Char; const fsCode: PUTF8Char): Shader; cdecl;
  LoadSound: function(const fileName: PUTF8Char): Sound; cdecl;
  LoadSoundFromWave: function(wave: Wave): Sound; cdecl;
  LoadStorageValue: function(position: Cardinal): Integer; cdecl;
  LoadTexture: function(const fileName: PUTF8Char): Texture2D; cdecl;
  LoadTextureCubemap: function(image: Image; layout: Integer): TextureCubemap; cdecl;
  LoadTextureFromImage: function(image: Image): Texture2D; cdecl;
  LoadVrStereoConfig: function(device: VrDeviceInfo): VrStereoConfig; cdecl;
  LoadWave: function(const fileName: PUTF8Char): Wave; cdecl;
  LoadWaveFromMemory: function(const fileType: PUTF8Char; const fileData: PByte; dataSize: Integer): Wave; cdecl;
  LoadWaveSamples: function(wave: Wave): PSingle; cdecl;
  MaximizeWindow: procedure(); cdecl;
  MeasureText: function(const text: PUTF8Char; fontSize: Integer): Integer; cdecl;
  MeasureTextEx: function(font: Font; const text: PUTF8Char; fontSize: Single; spacing: Single): Vector2; cdecl;
  MemAlloc: function(size: Integer): Pointer; cdecl;
  MemFree: procedure(ptr: Pointer); cdecl;
  MemPoolAlloc: function(mempool: PMemPool; bytes: NativeUInt): Pointer; cdecl;
  MemPoolCleanUp: procedure(mempool: PMemPool; ptrref: PPointer); cdecl;
  MemPoolFree: procedure(mempool: PMemPool; ptr: Pointer); cdecl;
  MemPoolRealloc: function(mempool: PMemPool; ptr: Pointer; bytes: NativeUInt): Pointer; cdecl;
  MemPoolReset: procedure(mempool: PMemPool); cdecl;
  MemRealloc: function(ptr: Pointer; size: Integer): Pointer; cdecl;
  MinimizeWindow: procedure(); cdecl;
  ObjPoolAlloc: function(objpool: PObjPool): Pointer; cdecl;
  ObjPoolCleanUp: procedure(objpool: PObjPool; ptrref: PPointer); cdecl;
  ObjPoolFree: procedure(objpool: PObjPool; ptr: Pointer); cdecl;
  OpenURL: procedure(const url: PUTF8Char); cdecl;
  PauseAudioStream: procedure(stream: AudioStream); cdecl;
  PauseMusicStream: procedure(music: Music); cdecl;
  PauseSound: procedure(sound: Sound); cdecl;
  PhysicsAddForce: procedure(body: PhysicsBody; force: Vector2); cdecl;
  PhysicsAddTorque: procedure(body: PhysicsBody; amount: Single); cdecl;
  PhysicsShatter: procedure(body: PhysicsBody; position: Vector2; force: Single); cdecl;
  PlayAudioStream: procedure(stream: AudioStream); cdecl;
  PlayMusicStream: procedure(music: Music); cdecl;
  PlaySound: procedure(sound: Sound); cdecl;
  PlaySoundMulti: procedure(sound: Sound); cdecl;
  PollInputEvents: procedure(); cdecl;
  ResetPhysics: procedure(); cdecl;
  RestoreWindow: procedure(); cdecl;
  ResumeAudioStream: procedure(stream: AudioStream); cdecl;
  ResumeMusicStream: procedure(music: Music); cdecl;
  ResumeSound: procedure(sound: Sound); cdecl;
  SaveFileData: function(const fileName: PUTF8Char; data: Pointer; bytesToWrite: Cardinal): bool; cdecl;
  SaveFileText: function(const fileName: PUTF8Char; text: PUTF8Char): bool; cdecl;
  SaveStorageValue: function(position: Cardinal; value: Integer): bool; cdecl;
  SeekMusicStream: procedure(music: Music; position: Single); cdecl;
  SetAudioStreamBufferSizeDefault: procedure(size: Integer); cdecl;
  SetAudioStreamPitch: procedure(stream: AudioStream; pitch: Single); cdecl;
  SetAudioStreamVolume: procedure(stream: AudioStream; volume: Single); cdecl;
  SetCameraAltControl: procedure(keyAlt: Integer); cdecl;
  SetCameraMode: procedure(camera: Camera; mode: Integer); cdecl;
  SetCameraMoveControls: procedure(keyFront: Integer; keyBack: Integer; keyRight: Integer; keyLeft: Integer; keyUp: Integer; keyDown: Integer); cdecl;
  SetCameraPanControl: procedure(keyPan: Integer); cdecl;
  SetCameraSmoothZoomControl: procedure(keySmoothZoom: Integer); cdecl;
  SetClipboardText: procedure(const text: PUTF8Char); cdecl;
  SetConfigFlags: procedure(flags: Cardinal); cdecl;
  SetExitKey: procedure(key: Integer); cdecl;
  SetGamepadMappings: function(const mappings: PUTF8Char): Integer; cdecl;
  SetGesturesEnabled: procedure(flags: Cardinal); cdecl;
  SetLoadFileDataCallback: procedure(callback: LoadFileDataCallback); cdecl;
  SetLoadFileTextCallback: procedure(callback: LoadFileTextCallback); cdecl;
  SetMasterVolume: procedure(volume: Single); cdecl;
  SetMaterialTexture: procedure(material: PMaterial; mapType: Integer; texture: Texture2D); cdecl;
  SetModelMeshMaterial: procedure(model: PModel; meshId: Integer; materialId: Integer); cdecl;
  SetMouseCursor: procedure(cursor: Integer); cdecl;
  SetMouseOffset: procedure(offsetX: Integer; offsetY: Integer); cdecl;
  SetMousePosition: procedure(x: Integer; y: Integer); cdecl;
  SetMouseScale: procedure(scaleX: Single; scaleY: Single); cdecl;
  SetMusicPitch: procedure(music: Music; pitch: Single); cdecl;
  SetMusicVolume: procedure(music: Music; volume: Single); cdecl;
  SetPhysicsBodyRotation: procedure(body: PhysicsBody; radians: Single); cdecl;
  SetPhysicsGravity: procedure(x: Single; y: Single); cdecl;
  SetPhysicsTimeStep: procedure(delta: Double); cdecl;
  SetPixelColor: procedure(dstPtr: Pointer; color: Color; format: Integer); cdecl;
  SetRandomSeed: procedure(seed: Cardinal); cdecl;
  SetSaveFileDataCallback: procedure(callback: SaveFileDataCallback); cdecl;
  SetSaveFileTextCallback: procedure(callback: SaveFileTextCallback); cdecl;
  SetShaderValue: procedure(shader: Shader; locIndex: Integer; const value: Pointer; uniformType: Integer); cdecl;
  SetShaderValueMatrix: procedure(shader: Shader; locIndex: Integer; mat: Matrix); cdecl;
  SetShaderValueTexture: procedure(shader: Shader; locIndex: Integer; texture: Texture2D); cdecl;
  SetShaderValueV: procedure(shader: Shader; locIndex: Integer; const value: Pointer; uniformType: Integer; count: Integer); cdecl;
  SetShapesTexture: procedure(texture: Texture2D; source: Rectangle); cdecl;
  SetSoundPitch: procedure(sound: Sound; pitch: Single); cdecl;
  SetSoundVolume: procedure(sound: Sound; volume: Single); cdecl;
  SetTargetFPS: procedure(fps: Integer); cdecl;
  SetTextureFilter: procedure(texture: Texture2D; filter: Integer); cdecl;
  SetTextureWrap: procedure(texture: Texture2D; wrap: Integer); cdecl;
  SetTraceLogCallback: procedure(callback: TraceLogCallback); cdecl;
  SetTraceLogLevel: procedure(logLevel: Integer); cdecl;
  SetWindowIcon: procedure(image: Image); cdecl;
  SetWindowMinSize: procedure(width: Integer; height: Integer); cdecl;
  SetWindowMonitor: procedure(monitor: Integer); cdecl;
  SetWindowOpacity: procedure(opacity: Single); cdecl;
  SetWindowPosition: procedure(x: Integer; y: Integer); cdecl;
  SetWindowSize: procedure(width: Integer; height: Integer); cdecl;
  SetWindowState: procedure(flags: Cardinal); cdecl;
  SetWindowTitle: procedure(const title: PUTF8Char); cdecl;
  ShowCursor: procedure(); cdecl;
  StopAudioStream: procedure(stream: AudioStream); cdecl;
  StopMusicStream: procedure(music: Music); cdecl;
  StopSound: procedure(sound: Sound); cdecl;
  StopSoundMulti: procedure(); cdecl;
  SwapScreenBuffer: procedure(); cdecl;
  TakeScreenshot: procedure(const fileName: PUTF8Char); cdecl;
  TextAppend: procedure(text: PUTF8Char; const append: PUTF8Char; position: PInteger); cdecl;
  TextCodepointsToUTF8: function(codepoints: PInteger; length: Integer): PUTF8Char; cdecl;
  TextCopy: function(dst: PUTF8Char; const src: PUTF8Char): Integer; cdecl;
  TextFindIndex: function(const text: PUTF8Char; const find: PUTF8Char): Integer; cdecl;
  TextFormat: function(const text: PUTF8Char): PUTF8Char varargs; cdecl;
  TextInsert: function(const text: PUTF8Char; const insert: PUTF8Char; position: Integer): PUTF8Char; cdecl;
  TextIsEqual: function(const text1: PUTF8Char; const text2: PUTF8Char): bool; cdecl;
  TextJoin: function(textList: PPUTF8Char; count: Integer; const delimiter: PUTF8Char): PUTF8Char; cdecl;
  TextLength: function(const text: PUTF8Char): Cardinal; cdecl;
  TextReplace: function(text: PUTF8Char; const replace: PUTF8Char; const by: PUTF8Char): PUTF8Char; cdecl;
  TextSplit: function(const text: PUTF8Char; delimiter: UTF8Char; count: PInteger): PPUTF8Char; cdecl;
  TextSubtext: function(const text: PUTF8Char; position: Integer; length: Integer): PUTF8Char; cdecl;
  TextToInteger: function(const text: PUTF8Char): Integer; cdecl;
  TextToLower: function(const text: PUTF8Char): PUTF8Char; cdecl;
  TextToPascal: function(const text: PUTF8Char): PUTF8Char; cdecl;
  TextToUpper: function(const text: PUTF8Char): PUTF8Char; cdecl;
  ToggleFullscreen: procedure(); cdecl;
  TraceLog: procedure(logLevel: Integer; const text: PUTF8Char) varargs; cdecl;
  UnloadAudioStream: procedure(stream: AudioStream); cdecl;
  UnloadCodepoints: procedure(codepoints: PInteger); cdecl;
  UnloadFileData: procedure(data: PByte); cdecl;
  UnloadFileText: procedure(text: PUTF8Char); cdecl;
  UnloadFont: procedure(font: Font); cdecl;
  UnloadFontData: procedure(chars: PGlyphInfo; glyphCount: Integer); cdecl;
  UnloadImage: procedure(image: Image); cdecl;
  UnloadImageColors: procedure(colors: PColor); cdecl;
  UnloadImagePalette: procedure(colors: PColor); cdecl;
  UnloadMaterial: procedure(material: Material); cdecl;
  UnloadMesh: procedure(mesh: Mesh); cdecl;
  UnloadModel: procedure(model: Model); cdecl;
  UnloadModelAnimation: procedure(anim: ModelAnimation); cdecl;
  UnloadModelAnimations: procedure(animations: PModelAnimation; count: Cardinal); cdecl;
  UnloadModelKeepMeshes: procedure(model: Model); cdecl;
  UnloadMusicStream: procedure(music: Music); cdecl;
  UnloadRenderTexture: procedure(target: RenderTexture2D); cdecl;
  UnloadShader: procedure(shader: Shader); cdecl;
  UnloadSound: procedure(sound: Sound); cdecl;
  UnloadTexture: procedure(texture: Texture2D); cdecl;
  UnloadVrStereoConfig: procedure(config: VrStereoConfig); cdecl;
  UnloadWave: procedure(wave: Wave); cdecl;
  UnloadWaveSamples: procedure(samples: PSingle); cdecl;
  UpdateAudioStream: procedure(stream: AudioStream; const data: Pointer; frameCount: Integer); cdecl;
  UpdateCamera: procedure(camera: PCamera); cdecl;
  UpdateMeshBuffer: procedure(mesh: Mesh; index: Integer; data: Pointer; dataSize: Integer; offset: Integer); cdecl;
  UpdateModelAnimation: procedure(model: Model; anim: ModelAnimation; frame: Integer); cdecl;
  UpdateMusicStream: procedure(music: Music); cdecl;
  UpdatePhysics: procedure(); cdecl;
  UpdateSound: procedure(sound: Sound; const data: Pointer; sampleCount: Integer); cdecl;
  UpdateTexture: procedure(texture: Texture2D; const pixels: Pointer); cdecl;
  UpdateTextureRec: procedure(texture: Texture2D; rec: Rectangle; const pixels: Pointer); cdecl;
  UploadMesh: procedure(mesh: PMesh; _dynamic: bool); cdecl;
  WaitTime: procedure(ms: Single); cdecl;
  WaveCopy: function(wave: Wave): Wave; cdecl;
  WaveCrop: procedure(wave: PWave; initSample: Integer; finalSample: Integer); cdecl;
  WaveFormat: procedure(wave: PWave; sampleRate: Integer; sampleSize: Integer; channels: Integer); cdecl;
  WindowShouldClose: function(): bool; cdecl;

implementation

{$R raylib.res}

uses
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  System.Zip;

var
  LDllHandle: THandle;
  LDllName: string;

procedure LoadDLL;
var
  LResStream: TResourceStream;
  LZipFile: TZipFile;
  LZipStream: TStream;
  LFileStream: TFileStream;
  LHeader: TZipHeader;
begin
  LResStream := TResourceStream.Create(HInstance, 'RESDATA', RT_RCDATA);
  LZipFile := TZipFile.Create;
  LZipFile.Open(LResStream, zmRead);
  LZipFile.Read(0, LZipStream, LHeader);
  LDllName := TPath.GetTempFileName;
  LFileStream := TFile.Create(LDllName);
  LFileStream.CopyFrom(LZipStream, LZipStream.Size);
  FreeAndNil(LFileStream);
  FreeAndNil(LZipStream);
  FreeAndNil(LZipFile);
  FreeAndNil(LResStream);

  LDllHandle := SafeLoadLibrary(LDllName);

  BeginBlendMode := GetProcAddress(LDllHandle, 'BeginBlendMode');
  BeginDrawing := GetProcAddress(LDllHandle, 'BeginDrawing');
  BeginMode2D := GetProcAddress(LDllHandle, 'BeginMode2D');
  BeginMode3D := GetProcAddress(LDllHandle, 'BeginMode3D');
  BeginScissorMode := GetProcAddress(LDllHandle, 'BeginScissorMode');
  BeginShaderMode := GetProcAddress(LDllHandle, 'BeginShaderMode');
  BeginTextureMode := GetProcAddress(LDllHandle, 'BeginTextureMode');
  BeginVrStereoMode := GetProcAddress(LDllHandle, 'BeginVrStereoMode');
  BiStackAllocBack := GetProcAddress(LDllHandle, 'BiStackAllocBack');
  BiStackAllocFront := GetProcAddress(LDllHandle, 'BiStackAllocFront');
  BiStackMargins := GetProcAddress(LDllHandle, 'BiStackMargins');
  BiStackResetAll := GetProcAddress(LDllHandle, 'BiStackResetAll');
  BiStackResetBack := GetProcAddress(LDllHandle, 'BiStackResetBack');
  BiStackResetFront := GetProcAddress(LDllHandle, 'BiStackResetFront');
  ChangeDirectory := GetProcAddress(LDllHandle, 'ChangeDirectory');
  CheckCollisionBoxes := GetProcAddress(LDllHandle, 'CheckCollisionBoxes');
  CheckCollisionBoxSphere := GetProcAddress(LDllHandle, 'CheckCollisionBoxSphere');
  CheckCollisionCircleRec := GetProcAddress(LDllHandle, 'CheckCollisionCircleRec');
  CheckCollisionCircles := GetProcAddress(LDllHandle, 'CheckCollisionCircles');
  CheckCollisionLines := GetProcAddress(LDllHandle, 'CheckCollisionLines');
  CheckCollisionPointCircle := GetProcAddress(LDllHandle, 'CheckCollisionPointCircle');
  CheckCollisionPointLine := GetProcAddress(LDllHandle, 'CheckCollisionPointLine');
  CheckCollisionPointRec := GetProcAddress(LDllHandle, 'CheckCollisionPointRec');
  CheckCollisionPointTriangle := GetProcAddress(LDllHandle, 'CheckCollisionPointTriangle');
  CheckCollisionRecs := GetProcAddress(LDllHandle, 'CheckCollisionRecs');
  CheckCollisionSpheres := GetProcAddress(LDllHandle, 'CheckCollisionSpheres');
  ClearBackground := GetProcAddress(LDllHandle, 'ClearBackground');
  ClearDirectoryFiles := GetProcAddress(LDllHandle, 'ClearDirectoryFiles');
  ClearDroppedFiles := GetProcAddress(LDllHandle, 'ClearDroppedFiles');
  ClearWindowState := GetProcAddress(LDllHandle, 'ClearWindowState');
  CloseAudioDevice := GetProcAddress(LDllHandle, 'CloseAudioDevice');
  ClosePhysics := GetProcAddress(LDllHandle, 'ClosePhysics');
  CloseWindow := GetProcAddress(LDllHandle, 'CloseWindow');
  CodepointToUTF8 := GetProcAddress(LDllHandle, 'CodepointToUTF8');
  ColorAlpha := GetProcAddress(LDllHandle, 'ColorAlpha');
  ColorAlphaBlend := GetProcAddress(LDllHandle, 'ColorAlphaBlend');
  ColorFromHSV := GetProcAddress(LDllHandle, 'ColorFromHSV');
  ColorFromNormalized := GetProcAddress(LDllHandle, 'ColorFromNormalized');
  ColorNormalize := GetProcAddress(LDllHandle, 'ColorNormalize');
  ColorToHSV := GetProcAddress(LDllHandle, 'ColorToHSV');
  ColorToInt := GetProcAddress(LDllHandle, 'ColorToInt');
  CompressData := GetProcAddress(LDllHandle, 'CompressData');
  CreateBiStack := GetProcAddress(LDllHandle, 'CreateBiStack');
  CreateBiStackFromBuffer := GetProcAddress(LDllHandle, 'CreateBiStackFromBuffer');
  CreateMemPool := GetProcAddress(LDllHandle, 'CreateMemPool');
  CreateMemPoolFromBuffer := GetProcAddress(LDllHandle, 'CreateMemPoolFromBuffer');
  CreateObjPool := GetProcAddress(LDllHandle, 'CreateObjPool');
  CreateObjPoolFromBuffer := GetProcAddress(LDllHandle, 'CreateObjPoolFromBuffer');
  CreatePhysicsBodyCircle := GetProcAddress(LDllHandle, 'CreatePhysicsBodyCircle');
  CreatePhysicsBodyPolygon := GetProcAddress(LDllHandle, 'CreatePhysicsBodyPolygon');
  CreatePhysicsBodyRectangle := GetProcAddress(LDllHandle, 'CreatePhysicsBodyRectangle');
  DecodeDataBase64 := GetProcAddress(LDllHandle, 'DecodeDataBase64');
  DecompressData := GetProcAddress(LDllHandle, 'DecompressData');
  DestroyBiStack := GetProcAddress(LDllHandle, 'DestroyBiStack');
  DestroyMemPool := GetProcAddress(LDllHandle, 'DestroyMemPool');
  DestroyObjPool := GetProcAddress(LDllHandle, 'DestroyObjPool');
  DestroyPhysicsBody := GetProcAddress(LDllHandle, 'DestroyPhysicsBody');
  DirectoryExists := GetProcAddress(LDllHandle, 'DirectoryExists');
  DisableCursor := GetProcAddress(LDllHandle, 'DisableCursor');
  DrawBillboard := GetProcAddress(LDllHandle, 'DrawBillboard');
  DrawBillboardPro := GetProcAddress(LDllHandle, 'DrawBillboardPro');
  DrawBillboardRec := GetProcAddress(LDllHandle, 'DrawBillboardRec');
  DrawBoundingBox := GetProcAddress(LDllHandle, 'DrawBoundingBox');
  DrawCircle := GetProcAddress(LDllHandle, 'DrawCircle');
  DrawCircle3D := GetProcAddress(LDllHandle, 'DrawCircle3D');
  DrawCircleGradient := GetProcAddress(LDllHandle, 'DrawCircleGradient');
  DrawCircleLines := GetProcAddress(LDllHandle, 'DrawCircleLines');
  DrawCircleSector := GetProcAddress(LDllHandle, 'DrawCircleSector');
  DrawCircleSectorLines := GetProcAddress(LDllHandle, 'DrawCircleSectorLines');
  DrawCircleV := GetProcAddress(LDllHandle, 'DrawCircleV');
  DrawCube := GetProcAddress(LDllHandle, 'DrawCube');
  DrawCubeTexture := GetProcAddress(LDllHandle, 'DrawCubeTexture');
  DrawCubeTextureRec := GetProcAddress(LDllHandle, 'DrawCubeTextureRec');
  DrawCubeV := GetProcAddress(LDllHandle, 'DrawCubeV');
  DrawCubeWires := GetProcAddress(LDllHandle, 'DrawCubeWires');
  DrawCubeWiresV := GetProcAddress(LDllHandle, 'DrawCubeWiresV');
  DrawCylinder := GetProcAddress(LDllHandle, 'DrawCylinder');
  DrawCylinderEx := GetProcAddress(LDllHandle, 'DrawCylinderEx');
  DrawCylinderWires := GetProcAddress(LDllHandle, 'DrawCylinderWires');
  DrawCylinderWiresEx := GetProcAddress(LDllHandle, 'DrawCylinderWiresEx');
  DrawEllipse := GetProcAddress(LDllHandle, 'DrawEllipse');
  DrawEllipseLines := GetProcAddress(LDllHandle, 'DrawEllipseLines');
  DrawFPS := GetProcAddress(LDllHandle, 'DrawFPS');
  DrawGrid := GetProcAddress(LDllHandle, 'DrawGrid');
  DrawLine := GetProcAddress(LDllHandle, 'DrawLine');
  DrawLine3D := GetProcAddress(LDllHandle, 'DrawLine3D');
  DrawLineBezier := GetProcAddress(LDllHandle, 'DrawLineBezier');
  DrawLineBezierCubic := GetProcAddress(LDllHandle, 'DrawLineBezierCubic');
  DrawLineBezierQuad := GetProcAddress(LDllHandle, 'DrawLineBezierQuad');
  DrawLineEx := GetProcAddress(LDllHandle, 'DrawLineEx');
  DrawLineStrip := GetProcAddress(LDllHandle, 'DrawLineStrip');
  DrawLineV := GetProcAddress(LDllHandle, 'DrawLineV');
  DrawMesh := GetProcAddress(LDllHandle, 'DrawMesh');
  DrawMeshInstanced := GetProcAddress(LDllHandle, 'DrawMeshInstanced');
  DrawModel := GetProcAddress(LDllHandle, 'DrawModel');
  DrawModelEx := GetProcAddress(LDllHandle, 'DrawModelEx');
  DrawModelWires := GetProcAddress(LDllHandle, 'DrawModelWires');
  DrawModelWiresEx := GetProcAddress(LDllHandle, 'DrawModelWiresEx');
  DrawPixel := GetProcAddress(LDllHandle, 'DrawPixel');
  DrawPixelV := GetProcAddress(LDllHandle, 'DrawPixelV');
  DrawPlane := GetProcAddress(LDllHandle, 'DrawPlane');
  DrawPoint3D := GetProcAddress(LDllHandle, 'DrawPoint3D');
  DrawPoly := GetProcAddress(LDllHandle, 'DrawPoly');
  DrawPolyLines := GetProcAddress(LDllHandle, 'DrawPolyLines');
  DrawPolyLinesEx := GetProcAddress(LDllHandle, 'DrawPolyLinesEx');
  DrawRay := GetProcAddress(LDllHandle, 'DrawRay');
  DrawRectangle := GetProcAddress(LDllHandle, 'DrawRectangle');
  DrawRectangleGradientEx := GetProcAddress(LDllHandle, 'DrawRectangleGradientEx');
  DrawRectangleGradientH := GetProcAddress(LDllHandle, 'DrawRectangleGradientH');
  DrawRectangleGradientV := GetProcAddress(LDllHandle, 'DrawRectangleGradientV');
  DrawRectangleLines := GetProcAddress(LDllHandle, 'DrawRectangleLines');
  DrawRectangleLinesEx := GetProcAddress(LDllHandle, 'DrawRectangleLinesEx');
  DrawRectanglePro := GetProcAddress(LDllHandle, 'DrawRectanglePro');
  DrawRectangleRec := GetProcAddress(LDllHandle, 'DrawRectangleRec');
  DrawRectangleRounded := GetProcAddress(LDllHandle, 'DrawRectangleRounded');
  DrawRectangleRoundedLines := GetProcAddress(LDllHandle, 'DrawRectangleRoundedLines');
  DrawRectangleV := GetProcAddress(LDllHandle, 'DrawRectangleV');
  DrawRing := GetProcAddress(LDllHandle, 'DrawRing');
  DrawRingLines := GetProcAddress(LDllHandle, 'DrawRingLines');
  DrawSphere := GetProcAddress(LDllHandle, 'DrawSphere');
  DrawSphereEx := GetProcAddress(LDllHandle, 'DrawSphereEx');
  DrawSphereWires := GetProcAddress(LDllHandle, 'DrawSphereWires');
  DrawText := GetProcAddress(LDllHandle, 'DrawText');
  DrawTextCodepoint := GetProcAddress(LDllHandle, 'DrawTextCodepoint');
  DrawTextEx := GetProcAddress(LDllHandle, 'DrawTextEx');
  DrawTextPro := GetProcAddress(LDllHandle, 'DrawTextPro');
  DrawTexture := GetProcAddress(LDllHandle, 'DrawTexture');
  DrawTextureEx := GetProcAddress(LDllHandle, 'DrawTextureEx');
  DrawTextureNPatch := GetProcAddress(LDllHandle, 'DrawTextureNPatch');
  DrawTexturePoly := GetProcAddress(LDllHandle, 'DrawTexturePoly');
  DrawTexturePro := GetProcAddress(LDllHandle, 'DrawTexturePro');
  DrawTextureQuad := GetProcAddress(LDllHandle, 'DrawTextureQuad');
  DrawTextureRec := GetProcAddress(LDllHandle, 'DrawTextureRec');
  DrawTextureTiled := GetProcAddress(LDllHandle, 'DrawTextureTiled');
  DrawTextureV := GetProcAddress(LDllHandle, 'DrawTextureV');
  DrawTriangle := GetProcAddress(LDllHandle, 'DrawTriangle');
  DrawTriangle3D := GetProcAddress(LDllHandle, 'DrawTriangle3D');
  DrawTriangleFan := GetProcAddress(LDllHandle, 'DrawTriangleFan');
  DrawTriangleLines := GetProcAddress(LDllHandle, 'DrawTriangleLines');
  DrawTriangleStrip := GetProcAddress(LDllHandle, 'DrawTriangleStrip');
  DrawTriangleStrip3D := GetProcAddress(LDllHandle, 'DrawTriangleStrip3D');
  EnableCursor := GetProcAddress(LDllHandle, 'EnableCursor');
  EncodeDataBase64 := GetProcAddress(LDllHandle, 'EncodeDataBase64');
  EndBlendMode := GetProcAddress(LDllHandle, 'EndBlendMode');
  EndDrawing := GetProcAddress(LDllHandle, 'EndDrawing');
  EndMode2D := GetProcAddress(LDllHandle, 'EndMode2D');
  EndMode3D := GetProcAddress(LDllHandle, 'EndMode3D');
  EndScissorMode := GetProcAddress(LDllHandle, 'EndScissorMode');
  EndShaderMode := GetProcAddress(LDllHandle, 'EndShaderMode');
  EndTextureMode := GetProcAddress(LDllHandle, 'EndTextureMode');
  EndVrStereoMode := GetProcAddress(LDllHandle, 'EndVrStereoMode');
  ExportImage := GetProcAddress(LDllHandle, 'ExportImage');
  ExportImageAsCode := GetProcAddress(LDllHandle, 'ExportImageAsCode');
  ExportMesh := GetProcAddress(LDllHandle, 'ExportMesh');
  ExportWave := GetProcAddress(LDllHandle, 'ExportWave');
  ExportWaveAsCode := GetProcAddress(LDllHandle, 'ExportWaveAsCode');
  Fade := GetProcAddress(LDllHandle, 'Fade');
  FileExists := GetProcAddress(LDllHandle, 'FileExists');
  GenImageCellular := GetProcAddress(LDllHandle, 'GenImageCellular');
  GenImageChecked := GetProcAddress(LDllHandle, 'GenImageChecked');
  GenImageColor := GetProcAddress(LDllHandle, 'GenImageColor');
  GenImageFontAtlas := GetProcAddress(LDllHandle, 'GenImageFontAtlas');
  GenImageGradientH := GetProcAddress(LDllHandle, 'GenImageGradientH');
  GenImageGradientRadial := GetProcAddress(LDllHandle, 'GenImageGradientRadial');
  GenImageGradientV := GetProcAddress(LDllHandle, 'GenImageGradientV');
  GenImageWhiteNoise := GetProcAddress(LDllHandle, 'GenImageWhiteNoise');
  GenMeshBinormals := GetProcAddress(LDllHandle, 'GenMeshBinormals');
  GenMeshCone := GetProcAddress(LDllHandle, 'GenMeshCone');
  GenMeshCube := GetProcAddress(LDllHandle, 'GenMeshCube');
  GenMeshCubicmap := GetProcAddress(LDllHandle, 'GenMeshCubicmap');
  GenMeshCylinder := GetProcAddress(LDllHandle, 'GenMeshCylinder');
  GenMeshHeightmap := GetProcAddress(LDllHandle, 'GenMeshHeightmap');
  GenMeshHemiSphere := GetProcAddress(LDllHandle, 'GenMeshHemiSphere');
  GenMeshKnot := GetProcAddress(LDllHandle, 'GenMeshKnot');
  GenMeshPlane := GetProcAddress(LDllHandle, 'GenMeshPlane');
  GenMeshPoly := GetProcAddress(LDllHandle, 'GenMeshPoly');
  GenMeshSphere := GetProcAddress(LDllHandle, 'GenMeshSphere');
  GenMeshTangents := GetProcAddress(LDllHandle, 'GenMeshTangents');
  GenMeshTorus := GetProcAddress(LDllHandle, 'GenMeshTorus');
  GenTextureMipmaps := GetProcAddress(LDllHandle, 'GenTextureMipmaps');
  GetCameraMatrix := GetProcAddress(LDllHandle, 'GetCameraMatrix');
  GetCameraMatrix2D := GetProcAddress(LDllHandle, 'GetCameraMatrix2D');
  GetCharPressed := GetProcAddress(LDllHandle, 'GetCharPressed');
  GetClipboardText := GetProcAddress(LDllHandle, 'GetClipboardText');
  GetCodepoint := GetProcAddress(LDllHandle, 'GetCodepoint');
  GetCodepointCount := GetProcAddress(LDllHandle, 'GetCodepointCount');
  GetCollisionRec := GetProcAddress(LDllHandle, 'GetCollisionRec');
  GetColor := GetProcAddress(LDllHandle, 'GetColor');
  GetCurrentMonitor := GetProcAddress(LDllHandle, 'GetCurrentMonitor');
  GetDirectoryFiles := GetProcAddress(LDllHandle, 'GetDirectoryFiles');
  GetDirectoryPath := GetProcAddress(LDllHandle, 'GetDirectoryPath');
  GetDroppedFiles := GetProcAddress(LDllHandle, 'GetDroppedFiles');
  GetFileExtension := GetProcAddress(LDllHandle, 'GetFileExtension');
  GetFileModTime := GetProcAddress(LDllHandle, 'GetFileModTime');
  GetFileName := GetProcAddress(LDllHandle, 'GetFileName');
  GetFileNameWithoutExt := GetProcAddress(LDllHandle, 'GetFileNameWithoutExt');
  GetFontDefault := GetProcAddress(LDllHandle, 'GetFontDefault');
  GetFPS := GetProcAddress(LDllHandle, 'GetFPS');
  GetFrameTime := GetProcAddress(LDllHandle, 'GetFrameTime');
  GetGamepadAxisCount := GetProcAddress(LDllHandle, 'GetGamepadAxisCount');
  GetGamepadAxisMovement := GetProcAddress(LDllHandle, 'GetGamepadAxisMovement');
  GetGamepadButtonPressed := GetProcAddress(LDllHandle, 'GetGamepadButtonPressed');
  GetGamepadName := GetProcAddress(LDllHandle, 'GetGamepadName');
  GetGestureDetected := GetProcAddress(LDllHandle, 'GetGestureDetected');
  GetGestureDragAngle := GetProcAddress(LDllHandle, 'GetGestureDragAngle');
  GetGestureDragVector := GetProcAddress(LDllHandle, 'GetGestureDragVector');
  GetGestureHoldDuration := GetProcAddress(LDllHandle, 'GetGestureHoldDuration');
  GetGesturePinchAngle := GetProcAddress(LDllHandle, 'GetGesturePinchAngle');
  GetGesturePinchVector := GetProcAddress(LDllHandle, 'GetGesturePinchVector');
  GetGlyphAtlasRec := GetProcAddress(LDllHandle, 'GetGlyphAtlasRec');
  GetGlyphIndex := GetProcAddress(LDllHandle, 'GetGlyphIndex');
  GetGlyphInfo := GetProcAddress(LDllHandle, 'GetGlyphInfo');
  GetImageAlphaBorder := GetProcAddress(LDllHandle, 'GetImageAlphaBorder');
  GetImageColor := GetProcAddress(LDllHandle, 'GetImageColor');
  GetKeyPressed := GetProcAddress(LDllHandle, 'GetKeyPressed');
  GetMemPoolFreeMemory := GetProcAddress(LDllHandle, 'GetMemPoolFreeMemory');
  GetMeshBoundingBox := GetProcAddress(LDllHandle, 'GetMeshBoundingBox');
  GetModelBoundingBox := GetProcAddress(LDllHandle, 'GetModelBoundingBox');
  GetMonitorCount := GetProcAddress(LDllHandle, 'GetMonitorCount');
  GetMonitorHeight := GetProcAddress(LDllHandle, 'GetMonitorHeight');
  GetMonitorName := GetProcAddress(LDllHandle, 'GetMonitorName');
  GetMonitorPhysicalHeight := GetProcAddress(LDllHandle, 'GetMonitorPhysicalHeight');
  GetMonitorPhysicalWidth := GetProcAddress(LDllHandle, 'GetMonitorPhysicalWidth');
  GetMonitorPosition := GetProcAddress(LDllHandle, 'GetMonitorPosition');
  GetMonitorRefreshRate := GetProcAddress(LDllHandle, 'GetMonitorRefreshRate');
  GetMonitorWidth := GetProcAddress(LDllHandle, 'GetMonitorWidth');
  GetMouseDelta := GetProcAddress(LDllHandle, 'GetMouseDelta');
  GetMousePosition := GetProcAddress(LDllHandle, 'GetMousePosition');
  GetMouseRay := GetProcAddress(LDllHandle, 'GetMouseRay');
  GetMouseWheelMove := GetProcAddress(LDllHandle, 'GetMouseWheelMove');
  GetMouseX := GetProcAddress(LDllHandle, 'GetMouseX');
  GetMouseY := GetProcAddress(LDllHandle, 'GetMouseY');
  GetMusicTimeLength := GetProcAddress(LDllHandle, 'GetMusicTimeLength');
  GetMusicTimePlayed := GetProcAddress(LDllHandle, 'GetMusicTimePlayed');
  GetPhysicsBodiesCount := GetProcAddress(LDllHandle, 'GetPhysicsBodiesCount');
  GetPhysicsBody := GetProcAddress(LDllHandle, 'GetPhysicsBody');
  GetPhysicsShapeType := GetProcAddress(LDllHandle, 'GetPhysicsShapeType');
  GetPhysicsShapeVertex := GetProcAddress(LDllHandle, 'GetPhysicsShapeVertex');
  GetPhysicsShapeVerticesCount := GetProcAddress(LDllHandle, 'GetPhysicsShapeVerticesCount');
  GetPixelColor := GetProcAddress(LDllHandle, 'GetPixelColor');
  GetPixelDataSize := GetProcAddress(LDllHandle, 'GetPixelDataSize');
  GetPrevDirectoryPath := GetProcAddress(LDllHandle, 'GetPrevDirectoryPath');
  GetRandomValue := GetProcAddress(LDllHandle, 'GetRandomValue');
  GetRayCollisionBox := GetProcAddress(LDllHandle, 'GetRayCollisionBox');
  GetRayCollisionMesh := GetProcAddress(LDllHandle, 'GetRayCollisionMesh');
  GetRayCollisionModel := GetProcAddress(LDllHandle, 'GetRayCollisionModel');
  GetRayCollisionQuad := GetProcAddress(LDllHandle, 'GetRayCollisionQuad');
  GetRayCollisionSphere := GetProcAddress(LDllHandle, 'GetRayCollisionSphere');
  GetRayCollisionTriangle := GetProcAddress(LDllHandle, 'GetRayCollisionTriangle');
  GetRenderHeight := GetProcAddress(LDllHandle, 'GetRenderHeight');
  GetRenderWidth := GetProcAddress(LDllHandle, 'GetRenderWidth');
  GetScreenHeight := GetProcAddress(LDllHandle, 'GetScreenHeight');
  GetScreenToWorld2D := GetProcAddress(LDllHandle, 'GetScreenToWorld2D');
  GetScreenWidth := GetProcAddress(LDllHandle, 'GetScreenWidth');
  GetShaderLocation := GetProcAddress(LDllHandle, 'GetShaderLocation');
  GetShaderLocationAttrib := GetProcAddress(LDllHandle, 'GetShaderLocationAttrib');
  GetSoundsPlaying := GetProcAddress(LDllHandle, 'GetSoundsPlaying');
  GetTime := GetProcAddress(LDllHandle, 'GetTime');
  GetTouchPointCount := GetProcAddress(LDllHandle, 'GetTouchPointCount');
  GetTouchPointId := GetProcAddress(LDllHandle, 'GetTouchPointId');
  GetTouchPosition := GetProcAddress(LDllHandle, 'GetTouchPosition');
  GetTouchX := GetProcAddress(LDllHandle, 'GetTouchX');
  GetTouchY := GetProcAddress(LDllHandle, 'GetTouchY');
  GetWindowHandle := GetProcAddress(LDllHandle, 'GetWindowHandle');
  GetWindowPosition := GetProcAddress(LDllHandle, 'GetWindowPosition');
  GetWindowScaleDPI := GetProcAddress(LDllHandle, 'GetWindowScaleDPI');
  GetWorkingDirectory := GetProcAddress(LDllHandle, 'GetWorkingDirectory');
  GetWorldToScreen := GetProcAddress(LDllHandle, 'GetWorldToScreen');
  GetWorldToScreen2D := GetProcAddress(LDllHandle, 'GetWorldToScreen2D');
  GetWorldToScreenEx := GetProcAddress(LDllHandle, 'GetWorldToScreenEx');
  GuiButton := GetProcAddress(LDllHandle, 'GuiButton');
  GuiCheckBox := GetProcAddress(LDllHandle, 'GuiCheckBox');
  GuiCheckIconPixel := GetProcAddress(LDllHandle, 'GuiCheckIconPixel');
  GuiClearIconPixel := GetProcAddress(LDllHandle, 'GuiClearIconPixel');
  GuiColorBarAlpha := GetProcAddress(LDllHandle, 'GuiColorBarAlpha');
  GuiColorBarHue := GetProcAddress(LDllHandle, 'GuiColorBarHue');
  GuiColorPanel := GetProcAddress(LDllHandle, 'GuiColorPanel');
  GuiColorPicker := GetProcAddress(LDllHandle, 'GuiColorPicker');
  GuiComboBox := GetProcAddress(LDllHandle, 'GuiComboBox');
  GuiDisable := GetProcAddress(LDllHandle, 'GuiDisable');
  GuiDrawIcon := GetProcAddress(LDllHandle, 'GuiDrawIcon');
  GuiDropdownBox := GetProcAddress(LDllHandle, 'GuiDropdownBox');
  GuiDummyRec := GetProcAddress(LDllHandle, 'GuiDummyRec');
  GuiEnable := GetProcAddress(LDllHandle, 'GuiEnable');
  GuiFade := GetProcAddress(LDllHandle, 'GuiFade');
  GuiGetFont := GetProcAddress(LDllHandle, 'GuiGetFont');
  GuiGetIconData := GetProcAddress(LDllHandle, 'GuiGetIconData');
  GuiGetIcons := GetProcAddress(LDllHandle, 'GuiGetIcons');
  GuiGetState := GetProcAddress(LDllHandle, 'GuiGetState');
  GuiGetStyle := GetProcAddress(LDllHandle, 'GuiGetStyle');
  GuiGrid := GetProcAddress(LDllHandle, 'GuiGrid');
  GuiGroupBox := GetProcAddress(LDllHandle, 'GuiGroupBox');
  GuiIconText := GetProcAddress(LDllHandle, 'GuiIconText');
  GuiIsLocked := GetProcAddress(LDllHandle, 'GuiIsLocked');
  GuiLabel := GetProcAddress(LDllHandle, 'GuiLabel');
  GuiLabelButton := GetProcAddress(LDllHandle, 'GuiLabelButton');
  GuiLine := GetProcAddress(LDllHandle, 'GuiLine');
  GuiListView := GetProcAddress(LDllHandle, 'GuiListView');
  GuiListViewEx := GetProcAddress(LDllHandle, 'GuiListViewEx');
  GuiLoadStyle := GetProcAddress(LDllHandle, 'GuiLoadStyle');
  GuiLoadStyleDefault := GetProcAddress(LDllHandle, 'GuiLoadStyleDefault');
  GuiLock := GetProcAddress(LDllHandle, 'GuiLock');
  GuiMessageBox := GetProcAddress(LDllHandle, 'GuiMessageBox');
  GuiPanel := GetProcAddress(LDllHandle, 'GuiPanel');
  GuiProgressBar := GetProcAddress(LDllHandle, 'GuiProgressBar');
  GuiScrollBar := GetProcAddress(LDllHandle, 'GuiScrollBar');
  GuiScrollPanel := GetProcAddress(LDllHandle, 'GuiScrollPanel');
  GuiSetFont := GetProcAddress(LDllHandle, 'GuiSetFont');
  GuiSetIconData := GetProcAddress(LDllHandle, 'GuiSetIconData');
  GuiSetIconPixel := GetProcAddress(LDllHandle, 'GuiSetIconPixel');
  GuiSetState := GetProcAddress(LDllHandle, 'GuiSetState');
  GuiSetStyle := GetProcAddress(LDllHandle, 'GuiSetStyle');
  GuiSlider := GetProcAddress(LDllHandle, 'GuiSlider');
  GuiSliderBar := GetProcAddress(LDllHandle, 'GuiSliderBar');
  GuiSpinner := GetProcAddress(LDllHandle, 'GuiSpinner');
  GuiStatusBar := GetProcAddress(LDllHandle, 'GuiStatusBar');
  GuiTextBox := GetProcAddress(LDllHandle, 'GuiTextBox');
  GuiTextBoxMulti := GetProcAddress(LDllHandle, 'GuiTextBoxMulti');
  GuiTextInputBox := GetProcAddress(LDllHandle, 'GuiTextInputBox');
  GuiToggle := GetProcAddress(LDllHandle, 'GuiToggle');
  GuiToggleGroup := GetProcAddress(LDllHandle, 'GuiToggleGroup');
  GuiUnlock := GetProcAddress(LDllHandle, 'GuiUnlock');
  GuiValueBox := GetProcAddress(LDllHandle, 'GuiValueBox');
  GuiWindowBox := GetProcAddress(LDllHandle, 'GuiWindowBox');
  HideCursor := GetProcAddress(LDllHandle, 'HideCursor');
  ImageAlphaClear := GetProcAddress(LDllHandle, 'ImageAlphaClear');
  ImageAlphaCrop := GetProcAddress(LDllHandle, 'ImageAlphaCrop');
  ImageAlphaMask := GetProcAddress(LDllHandle, 'ImageAlphaMask');
  ImageAlphaPremultiply := GetProcAddress(LDllHandle, 'ImageAlphaPremultiply');
  ImageClearBackground := GetProcAddress(LDllHandle, 'ImageClearBackground');
  ImageColorBrightness := GetProcAddress(LDllHandle, 'ImageColorBrightness');
  ImageColorContrast := GetProcAddress(LDllHandle, 'ImageColorContrast');
  ImageColorGrayscale := GetProcAddress(LDllHandle, 'ImageColorGrayscale');
  ImageColorInvert := GetProcAddress(LDllHandle, 'ImageColorInvert');
  ImageColorReplace := GetProcAddress(LDllHandle, 'ImageColorReplace');
  ImageColorTint := GetProcAddress(LDllHandle, 'ImageColorTint');
  ImageCopy := GetProcAddress(LDllHandle, 'ImageCopy');
  ImageCrop := GetProcAddress(LDllHandle, 'ImageCrop');
  ImageDither := GetProcAddress(LDllHandle, 'ImageDither');
  ImageDraw := GetProcAddress(LDllHandle, 'ImageDraw');
  ImageDrawCircle := GetProcAddress(LDllHandle, 'ImageDrawCircle');
  ImageDrawCircleV := GetProcAddress(LDllHandle, 'ImageDrawCircleV');
  ImageDrawLine := GetProcAddress(LDllHandle, 'ImageDrawLine');
  ImageDrawLineV := GetProcAddress(LDllHandle, 'ImageDrawLineV');
  ImageDrawPixel := GetProcAddress(LDllHandle, 'ImageDrawPixel');
  ImageDrawPixelV := GetProcAddress(LDllHandle, 'ImageDrawPixelV');
  ImageDrawRectangle := GetProcAddress(LDllHandle, 'ImageDrawRectangle');
  ImageDrawRectangleLines := GetProcAddress(LDllHandle, 'ImageDrawRectangleLines');
  ImageDrawRectangleRec := GetProcAddress(LDllHandle, 'ImageDrawRectangleRec');
  ImageDrawRectangleV := GetProcAddress(LDllHandle, 'ImageDrawRectangleV');
  ImageDrawText := GetProcAddress(LDllHandle, 'ImageDrawText');
  ImageDrawTextEx := GetProcAddress(LDllHandle, 'ImageDrawTextEx');
  ImageFlipHorizontal := GetProcAddress(LDllHandle, 'ImageFlipHorizontal');
  ImageFlipVertical := GetProcAddress(LDllHandle, 'ImageFlipVertical');
  ImageFormat := GetProcAddress(LDllHandle, 'ImageFormat');
  ImageFromImage := GetProcAddress(LDllHandle, 'ImageFromImage');
  ImageMipmaps := GetProcAddress(LDllHandle, 'ImageMipmaps');
  ImageResize := GetProcAddress(LDllHandle, 'ImageResize');
  ImageResizeCanvas := GetProcAddress(LDllHandle, 'ImageResizeCanvas');
  ImageResizeNN := GetProcAddress(LDllHandle, 'ImageResizeNN');
  ImageRotateCCW := GetProcAddress(LDllHandle, 'ImageRotateCCW');
  ImageRotateCW := GetProcAddress(LDllHandle, 'ImageRotateCW');
  ImageText := GetProcAddress(LDllHandle, 'ImageText');
  ImageTextEx := GetProcAddress(LDllHandle, 'ImageTextEx');
  ImageToPOT := GetProcAddress(LDllHandle, 'ImageToPOT');
  InitAudioDevice := GetProcAddress(LDllHandle, 'InitAudioDevice');
  InitPhysics := GetProcAddress(LDllHandle, 'InitPhysics');
  InitWindow := GetProcAddress(LDllHandle, 'InitWindow');
  IsAudioDeviceReady := GetProcAddress(LDllHandle, 'IsAudioDeviceReady');
  IsAudioStreamPlaying := GetProcAddress(LDllHandle, 'IsAudioStreamPlaying');
  IsAudioStreamProcessed := GetProcAddress(LDllHandle, 'IsAudioStreamProcessed');
  IsCursorHidden := GetProcAddress(LDllHandle, 'IsCursorHidden');
  IsCursorOnScreen := GetProcAddress(LDllHandle, 'IsCursorOnScreen');
  IsFileDropped := GetProcAddress(LDllHandle, 'IsFileDropped');
  IsFileExtension := GetProcAddress(LDllHandle, 'IsFileExtension');
  IsGamepadAvailable := GetProcAddress(LDllHandle, 'IsGamepadAvailable');
  IsGamepadButtonDown := GetProcAddress(LDllHandle, 'IsGamepadButtonDown');
  IsGamepadButtonPressed := GetProcAddress(LDllHandle, 'IsGamepadButtonPressed');
  IsGamepadButtonReleased := GetProcAddress(LDllHandle, 'IsGamepadButtonReleased');
  IsGamepadButtonUp := GetProcAddress(LDllHandle, 'IsGamepadButtonUp');
  IsGestureDetected := GetProcAddress(LDllHandle, 'IsGestureDetected');
  IsKeyDown := GetProcAddress(LDllHandle, 'IsKeyDown');
  IsKeyPressed := GetProcAddress(LDllHandle, 'IsKeyPressed');
  IsKeyReleased := GetProcAddress(LDllHandle, 'IsKeyReleased');
  IsKeyUp := GetProcAddress(LDllHandle, 'IsKeyUp');
  IsModelAnimationValid := GetProcAddress(LDllHandle, 'IsModelAnimationValid');
  IsMouseButtonDown := GetProcAddress(LDllHandle, 'IsMouseButtonDown');
  IsMouseButtonPressed := GetProcAddress(LDllHandle, 'IsMouseButtonPressed');
  IsMouseButtonReleased := GetProcAddress(LDllHandle, 'IsMouseButtonReleased');
  IsMouseButtonUp := GetProcAddress(LDllHandle, 'IsMouseButtonUp');
  IsMusicStreamPlaying := GetProcAddress(LDllHandle, 'IsMusicStreamPlaying');
  IsSoundPlaying := GetProcAddress(LDllHandle, 'IsSoundPlaying');
  IsWindowFocused := GetProcAddress(LDllHandle, 'IsWindowFocused');
  IsWindowFullscreen := GetProcAddress(LDllHandle, 'IsWindowFullscreen');
  IsWindowHidden := GetProcAddress(LDllHandle, 'IsWindowHidden');
  IsWindowMaximized := GetProcAddress(LDllHandle, 'IsWindowMaximized');
  IsWindowMinimized := GetProcAddress(LDllHandle, 'IsWindowMinimized');
  IsWindowReady := GetProcAddress(LDllHandle, 'IsWindowReady');
  IsWindowResized := GetProcAddress(LDllHandle, 'IsWindowResized');
  IsWindowState := GetProcAddress(LDllHandle, 'IsWindowState');
  LoadAudioStream := GetProcAddress(LDllHandle, 'LoadAudioStream');
  LoadCodepoints := GetProcAddress(LDllHandle, 'LoadCodepoints');
  LoadFileData := GetProcAddress(LDllHandle, 'LoadFileData');
  LoadFileText := GetProcAddress(LDllHandle, 'LoadFileText');
  LoadFont := GetProcAddress(LDllHandle, 'LoadFont');
  LoadFontData := GetProcAddress(LDllHandle, 'LoadFontData');
  LoadFontEx := GetProcAddress(LDllHandle, 'LoadFontEx');
  LoadFontFromImage := GetProcAddress(LDllHandle, 'LoadFontFromImage');
  LoadFontFromMemory := GetProcAddress(LDllHandle, 'LoadFontFromMemory');
  LoadImage := GetProcAddress(LDllHandle, 'LoadImage');
  LoadImageAnim := GetProcAddress(LDllHandle, 'LoadImageAnim');
  LoadImageColors := GetProcAddress(LDllHandle, 'LoadImageColors');
  LoadImageFromMemory := GetProcAddress(LDllHandle, 'LoadImageFromMemory');
  LoadImageFromScreen := GetProcAddress(LDllHandle, 'LoadImageFromScreen');
  LoadImageFromTexture := GetProcAddress(LDllHandle, 'LoadImageFromTexture');
  LoadImagePalette := GetProcAddress(LDllHandle, 'LoadImagePalette');
  LoadImageRaw := GetProcAddress(LDllHandle, 'LoadImageRaw');
  LoadMaterialDefault := GetProcAddress(LDllHandle, 'LoadMaterialDefault');
  LoadMaterials := GetProcAddress(LDllHandle, 'LoadMaterials');
  LoadModel := GetProcAddress(LDllHandle, 'LoadModel');
  LoadModelAnimations := GetProcAddress(LDllHandle, 'LoadModelAnimations');
  LoadModelFromMesh := GetProcAddress(LDllHandle, 'LoadModelFromMesh');
  LoadMusicStream := GetProcAddress(LDllHandle, 'LoadMusicStream');
  LoadMusicStreamFromMemory := GetProcAddress(LDllHandle, 'LoadMusicStreamFromMemory');
  LoadRenderTexture := GetProcAddress(LDllHandle, 'LoadRenderTexture');
  LoadShader := GetProcAddress(LDllHandle, 'LoadShader');
  LoadShaderFromMemory := GetProcAddress(LDllHandle, 'LoadShaderFromMemory');
  LoadSound := GetProcAddress(LDllHandle, 'LoadSound');
  LoadSoundFromWave := GetProcAddress(LDllHandle, 'LoadSoundFromWave');
  LoadStorageValue := GetProcAddress(LDllHandle, 'LoadStorageValue');
  LoadTexture := GetProcAddress(LDllHandle, 'LoadTexture');
  LoadTextureCubemap := GetProcAddress(LDllHandle, 'LoadTextureCubemap');
  LoadTextureFromImage := GetProcAddress(LDllHandle, 'LoadTextureFromImage');
  LoadVrStereoConfig := GetProcAddress(LDllHandle, 'LoadVrStereoConfig');
  LoadWave := GetProcAddress(LDllHandle, 'LoadWave');
  LoadWaveFromMemory := GetProcAddress(LDllHandle, 'LoadWaveFromMemory');
  LoadWaveSamples := GetProcAddress(LDllHandle, 'LoadWaveSamples');
  MaximizeWindow := GetProcAddress(LDllHandle, 'MaximizeWindow');
  MeasureText := GetProcAddress(LDllHandle, 'MeasureText');
  MeasureTextEx := GetProcAddress(LDllHandle, 'MeasureTextEx');
  MemAlloc := GetProcAddress(LDllHandle, 'MemAlloc');
  MemFree := GetProcAddress(LDllHandle, 'MemFree');
  MemPoolAlloc := GetProcAddress(LDllHandle, 'MemPoolAlloc');
  MemPoolCleanUp := GetProcAddress(LDllHandle, 'MemPoolCleanUp');
  MemPoolFree := GetProcAddress(LDllHandle, 'MemPoolFree');
  MemPoolRealloc := GetProcAddress(LDllHandle, 'MemPoolRealloc');
  MemPoolReset := GetProcAddress(LDllHandle, 'MemPoolReset');
  MemRealloc := GetProcAddress(LDllHandle, 'MemRealloc');
  MinimizeWindow := GetProcAddress(LDllHandle, 'MinimizeWindow');
  ObjPoolAlloc := GetProcAddress(LDllHandle, 'ObjPoolAlloc');
  ObjPoolCleanUp := GetProcAddress(LDllHandle, 'ObjPoolCleanUp');
  ObjPoolFree := GetProcAddress(LDllHandle, 'ObjPoolFree');
  OpenURL := GetProcAddress(LDllHandle, 'OpenURL');
  PauseAudioStream := GetProcAddress(LDllHandle, 'PauseAudioStream');
  PauseMusicStream := GetProcAddress(LDllHandle, 'PauseMusicStream');
  PauseSound := GetProcAddress(LDllHandle, 'PauseSound');
  PhysicsAddForce := GetProcAddress(LDllHandle, 'PhysicsAddForce');
  PhysicsAddTorque := GetProcAddress(LDllHandle, 'PhysicsAddTorque');
  PhysicsShatter := GetProcAddress(LDllHandle, 'PhysicsShatter');
  PlayAudioStream := GetProcAddress(LDllHandle, 'PlayAudioStream');
  PlayMusicStream := GetProcAddress(LDllHandle, 'PlayMusicStream');
  PlaySound := GetProcAddress(LDllHandle, 'PlaySound');
  PlaySoundMulti := GetProcAddress(LDllHandle, 'PlaySoundMulti');
  PollInputEvents := GetProcAddress(LDllHandle, 'PollInputEvents');
  ResetPhysics := GetProcAddress(LDllHandle, 'ResetPhysics');
  RestoreWindow := GetProcAddress(LDllHandle, 'RestoreWindow');
  ResumeAudioStream := GetProcAddress(LDllHandle, 'ResumeAudioStream');
  ResumeMusicStream := GetProcAddress(LDllHandle, 'ResumeMusicStream');
  ResumeSound := GetProcAddress(LDllHandle, 'ResumeSound');
  SaveFileData := GetProcAddress(LDllHandle, 'SaveFileData');
  SaveFileText := GetProcAddress(LDllHandle, 'SaveFileText');
  SaveStorageValue := GetProcAddress(LDllHandle, 'SaveStorageValue');
  SeekMusicStream := GetProcAddress(LDllHandle, 'SeekMusicStream');
  SetAudioStreamBufferSizeDefault := GetProcAddress(LDllHandle, 'SetAudioStreamBufferSizeDefault');
  SetAudioStreamPitch := GetProcAddress(LDllHandle, 'SetAudioStreamPitch');
  SetAudioStreamVolume := GetProcAddress(LDllHandle, 'SetAudioStreamVolume');
  SetCameraAltControl := GetProcAddress(LDllHandle, 'SetCameraAltControl');
  SetCameraMode := GetProcAddress(LDllHandle, 'SetCameraMode');
  SetCameraMoveControls := GetProcAddress(LDllHandle, 'SetCameraMoveControls');
  SetCameraPanControl := GetProcAddress(LDllHandle, 'SetCameraPanControl');
  SetCameraSmoothZoomControl := GetProcAddress(LDllHandle, 'SetCameraSmoothZoomControl');
  SetClipboardText := GetProcAddress(LDllHandle, 'SetClipboardText');
  SetConfigFlags := GetProcAddress(LDllHandle, 'SetConfigFlags');
  SetExitKey := GetProcAddress(LDllHandle, 'SetExitKey');
  SetGamepadMappings := GetProcAddress(LDllHandle, 'SetGamepadMappings');
  SetGesturesEnabled := GetProcAddress(LDllHandle, 'SetGesturesEnabled');
  SetLoadFileDataCallback := GetProcAddress(LDllHandle, 'SetLoadFileDataCallback');
  SetLoadFileTextCallback := GetProcAddress(LDllHandle, 'SetLoadFileTextCallback');
  SetMasterVolume := GetProcAddress(LDllHandle, 'SetMasterVolume');
  SetMaterialTexture := GetProcAddress(LDllHandle, 'SetMaterialTexture');
  SetModelMeshMaterial := GetProcAddress(LDllHandle, 'SetModelMeshMaterial');
  SetMouseCursor := GetProcAddress(LDllHandle, 'SetMouseCursor');
  SetMouseOffset := GetProcAddress(LDllHandle, 'SetMouseOffset');
  SetMousePosition := GetProcAddress(LDllHandle, 'SetMousePosition');
  SetMouseScale := GetProcAddress(LDllHandle, 'SetMouseScale');
  SetMusicPitch := GetProcAddress(LDllHandle, 'SetMusicPitch');
  SetMusicVolume := GetProcAddress(LDllHandle, 'SetMusicVolume');
  SetPhysicsBodyRotation := GetProcAddress(LDllHandle, 'SetPhysicsBodyRotation');
  SetPhysicsGravity := GetProcAddress(LDllHandle, 'SetPhysicsGravity');
  SetPhysicsTimeStep := GetProcAddress(LDllHandle, 'SetPhysicsTimeStep');
  SetPixelColor := GetProcAddress(LDllHandle, 'SetPixelColor');
  SetRandomSeed := GetProcAddress(LDllHandle, 'SetRandomSeed');
  SetSaveFileDataCallback := GetProcAddress(LDllHandle, 'SetSaveFileDataCallback');
  SetSaveFileTextCallback := GetProcAddress(LDllHandle, 'SetSaveFileTextCallback');
  SetShaderValue := GetProcAddress(LDllHandle, 'SetShaderValue');
  SetShaderValueMatrix := GetProcAddress(LDllHandle, 'SetShaderValueMatrix');
  SetShaderValueTexture := GetProcAddress(LDllHandle, 'SetShaderValueTexture');
  SetShaderValueV := GetProcAddress(LDllHandle, 'SetShaderValueV');
  SetShapesTexture := GetProcAddress(LDllHandle, 'SetShapesTexture');
  SetSoundPitch := GetProcAddress(LDllHandle, 'SetSoundPitch');
  SetSoundVolume := GetProcAddress(LDllHandle, 'SetSoundVolume');
  SetTargetFPS := GetProcAddress(LDllHandle, 'SetTargetFPS');
  SetTextureFilter := GetProcAddress(LDllHandle, 'SetTextureFilter');
  SetTextureWrap := GetProcAddress(LDllHandle, 'SetTextureWrap');
  SetTraceLogCallback := GetProcAddress(LDllHandle, 'SetTraceLogCallback');
  SetTraceLogLevel := GetProcAddress(LDllHandle, 'SetTraceLogLevel');
  SetWindowIcon := GetProcAddress(LDllHandle, 'SetWindowIcon');
  SetWindowMinSize := GetProcAddress(LDllHandle, 'SetWindowMinSize');
  SetWindowMonitor := GetProcAddress(LDllHandle, 'SetWindowMonitor');
  SetWindowOpacity := GetProcAddress(LDllHandle, 'SetWindowOpacity');
  SetWindowPosition := GetProcAddress(LDllHandle, 'SetWindowPosition');
  SetWindowSize := GetProcAddress(LDllHandle, 'SetWindowSize');
  SetWindowState := GetProcAddress(LDllHandle, 'SetWindowState');
  SetWindowTitle := GetProcAddress(LDllHandle, 'SetWindowTitle');
  ShowCursor := GetProcAddress(LDllHandle, 'ShowCursor');
  StopAudioStream := GetProcAddress(LDllHandle, 'StopAudioStream');
  StopMusicStream := GetProcAddress(LDllHandle, 'StopMusicStream');
  StopSound := GetProcAddress(LDllHandle, 'StopSound');
  StopSoundMulti := GetProcAddress(LDllHandle, 'StopSoundMulti');
  SwapScreenBuffer := GetProcAddress(LDllHandle, 'SwapScreenBuffer');
  TakeScreenshot := GetProcAddress(LDllHandle, 'TakeScreenshot');
  TextAppend := GetProcAddress(LDllHandle, 'TextAppend');
  TextCodepointsToUTF8 := GetProcAddress(LDllHandle, 'TextCodepointsToUTF8');
  TextCopy := GetProcAddress(LDllHandle, 'TextCopy');
  TextFindIndex := GetProcAddress(LDllHandle, 'TextFindIndex');
  TextFormat := GetProcAddress(LDllHandle, 'TextFormat');
  TextInsert := GetProcAddress(LDllHandle, 'TextInsert');
  TextIsEqual := GetProcAddress(LDllHandle, 'TextIsEqual');
  TextJoin := GetProcAddress(LDllHandle, 'TextJoin');
  TextLength := GetProcAddress(LDllHandle, 'TextLength');
  TextReplace := GetProcAddress(LDllHandle, 'TextReplace');
  TextSplit := GetProcAddress(LDllHandle, 'TextSplit');
  TextSubtext := GetProcAddress(LDllHandle, 'TextSubtext');
  TextToInteger := GetProcAddress(LDllHandle, 'TextToInteger');
  TextToLower := GetProcAddress(LDllHandle, 'TextToLower');
  TextToPascal := GetProcAddress(LDllHandle, 'TextToPascal');
  TextToUpper := GetProcAddress(LDllHandle, 'TextToUpper');
  ToggleFullscreen := GetProcAddress(LDllHandle, 'ToggleFullscreen');
  TraceLog := GetProcAddress(LDllHandle, 'TraceLog');
  UnloadAudioStream := GetProcAddress(LDllHandle, 'UnloadAudioStream');
  UnloadCodepoints := GetProcAddress(LDllHandle, 'UnloadCodepoints');
  UnloadFileData := GetProcAddress(LDllHandle, 'UnloadFileData');
  UnloadFileText := GetProcAddress(LDllHandle, 'UnloadFileText');
  UnloadFont := GetProcAddress(LDllHandle, 'UnloadFont');
  UnloadFontData := GetProcAddress(LDllHandle, 'UnloadFontData');
  UnloadImage := GetProcAddress(LDllHandle, 'UnloadImage');
  UnloadImageColors := GetProcAddress(LDllHandle, 'UnloadImageColors');
  UnloadImagePalette := GetProcAddress(LDllHandle, 'UnloadImagePalette');
  UnloadMaterial := GetProcAddress(LDllHandle, 'UnloadMaterial');
  UnloadMesh := GetProcAddress(LDllHandle, 'UnloadMesh');
  UnloadModel := GetProcAddress(LDllHandle, 'UnloadModel');
  UnloadModelAnimation := GetProcAddress(LDllHandle, 'UnloadModelAnimation');
  UnloadModelAnimations := GetProcAddress(LDllHandle, 'UnloadModelAnimations');
  UnloadModelKeepMeshes := GetProcAddress(LDllHandle, 'UnloadModelKeepMeshes');
  UnloadMusicStream := GetProcAddress(LDllHandle, 'UnloadMusicStream');
  UnloadRenderTexture := GetProcAddress(LDllHandle, 'UnloadRenderTexture');
  UnloadShader := GetProcAddress(LDllHandle, 'UnloadShader');
  UnloadSound := GetProcAddress(LDllHandle, 'UnloadSound');
  UnloadTexture := GetProcAddress(LDllHandle, 'UnloadTexture');
  UnloadVrStereoConfig := GetProcAddress(LDllHandle, 'UnloadVrStereoConfig');
  UnloadWave := GetProcAddress(LDllHandle, 'UnloadWave');
  UnloadWaveSamples := GetProcAddress(LDllHandle, 'UnloadWaveSamples');
  UpdateAudioStream := GetProcAddress(LDllHandle, 'UpdateAudioStream');
  UpdateCamera := GetProcAddress(LDllHandle, 'UpdateCamera');
  UpdateMeshBuffer := GetProcAddress(LDllHandle, 'UpdateMeshBuffer');
  UpdateModelAnimation := GetProcAddress(LDllHandle, 'UpdateModelAnimation');
  UpdateMusicStream := GetProcAddress(LDllHandle, 'UpdateMusicStream');
  UpdatePhysics := GetProcAddress(LDllHandle, 'UpdatePhysics');
  UpdateSound := GetProcAddress(LDllHandle, 'UpdateSound');
  UpdateTexture := GetProcAddress(LDllHandle, 'UpdateTexture');
  UpdateTextureRec := GetProcAddress(LDllHandle, 'UpdateTextureRec');
  UploadMesh := GetProcAddress(LDllHandle, 'UploadMesh');
  WaitTime := GetProcAddress(LDllHandle, 'WaitTime');
  WaveCopy := GetProcAddress(LDllHandle, 'WaveCopy');
  WaveCrop := GetProcAddress(LDllHandle, 'WaveCrop');
  WaveFormat := GetProcAddress(LDllHandle, 'WaveFormat');
  WindowShouldClose := GetProcAddress(LDllHandle, 'WindowShouldClose');
end;

procedure UnloadDLL;
begin
  FreeLibrary(LDllHandle);
  TFile.Delete(LDllName);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;
  LoadDLL;

finalization
  UnloadDLL;

end.
