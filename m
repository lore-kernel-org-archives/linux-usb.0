Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937808;
	b=Ucu965hst3/+K5LXBr3It5r049H7s1WmmwYHhS+bdbKyyAtAc1jnF9So6GAXSHD6cVOf
	 BLC9hcU7ILOoeua1se4U/5SLuYARTc5QhVaFOygWVPU+uqY0D3apKBtcdMjJ+XrcRHqMh
	 sDDdvjEMx5euVL813G4udK74fHB8b5xZejZsopTh8revw4mJsEOIP++rv568toHbqbxG0
	 8QxvkSjiBhAFN1rH6KzYKu3Y0cv4/ErMsZG9m8RaYV+F8ayUnAg+qLg4lXoT+AufUMAjK
	 fl2YizbvnPWZQhNErQaRocVzpYGrP0gVzNM+C8sJROZ0aVbS0Zw19zPy5ML3kHjbXdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937808;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=lb8u+1U80KvX6azbj+fjW/HgArNC4kkO5jfFU9aFgO4=;
	b=eyZd1BQbmX9Hhh2YjX0P9qmsc5LNAwF+vVqDif3lRj6bQgxrJ/kxxA6+pRCpnUjho2wH
	 G1jAQgmwIzZen0i9pL2XB49DTiwGpdm7ykcYPJLnQJH/WlJv0GqHNjLhbEJaD23SLaaQp
	 3Ui1wGo2sJbx/BFGCmG83pSKxunZmifiTCqCamnqIU1nMtoKOMtt3o2dqKB1F9Pthcp8o
	 KQ/7RGwEcMzEA8nHbXRbY+Unu5FPjEdCwf2SP4oByoA2gANHkH1o0DXQ/4Lnny5d2pzG6
	 +1abaPmz1i9MINOprzVoENyIrQ6+94STEzKV6HVQZiFkgNHip/pWm2axu3w+r1wz1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MCMgcmZb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Sif/GlpJ";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UM4fpGCS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4UaA7B5t;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0DF606A32C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B0DF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MCMgcmZb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Sif/GlpJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UM4fpGCS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4UaA7B5t
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D3E61F78D;
	Tue, 17 Nov 2026 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794937805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lb8u+1U80KvX6azbj+fjW/HgArNC4kkO5jfFU9aFgO4=;
	b=MCMgcmZbfFMufCmvx5Q1KbyRvMCDkBQtBpMQhTQmBJyxCGPHctlLJJsZ6d/kujuqziSFjH
	1yw3B2DxeZGGc1ntTNVsPkY6POvZHpGuejJsOn+xeSLNs3mR4HWSmo5lYIejB3bAOwmV3W
	hpVcMVwP2ntRZjieiSaQflSDV1O0i9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794937805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lb8u+1U80KvX6azbj+fjW/HgArNC4kkO5jfFU9aFgO4=;
	b=Sif/GlpJv9OKJ0PkDI46iUuOC3ZLRULrbJIup6/Ra5Slr/UdOt/ZAZ/Q2hEqFHg7L34kpA
	/A0ZCduZPtRxgSDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UM4fpGCS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4UaA7B5t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794937804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lb8u+1U80KvX6azbj+fjW/HgArNC4kkO5jfFU9aFgO4=;
	b=UM4fpGCSz7xHRrJZEuQqNhpgYXZiRUlcKLEf6cgfv/fnEFLWIwN5H9iCsWp0P25NMeR8Kj
	XSdKw1sb1JFep/K2KHi078CgxaHs693ma+/4GpMj+fg059IQ06fGU24yXIEcM7eE/mZpjL
	7NWxbug0YWBxtAOJCB8i1CsxDyWYorg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794937804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lb8u+1U80KvX6azbj+fjW/HgArNC4kkO5jfFU9aFgO4=;
	b=4UaA7B5tSY14Trr93V5vDzBlPmwM1+uctd11YJ+vXa7SbgRJi7L1QQlvBD8WFu5laC+fCV
	MxNlmRh4hJaT5FCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4568713302;
	Tue, 17 Nov 2026 17:50:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YuoHB8yT/GqkEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 17:50:04 +0000
Date: Tue, 17 Nov 2026 18:50:03 +0100
Message-ID: <87jymbxs8k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: avoid redundant strlen() in make_name_string()
In-Reply-To: <20261117170207.642330-1-dmantipov@yandex.ru>
References: <20261117170207.642330-1-dmantipov@yandex.ru>
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
X-Rspamd-Queue-Id: 8D3E61F78D
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[yandex.ru];
	FREEMAIL_ENVRCPT(0.00)[yandex.ru];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Tue, 17 Nov 2026 18:02:07 +0100,
Dmitry Antipov wrote:
> 
> In make_name_string(), prefer strchrnul() over strchr() to
> avoid redundant call to strlen().
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/usb/gadget/function/f_midi2.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
> index d693de427641..76738ea55dba 100644
> --- a/drivers/usb/gadget/function/f_midi2.c
> +++ b/drivers/usb/gadget/function/f_midi2.c
> @@ -2101,11 +2101,10 @@ static void make_name_string(char *s)
>  {
>  	char *p;
>  
> -	p = strchr(s, '\n');
> -	if (p)
> +	p = strchrnul(s, '\n');
> +	if (*p)
>  		*p = 0;
>  
> -	p = s + strlen(s);
>  	for (; p > s && isspace(*p); p--)
>  		*p = 0;
>  }

Hmm, does it really result in the same?  Wouldn't you need to
decrement p at first before the loop?

And I guess this can be better replaced with strim().


thanks,

Takashi
