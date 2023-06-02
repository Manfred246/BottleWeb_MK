% rebase('layout.tpl', title='Articles', year=year)

 <script>
 const styledSwal = Swal.mixin({
    background: 'linear-gradient(180deg, var(--gradient-four), var(--gradient-three), var(--gradient-one))',
    customClass: {
        confirmButton: 'btn btn-warning'
    },
    buttonsStyling: false
});

 % if message != '':

    styledSwal.fire('{{message}}');

% end
 </script>

<div>
	<header class="site-header">
		<div class="wrapper header-gallery">
			<a class="site-title" href="#">Articles</a>
		</div>
	</header>

	<div class="page-content-small">
        <div class="wrapper">            
        </div>
    </div> 

	<form action="/writes" method="post">
		<div class="page-content-small about">
			<div class="top cardd mb-25000">
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
				<p class="main-title">Write your article!</p>
				<p><input type="text" size="50" name="TITLE" placeholder="♡ Article title ♡"></input></p>
				<p><input type="text" size="50" name="IMAGE" placeholder="- image link -"></input></p>
				<p><textarea class="TAcon" rows="2" cols="50" name="ARTICLE" placeholder="(ﾉ´ з `)ノ Your article"></textarea></p>
				<p><input type="text" size="50" name="AUTHOR" placeholder="♡ Article author ♡"></input></p>
				<p><button class="btn btn-warning-new" name="BTNSEND" type="submit" value="Send">Send</button></p>
			</div>
		</div>		

		%mas = []
		%if len(wr) != 0:
			%for i in range(int(count + 1)):
				%if i != 0:
					%for j in wr:
						%for k in range(len(wr[j]['title'])):
							%if wr[j]['num'][k] == i:
								%mas.append([wr[j]['title'][k], wr[j]['article'][k], j, wr[j]['date'][k], wr[j]['image'][k], wr[j]['num'][k]])
							%end
						%end
					%end
				%end
			%end
		%end

		<div class="page-content-small about">
			<div class="top cardd mt-25000">
				<p class="main-title">List of Articles</p>
				<img height="425px" class="round-new" src="https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQPjutZ9txmd5DBd_DK_pLRo5eMWVHq5MpZBgAxYi6EGXfdv2cj53_zbNR8VZH932q9"/>
				<select onchange="window.location.href=this.options[this.selectedIndex].value">
					%for i in reversed(mas):													
						<option value="#{{ i[5] }}">{{ i[0] }}</option>								
					%end
				</select>	
			</div>
		</div>

		%for i in reversed(mas):
			<a id= {{ i[5] }}></a>
			<div class="page-content">
				<div class="ttop cardd">			
					<p class="main-title">{{ i[0] }}</p>
					<image height="500px" class="round" src= {{ i[4] }}/></br>
					<p class="main-text val-text">{{ i[1] }}</p>					
					<p class="main-text text-right">{{ i[2] }} - {{ i[3] }}</p>
				</div>
			</div>
		%end		
	</form>
</div>