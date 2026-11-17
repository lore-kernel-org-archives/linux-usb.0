Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939043;
	b=eMO/dFxDNIFklXogUAkoWqwkDk5YWjBt0wCvS8Q1cn+JsEULwI6Rzg+HrrwjlmsBs3Zp
	 VWCbjA8pPU/Hictb1gZor4ASbtkHKhh4zAu/x34Kk9BFC3yRF78YSLoyLVlhHZGKEJFem
	 bNaIgPmHeE90vLUoHDpOP9TIhaDU3LgsYQDI1vtODbyA2r0WeaUrRUMNy0kBqLSMzwD/F
	 gj1s2uHavHvnxkhrQW0vAZ52Dgv1MdFpXuM61gsagmF+z2tbC/z855i04D20E/Dtioz9S
	 2CDjkeZ/3q/Y/FF1fRHbIn0XNQq/BgXnj8IM6qsWFmhIEDJBI3bpNb2ixWKQXSfRqHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939043;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=Xyl8P/hXc2RHS5cMV7yi1N2n1G0wq0f1k4006Vi15oY=;
	b=obP7gbjtjQqy+cwhlarw3/V7PkRzWZhj3Q4avQ8klbwaYVg4pv+rsJb9/NE7WZpjW4+s
	 /xkHoqQEtlM/LxkfFtyZxngc3UtagvcjCadkyah8b2uYZAbA2GqFeXdfmq41EiqBYLV+8
	 w4PTUJ2wlXTW36CP0bCqbcC0jx6Ls+k8hcy8Cum7/atU+wpNxFFvhOiRY/x+Y+IUTqNHa
	 mo5XL7764Qz7W/orF77E8JyLMFbvIbVng4s/l6SCkC3DeEZoCxC0HyqrplsaB97udcPRt
	 XAEkJBpHMD5Zo8xSeaHV6y5Ytd+oTco1eqrfPaBOjy+b/u4/H+GRWu4+00QXjdjxQ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qVwRbkJw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/FKr1fHm";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qVwRbkJw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/FKr1fHm";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56183606A32A
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 18:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56183606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qVwRbkJw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/FKr1fHm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qVwRbkJw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/FKr1fHm
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 82D07221C8;
	Tue, 17 Nov 2026 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794939041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xyl8P/hXc2RHS5cMV7yi1N2n1G0wq0f1k4006Vi15oY=;
	b=qVwRbkJwz1/qQZR9Pu7ZonaJnmKMpBnqlCoPPBI1WRge6Pad626Nup/MgqvUie/BH9PxeV
	GRaT85KBcn5g7Yk7LMmCS+45eL26iZxfou8gXL6/TmoaeF2Q0FYIkU21JPtOv8qUV10eYf
	5hZ5gCezgHOLzFky6IY+pb+WkkDRaCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794939041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xyl8P/hXc2RHS5cMV7yi1N2n1G0wq0f1k4006Vi15oY=;
	b=/FKr1fHmKo1bNUG+wyNZeHzdFFWTPwLMsP5FLs68+LH2mT6Gg63dsPpcLm+CEsKrZDOP+A
	gHxZ1FwDa8KrsrDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794939041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xyl8P/hXc2RHS5cMV7yi1N2n1G0wq0f1k4006Vi15oY=;
	b=qVwRbkJwz1/qQZR9Pu7ZonaJnmKMpBnqlCoPPBI1WRge6Pad626Nup/MgqvUie/BH9PxeV
	GRaT85KBcn5g7Yk7LMmCS+45eL26iZxfou8gXL6/TmoaeF2Q0FYIkU21JPtOv8qUV10eYf
	5hZ5gCezgHOLzFky6IY+pb+WkkDRaCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794939041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xyl8P/hXc2RHS5cMV7yi1N2n1G0wq0f1k4006Vi15oY=;
	b=/FKr1fHmKo1bNUG+wyNZeHzdFFWTPwLMsP5FLs68+LH2mT6Gg63dsPpcLm+CEsKrZDOP+A
	gHxZ1FwDa8KrsrDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FF6C13302;
	Tue, 17 Nov 2026 18:10:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xXcwBqGY/GrHJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 18:10:41 +0000
Date: Tue, 17 Nov 2026 19:10:40 +0100
Message-ID: <87fqwzxra7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: avoid redundant strlen() in make_name_string()
In-Reply-To: <87jymbxs8k.wl-tiwai@suse.de>
References: <20261117170207.642330-1-dmantipov@yandex.ru>
	<87jymbxs8k.wl-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yandex.ru];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[yandex.ru];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Tue, 17 Nov 2026 18:50:03 +0100,
Takashi Iwai wrote:
> 
> On Tue, 17 Nov 2026 18:02:07 +0100,
> Dmitry Antipov wrote:
> > 
> > In make_name_string(), prefer strchrnul() over strchr() to
> > avoid redundant call to strlen().
> > 
> > Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> > ---
> >  drivers/usb/gadget/function/f_midi2.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
> > index d693de427641..76738ea55dba 100644
> > --- a/drivers/usb/gadget/function/f_midi2.c
> > +++ b/drivers/usb/gadget/function/f_midi2.c
> > @@ -2101,11 +2101,10 @@ static void make_name_string(char *s)
> >  {
> >  	char *p;
> >  
> > -	p = strchr(s, '\n');
> > -	if (p)
> > +	p = strchrnul(s, '\n');
> > +	if (*p)
> >  		*p = 0;
> >  
> > -	p = s + strlen(s);
> >  	for (; p > s && isspace(*p); p--)
> >  		*p = 0;
> >  }
> 
> Hmm, does it really result in the same?  Wouldn't you need to
> decrement p at first before the loop?

... and looking again, I think it's a bug in my original code ;)

> And I guess this can be better replaced with strim().

... which can be fixed by replacing with strim() gracefully.

Care to resubmit as a fix?


thanks,

Takashi
