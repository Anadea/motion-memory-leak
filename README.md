When we try to process ~35 mb line by line, storing strings in variable and then convert this string to NSData we get memory leak. For 35 mb text file we see in active monitor 288 mb released memory. Even autorelease_pool method doesn't help us.

Look at the app_delegate file of project.

Can you explain us this situation? Can we avoid it?