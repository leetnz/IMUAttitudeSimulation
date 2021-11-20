function plotDynamics(t, x, dx, ddx, u, name)
   figure;
   cm = lines(4);

   subplot(3, 1, 1); plot(t, x, 'color', cm(1,:));
   grid on;
   legend([name]);
   subplot(3, 1, 2); plot(t, dx, 'color', cm(2,:));
   legend(["d"+name]);
   grid on;

   subplot(3, 1, 3); 
   hold on;
   plot(t, ddx, 'color', cm(3,:));
   plot(t, u, 'color', cm(4,:));
   hold off;
   legend(["dd"+name, "u_"+name]);
   grid on;
   
   subplot(3, 1, 1);
   title(name);
end

