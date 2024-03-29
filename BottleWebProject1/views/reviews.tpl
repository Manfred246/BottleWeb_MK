% rebase('layout.tpl', title='Reviews', year=year)

<div>
	%mass = []
	%counter = 0
	%if len(rev) != 0:
		%for i in range(int(count + 1)):
			%if i != 0:
				%for j in rev:
					%for k in range(len(rev[j]['reviews'])):
						%if rev[j]['num'][k] == i:
							%counter += 1
							%mass.append([rev[j]['name'], j, rev[j]['reviews'][k], rev[j]['date'][k]])								
						%end
					%end
				%end
			%end
		%end
	%end

	<header class="site-header">
		<div class="wrapper header-gallery">
			<a class="site-title" href="#">Site Reviews ({{ counter }})</a>
		</div>
	</header>

	<form action="/reviews" method="post">
		<div class="page-content-small">
			<div class="top cardd">
				<p><textarea class="TAcon" cols="50" name="REVIEW" placeholder="Your review"></textarea></p>
				<p><input type="text" size="50" name="USERNAME" placeholder="Your nickname"></input></p>
				<p><input type="text" size="50" name="ADRESS" placeholder="Your email"></input></p>
				<p><button class="btn btn-warning-new" name="BTNSEND" type="submit" value="Send">Send</button></p>
			</div>
		</div>		
		
		%for i in reversed(mass):
			<div class="page-content">
				<div class="ttop cardd">			
					<p class="main-title">{{ i[0] }} ({{ i[1] }})</p>
					<p class="main-text val-text">{{ i[2] }}</p>
					<p class="main-text text-right">{{ i[3] }}</p>
				</div>
			</div>
		%end
	</form>
</div>

 <script>
 const styledSwal = Swal.mixin({
    background: 'linear-gradient(180deg, var(--gradient-four), var(--gradient-three), var(--gradient-one))',
    customClass: {
        confirmButton: 'btn btn-warning'
    },
    buttonsStyling: false
});

$(document).ready(function() {
	 % if message != '':

    styledSwal.fire('{{message}}');

% end
});
 </script>