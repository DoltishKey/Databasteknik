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
                        %printed = []
                        %for staff in security:
                            %if staff[3] not in printed:
                                %printed.append(staff[3])
                                <li class="list-group-item contact_persons_band col-md-12">
                                    <p class="col-md-3">{{staff[2]}}</p>
                                    <button type="button" class="btn btn-primary how_contact_bands">+</button>
                                    </p>

                                    <div class="contacts_bands col-md-12">
                                        <table class="table">
                                            <tr>
                                                <th>Scen</th>
                                                <th>Starttid</th>
                                                <th>Sluttid</th>
                                            </tr>
                                            %from datetime import datetime, timedelta
                                            %for item in security:
                                                %if item[3] == staff[3]:
                                                    <tr>
                                                        <td>{{item[0]}}</td>
                                                        <td>{{item[1]}}</td>
                                                        <td>{{(item[1] + timedelta(hours = 4))}}</td>
                                                    </tr>
                                                %end
                                            %end
                                        </table>
                                    </div>
                                </li>
                            %end
                        %end
                    </ul>
                </div>
            </div>
        </div>
        %include('footer.tpl')
    </body>
</html>
