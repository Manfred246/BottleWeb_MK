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
			%for i in rev:
				%for j in range(len(rev[i]['reviews'])):
					<div class="page-content">
						<div class="ttop cardd">			
							<p class="main-title">{{ rev[i]['name'] }} ({{ list(rev.keys())[list(rev.values()).index(rev[i])] }})</p>
							<p class="main-text">{{ rev[i]['reviews'][j] }}</p>											
						</div>
					</div>
				%end
			%end
		%end
	</form>
</div>