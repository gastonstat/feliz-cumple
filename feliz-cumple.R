library(magick)

set.seed(20260430)

n = 250

x = runif(n, min = 0, max = 5)
y = runif(n, min = 1, max = 2)
cols = sample(c("#4a84bd", "#4abdbd", "#4abd84"), size = n, replace = TRUE)
cex = runif(n, 2, 5)

plot(x, y, type = "n", xlim = c(0, 5), ylim = c(1, 2))
points(x, y, pch = 21, col = "white",
       cex = sizes, bg = cols)
text(0.5, 1.5, "Feliz\nCumpleaños", adj = 0, cex = 3, col = "orange")


x_lst = list(x[1:50], x[51:100], x[101:150], x[151:200], x[201:250])
y_lst = list(y[1:50], y[51:100], y[101:150], y[151:200], y[201:250])
col_lst = list(cols[1:50], cols[51:100], cols[101:150], cols[151:200], cols[201:250])
cex_lst = list(cex[1:50], cex[51:100], cex[101:150], cex[151:200], cex[201:250])


for (i in 1:5) {
  png(filename = paste0("image", i, ".png"))
  op = par(bg = "#bdbd4a")
  plot(x, y, type = "n", xlim = c(0, 5), ylim = c(1, 2))
  points(unlist(x_lst[1:i]), unlist(y_lst[1:i]), 
         pch = 21, col = "white",
         cex = unlist(cex_lst[1:i]), 
         bg = unlist(col_lst[1:i]))
  text(0.5, 1.5, "Feliz\nCumpleaños", adj = 0, cex = 4, col = "white")
  par(op)
  dev.off()
}


## list file names and read in
imgs <- dir(".", pattern = ".png")
img_list <- lapply(imgs, image_read)

## join the images together
img_joined <- image_join(img_list)

## animate at 2 frames per second
img_animated <- image_animate(img_joined, fps = 2)

## view animated image
img_animated

## save to disk
image_write(image = img_animated,
            path = "felizzz.gif")



# lst = list(
#   plot1 = list(
#     x = x[1:50],
#     y = y[1:50],
#     cols = cols[1:50],
#     sizes = sizes[1:50]),
#   plot2 = list(
#     x = x[51:100],
#     y = y[51:100],
#     cols = cols[51:100],
#     sizes = sizes[51:100]),
#   plot3 = list(
#     x = x[101:150],
#     y = y[101:150],
#     cols = cols[101:150],
#     sizes = sizes[101:150]),
#   plot4 = list(
#     x = x[151:200],
#     y = y[151:200],
#     cols = cols[151:200],
#     sizes = sizes[151:200]),
#   plot5 = list(
#     x = x[201:250],
#     y = y[201:250],
#     cols = cols[201:250],
#     sizes = sizes[201:250])
# )
