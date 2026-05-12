using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Entities
{
    public class TblTestDetails
    {
        public int IdTestDetails { get; set; }
        public int IdTest { get; set; }
        public int PrimaryFilterID { get; set; } = 1;
        public int SecondaryFilterID { get; set; }
        public bool IsDelayedR2 { get; set; } = false;
        public double Linearity { get; set; }
        public double SubstrateDepletion { get; set; }
        public int IncubationTime { get; set; } = 15;
        public int ReadingTime { get; set; } = 15;
        public int ReadStartCycle { get; set; }
        public int ReadEndCycle { get; set; }
        public int CorelationA { get; set; } = 1;
        public int CorelationB { get; set; } = 0;
        public int R1Volume { get; set; } = 300;
        public int R2Volume { get; set; } = 0;
        public double SampleVolume { get; set; } = 3;
        public int AutoDilutionRatio { get; set; } = 2;
        public int StirrerSpeedSample { get; set; } = 2;
        public int StirrerSpeedR2 { get; set; } = 2;
        public double LastReagentBlank { get; set; } = 0;
        public double ReagentBlankLow { get; set; } = 0;
        public double ReagentBlankHigh { get; set; } = 0;
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.MinValue;
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedAt { get; set; } = DateTime.MinValue;
    }
}