<html>
<head>
       <style type="text/css">
           @font-face {
               font-family: "bvrocrb";
               font-style: normal;
               font-weight: normal;
               src: url(${police_absolute_path('ocrbb.ttf')}) format("truetype");
           }
           .ocrbb{
             text-align:right;
             font-family:bvrocrb;
             font-size:${str(company.bvr_scan_line_font_size or '0.0').replace(',','.')}pt;
             position:absolute;top:${str(company.bvr_scan_line_vert or '0.0').replace(',','.')}mm;
             left:${str(company.bvr_scan_line_horz or '0.0').replace(',','.')}mm;
             z-index:4;
             letter-spacing:str(company.bvr_scan_line_letter_spacing or '0.0').replace(',','.')
           }

           .slip_address_b {
            position:absolute;
            top:${str(215 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
            left:${str(5 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;

           }

         .slip_bank_acc {
           font-family:Helvetica;
           font-size:8pt;
           border-width:0px;
           padding-left:0mm;
           padding-top:0mm;
           position:absolute;
           top:${str(194 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
           left:${str(30 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
          }

         .slip_bank_add_acc {
           font-family:Helvetica;
           font-size:8pt;
           border-width:0px;
           padding-left:0mm;
           padding-top:0mm;
           position:absolute;
           top:${str(160 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
           left:${str(5 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
          }

          .slip_comp {
              font-family:Helvetica;
              font-size:8pt;
              border-width:0px;
              padding-left:0mm;
              padding-top:0mm;
              position:absolute;
              top:${str(175+ (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
              left:${str(5 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
           }

           .slip_add {
             font-family:Helvetica;
             font-size:8pt;
             border-width:0px;
             padding-left:0mm;
             padding-top:0mm
           }

           .slip_amount {
             width:5cm;
             text-align:right;
             font-size:11pt;
             font-family:Helvetica;
             position:absolute;
             top:${str(203 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
             left:${str(7 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
           }

           /*
            Slip 2 element
           */

           .slip2_address_b {
             position:absolute;
             top:${str(200 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
             left:${str(130 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
           }


         .slip2_bank_acc {
           font-family:Helvetica;
           font-size:8pt;
           border-width:0px;
           padding-left:0mm;
           padding-top:0mm;
           position:absolute;
           top:${str(194 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
           left:${str(90 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
          }



         .slip2_bank_add_acc {
           font-family:Helvetica;
           font-size:8pt;
           border-width:0px;
           padding-left:0mm;
           padding-top:0mm;
           position:absolute;
           top:${str(160 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
           left:${str(65 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
          }


         .slip2_ref {
              text-align:right;
              font-size:11pt;
              font-family:Helvetica;
              position:absolute;
              top:${str(185 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
              left:${str(130 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
           }

           .slip2_comp {
             font-family:Helvetica;
             font-size:8pt;
             border-width:0px;
             padding-left:0mm;
             padding-top:0mm;
             position:absolute;
             top:${str(175+ (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
             left:${str(65 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
           }

           .bvr_background {
               width:210mm;
               height:106mm;
               border:0;
               margin:0;
               position:absolute;
               z-index:-10;
               top:${str(151.2+ (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
               left:${str(0 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
           }

           .slip2_amount {
             width:5cm;
             text-align:right;
             font-size:11pt;
             font-family:Helvetica;
             position:absolute;
             top:${str(203 + (company.bvr_delta_vert or 0.0)).replace(',','.')}mm;
             left:${str(67 + (company.bvr_delta_horz or 0.0)).replace(',','.')}mm;
           }

          ${css}
    </style>

   </head>
   <body topmargin="0px">

       %for inv in objects :
       <% setLang(inv.partner_id.lang) %>
       <!--adresses + info block -->
        <table class="dest_address"  style="position:absolute;top:6mm;left:15mm;width:230px;word-wrap:break-word">

               %if inv.partner_id.title:
               <tr><td>${inv.partner_id.title.name}</tr></td>
               %endif
               %if inv.partner_id.name:
               <tr><td>${inv.partner_id.name}</td></tr>
               %endif
               <tr><td>${inv.partner_id.street or ''|entity}</td></tr>
               <tr><td>${inv.partner_id.street2 or ''|entity}</td></tr>
               <tr><td>${inv.partner_id.zip or ''|entity} ${inv.partner_id.city or ''|entity}</td></tr>
               %if inv.partner_id.country_id :
               <tr><td>${inv.partner_id.country_id.name or ''|entity} </td></tr>
               %endif
           </table>

       <div style="position:absolute;top:60mm; left:10mm">
           <b>${_('Payment slip for:')}</b> ${inv.number or ''|entity}
           <br/>
       </div>

       <div id="cont_${inv.id}" style="padding-left:20mm;padding-top:0;padding-bottom:10;height:180mm">
        <!-- Your communication message here -->
       </div>
    %if company.bvr_background:
    <img name="bvr_background" id="bvr_background" class="bvr_background" alt="bvr" src="${bvr_absolute_path()}" />
    %endif
    <!-- slip 1 elements -->
       <div id="slip_address_b" class="slip_address_b">
         <table class="slip_add">
           <tr><td>${_space(_get_ref(inv))}</td></tr>
           <tr><td>
               %if title:
               ${inv.partner_id.title.name or ''|entity}&nbsp;
               %endif
               ${inv.partner_id.name |entity}</td></tr>
           <tr><td>${inv.partner_id.street or ''|entity}</td></tr>
           <tr><td>${inv.partner_id.street2 or ''|entity}</td></tr>
           <tr><td>${inv.partner_id.zip or ''|entity} ${inv.partner_id.city or ''|entity}</td></tr>
       </table>
       </div>
       %if inv.partner_bank_id and inv.partner_bank_id.print_bank and inv.partner_bank_id.bank:
         <div id="slip_bank_add_acc" class="slip_bank_add_acc">
           ${inv.partner_bank_id.bank.name or ''} <br/>
           ${inv.partner_bank_id.bank and inv.partner_bank_id.bank.zip or ''}&nbsp;${inv.partner_bank_id.bank and inv.partner_bank_id.bank.city or ''}
         </div>
       %endif


       <div id="slip_bank_acc" class="slip_bank_acc">${inv.partner_bank_id.print_account and inv.partner_bank_id.acc_number or ''}</div>

       <div id="slip_amount" class="slip_amount"><span >${"&nbsp;".join(_space(('%.2f' % inv.amount_total)[:-3], 1))}</span>  <span style="padding-left:6mm">${"&nbsp;".join(_space(('%.2f' % inv.amount_total)[-2:], 1))}</span></div>

       %if  inv.partner_bank_id.print_partner:
       <div id="slip_comp" class="slip_comp">
        <table class="slip_add">
            <tr><td>${user.company_id.partner_id.name}</td></tr>
            <tr><td>${user.company_id.partner_id.address[0].street}</td></tr>
            <tr><td></td></tr>
            <tr><td>${user.company_id.partner_id.address[0].city} ${user.company_id.partner_id.address[0].zip}</td></tr>
        </table>
      </div>
      %endif

    <!-- slip 2 elements -->
       <div id="slip2_ref" class="slip2_ref" >${_space(_get_ref(inv))}</div>
       <div id="slip2_amount" class="slip2_amount"><span>${"&nbsp;".join(_space(('%.2f' % inv.amount_total)[:-3], 1))}</span>  <span style="padding-left:6mm">${"&nbsp;".join(_space(('%.2f' % inv.amount_total)[-2:], 1))}</span></div>
       <div id="slip2_address_b" class="slip2_address_b">
           <table class="slip_add">
               <tr><td>
                   %if title:
                   ${inv.partner_id.title.name or ''|entity}
                   %endif
                   ${inv.partner_id.name |entity}</td></tr>
               <tr><td>${inv.partner_id.street or ''|entity}</td></tr>
               <tr><td>${inv.partner_id.street2 or ''|entity}</td></tr>
               <tr><td>${inv.partner_id.zip or ''|entity} ${inv.partner_id.city or ''|entity}</td></tr>
           </table></td>
       </div>

       %if inv.partner_bank_id.print_partner:
       <div id="slip2_comp" class="slip2_comp">
           <table class="slip_add">
               <tr><td>${user.company_id.partner_id.name}</td></tr>
               <tr><td>${user.company_id.partner_id.address[0].street}</td></tr>
               <tr><td></td></tr>
               <tr><td>${user.company_id.partner_id.address[0].city} ${user.company_id.partner_id.address[0].zip}</td></tr>
           </table>
       </div>
       %endif

       %if inv.partner_bank_id and inv.partner_bank_id.print_bank and inv.partner_bank_id.bank:
         <div id="slip2_bank_add_acc" class="slip2_bank_add_acc">
           ${inv.partner_bank_id.bank.name or ''} <br/>
           ${inv.partner_bank_id.bank and inv.partner_bank_id.bank.zip or ''}&nbsp;${inv.partner_bank_id.bank and inv.partner_bank_id.bank.city or ''}
         </div>
       %endif

       <div id="slip2_bank_acc" class="slip2_bank_acc">${inv.partner_bank_id.print_account and inv.partner_bank_id.acc_number or ''}</div>
    <!--- scaner code bar -->
    <div colspan="2" class="ocrbb">${mod10r('01'+str('%.2f' % inv.amount_total).replace('.','').rjust(10,'0'))}&gt;${_get_ref(inv)}+&nbsp;${inv.partner_bank_id.acc_number.split('-')[0]+(str(inv.partner_bank_id.acc_number.split('-')[1])).rjust(6,'0')+inv.partner_bank_id.acc_number.split('-')[2]}&gt;</div>

    %endfor
</body>
</html>