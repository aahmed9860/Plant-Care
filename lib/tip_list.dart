import 'package:flutter/material.dart';

 abstract class ListItem{
  Widget buildTitle(BuildContext context);

  Widget buildTip(BuildContext context);
  /*
final tips = List<String>(
  ?HeadingItem('Watering Plants')
  : MessageItem('', 'You should water your plants every day'),
  
  
)
*/
 }

 class HeadingItem implements ListItem{
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context){
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  @override 
  Widget buildTip(BuildContext context) => const SizedBox.shrink();
 }

 class MessageItem implements ListItem{
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildTip(BuildContext context)=> Text(body);
 }