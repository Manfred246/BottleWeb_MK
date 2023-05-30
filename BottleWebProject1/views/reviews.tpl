% rebase('layout.tpl', title=title, message=message, year=year)

<div>
	<header class="site-header">
		<div class="wrapper header-gallery">
			<a class="site-title" href="#">Site Reviews</a>
		</div>
	</header>

	<form action="/reviews">
		<div class="page-content">
			<div class="top cardd">
				<p><textarea class="TAcon" rows="2" cols="50" name="REVIEW" placeholder="Your review"></textarea></p>
				<p><input type="text" size="50" name="USERNAME" placeholder="Your nickname"></input></p>
				<p><input type="text" size="50" name="ADRESS" placeholder="Your email"></input></p>
				<p><input class="btn btn-default" name="reviews_btn" type="submit" value="Send"></input></p>
				<p><size="50">{{ message }}</p>
			</div>
		</div>
		%if len(rev) != 0:
			%for i in range(len(rev)):
				%for j in range(len(rev[i]['REVIEWS'])):
					<div class="page-content">
						<div class="ttop cardd">			
							<p class="main-title">{{rev[i]['NAME']}} ({{rev[i]}})</p>
							<p class="main-text">rev[i][j]</p>											
						</div>
					</div>
				%end
			%end
		%end
	</form>
</div>