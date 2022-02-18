import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:smart_common_shared/src/application/enum/platform_dialog_type.dart';

Map<PlatformDialogType, DialogType> dialogType =
{
  PlatformDialogType.info : DialogType.INFO,
  PlatformDialogType.error : DialogType.ERROR,
  PlatformDialogType.question : DialogType.QUESTION,
  PlatformDialogType.infoReversed : DialogType.INFO_REVERSED,
  PlatformDialogType.noHeader : DialogType.NO_HEADER,
  PlatformDialogType.success : DialogType.SUCCES,
  PlatformDialogType.warning : DialogType.WARNING
};

