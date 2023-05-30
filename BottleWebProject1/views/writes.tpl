% rebase('layout.tpl', title='Articles', year=year)

<div>
	<header class="site-header">
		<div class="wrapper header-gallery">
			<a class="site-title" href="#">Articles</a>
		</div>
	</header>

	<form action="/writes" method="post">
		<div class="page-content-small">
			<div class="top cardd">
				<p class="main-title">Write your article!</p>
				<p><input type="text" size="50" name="TITLE" placeholder="* Article title *"></input></p>
				<p><textarea class="TAcon" rows="2" cols="50" name="ARTICLE" placeholder="Your article"></textarea></p>
				<p><input type="text" size="50" name="AUTHOR" placeholder="Article author"></input></p>

				<svg width="160" height="32" viewBox="0 0 160 32">
				  <defs>
					<mask id="perc">
					  <rect x="0" y="0" width="100%" height="100%" fill="white" />
					  <rect x="48%" y="0" width="100%" height="100%" fill="grey" />
					</mask>

					<symbol viewBox="0 0 32 32" id="star">
					  <path d="M31.547 12a.848.848 0 00-.677-.577l-9.427-1.376-4.224-8.532a.847.847 0 00-1.516 0l-4.218 8.534-9.427 1.355a.847.847 0 00-.467 1.467l6.823 6.664-1.612 9.375a.847.847 0 001.23.893l8.428-4.434 8.432 4.432a.847.847 0 001.229-.894l-1.615-9.373 6.822-6.665a.845.845 0 00.214-.869z" />
					</symbol>
					<symbol viewBox="0 0 160 32" id="stars">
					  <use xlink:href="#star" x="-64" y="0"></use>
					  <use xlink:href="#star" x="-32" y="0"></use>
					  <use xlink:href="#star" x="0" y="0"></use>
					  <use xlink:href="#star" x="32" y="0"></use>
					  <use xlink:href="#star" x="64" y="0"></use>
					</symbol>
				  </defs>
				  <use xlink:href="#stars" fill="#E0A129" stroke="black" mask="url(#perc)"></use>
				</svg>

				<p><button name="BTNSEND" type="submit" value="Send">Send</button></p>
				<p><size="50">{{ message }}</p>
			</div>
		</div>

		%if len(wr) != 0:
			%for i in range(int(count + 1)):
				%if i != 0:
					%for j in wr:
						%for k in range(len(wr[j]['title'])):
							%if wr[j]['num'][k] == i:
								<div class="page-content">
									<div class="ttop cardd">			
										<p class="main-title">{{ wr[j]['title'][k] }}</p>
										<p class="main-text">{{ wr[j]['article'][k] }}</p>
										<p calass="main-text">{{ j }}</p>
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