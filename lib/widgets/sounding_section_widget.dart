import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:w_phonics/models/phonics_character.dart';
import 'package:w_phonics/models/sounding_item.dart';
import 'package:w_phonics/widgets/phonics_item_card.dart';

class SoundingSectionWidget extends StatefulWidget {
  const SoundingSectionWidget({
    super.key,
    required this.phonicChar,
    required this.phonicsCharacter,
  });

  final String phonicChar;
  final PhonicsCharacter phonicsCharacter;

  @override
  State<SoundingSectionWidget> createState() => _SoundingSectionWidgetState();
}

class _SoundingSectionWidgetState extends State<SoundingSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return PhonicsItemPageCard(
      title: "Sounding",
      child: Column(
        children: [
          Text(
            "Which of these words does not contain the ${widget.phonicChar} sound",
          ),
          Column(
            children: List.generate(
              widget.phonicsCharacter.soundingItems.length,
              (index) {
                var soundingItem = widget.phonicsCharacter.soundingItems[index];
                return SoundingItemWidget(soundingItem: soundingItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SoundingItemWidget extends StatefulWidget {
  const SoundingItemWidget({super.key, required this.soundingItem});
  final SoundingItem soundingItem;

  @override
  State<SoundingItemWidget> createState() => _SoundingItemWidgetState();
}

class _SoundingItemWidgetState extends State<SoundingItemWidget> {
  var justAudio = AudioPlayer();
  bool showText = false;

  @override
  void dispose() {
    super.dispose();
    justAudio.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        justAudio.setAsset(widget.soundingItem.audio);
        justAudio.play();

        setState(() {
          showText = true;
        });
      },
      child: Column(
        children: [
          Container(child: Image.asset(widget.soundingItem.image)),
          if (showText) Text(widget.soundingItem.name),
        ],
      ),
    );
  }
}
