# Subscribe to my channel, share and like my videos at
# http://youtube.com/tkorting
#
# Feel free to use and share this code.
#
# Thales Sehn Körting

# this is a basic function to draw current state of image and convolution stage
# parameters:
# figure_id: the id of the figure
# input_image: the image to be drawnow
# actual_row: the actual row of convolution
# actual_column: the actual column of convolution
# rectangle_size: the size of the convolution window
# operation: can be 'c' for 'convolution' or 'p' for 'pooling' to 
#            create a proper rectangle
#
# drw: the output drawing object
function drw = draw_current_state(figure_id, input_image, actual_row, actual_column, rectangle_size, operation = 'c')
  pkg load geometry;
  figure(figure_id);
  set(gca,'YDir','reverse');
  hold on;
  grid off;
  axis off;
  imagesc(input_image);
  if (operation == 'c')
    plot(actual_column, actual_row, 'rx');
    delta_size = floor(rectangle_size / 2);
    drw = drawRect(actual_column - delta_size, actual_row - delta_size, rectangle_size - 1, rectangle_size - 1);
    set(drw, "color", [1 0 0]);
    set(drw, "linewidth", 2);
  elseif(operation == 'p')
    drw = drawRect(actual_column, actual_row, rectangle_size, rectangle_size);
    set(drw, "color", [1 0 0]);
    set(drw, "linewidth", 2);
  endif
  hold off;
endfunction
