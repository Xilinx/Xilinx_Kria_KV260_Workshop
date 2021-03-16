module counter(
    input clk,
    input rst,
    output reg [7:0] Q
    );
 
always @ (posedge(clk), posedge(rst))   // When will Always Block Be Triggered
begin
    if (rst == 1'b1)
        // How Output reacts when Reset Is Asserted
        Q <= 8'b0;
    else
        // How Output reacts when Rising Edge of Clock Arrives?
        Q <= Q + 1'b1;
end
 
endmodule
