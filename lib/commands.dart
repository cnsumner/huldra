import 'package:nyxx/commands.dart';

@Command('test')
Future<void> single(CommandContext context) async {
  await context.replyTemp(Duration(seconds: 2), content: 'nice');
}
