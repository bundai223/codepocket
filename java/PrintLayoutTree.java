	private void PrintViewTree(View view, String padding) {
		if (view instanceof ViewGroup) {
			ViewGroup group = (ViewGroup)view;
			int	num = group.getChildCount();	
			Logger.d(padding + view + "(" + num + ")");

			String newpadding;
			if ("".equals(padding)) {
				newpadding = "|-";
			}
			else {
				newpadding = " " + padding;
			}

			for( int i = 0; i < num; ++i){ 
				View child = group.getChildAt(i);
				PrintViewTree(child, newpadding);
			}
		}
		else {
			Logger.d(padding + view);
		}
	}


