<!DOCTYPE html>
%from bottle import request
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Kontaktperson</h1>
                    <ul class="nav nav-tabs nav-justified">
                         <li role="navigation"><a href="/contact">Saknar kontaktperson</a></li>
                         <li role="navigation"><a href="/contact_by_band">Kontaktpersoner för band</a></li>
                         <li role="navigation" class="active"><a href="/contact_staff">Kontaktpersoner</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <ul class="list-group">
                        %for person in staff:
                            %tot_artist = 0
                            <li class="list-group-item contact_persons_band col-md-12">
                                <p class="col-md-3">{{person[0]}}</p>
                                <p class="col-md-3">Ansvarar för: {{person[2]}} artister</p>

                                <div class="contacts_bands col-md-12">
                                    <table class="table">
                                        <tr>
                                            <th>Band</th>
                                            <th>Antal medlemmar</th>
                                        </tr>
                                        %for band in bands:
                                            %if person[1] == band[3]:
                                                <tr>
                                                    <td>{{band[1]}}</td>
                                                    <td>{{band[2]}}</td>
                                                </tr>
                                            %end
                                        %end
                                    </table>
                                </div>
                            </li>
                        %end
                    </ul>
                </div>
            </div>
        </div>
        %include('footer.tpl')
    </body>
</html>
