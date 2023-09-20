// 10101 Overlapping Sequence

module sequence_detector(
  input in,clk,rst,
  output reg out,
  output reg [2:0]state
);
  reg [2:0]next_state;
  reg yes;
  parameter A=3'b000;
  parameter B=3'b001;
  parameter C=3'b010;
  parameter D=3'b011;
  parameter E=3'b100;
  parameter DETECTED=3'b101;


    always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= A;
    end else begin
      state <= next_state;
    end
  end
  always @(*) begin
      case(state)
        A:if(in)begin next_state<=B;end
          else begin next_state<=A;end
        B:if(in)begin next_state<=B;end
          else begin next_state<=C;end
        C:if(in)begin next_state<=D;end
          else begin next_state<=A;end
        D:if(in)begin next_state<=B;end
          else begin next_state<=E;end
        E:if(in)begin next_state<=DETECTED;end
          else begin next_state<=A;end
        DETECTED: begin
        next_state <= D;
      end
        default: begin
        next_state <= A;
      end
      endcase
    out = (state==DETECTED)?1'b1:1'b0;
    end

endmodule
