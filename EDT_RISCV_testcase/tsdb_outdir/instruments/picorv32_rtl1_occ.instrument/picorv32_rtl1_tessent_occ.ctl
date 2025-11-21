//-------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2024.4
//       Created on: Thu Nov 20 12:09:51 EST 2025
//-------------------------------------------------


STIL 1.0 {
  Design 2005;
  CTL 2005;
}
Header {
  Title "CTL for design 'picorv32_rtl1_tessent_occ'";
  Date "Thu Nov 20 12:09:51 EST 2025";
  Source "Tessent Shell 2024.4";
}
Signals {
  fast_clock In;
  slow_clock In;
  scan_en In;
  test_mode In;
  fast_capture_mode In;
  capture_cycle_width[0] In;
  capture_cycle_width[1] In;
  shift_only_mode In;
  clock_out Out;
  scan_in In;
  scan_out Out;
}
SignalGroups {
  all_inputs = 'fast_clock + slow_clock + scan_en + test_mode + fast_capture_mode + capture_cycle_width[0] + capture_cycle_width[1] + shift_only_mode + scan_in';
  all_outputs = 'clock_out + scan_out';
  all_ports = 'all_inputs + all_outputs';
}
ScanStructures {
  ScanChain "chain_0" {
    ScanLength 3;
    ScanIn scan_in;
    ScanOut scan_out;
    ScanEnable scan_en;
    ScanMasterClock slow_clock;
  }
}
Timing timing {
}
MacroDefs {
}
Environment picorv32_rtl1_tessent_occ {
  CTLMode internal_test {
    TestMode InternalTest;
    DomainReferences {
    }
    Internal {
      slow_clock {
        DataType ScanMasterClock {
          ActiveState ForceUp;
        }
      }
      scan_en {
        DataType ScanEnable {
          ActiveState ForceUp;
        }
      }
      test_mode {
        DataType TestMode {
          ActiveState ForceUp;
        }
      }
      scan_in {
        ScanStyle MultiplexedData;
        DataType ScanDataIn {
          ScanDataType Internal;
        }
        CaptureClock slow_clock {
          LeadingEdge ;
        }
      }
      scan_out {
        ScanStyle MultiplexedData;
        DataType ScanDataOut {
          ScanDataType Internal;
        }
        LaunchClock slow_clock {
          TrailingEdge ;
        }
      }
    }
  }
}

