// channel layout constants from FFmpeg libavutil/channel_layout.h
class ChannelLayouts {
  // ignore_for_file: constant_identifier_names

  static const FRONT_LEFT = 0x00000001;
  static const FRONT_RIGHT = 0x00000002;
  static const FRONT_CENTER = 0x00000004;
  static const LOW_FREQUENCY = 0x00000008;
  static const BACK_LEFT = 0x00000010;
  static const BACK_RIGHT = 0x00000020;
  static const FRONT_LEFT_OF_CENTER = 0x00000040;
  static const FRONT_RIGHT_OF_CENTER = 0x00000080;
  static const BACK_CENTER = 0x00000100;
  static const SIDE_LEFT = 0x00000200;
  static const SIDE_RIGHT = 0x00000400;
  static const TOP_CENTER = 0x00000800;
  static const TOP_FRONT_LEFT = 0x00001000;
  static const TOP_FRONT_CENTER = 0x00002000;
  static const TOP_FRONT_RIGHT = 0x00004000;
  static const TOP_BACK_LEFT = 0x00008000;
  static const TOP_BACK_CENTER = 0x00010000;
  static const TOP_BACK_RIGHT = 0x00020000;
  static const STEREO_LEFT = 0x20000000;
  static const STEREO_RIGHT = 0x40000000;

  static const WIDE_LEFT = 0x0000000080000000;
  static const WIDE_RIGHT = 0x0000000100000000;
  static const SURROUND_DIRECT_LEFT = 0x0000000200000000;
  static const SURROUND_DIRECT_RIGHT = 0x0000000400000000;
  static const LOW_FREQUENCY_2 = 0x0000000800000000;

  static const LAYOUT_NATIVE = 0x8000000000000000;

  static const LAYOUT_MONO = (FRONT_CENTER);
  static const LAYOUT_STEREO = (FRONT_LEFT | FRONT_RIGHT);
  static const LAYOUT_2POINT1 = (LAYOUT_STEREO | LOW_FREQUENCY);
  static const LAYOUT_2_1 = (LAYOUT_STEREO | BACK_CENTER);
  static const LAYOUT_SURROUND = (LAYOUT_STEREO | FRONT_CENTER);
  static const LAYOUT_3POINT1 = (LAYOUT_SURROUND | LOW_FREQUENCY);
  static const LAYOUT_4POINT0 = (LAYOUT_SURROUND | BACK_CENTER);
  static const LAYOUT_4POINT1 = (LAYOUT_4POINT0 | LOW_FREQUENCY);
  static const LAYOUT_2_2 = (LAYOUT_STEREO | SIDE_LEFT | SIDE_RIGHT);
  static const LAYOUT_QUAD = (LAYOUT_STEREO | BACK_LEFT | BACK_RIGHT);
  static const LAYOUT_5POINT0 = (LAYOUT_SURROUND | SIDE_LEFT | SIDE_RIGHT);
  static const LAYOUT_5POINT1 = (LAYOUT_5POINT0 | LOW_FREQUENCY);
  static const LAYOUT_5POINT0_BACK = (LAYOUT_SURROUND | BACK_LEFT | BACK_RIGHT);
  static const LAYOUT_5POINT1_BACK = (LAYOUT_5POINT0_BACK | LOW_FREQUENCY);
  static const LAYOUT_6POINT0 = (LAYOUT_5POINT0 | BACK_CENTER);
  static const LAYOUT_6POINT0_FRONT = (LAYOUT_2_2 | FRONT_LEFT_OF_CENTER | FRONT_RIGHT_OF_CENTER);
  static const LAYOUT_HEXAGONAL = (LAYOUT_5POINT0_BACK | BACK_CENTER);
  static const LAYOUT_6POINT1 = (LAYOUT_5POINT1 | BACK_CENTER);
  static const LAYOUT_6POINT1_BACK = (LAYOUT_5POINT1_BACK | BACK_CENTER);
  static const LAYOUT_6POINT1_FRONT = (LAYOUT_6POINT0_FRONT | LOW_FREQUENCY);
  static const LAYOUT_7POINT0 = (LAYOUT_5POINT0 | BACK_LEFT | BACK_RIGHT);
  static const LAYOUT_7POINT0_FRONT = (LAYOUT_5POINT0 | FRONT_LEFT_OF_CENTER | FRONT_RIGHT_OF_CENTER);
  static const LAYOUT_7POINT1 = (LAYOUT_5POINT1 | BACK_LEFT | BACK_RIGHT);
  static const LAYOUT_7POINT1_WIDE = (LAYOUT_5POINT1 | FRONT_LEFT_OF_CENTER | FRONT_RIGHT_OF_CENTER);
  static const LAYOUT_7POINT1_WIDE_BACK = (LAYOUT_5POINT1_BACK | FRONT_LEFT_OF_CENTER | FRONT_RIGHT_OF_CENTER);
  static const LAYOUT_OCTAGONAL = (LAYOUT_5POINT0 | BACK_LEFT | BACK_CENTER | BACK_RIGHT);
  static const LAYOUT_HEXADECAGONAL = (LAYOUT_OCTAGONAL | WIDE_LEFT | WIDE_RIGHT | TOP_BACK_LEFT | TOP_BACK_RIGHT | TOP_BACK_CENTER | TOP_FRONT_CENTER | TOP_FRONT_LEFT | TOP_FRONT_RIGHT);
  static const LAYOUT_STEREO_DOWNMIX = (STEREO_LEFT | STEREO_RIGHT);

  static const names = {
    LAYOUT_NATIVE: 'native',
    LAYOUT_MONO: 'mono',
    LAYOUT_STEREO: 'stereo',
    LAYOUT_2POINT1: '2.1',
    LAYOUT_2_1: '2_1',
    LAYOUT_SURROUND: 'surround',
    LAYOUT_3POINT1: '3.1',
    LAYOUT_4POINT0: '4.0',
    LAYOUT_4POINT1: '4.1',
    LAYOUT_2_2: '2_2',
    LAYOUT_QUAD: 'quad',
    LAYOUT_5POINT0: '5.0',
    LAYOUT_5POINT1: '5.1',
    LAYOUT_5POINT0_BACK: '5.0 back',
    LAYOUT_5POINT1_BACK: '5.1 back',
    LAYOUT_6POINT0: '6.0',
    LAYOUT_6POINT0_FRONT: '6.0 front',
    LAYOUT_HEXAGONAL: 'hexagonal',
    LAYOUT_6POINT1: '6.1',
    LAYOUT_6POINT1_BACK: '6.1 back',
    LAYOUT_6POINT1_FRONT: '6.1 front',
    LAYOUT_7POINT0: '7.0',
    LAYOUT_7POINT0_FRONT: '7.0 front',
    LAYOUT_7POINT1: '7.1',
    LAYOUT_7POINT1_WIDE: '7.1 wide',
    LAYOUT_7POINT1_WIDE_BACK: '7.1 wide back',
    LAYOUT_OCTAGONAL: 'octagonal',
    LAYOUT_HEXADECAGONAL: 'hexadecagonal',
    LAYOUT_STEREO_DOWNMIX: 'stereo downmix',
  };
}
