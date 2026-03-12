Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE4739EF02
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297408; cv=none; b=VDZwbYqU8U8HQ1abczU9T6eYsaBK/AE38b2/sjLA9OTiVViPdmNWfqxxRnMDSH2+VMGRyL772mYyfNSAbrAq+NHUSQrmTHGXebi2nLX5CnwRsQJvbcGAe6Wh02vZJ4bEcWIf6c7fpZoyodaiporRKRp6YMb3BksMrnTg4SvdLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297408; c=relaxed/simple;
	bh=xSKVPFg8et6wvDn6/3pOSXsnzxbzTIvu1BaLznozHEI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dawqljlaJdN7/JY5fkfH60VUcOZ/5Sqyn3s/TwyFEBucrsbF+3h04cSCBnu9wZ117AdiErRJGr0NpUYLT/sJGTXtGb6pOX6RM8t2RZEdRp+5QWUYCYdePGGPwvJosIWthCKelngkinF+Xc5D8ISW0djpvrl2s1K+EYBNoIJBmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xLC5ni2S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MxfOGQBY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=069RS/+d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oUCC0gNT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xLC5ni2S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MxfOGQBY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="069RS/+d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oUCC0gNT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C2EAD5BCC6;
	Thu, 12 Mar 2026 06:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773297405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bS3v7l4ijvemFyEObCIi/EYWm6WggbKQYJD5l9cARdg=;
	b=xLC5ni2SjfxE0o3dlUWaMFeMc/jslfwmHG4Tti/wLbfk/F5w2EvZlHO01g9C+75I7wQudO
	ntjcxxUnlq8FpyOB5tKz5hq69z6C2x8q/KaToBSLz6tPgfAo1N18PIUvJT7No+/EfkCLQC
	fmEYGsg+Ch2jQBsv+vq6E5Jh+Q2Y5GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773297405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bS3v7l4ijvemFyEObCIi/EYWm6WggbKQYJD5l9cARdg=;
	b=MxfOGQBYxqhp63iNgfuN4Qzfi8Y1jQHAcVwdH58kSjN1MPL01U5U8WSyzbnQla5CdaarrB
	SGtJ2H2sOprb3SBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="069RS/+d";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oUCC0gNT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773297404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bS3v7l4ijvemFyEObCIi/EYWm6WggbKQYJD5l9cARdg=;
	b=069RS/+dHxr1SGC/oZCPHCOaGNM3zJiGY2HOEh7M7/2CRg41FqLKFXCdnZYon6pXrKqvZ/
	GZFL45z/WXUPn8wtHS/ca+ge4tj6D2JtFw9q72x1XJID8p36H2mVHRnbdFqKR80x3pU5iO
	4LBoOPFYCIMEI3kqMG+L1/IlUSUSsTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773297404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bS3v7l4ijvemFyEObCIi/EYWm6WggbKQYJD5l9cARdg=;
	b=oUCC0gNTBSwDoBk+MzSLemtl8hzDnoVYoSBtukWBckmNbB8S0O/H6/Q/CzUoUfSCqTb7ez
	pW+UxewBXe5JkRCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 833753FE29;
	Thu, 12 Mar 2026 06:36:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gfieHvxesmmGcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Mar 2026 06:36:44 +0000
Date: Thu, 12 Mar 2026 07:36:44 +0100
Message-ID: <87sea5d05f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: map UAC3 front wide channels in convert_chmap_v3()
In-Reply-To: <20260311200010.103710-1-cassiogabrielcontato@gmail.com>
References: <20260311200010.103710-1-cassiogabrielcontato@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: C2EAD5BCC6
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 11 Mar 2026 21:00:10 +0100,
Cássio Gabriel wrote:
> 
> convert_chmap_v3() translates UAC3 channel relationship values into
> ALSA channel-map positions.
> 
> UAC3_CH_FRONT_WIDE_LEFT and UAC3_CH_FRONT_WIDE_RIGHT currently fall
> back to SNDRV_CHMAP_UNKNOWN, although ALSA already provides matching
> channel-map positions via SNDRV_CHMAP_FLW and SNDRV_CHMAP_FRW.
> 
> Map these two UAC3 positions to their ALSA equivalents and update the
> comment to clarify that unsupported UAC3 channel relationships remain
> reported as SNDRV_CHMAP_UNKNOWN.
> 
> No functional change for other channel relationships.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, applied to for-next branch now.


Takashi
