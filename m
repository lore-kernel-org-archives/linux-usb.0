Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B824E5359;
	Tue, 29 Sep 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674518; cv=none; b=ByYQQqVcy0s4kmm+OTlK/b0qIL5h4wxIdBIbxqaoFS/afivMgzi2IxGG0sVO/oCJy2UKrZZlgjNcRxM5SvG2x+WAuFIpPEN36yfUKSP/22jDxmoF7f+1zldpwQTLlrUS+XyZ+BP7HN8NTI3hAZE8RHnjd/5juUeCJZTe6M1LszM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674518; c=relaxed/simple;
	bh=OanTfQ+7y69cPdAS1xdo0YU6xihNeuxRH3PAzNkmCts=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iLP9gDxiCfZGD7DG3sG4T7M/OFLZxiln23GCtSALTlc7EAPZ6Rcv2JNzeZw+oplO/2k9QDUgPYlh1P+hWHOPcaFwvy9GBxZvIDH//Idgg0uBqZdq4hdxOtFTkH+0Qqeyp3pMjTmaStYUWidRnFdj/ATWkrXIU4DXC6IcCsMnK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RnVlURL9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gySeSqr6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u5VoaP3N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MpmUsZbF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RnVlURL9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gySeSqr6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u5VoaP3N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MpmUsZbF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF7311F390;
	Tue, 29 Sep 2026 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eueLG3D+Dq0TjIAguzsLawypQVR1ipWJYgTXwD+aOsE=;
	b=RnVlURL9AjL46WamSi1D4jgvRXtw7NJaJ9E8mD+ogdXhzR6LCS8INO+C59ZFFBw92qn0y6
	DqKVlHojwGSYmnzMgYwz6mH4lAXMrBio3u22XDV5NlIg6Lo4uKyOaEzPq7hi0tnpD0iVDd
	8edB7YlhvjsYfiSHNBZF1uILOeJTFOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eueLG3D+Dq0TjIAguzsLawypQVR1ipWJYgTXwD+aOsE=;
	b=gySeSqr6SC/C7OVcFkeR/YYLn00A1GhNf15BRZARiiwHDouNFJJQLuwch9iaQZ4cXf89I9
	eLGTD7LXhB2HZkCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u5VoaP3N;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MpmUsZbF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eueLG3D+Dq0TjIAguzsLawypQVR1ipWJYgTXwD+aOsE=;
	b=u5VoaP3N9ra1We4XbFyccW7HtSS77KsKueTg4MWKpwIkV9ANYSYK+gYLbCmSG7mlMfW3qO
	4xKJ+s+hqctgbzSe7WI19uXXsFYMIDNaruuGn0fY66jvO85UmTL8iDHdsUGbMXjwnRNR4i
	q0QOj6COxB3cN0+Q/yOS6TRlP/Ib530=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eueLG3D+Dq0TjIAguzsLawypQVR1ipWJYgTXwD+aOsE=;
	b=MpmUsZbFN/FZkTqbdjy9ORJN7i50zGgs9Gpi2hh22LHy2Jblnfw5/Y1SNUwnnuKxTU6KuC
	PsLB0KYRSxZ3a3Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAC7C133F1;
	Tue, 29 Sep 2026 09:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b/6tH0mGu2reGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 09:35:05 +0000
Date: Tue, 29 Sep 2026 11:35:01 +0200
Message-ID: <87ecec2yey.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xucheng Pan <panxucc@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Re-read descriptors for Xiaomi 2717:d005
In-Reply-To: <20260923152552.943151-1-panxucc@gmail.com>
References: <20260923152552.943151-1-panxucc@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DF7311F390
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Spam-Level: 

On Wed, 23 Sep 2026 17:25:52 +0200,
Xucheng Pan wrote:
> 
> The Xiaomi 2717:d005 USB audio transmitter supports Sound 2 Pro and
> Sound 2 Max speakers. This issue was reproduced with two Sound 2 Pro
> speakers paired in stereo. After a USB replug, Linux detects the
> transmitter and exposes a hardware volume control, but moving the volume
> slider changes neither the audible level nor the speakers' volume LEDs.
> Windows controls the same speakers with its in-box USB Audio driver.
> USB captures show standard UAC2 volume SET_CUR requests on both systems.
> 
> Re-reading the device descriptor (18 bytes), configuration header
> (9 bytes), and full configuration descriptor (184 bytes on the tested
> unit) after 2717:d005 is configured restores hardware volume control.
> The USBFS sequence recovered the device after multiple replug tests.
> Reading only the device descriptor did not restore volume control.
> 
> Perform these reads when snd-usb-audio first probes 2717:d005. Use the
> configuration header's wTotalLength for the final read. If a read fails,
> warn and continue probing so that playback remains available.
> 
> Tested on 7.2.6-zen2-1-zen with the existing userspace workaround
> disabled. After a physical USB replug, the quirk ran when 2717:d005
> appeared, and both audible volume and the speakers' LEDs followed the
> KDE volume slider.
> 
> Signed-off-by: Xucheng Pan <panxucc@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
