Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DA7262E;
	Mon,  9 Mar 2026 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051099; cv=none; b=h1gVtkIJziMQfQOA7m7MEFg6YoHoW6cGaZ1RCwJ3R+88/DsOLNvckHM1F/wiXHsYtVJfQXCAcfiV5tR6d3wa+MQUtoMZgO0ZuYv0VNSo+DzXPrEpoV0Ig+AdNpsgy4Ghod9Cdm92ql+52QHlIEK2tHWHgIG0pVUOjMoiJJJo6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051099; c=relaxed/simple;
	bh=tLnmfFOZzESytsBgYKTuFVUj3SXiR9lxn7iooMlwSjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXNW5e2y7x5QsqmQQ6Gn1CDM3S3SgciVkCWmbZGyWAZRNK5gwy7GHUfJ6PQ+ehy6TFMLi4Js1rBzOHmbsyaOzWHybTgNAI6lgk7RZIuj5zwaNqlaWnd7cIWYQn/kkhTOkyJRgpIWaAgpY2xjfouqQSqPV92rlMLg4Gb0jRaL/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WQIgw8km; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WQIgw8km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85EBC4CEF7;
	Mon,  9 Mar 2026 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773051099;
	bh=tLnmfFOZzESytsBgYKTuFVUj3SXiR9lxn7iooMlwSjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQIgw8kmYuDBBBt0pHS1So275S1ls7S4d26r3nG5ah6+nN8TUMclurIUX0FzJyTRy
	 AtMFSacJXyFeaQGez/zWowB/Tk+zjwcz6Q8VlsEieKtcMgW2jjBpVhirLbLkuV0lh8
	 XmIr/NnSADXpG1TFFYSrWyVHYMxAdO4bfdal1NE4=
Date: Mon, 9 Mar 2026 11:11:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@qq.com>
Cc: tiwai@suse.de, g@b4.vu, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: scarlett2: Add the number of endpoints checked
 was 0
Message-ID: <2026030947-ladylike-deeply-402f@gregkh>
References: <87y0k1toaz.wl-tiwai@suse.de>
 <tencent_986ED56EFECC99E7EF86D412F6064FC99906@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_986ED56EFECC99E7EF86D412F6064FC99906@qq.com>

On Mon, Mar 09, 2026 at 05:57:03PM +0800, Edward Adam Davis wrote:
> The user constructed a corrupted USB device, causing the USB device
> enumeration phase to fail to resolve any endpoints. This resulted in
> a null pointer dereference reported in [1] when the USB sound card
> driver executed probe to initialize the mixer. 
> 
> To avoid the problem reported in [1], a check was added to ensure that
> the number of endpoints contained in the interface was 0 when creating
> mixer controls for the Focusrite Scarlett 2nd/3rd Gen USB sound card.
> 
> [1]
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:479 [inline]
> RIP: 0010:scarlett2_find_fc_interface sound/usb/mixer_scarlett2.c:8261 [inline]
> RIP: 0010:scarlett2_init_private sound/usb/mixer_scarlett2.c:8295 [inline]
> RIP: 0010:snd_scarlett2_controls_create sound/usb/mixer_scarlett2.c:8684 [inline]
> RIP: 0010:snd_scarlett2_init.cold+0xbad/0x6c79 sound/usb/mixer_scarlett2.c:9407
> Call Trace:
>  snd_usb_mixer_apply_create_quirk+0x1c21/0x2b80 sound/usb/mixer_quirks.c:4446
>  snd_usb_create_mixer+0x7a2/0x1910 sound/usb/mixer.c:3641
>  usb_audio_probe+0xf6d/0x3a90 sound/usb/card.c:1033
> 
> Reported-by: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ae893a8901067fde2741 
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
> v1 -> v2: move the check to scarlett2
> 
>  sound/usb/mixer_scarlett2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
> index ef3150581eab..4b300226f16c 100644
> --- a/sound/usb/mixer_scarlett2.c
> +++ b/sound/usb/mixer_scarlett2.c
> @@ -9393,6 +9393,15 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
>  		return 0;
>  	}
>  
> +	if (get_iface_desc(mixer->hostif)->bNumEndpoints == 0) {
> +		usb_audio_err(chip,
> +			"%s: There are no endpoints for %04x:%04x\n",
> +			__func__,
> +			USB_ID_VENDOR(chip->usb_id),
> +			USB_ID_PRODUCT(chip->usb_id));
> +		return 0;
> +	}

Why not use the "normal" functions to check a USB device for the exact
specific types and numbers of endpoints instead of hand-coding it all?

thanks,

greg k-h
