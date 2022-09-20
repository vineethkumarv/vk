module enums;
enum{thursday,monday,saturday,tuesday,friday,sunday,wednesday}days;
string days_arr[];
bit b=0;
initial begin
  days_arr='{"monday","tuesday","wednesday","thursday","friday","saturday","sunday"};
 // if(days.num() == days_arr.size())begin
  for (int j=0;j<days_arr.size();j++)begin
    for(int i=0;i<7;i++)begin //$display("%s and %p",days.name,days_arr[i]);
      if(days_arr[j]== days.name[i])begin  $display("%s",days.name); break;end
      else begin b=0; end
      days=days.next();
    end
  end
  /*if(b)begin
    for (int i=0;i<days_arr.size;i++)begin
      $display("%s",days_arr[i]);
  end
end
else begin $display("not working");end*/
//end
end
endmodule
/* else if(days.name=="tuesday")begin
  $display(days.name);
  break;
end
else if(days.name=="wednesday")begin
  $display(days.name);
  break;
end
else if(days.name=="thursday")begin
  $display(days.name);
  break;
end
else if(days.name=="friday")begin
  $display(days.name);
  break;
end
else if(days.name=="saturday")begin
  $display(days.name);
  break;
end
else if(days.name=="sunday")begin
  $display(days.name);
  break;
end
days=days.next;
end
end
endmodule*/
