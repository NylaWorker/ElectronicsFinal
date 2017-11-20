/* math.v - Verilog code to call the math PLI applications */
module math;
   real x;
   initial 
     begin
	$display("$exp(2.0) = %f",      $exp(2.0));
	$display("$log(44.0) = %f",     $log(44.0));
	$display("$log10(100.0) = %f",  $log10(100.0));
	$display("$log10(555.0) = %f",  $log10(555.0));
        $display("$sin(3.14159) = %f",  $sin(3.14159));
        $display("$sqrt(16.9) = %f",    $sqrt(16.9));
        $display("$pow(3.1, 4.1) = %f", $pow(3.1, 4.1));
     end
endmodule // math
