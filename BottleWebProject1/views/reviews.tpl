% rebase('layout.tpl', title=title, year=year)

<div>
	<header class="site-header">
		<div class="wrapper header-gallery">
			<a class="site-title" href="#">Site Reviews</a>
		</div>
	</header>

	<form action="/reviews" method="post">
		<div class="page-content">
			<div class="ttop cardd">			
				<p class="main-title">Dcryde (dcryde@yandex.ru)</p>
				<p class="main-text">WTF?</p>
			
				<p><textarea class="TAcon" rows="2" cols="50" name="REVIEW" placeholder="Your review"></textarea></p>
				<p><input type="text" size="50" name="USERNAME" placeholder="Your nickname"></p>
				<p><input type="text" size="50" name="ADRESS" placeholder="Your email"></p>
				<p><input class="btn btn-default" type="submit" value="Send">
				<p><size="50">{{ message }}</p>
			</div>
		</div>
	</form>
</div>