%from bottle import request
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand active" href="/">HEM</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                %if request.path == "/book_band":
                    <li role="presentation" class="active"><a href="/book_band">Lägg till band</a></li>
                %else:
                    <li role="presentation"><a href="/book_band">Lägg till band</a></li>
                %end

                %if request.path == "/staff":
                    <li role="presentation" class="active"><a href="/staff">Personal</a></li>
                %else:
                    <li role="presentation"><a href="/staff">Personal</a></li>
                %end

                %if request.path == "/add_play" or request.path == "/edith_play":
                    <li role="presentation" class="active"><a href="/add_play">Spelningar</a></li>
                %else:
                    <li role="presentation"><a href="/add_play">Spelningar</a></li>
                %end

                %if request.path == "/security" or request.path == "/security_search":
                    <li role="presentation" class="active"><a href="/security">Säkerhetsansvarig</a></li>
                %else:
                    <li role="presentation"><a href="/security">Säkerhetsansvarig</a></li>
                %end

                %if request.path == "/contact":
                    <li role="presentation" class="active"><a href="/contact">Kontaktperson</a></li>
                %else:
                    <li role="presentation"><a href="/contact">Kontaktperson</a></li>
                %end

            </ul>
        </div>
    </div>
</nav>
