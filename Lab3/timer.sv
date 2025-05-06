module timer #(
    parameter int CLOCK_FREQ_HZ = 50_000_000,   // Frecuencia del reloj (Hz)
    parameter int seconds_target = 10           // Tiempo objetivo en segundos
)(
    input  logic clk,
    input  logic rst,
	 output reg [6:0] segU,
	 output reg [6:0] segT,
    output logic timeOut,                          // Señal alta al alcanzar el tiempo
    
);
    logic [$clog2(seconds_target+1)-1:0] current_seconds;  // Segundos actuales
    // Contador de ciclos hasta que pase 1 segundo
    logic [$clog2(CLOCK_FREQ_HZ)-1:0] cycle_counter;

    always_ff @(posedge clk) begin
        if (rst) begin
            cycle_counter     <= 0;
            current_seconds   <= 0;
            timeOut              <= 0;
        end else if (!timeOut) begin
            if (cycle_counter == CLOCK_FREQ_HZ - 1) begin
                cycle_counter   <= 0;
                current_seconds <= current_seconds + 1;

                if (current_seconds + 1 == seconds_target)
                    timeOut <= 1;
            end else begin
                cycle_counter <= cycle_counter + 1;
            end
        end
    end

	dec7seg #(
		.N(4)
	) display7seg (
		.value(current_seconds),
		.segU(segUnidades),
		.segT(segDecenas)
	);
endmodule
