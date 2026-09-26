import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    required this.assetPath,
    required this.initialPosition,
    required this.onProgressChanged,
    super.key,
  });

  final String assetPath;
  final Duration initialPosition;
  final void Function(Duration position, Duration duration) onProgressChanged;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late final VideoPlayerController _videoController;
  ChewieController? _chewieController;
  Object? _playbackError;
  int _lastReportedSecond = -1;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.assetPath);
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await _videoController.initialize();
      if (!mounted) return;

      if (widget.initialPosition > Duration.zero) {
        await _videoController.seekTo(widget.initialPosition);
        if (!mounted) return;
      }
      _videoController.addListener(_reportProgress);
      _configureChewieController();
    } catch (error) {
      if (!mounted) return;
      _playbackError = error;
    }
    setState(() {});
  }

  void _configureChewieController() {
    final previousController = _chewieController;
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      optionsTranslation: OptionsTranslation(
        playbackSpeedButtonText: context.l10n.playbackSpeed,
        subtitlesButtonText: context.l10n.subtitles,
        cancelButtonText: context.l10n.cancel,
      ),
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true,
      playbackSpeeds: const [1, 1.25, 1.5, 2],
      allowedScreenSleep: false,
    );
    previousController?.dispose();
  }

  void _reportProgress() {
    final value = _videoController.value;
    if (value.hasError) {
      if (_playbackError == null && mounted) {
        setState(() => _playbackError = value.errorDescription ?? value);
      }
      return;
    }
    if (!value.isInitialized) return;
    final currentSecond = value.position.inSeconds;
    if (currentSecond == _lastReportedSecond) return;
    if (!value.isCompleted && currentSecond.isOdd) return;
    _lastReportedSecond = currentSecond;
    widget.onProgressChanged(value.position, value.duration);
  }

  @override
  void dispose() {
    _videoController.removeListener(_reportProgress);
    _chewieController?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_playbackError != null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: ColoredBox(
          color: Colors.black,
          child: Center(
            child: Text(
              context.l10n.videoUnavailable,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }
    final controller = _chewieController;
    if (controller == null) {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: ColoredBox(
          color: Colors.black,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return AspectRatio(
      aspectRatio: _videoController.value.aspectRatio,
      child: Chewie(controller: controller),
    );
  }
}
