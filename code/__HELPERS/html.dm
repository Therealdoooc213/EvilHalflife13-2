/proc/button_element(trg, text, action, class, style)
	return "<a href='?src=\ref[trg];[action]' onClick='event.stopPropagation();' [class ? "class='[class]'" : ""] style='cursor:pointer;[style]'>[text]</a>"
