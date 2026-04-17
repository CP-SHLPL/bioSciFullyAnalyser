
using Grpc.Net.Client;
using Instrument;
using Org.BouncyCastle.Crypto.Operators;

var config = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json", optional: true)
    .Build();
using var loggerFactory = LoggerFactory.Create(builder =>
{
    builder.AddConsole();
    builder.SetMinimumLevel(LogLevel.Information);
});
var logger = loggerFactory.CreateLogger("InstrumentClient");

//string serverAddress = config["GrpcServerAddress"]
//    ?? throw new InvalidOperationException("GrpcServerAddress is missing in appsettings.json");

//logger.LogInformation("Connecting to server at {Address}", serverAddress);

//using var channel = GrpcChannel.ForAddress(serverAddress);
//var client = new InstrumentData.InstrumentDataClient(channel);

// 4. Setup graceful shutdown via Ctrl+C
var cts = new CancellationTokenSource();
Console.CancelKeyPress += (sender, e) => {
    e.Cancel = true; // Prevent instant kill
    logger.LogInformation("Shutting down...");
    cts.Cancel();
};

//await ListenToServerCommandsAsync(client, logger, cts.Token);


async Task ListenToServerCommandsAsync(InstrumentData.InstrumentDataClient client, ILogger logger, CancellationToken cancellationToken)
{
    //Create a server stream to listen to calls from server. 
    // Handle that stream as per the instrument.
    //All commands have to be sent via the application backend.
    //Initial Polling command will be sent via the backend to start the data flow.
    //After that, the server will send commands to the client(Instrument application) as per the instrument's needs.
    //For example, Start Run will be sent by the server, Any additional stat samples, Stop Run, Pause Run etc. 


    while (!cancellationToken.IsCancellationRequested)
    {
    }
}