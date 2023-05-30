% rebase('layout.tpl', title='Reviews', year=year)

<div>
	<header class="site-header">
		<div class="wrapper header-gallery">
			<a class="site-title" href="#">Site Reviews</a>
		</div>
	</header>

	<form action="/reviews" method="post">
		<div class="page-content">
			<div class="top cardd">
				<p><textarea class="TAcon" rows="2" cols="50" name="REVIEW" placeholder="Your review"></textarea></p>
				<p><input type="text" size="50" name="USERNAME" placeholder="Your nickname"></input></p>
				<p><input type="text" size="50" name="ADRESS" placeholder="Your email"></input></p>
				<p><button name="BTNSEND" type="submit" value="Send">Send</button></p>
				<p><size="50">{{ message }}</p>
			</div>
		</div>
		%if len(rev) != 0:
			%for i in range(int(count + 1)):
				%if i != 0:
					%for j in rev:
						%for k in range(len(rev[j]['reviews'])):
							%if rev[j]['num'][k] == i:
								<div class="page-content">
									<div class="ttop cardd">			
										<p class="main-title">{{ rev[j]['name'] }} ({{ j }})</p>
										<p class="main-text">{{ rev[j]['reviews'][k] }}</p>											
									</div>
								</div>
							%end
						%end
					%end
				%end
			%end
		%end
	</form>
</div>