#
# ja/spamfilter.rb: resource of ja $Revision: 1.10 $
#

@spamfilter_label_conf = 'spam�ե��륿'

def spamfilter_conf_html
	r = <<-HTML
	<h3>spam�ΰ���</h3>
	<p>spam��Ƚ�ꤵ�줿�ĥå��ߤ�
		<select name="spamfilter.filter_mode">
			<option value="true"#{" selected" if @conf['spamfilter.filter_mode']}>��ɽ���ˤ���</option>
			<option value="false"#{" selected" unless @conf['spamfilter.filter_mode']}>�ΤƤ�</option>
	</select></p>

	<h3>���Ƥˤ��ե��륿</h3>
	<p>�ĥå������URL�ο���<input type="text" name="spamfilter.max_uris" value="#{CGI.escapeHTML(@conf['spamfilter.max_uris'].to_s)}" size="5">�Ĥ�Ķ������spam�Ȥߤʤ�</p>
	<p>�ĥå������URL��ɽ��ʸ���������礬<input type="text" name="spamfilter.max_rate" value="#{CGI.escapeHTML(@conf['spamfilter.max_rate'].to_s)}" size="5">%���⤤��Τ�spam�Ȥߤʤ�</p>
	<p>�ĥå�����ʸ���ʲ��Υѥ���������ƤϤޤ����spam�Ȥߤʤ�������ɽ�������ѤǤ��ޤ�<br>
		<textarea name="spamfilter.bad_comment_patts" cols="70" rows="5">#{CGI.escapeHTML(@conf['spamfilter.bad_comment_patts'] || '')}</textarea></p>
	<p>�ĥå��ߤΥ᡼�륢�ɥ쥹���ʲ��Υѥ���������ƤϤޤ����spam�Ȥߤʤ�������ɽ�����Ȥ��ޤ�<br>
		<textarea name="spamfilter.bad_mail_patts" cols="70" rows="5">#{CGI.escapeHTML(@conf['spamfilter.bad_mail_patts'] || '')}</textarea></p>
	<p>�ĥå��ߤ��󥯸��˴ޤޤ��URL�ˡ��ʲ��Υѥ����󤬴ޤޤ�����spam�Ȥߤʤ�<br>
		<textarea name="spamfilter.bad_uri_patts" cols="70" rows="5">#{CGI.escapeHTML(@conf['spamfilter.bad_uri_patts'] || '')}</textarea></p>
	<p>��Υѥ������ĥå��ߤΥ᡼�륢�ɥ쥹�Υ����å��ˤ�
		<select name="spamfilter.bad_uri_patts_for_mails">
			<option value="true"#{" selected" if @conf['spamfilter.bad_uri_patts_for_mails']}>���Ѥ���</option>
			<option value="false"#{" selected" unless @conf['spamfilter.bad_uri_patts_for_mails']}>���Ѥ��ʤ�</option>
		</select></p>

	<h3>���դ��ˤ��ե��륿</h3>
	<p><input type="text" name="spamfilter.date_limit" value="#{CGI.escapeHTML(@conf['spamfilter.date_limit'].to_s)}" size="5">���ʾ��������դ��ؤΥĥå��ߤ�spam�Ȥߤʤ�<br>(��������¤ʤ���0�������Τ�)</p>

	<h3>IP���ɥ쥹�ˤ��ե��륿</h3>
	<p>�ĥå��ߤ�TrackBack��������IP���ɥ쥹�����ʲ��Υѥ���������ƤϤޤ����spam�Ȥߤʤ�(�ꥹ�Ȥˤϴ�����IP���ɥ쥹�ޤ��ϡ�.�פǽ����IP���ɥ쥹�ΰ����򵭽Ҥ���)<br>
		<textarea name="spamfilter.bad_ip_addrs" cols="70" rows="5">#{CGI.escapeHTML(@conf['spamfilter.bad_ip_addrs'] || '')}</textarea></p>
	</p>
	<p>TrackBack�������ȼºݤΥ����Ȥ�IP���ɥ쥹���ۤʤ����
		<select name="spamfilter.resolv_check">
			<option value="true"#{" selected" if @conf['spamfilter.resolv_check']}>spam�Ȥߤʤ�</option>
			<option value="false"#{" selected" unless @conf['spamfilter.resolv_check']}>spam�Ȥߤʤ��ʤ�</option>
		</select>
	</p>
	<p>��ξ��ˤ�ä�spam�Ȥߤʤ��줿TrackBack��
		<select name="spamfilter.resolv_check_mode">
			<option value="true"#{" selected" if resolv_check_mode}>��ɽ���ˤ���</option>
			<option value="false"#{" selected" unless resolv_check_mode}>�ΤƤ�</option>
		</select>
	</p>
   <h3>�֥�å��ꥹ�ȥ����ӥ���Ȥä��ե��륿</h3>
   <p>�֥�å��ꥹ���䤤��碌�����С�����ꤷ�ޤ�<br>
   <textarea name="spamlookup.domain.list" cols="70" rows="5">#{CGI::escapeHTML( @conf['spamlookup.domain.list'] )}</textarea></p>
   <p>�ʲ��˻��ꤷ���ɥᥤ��ϥ֥�å��ꥹ�Ȥ��䤤��碌�ޤ��󡣸������󥸥�������ꤷ�Ƥ�������<br>
   <textarea name="spamlookup.safe_domain.list" cols="70" rows="5">#{CGI::escapeHTML( @conf['spamlookup.safe_domain.list'] )}</textarea></p>
   HTML
   
	unless @conf.secure then
	r << <<-HTML
	<h3>�ե��륿�Υ���</h3>
	<p>�ե��륿�Υ�����ʲ��Υե������
		<select name="spamfilter.debug_mode">
			<option value="true"#{" selected" if @conf['spamfilter.debug_mode']}>��Ͽ����</option>
			<option value="false"#{" selected" unless @conf['spamfilter.debug_mode']}>��Ͽ���ʤ�</option>
		</select></p>
	<p>�ե�����̾: <input type="text" name="spamfilter.debug_file" value="#{CGI.escapeHTML(@conf['spamfilter.debug_file'] || '')}" size="50"></p>
	HTML
	end

	r
end