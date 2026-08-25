Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17883955EB;
	Tue, 25 Aug 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656193; cv=none; b=YaCdP1wYJXfnafRS5t5BgoN8qD/waugZBrSlB3Cwd4YKEc3QVLbkv3Kljb8hhNz/+H7ERSPXMdrx6xWEn/NS71PS1i3dB18Mti/BoDT/bGj2x7ao7pfDnDH/sdLjwg7CK9fXI6s4PZmxNjq4+sMZZXu0oxERXwbk/kMTDFgy82k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656193; c=relaxed/simple;
	bh=v6SKz/QSgRHXGIUo1eEuETY+0V6EHZTt5iHjhXxsvyk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9Tep2kPCfmFbD1qCp6wFqXSrBz6sih/RSSOBtjncqIFWJlybArFxmZ0GrNeSm9nlLY3ZVaQqoeuEjEd903EVs/uDI7ArZ3BHPyup75tBpRa3pZ7Sh/zn2Op0PuBU6jFgFpKYBR9uuF56bWbXf/Q/eN5mWP9c2oCE9uG1FoKIdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V37jzsVe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bizvjyRx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KX8oeYje; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ISQnX6wt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V37jzsVe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bizvjyRx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KX8oeYje";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ISQnX6wt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B1F2886E49;
	Tue, 25 Aug 2026 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787656185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifHAILXr3H0GLX5Reet3nLnTl72ERhcEO8ROft9fRQ4=;
	b=V37jzsVePOqYnGPrKsE/k/5qDTqf9hn1n5S70EFbyOgt4Tl+HqMEb9hCPZKbW7uTPVnFoQ
	Ya7Rd73WClJgaKJptm0SuK/ns5BD84MPlUmG10qewtUHTWUiDHG9RhQkxefJJLoH3tpl+4
	Slnuuf7BxcpDCBSomFv0U9NwSwMIZA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787656185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifHAILXr3H0GLX5Reet3nLnTl72ERhcEO8ROft9fRQ4=;
	b=bizvjyRxlFwsfD5PMUJQwiBfbJ4MoklgAV/Xjj9kyjTqmrPNEiUqzJpAiAOY41X3opB1IV
	9FsqcVqlB9enYPCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787656181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifHAILXr3H0GLX5Reet3nLnTl72ERhcEO8ROft9fRQ4=;
	b=KX8oeYjeDDeEBvy1/cJq5fTCoFfHbG1Qmd1OpxpvnQODBGbBVNFSzB8SKk9NyQRXezqiOd
	CGb8dh/sWbygQo3mIq0xvshnBwpq0FMc7rNRE+4NdHfNkYbHr8m/KdavSulwV6qt0ryr0Y
	IvFC5nFS/LMZlLq+FtKK1b9wuzct0VY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787656181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifHAILXr3H0GLX5Reet3nLnTl72ERhcEO8ROft9fRQ4=;
	b=ISQnX6wtuudLeuS6PrHD39UHxX1p4/MSTK0dMUV4nXHnpWD08afpduEkdZ9NjIJfdK5Z7A
	N5KlIuNeh6sJHKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92FC513332;
	Tue, 25 Aug 2026 11:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NNEwI/V3jWrxLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 11:09:41 +0000
Date: Tue, 25 Aug 2026 13:09:37 +0200
Message-ID: <87o6eqsbgu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload path
In-Reply-To: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 25 Aug 2026 04:06:54 +0200,
Wesley Cheng wrote:
> 
> On some environments, 16kB pages can be enabled from the Linux subsystem,
> which manages the IOMMU mappings for the audio DSP within the system.  In
> the current design, the following assumptions break when 16k pages are
> utilized:
>   1. xHCI ring size is equal to PAGE_SIZE
>   2. Ring addresses start at the beginning of a page
> 
> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
> set with a 16k granular, which is a problem, as several xHCI rings could
> exist on the same page.  This is because the rings are currently allocated
> from the segment_pool.  Hence, potentially mapping non USB audio related
> rings into the region accessible by the audio DSP.
> 
> To mitigate this, this series introduces the alignment_req parameter.
> Before the USB audio offload path is enabled, the USB audio data
> streams/endpoint are not active.  Only when the class driver issues a
> usb_set_interface() call (done from snd_usb_endpoint_prepare()), will the
> xHCI allocate the transfer ring resources.  By setting the alignment_req
> beforehand, when allocating the ring segment, it can fulfill the audio DSP
> alignment requirements by allocating DMA-able memory on the fly (based on
> what is being requested) versus fetching it from the segment pool.
> Likewise, keep track of if memory was dynamically allocated to handle the
> free path properly.  The function call flow will now look like the
> following:
> 
> handle_uaudio_stream_req()
>   │
>   ▼
> enable_audio_stream(subs, ..., pcm_card_num)
>   │
>   ├─ xhci_sideband_add_endpoint(sb, data_ep, PAGE_SIZE)
>   │    │  alignment_req == PAGE_SIZE
>   │    ▼
>   │  sb->alignment_req = alignment_req
>   │
>   ├─ snd_usb_endpoint_prepare(chip, data_endpoint)
>   │     → xhci_check_bandwidth() → xhci_endpoint_init())
>   │    ▼
>   xhci_endpoint_init(..., ep_index, ...)
>   │    if (sideband && sideband->alignment_req)
>   │        new_ring = xhci_ring_alloc(xhci, 2, ring_type, max_packet,
>   │                                    sideband->alignment_req, mem_flags)
>   │    ▼
>   xhci_ring_alloc(..., alignment_req, ...)
>   │    ring->alignment_req = alignment_req
>   │    ▼
>   xhci_alloc_segments_for_ring(xhci, ring, flags)
>   │    xhci_segment_alloc(xhci, ..., ring->alignment_req, flags)
>   │    ▼
>   xhci_segment_alloc(..., alignment_req, flags)
>        if (alignment_req > TRB_SEGMENT_SIZE)
>            seg->trbs = dma_alloc_coherent(dev, alignment_req, &dma, flags)
>        else
>            seg->trbs = dma_pool_zalloc(xhci->segment_pool, ...)
> 
> Similar logic is added for the secondary interrupter path as well.  The USB
> offload class driver calls xhci_sideband_create_interrupter(), which will
> be responsible for allocating the secondary event ring.  The same
> alignment_req parameter is passed, and during xHCI event ring creation, the
> same set of APIs are utilized, so the runtime memory allocation is already
> handled.
> 
> This was confirmed to work on the SM8350 MTP platform, with the 
> CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:
> 
> tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
> tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card) 
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
> Wesley Cheng (2):
>       xhci: sideband: support page-aligned ring segment allocation
>       ALSA: usb-audio: qcom: request page-aligned xHCI ring buffers

I guess your first patch alone breaks the build, and this is bad for
bisection.  When you change the API, the callers should be addressed
in the same commit altogether in order to keep the stuff working
during the transition.


thanks,

Takashi
