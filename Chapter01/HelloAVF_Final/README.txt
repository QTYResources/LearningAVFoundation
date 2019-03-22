HelloAVF_Final

使用AVSpeechSynthesizer进行文本转语音

// 使用要转换语音的文本构建AVSpeechUtterance示例
AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.speechString[i]];
// 设置播放语音的语言
utterance.voice = self.voices[i % 2];
// 设置播放的速率
utterance.rate = 0.5f;
// 设置播放的音调
utterance.pitchMultiplier = 0.8f;
// 设置播放延迟
utterance.postUtteranceDelay = 0.1f;
// 使用AVSpeechSynthesizer实例进行播放
[self.synthesizer speakUtterance:utterance];