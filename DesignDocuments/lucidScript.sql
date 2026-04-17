CREATE TABLE `TblPatient` (
  `IdPatient` int,
  `PatientName` nvarchar(20),
  `PatientFirstName` nvarchar(20),
  `PatientLastName` nvarchar(20),
  `DateOfBirth` DateTime,
  `Gender` int,
  `Remark` nvarchar(20)
);

CREATE TABLE `TblReagentPosition` (
  `IdReagentPosition` int,
  `IdReagentBottle` int,
  `TrayPosition` int,
  `IsOuterPosition` bool,
  `IsInUse` bool,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblScheduleDet` (
  `IdScheduleDet` int,
  `IdSchedule` long,
  `IdTest` int,
  `DilutionRatio` int,
  `ScheduleStatus` int,
  `ScheduleReason` int,
  `IdQCDetails` int,
  `IdStandardDetails` int,
  `IdSample` int,
  `IsSelectiveCalibration` int,
  `IsConvergingCalibration` int
);

CREATE TABLE `TblTest` (
  `IdTest` int,
  `TestCode` nvarchar(20),
  `TestName` nvarchar(20),
  `ConventionalUnitId` int,
  `SIUnitId` int,
  `isSpecialSolution` bool,
  `MethodId` int,
  `NoOfReagents` int,
  `Decimals` int,
  `Blankint` double,
  `TestSequence` int,
  `IsCalculatedTest` int,
  `IdCalculatedDetails` int,
  `IsSendToLIS` bool
);

CREATE TABLE `TblCalibrator` (
  `IdCalibrator` int,
  `CalibratiorLotNo` nvarchar(20),
  `ExpiryDate` DateTime,
  `IsExpired` bool,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblQCDetails` (
  `IdQCDetails` int,
  `IdQcLot` int,
  `IdTest` int,
  `MeanValue` double,
  `SDValue` double,
  `1SDRange` nvarchar(20),
  `2SDRange` nvarchar(20),
  `3SDRange` nvarchar(20),
  `IdUnit` int,
  `IsPBRTQC` bool,
  `AvgSampleCount` int,
  `LowTruncateValue` double,
  `HighTruncateValue` double,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblSample` (
  `IdSample` long,
  `IsSampleBarcoded` bool,
  `SampleBarcode` nvarchar(20),
  `Field` int,
  `IdPatient` int,
  `IsISERequested` bool,
  `SampleFor` int,
  `SampleContainer` int,
  `SampleCollectionDate` DateTime,
  `SampleProcessDate` DateTime,
  `Sampleint` int,
  `SampleRemark` nvarchar(20),
  `AreAllTestDone` bool,
  `HaveCalculatedTestCompleted` bool,
  `IsReRunRequested` bool,
  `CreatedBy` int,
  `CreatedAt` DateTime,
  `ModifiedBy` int,
  `Field` int
);

CREATE TABLE `TblStandard` (
  `IdStandard` int,
  `IdCalibrator` int,
  `IdTest` int,
  `Curveint` int,
  `Containerint` int,
  `AutoDilutionRatio` int,
  `StandardCount` int,
  `ValidityDays` DateTime,
  `IsValid` bool,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblSchedule` (
  `IdSchedule` long,
  `SampleFor` int,
  `SampleContainer` int,
  `SamplePosition` int,
  `IsSampleEmergency` bool,
  `SampleStatus` int
);

CREATE TABLE `TblStandardDetails` (
  `IdStandardDetails` int,
  `IdStandard` int,
  `StandardNumber` int,
  `StandardPosition` int,
  `StandardConc` double,
  `StandardOD` double,
  `IsRerun` bool,
  `IsActive` int
);

CREATE TABLE `TblCalibrationDetails` (
  `IdCalibrationDetails` int,
  `IDStandardDetails` int,
  `IdCalibration` int,
  `ResultId` long,
  `CreatedAt` int,
  `ModifiedAt` int
);

CREATE TABLE `TblReagentBottle` (
  `IdReagentBottle` int,
  `ReagentLot` nvarchar(20),
  `ReagentBottleNo` int,
  `IdTest` int,
  `Bottleint` int,
  `BottleSize` int,
  `IdManufacturer` int,
  `ManufactureDate` DateTime,
  `BottleOpenDate` DateTime,
  `BottleStabilityDate` DateTime,
  `ExpiryDate` DateTime,
  `Volume` int,
  `VolumeSteps` int,
  `IsBarcoded` bool,
  `Barcode` nvarchar(20),
  `TestCount` int,
  `IsExhausted` bool,
  `IsReminderRequired` bool,
  `ReminderCount` int,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` DateTime,
  `ModifiedBy` int,
  `ModifiedAt` DateTime
);

CREATE TABLE `TblCalibration` (
  `IdCalibration` int,
  `IdTest` int,
  `CalibrationDate` DateTime,
  `ExpiryDate` DateTime,
  `Curveint` int,
  `StandardCount` int,
  `KFactor` double,
  `AFactor` double,
  `BFactor` double,
  `CFactor` double,
  `DFactor` double,
  `RoFactor` double,
  `IsSelectiveCalibration` bool,
  `IsCalculatedCalibration` bool,
  `IsValid` bool,
  `IsExpired` bool,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblTestDetails` (
  `IdTestDetails` int,
  `IdTest` int,
  `PrimaryFilter` int,
  `SecondaryFilter` int,
  `IsDelayedR2` bool,
  `IsOutpreparationSample` bool,
  `Linearity` double,
  `SubstrateDeplition` double,
  `IncubationTime` int,
  `ReadingTime` int,
  `CorelationA` double,
  `CorelationB` double,
  `R1Volume` int,
  `R2Volume` int,
  `OutPreparationVolume` int,
  `SampleVolumeNormal` double,
  `SampleVolumeIncrease` double,
  `SampleVolumeDecrease` double,
  `AutoDilutionRatio` int,
  `StirrerSpeedR1` int,
  `StirrerSpeedR2` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int
);

CREATE TABLE `TblResultReads` (
  `IdResultReads` long,
  `IdResult` long,
  `ReadingNumber` int,
  `ReadingTime` DateTime,
  `PrimaryOD` double,
  `PrimaryCount` int,
  `SecondaryOD` double,
  `SecondaryCount` int,
  `ActualOD` double,
  `ReadingMark` int,
  `IsConsideredInCalculation` bool
);

CREATE TABLE `TblResult` (
  `IdResult` long,
  `IdTest` int,
  `IdCalibration` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `Field` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblReflex` (
  `IdReflex` int,
  `IdTest` int,
  `Reflexint` int,
  `LowRefRange` double,
  `HighRefRange` double,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblReflexTests` (
  `IdReflexTests` int,
  `IdReflex` int,
  `IdTest` int
);

CREATE TABLE `TblCalculatedDetails` (
  `IdCalculatedDetails` int,
  `RefLow` double,
  `RefHigh` double,
  `DisplayExpression` nvarchar(20),
  `CalculatedExpression` nvarchar(20),
  `IsActive` bool
);

CREATE TABLE `TblCarryOver` (
  `IdCarryOver` int,
  `IdTest` int,
  `Washint` int,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblCarryOverTests` (
  `IdCarryOverTests` int,
  `IdCarryOver` int,
  `IdAffectedTest` int
);

CREATE TABLE `TblTestProfile` (
  `IdTestProfile` int,
  `ProfileCode` nvarchar(20),
  `ProfileName` nvarchar(20),
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblTestProfileTests` (
  `IdTestProfileTests` int,
  `IdTestProfile` int,
  `IdTestCode` int
);

CREATE TABLE `TblSoftwareSettings` (
  `IdSoftwareSettings` int,
  `IdInstrument` int,
  `IdLanguage` int,
  `IdleLampOffTime` int,
  `IsReflexTestEnabled` bool,
  `IsCarryOverEnabled` bool,
  `IsPowerOnWashing` bool,
  `IsPowerOffWashing` bool,
  `PowerOffLiveReadings` bool,
  `AutoReRun` bool,
  `IsReRunOnLinearity` bool,
  `IsReRunOnSubstrateDepletion` bool,
  `ErrorAudioCue` bool,
  `ErrorBeepFlags` bool,
  `IsConventionalUnit` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

CREATE TABLE `TblInstrument` (
  `IdInstrument` int,
  `InstrumentName` nvarchar(20),
  `PortName` nvarchar(20),
  `TotalCuvetteNo` int,
  `BaudRate` int
);

CREATE TABLE `TblInstrumentSettings` (
  `TblInstrumentSettings` int,
  `IdInstrument` int,
  `IdMotor` int,
  `PositionKey` int,
  `StepValue` int,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `MOdifiedAt` int
);

CREATE TABLE `TblLISSettings` (
  `IdLISSettings` int,
  `LISint` int,
  `SerialPort` nvarchar(20),
  `LISBaudRate` int,
  `IPAddress` nvarchar(20),
  `PortNumber` int,
  `ShouldSendQCData` bool,
  `ShouldSendCalibrationData` bool,
  `ShouldSendAbnormalResults` bool,
  `CreatedBy` int,
  `CreatedAt` DateTime,
  `ModifiedBy` int,
  `ModifiedAt` DateTime
);

CREATE TABLE `TblUnit` (
  `IdUnit` int,
  `UnitName` nvarchar(20),
  `IsConventionalUnit` bool,
  `IsActive` bool
);

CREATE TABLE `TblUnitConversion` (
  `IdUnitConversion` int,
  `ConventionalUnitId` int,
  `SIUnitID` int,
  `MultiplicationFactor` double
);

CREATE TABLE `TblUser` (
  `IdUser` int,
  `Username` nvarchar(20),
  `FirstName` nvarchar(20),
  `LastName` nvarchar(20),
  `Role` int,
  `PasswordHash` nvarchar(20),
  `PasswordUpdatedBy` int,
  `PasswordUpdatedAt` DateTime,
  `CreatedBy` int,
  `CreatedAt` DateTime,
  `ModifiedBy` int,
  `ModifiedAt` DateTIme
);

CREATE TABLE `TblQCLot` (
  `IdQCLot` int,
  `QCLotNo` nvarchar(20),
  `ExpiryDate` DateTIme,
  `QCLevel` int,
  `IsExpired` bool,
  `IsActive` bool,
  `CreatedBy` int,
  `CreatedAt` int,
  `ModifiedBy` int,
  `ModifiedAt` int
);

