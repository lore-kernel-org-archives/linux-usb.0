Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949841;
	b=FdKQ/5I8AWWaOcCScnaIL3+8DPed6t6UY6CU2Mo76PB3mpCLYxme39NMi7l2tTZ8MDXs
	 W8ArJUwTSgFJQ6PgzgT7VVoNwABiDAaDVKOmU3npqaSzTt1XSmXtygMKLyBGtXEPousZ7
	 R6sOXUG4xvP764LsymPzdF7a3gLVdLN3DQOe1Id7y0cSORn3s/lQnmIdESQhCdTbxISBf
	 3QRxagi9voazsph3Q73f9mnFptXBFab+P17ZncK3ojuPaAczHu8d6gnjK9YtkzQdWBK0F
	 NL2mVVRM37kFNvVf1SSIBAtOvRMVZQ5sXG8rNGYa1jqgeIriHtwBb2vCY6q39pNacIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949841;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=SAzgekvvunqkce1NZOZDolcNJqF/8XhHh2Se6M+aoA4=;
	b=gkEqyRpRz2Zuyc9/va6khCCaQ4ombsHisxdvssXV5o+Kz8aMjX2HNcs9G6be9+kXmBxw
	 t9QCv9763b/eWnG3n1HOjUXLXExHQd0CmSDslgWUlDmnQ6JfLeOX6fk0zUBNXk8HcDPFz
	 xlvFsAtiHXXM7PvBrT7yqQCt7MeMVH1VkbAts4RZvyWvHNJKDaEZmnh7mwxmEdwHV9yR4
	 8iQqCBWuaQjEaii1rZwfRELwH+QqOEl49q8UbQ8+oTaP6ib09/NngXf0zrL4+elDu0KuG
	 2AMzncqDrdxJsL4fs/owtPRcGzU5VK9V6Dpsks6684kI47UY1twhK69McCfhoKfV+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vsHONtUe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hv5sOgSa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1yI8oafQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Jlajyevd;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D404606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 21:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D404606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vsHONtUe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hv5sOgSa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1yI8oafQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Jlajyevd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 624CF220D6;
	Tue, 17 Nov 2026 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794949838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAzgekvvunqkce1NZOZDolcNJqF/8XhHh2Se6M+aoA4=;
	b=vsHONtUe1PrdHBMUIvQY3V6m+c7g+FHW0UXQvB+JPZrbUMW/n8uNMdeQnzAt2qzZB/1AO5
	WzXojYyAx828cJuHS4n1ZjwCWRsHZ0Ih1oTu/FUCpw99T6VU1WpA6KysTq7ykCBxDjl2PX
	v24oXxz/Qo754OQG0+Rt/SS38RiG3bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794949838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAzgekvvunqkce1NZOZDolcNJqF/8XhHh2Se6M+aoA4=;
	b=hv5sOgSald208w3xB+WxAZ3xRMCdPBYt+pKiv78YzrjwOMYYherUpOVrX+mZyigCjoGtra
	6si70xd2G0fo0kCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1yI8oafQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jlajyevd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794949836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAzgekvvunqkce1NZOZDolcNJqF/8XhHh2Se6M+aoA4=;
	b=1yI8oafQn02cDHmjNWcRrIc7UR0W/vBxF7rxojw37fzxM9oJ62L2oPVDOJ8uWTbFxiiK0X
	qhxxE2ZjcsrdiyeV2xk1RWKmxW0yReMHz/Ns3bA25wGPpGw7+gvRoFGu6XjW9yob8RJLGj
	2uzrtgfA7j+XlQ58Xs77MPu2E+tbVnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794949836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAzgekvvunqkce1NZOZDolcNJqF/8XhHh2Se6M+aoA4=;
	b=JlajyevdNXKTAjDcZ9iHlLOP2SKSO1Vdo7voMFG7q0ojH1DRBgfZNRLkMfKGuEGZWLfmwk
	hhXKBAdlLrsnhVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB1441334C;
	Tue, 17 Nov 2026 21:10:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eYAqL8vC/GoHXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 21:10:35 +0000
Date: Tue, 17 Nov 2026 22:10:35 +0100
Message-ID: <87a4n7xiyc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Takashi Iwai <tiwai@suse.de>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: avoid redundant strlen() in make_name_string()
In-Reply-To: <839e190e-6377-4585-b68a-b672e5b4a13e@yandex.ru>
References: <20261117170207.642330-1-dmantipov@yandex.ru>
	<87jymbxs8k.wl-tiwai@suse.de>
	<87fqwzxra7.wl-tiwai@suse.de>
	<839e190e-6377-4585-b68a-b672e5b4a13e@yandex.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[yandex.ru];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yandex.ru];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 624CF220D6

On Tue, 17 Nov 2026 20:08:01 +0100,
Dmitry Antipov wrote:
> 
> On 11/17/26 9:10 PM, Takashi Iwai wrote:
> 
> >> Hmm, does it really result in the same?  Wouldn't you need to
> >> decrement p at first before the loop?
> > 
> > ... and looking again, I think it's a bug in my original code ;)
> > 
> >> And I guess this can be better replaced with strim().
> > 
> > ... which can be fixed by replacing with strim() gracefully.
> > 
> > Care to resubmit as a fix?
> 
> strim() implies strlen() which is not actually needed here :-).
> So (assuming I've hit an original intention) I'm voting for:
> 
> void make_name_string(char *s)
> {
> 	char *p;
> 
> 	p = strchrnul(s, '\n');
> 	if (*p)
> 		*p = 0;
> 
> 	while (--p > s && isspace(*p))
> 		*p = 0;
> }
> 
> Note this trims " \n" to " " (string of the only space character).
> If this is not what we want here,
> 
> while (--p >= s && isspace(*p))
> 
> converts " \n" to an empty string.

For that code path, chasing for performance with open-code has no
merit.  A simpler code would have much more benefit, instead.

Basically make_name_string() call can be simply replaced strim(), and
you can get rid of buggy (or error-prone) open code.


Takashi
