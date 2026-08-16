Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C133D4130;
	Sun, 16 Aug 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876896; cv=none; b=eXjGk7YHu2mXPnkRyxe2pf4hdHlsaKEX/VW+AZ7fcALg/1NAl8WBxL9LEhCssR5pARo70NJT+t8hyR5kbXamDppkt5Z0pQO3No+BzHbZfw/F7wJKsx/l/JtyeJpRuw05X66nU12+KwbR+oBgNaFonkHwynwAOGjIBJboaP9aqfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876896; c=relaxed/simple;
	bh=xMZlj9Iiar272c+Gygt8jjleu4chy5Uu1j62qqREqw8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6gRR3Y1ceOswU8vnZqe+gkRATrl8UNl8oLvfumCJ12ILcwJH36nuv5J+spLNlKcH648flRmURACCTK7o1k8Fhy/9BIJbUbj7LvKiFD3IcqH0zgT5WMrXw5Z5clNltxRcTln6UIPiwgJja407YFOQgGar1qXIrkx+FKFkgOUVe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s3wh2fyd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nd19wAlu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vCXdC1s7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kNvJna3T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s3wh2fyd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nd19wAlu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vCXdC1s7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kNvJna3T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C92D53DFB;
	Sun, 16 Aug 2026 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786876818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQjgRTEL5pOCz05NumqaVS/dzntI6SvtoHSPjBDtlyk=;
	b=s3wh2fydDd+SUJcW4R1A/TMpOnLMd1VlEN0jfizRBviyWrOANamBd/zkP42Zd495Rjh0/A
	JBH6t3os64/YMIEPsWWh4EqcYzdi2wItiM0DF9X10qAs4sRuIWK5R9R8y1bIhR+y8pQwP6
	3p/lPfW/ZzYXcMYp1G50Bx5kjtY/WxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786876818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQjgRTEL5pOCz05NumqaVS/dzntI6SvtoHSPjBDtlyk=;
	b=nd19wAluTtCdbuvewLd2a5oUJS5xmlB2NiIYRpJfw6OvHCYlEUHmH5c/zMGJXAbwKJuHdb
	7V7RLTSeIQ6twYBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vCXdC1s7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kNvJna3T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786876813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQjgRTEL5pOCz05NumqaVS/dzntI6SvtoHSPjBDtlyk=;
	b=vCXdC1s7lLU7Wvt0PLJGYRd73yutPmoE+pspXNVS8aRMKaL4I+SzD3ybmmmbadgStNIlzb
	ojZtWFQAHmdhU2F9o96xcsog0uO1RM4miKUSCLYrS4vlMHdw4WQTfzhRxgkl5NFvBnZwLa
	wYfT6iDdBx8uvwGSo4LayU8sALnGVwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786876813;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQjgRTEL5pOCz05NumqaVS/dzntI6SvtoHSPjBDtlyk=;
	b=kNvJna3TfNuuqwPDvImzadWDdAwwsLy587aNI823zLCG5Rr7pjS4rDrewm26JBL5QqugG3
	spC2ZHoWFRBghPCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 828B378E68;
	Sun, 16 Aug 2026 10:40:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FsYDHo2TgWrjaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Aug 2026 10:40:13 +0000
Date: Sun, 16 Aug 2026 12:40:13 +0200
Message-ID: <87zeymcprm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>,
	Kees Cook <kees@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2280f1cca5e6b0c353e4@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_midi2: fix use-after-free in string attribute show path
In-Reply-To: <20260816005434.34018-1-skunkolee@gmail.com>
References: <20260816005434.34018-1-skunkolee@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C92D53DFB
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wanadoo.fr];
	FREEMAIL_CC(0.00)[linuxfoundation.org,suse.de,kernel.org,wanadoo.fr,vger.kernel.org,syzkaller.appspotmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[2280f1cca5e6b0c353e4];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,appspotmail.com:email,suse.de:mid,suse.de:email,suse.de:dkim,syzkaller.appspot.com:url]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sun, 16 Aug 2026 02:54:33 +0200,
Ivy Lopez wrote:
> 
> f_midi2_opts_str_show() takes the string lock internally, but its
> callers dereference the opts->info.<field> pointer before calling it,
> outside the lock. This races with f_midi2_opts_str_store(), which
> frees the old string under opts->lock when the attribute is written
> concurrently, the show path can read a pointer that gets freed
> before the lock inside str_show() is even taken.
> 
> Change f_midi2_opts_str_show() to take a pointer to the string field,
> matching the existing pattern in f_midi2_opts_str_store(), and
> dereference it only after the lock is held. Update all three callers
> (iface_name, block name, and the EP string option macro) accordingly.
> 
> Reported-by: syzbot+2280f1cca5e6b0c353e4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2280f1cca5e6b0c353e4
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
