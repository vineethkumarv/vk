module one;
string a,b;
initial begin
a="hi";
$display("a value is %0s",a);
$sformat(b," hello");

$display("b value is %0s",b);
a={a,$sformatf(b," hai hello")};
$display("a value is %0s",a);
$display("b value is %0s",b);
$display("%0s",a);
$display("a value is\"%s\"",a);
end
endmodule


module top;
string res="some string";
string id="ID1";
string name1="Ram";
string name2="Singh";
string filename="test.sv";
int line=3;
string verbosity="High";
int fd1;

initial begin
  res=$sformatf("<message ctxt=\"%s\" kind=\"%s\" id=\"%s\" location=%s:%0d
  verbosity=\"%s\" time=\"%0t\">%s</message>\n",name1,name2,id,filename,line,verbosity,$realtime,res);
  $display(res);
  fd1 = $fopen("data_txt", "w");
  $fwrite(fd1, "%s\n", res);
  $fdisplay(fd1,"\n........................");
  $fclose(fd1);
  $fopen("data_txt","r+");
  $fwrite(fd1,"\n@@@HI mocking your data written from here");
  $fclose(fd1);
end
endmodule

module hand;
int b;
string k;

initial begin
b=$fopen("example_file","r");
$display($fgets(k,b));
$display(k);
$fclose(b);
b=$fopen("example_file","a");
k="kannulu vaechi undali";
$fwrite(b,k);
$fclose(b);
b=$fopen("example_file","r");
repeat (2) begin
$display($fgets(k,b));
end
$display(k);
$fclose(b);


end
endmodule
