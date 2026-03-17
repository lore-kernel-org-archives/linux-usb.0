Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057A2222C5
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738203; cv=none; b=nBWk0Jvq2DE9YqoNyB52B/NGdkw6wc/+sZSCEnJkpTOgMHS2hN+OjQ8iGDr9mNaazsJ4NJoIMEdEQhP0E3q5J3qmHO6OBrh7Mjc3J/jvGDhYseVmvAUuhVYqdsUj2zwbWoNzCP3/Fgj5UZH+4c1Z3Zgjyk3PfZKm81ba/0YJ6S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738203; c=relaxed/simple;
	bh=NRUwGV1uoRLt4unaHg3GcNc5f3AItei+ejEmRCqlz+Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJWILvW9WJjraSquWFROrZvnWu7/v8yB5M673dTex8+vQbJDDaIKdub3X2T7yg2f6SFmNMgO+/e29s/9xEFiEItg2GNJVu80oBfduljsOYpZX3sp+UTHSi81vy7FLWYTHiAtGXJ2afYK8FqHZdnu5QtxbpDUonuzVqcM8w57j7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KTmg+k0u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2ULljy+4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WkZUXHK/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bt/nQt/Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KTmg+k0u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ULljy+4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WkZUXHK/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bt/nQt/Y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BFF975BD8F;
	Tue, 17 Mar 2026 09:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773738195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev+OZDozWhHDoTFg/txd5DS17peFvQa/sMKLGxjYpxw=;
	b=KTmg+k0u4zmtz9LWM/vzfZ1oWDGiwqSB33jYietjBbf7WkCQytEYjJg/7QKaKJd5luUj5P
	W+eQ1IHJKkNdmOPJmZ1DbHeRWA19fW4Na+XotEAiAvoue77Ca69JAwLNB5EMjvL4D6ng1e
	yG3BLbAtB3y51SLtoncFtWFYhvc0DOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773738195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev+OZDozWhHDoTFg/txd5DS17peFvQa/sMKLGxjYpxw=;
	b=2ULljy+42KfETp1rx87d9Fu/v1qPCOTdiqNdKbTm33Fb30cxuRHVlsu5Y59xjED5HZ0vGP
	wVtPJAN/gVy/3XCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773738190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev+OZDozWhHDoTFg/txd5DS17peFvQa/sMKLGxjYpxw=;
	b=WkZUXHK/CA5vY0We7c+AAc46ZUJteq41vvvDr2oiztilmB1IhZPrl+ewwcxzygXyhub26H
	KpQNkvpiyw/tm10hFHtWwzgOFiV8dRkxDrNf0/9nck9uzWacZnpRq4kuc1ltF93wvav2cF
	BzM01N5IFC+oUfaAxYfE9IploNueYr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773738190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev+OZDozWhHDoTFg/txd5DS17peFvQa/sMKLGxjYpxw=;
	b=bt/nQt/Y4JsPaJ4lj/AxBrJs7znI3/As7pzkTECl6Fx6rjneDJK2kjlv9jCUm/BAWND377
	M0uAVtsUf3QkMABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86D894273B;
	Tue, 17 Mar 2026 09:03:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GU95H84YuWnJDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Mar 2026 09:03:10 +0000
Date: Tue, 17 Mar 2026 10:03:10 +0100
Message-ID: <878qbqg75d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: validate full match when resolving quirk aliases
In-Reply-To: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
References: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 17 Mar 2026 05:22:04 +0100,
Cássio Gabriel wrote:
> 
> get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> usb_audio_ids[], but it currently checks only the vendor/product pair.
> 
> This is weak for quirk table entries that also depend on additional
> USB_DEVICE_ID match fields, such as device or interface class,
> subclass, protocol, interface number, or bcdDevice range.
> 
> Rework the alias lookup so that it still uses the aliased vid:pid as
> the initial lookup key, but validates the remaining match_flags
> constraints of each candidate entry against the real device and
> interface descriptors before returning the quirk.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v2:
> - drop the temporary usb_device_id reconstruction approach
> - validate only the remaining match_flags explicitly
> - pass struct usb_interface * to get_alias_quirk()
> - Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
> ---
>  sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 64 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index fd81f32a66fb..153085a77d43 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
>  	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
>  }
>  
> +/*
> + * Match aliased vid:pid first, then validate remaining fields against
> + * the real device and interface descriptors.
> + */
> +static bool snd_usb_match_alias_entry(struct usb_interface *intf,
> +				      const struct usb_device_id *id,
> +				      u32 alias_id)
> +{
> +	struct usb_device *dev = interface_to_usbdev(intf);
> +	const struct usb_host_interface *alt = intf->cur_altsetting;
> +	const struct usb_interface_descriptor *intfd = &alt->desc;
> +	const struct usb_device_descriptor *devd = &dev->descriptor;
> +	u16 bcd = le16_to_cpu(devd->bcdDevice);
> +
> +	/* Match aliased vendor/product */
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
> +	    id->idVendor != USB_ID_VENDOR(alias_id))
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
> +	    id->idProduct != USB_ID_PRODUCT(alias_id))
> +		return false;
> +	/* Match real device descriptor constraints */
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
> +	    bcd < id->bcdDevice_lo)
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
> +	    bcd > id->bcdDevice_hi)
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
> +	    devd->bDeviceClass != id->bDeviceClass)
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
> +	    devd->bDeviceSubClass != id->bDeviceSubClass)
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
> +	    devd->bDeviceProtocol != id->bDeviceProtocol)
> +		return false;
> +	/* Match real interface descriptor constraints */
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
> +	    intfd->bInterfaceClass != id->bInterfaceClass)
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
> +	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
> +	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
> +		return false;
> +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
> +	    intfd->bInterfaceNumber != id->bInterfaceNumber)
> +		return false;
> +
> +	return true;
> +}

Hrm, it became larger than I wished.
You compared with another implementation and decided to choose this
version?

An alternative would be to have a copy of usb_device_id like your
previous version, and clear match_flags bits with
~USB_DEVICE_ID_MATCH_DEVICE.  If match_flags becomes 0, it passes.
Otherwise call usb_match_one_id().


thanks,

Takashi
