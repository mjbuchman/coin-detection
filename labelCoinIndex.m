% Used to label the coins index in blue instead of value (for debugging).

function labelCoinIndex(x,y,r,value)
    txt = sprintf('%d',value);
    text(x,y,txt,'FontSize',r/2,'Color','blue','FontWeight','bold','HorizontalAlignment','center');
end