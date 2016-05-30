<!DOCTYPE html>
%from bottle import request
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Säkerhetsansvar</h1>
                    <ul class="nav nav-tabs nav-justified">
                         <li role="navigation"><a href="/security">Säkerhetsansvar fattas</a></li>
                         <li role="navigation"><a href="/security_search">Scenschema säkerhetsansvar</a></li>
                         <li role="navigation" class="active"><a href="/schedule_security">Schema säkerhetsansvarig</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <ul class="list-group">

                            <li class="list-group-item contact_persons_band col-md-12">
                                <p class="col-md-3"></p>
                                <p class="col-md-3">Ansvarar för: artister</p>
                                <button type="button" class="btn btn-primary how_contact_bands">+</button>
                                </p>

                                <div class="contacts_bands col-md-12">
                                    <table class="table">
                                        <tr>
                                            <th>Band</th>
                                            <th>Antal medlemmar</th>
                                        </tr>

                                    </table>
                                </div>
                            </li>

                    </ul>
                </div>
            </div>
        </div>
        %include('footer.tpl')
    </body>
</html>
