module Floyds_algorithm_behaviour(); 

    integer infty = 10000;
    integer w[30:0][30:0];
    integer d[30:0][30:0];

    task AddEdge(integer i, integer j, integer weight); begin
            w[i][j] = weight;
            w[j][i] = weight;
        end
    endtask

    
    initial begin
        for (integer i = 0; i <= 30; i++) begin
            for (integer j = 0; j <= 30; j++) begin
                w[i][j] = infty;
            end
        end
        // unfortunately, here is no 'char' data type 
        AddEdge(0, 1, 2);
        AddEdge(0, 2, 4);
        AddEdge(0, 3, 1);
        AddEdge(1, 4, 1);
        AddEdge(1, 2, 3);
        AddEdge(2, 4, 2);
        AddEdge(2, 5, 2);
        AddEdge(3, 5, 5);
        AddEdge(3, 6, 4);
        AddEdge(5, 6, 3);
        AddEdge(4, 7, 3);
        AddEdge(5, 7, 3);
        AddEdge(6, 10, 2);
        AddEdge(5, 9, 4);
        AddEdge(5, 8, 2);
        AddEdge(8, 9, 3);
        AddEdge(9, 10, 6);
        AddEdge(7, 14, 8);
        AddEdge(7, 11, 1);
        AddEdge(8, 11, 3);
        AddEdge(8, 12, 2);
        AddEdge(9, 12, 6);
        AddEdge(9, 13, 3);
        AddEdge(10, 13, 4);
        AddEdge(10, 17, 2);
        AddEdge(11, 12, 3);
        AddEdge(12, 13, 5);
        AddEdge(11, 14, 6);
        AddEdge(12, 14, 4);
        AddEdge(12, 15, 2);
        AddEdge(13, 16, 2);
        AddEdge(13, 17, 1);
        AddEdge(14, 15, 2);
        AddEdge(15, 16, 1);
        AddEdge(16, 17, 8);
        AddEdge(14, 18, 6);
        AddEdge(15, 18, 2);
        AddEdge(15, 19, 1);
        AddEdge(16, 19, 3);
        AddEdge(17, 19, 5);
        AddEdge(18, 25, 2);
        AddEdge(19, 25, 8);

        for (integer i = 0; i <= 30; i++)begin
            for (integer j = 0; j <= 30; j++)begin
                d[i][j] = w[i][j];
            end
        end


        for (integer i = 0; i <= 30; i++) begin
            d[i][i] = 0;
        end

        for (integer i = 0; i <= 30; i++) begin
            for (integer j = 0; j <= 30; j++) begin
                for (integer k = 0; k <= 30; k++) begin
                    if (d[j][i] + d[i][k] < d[j][k])
                        d[j][k] = d[j][i] + d[i][k];
                end
            end
        end

        for (integer i = 0; i <= 30; i++)begin
            for (integer j = 0; j <= 30; j++)begin
                if (d[i][j] == infty)
                    $write("-  ");
                else if (d[i][j] > 9)
                    $write("%0t ", d[i][j]);
                else
                    $write("%0t  ", d[i][j]);
            end
            $display();
        end



    end

endmodule