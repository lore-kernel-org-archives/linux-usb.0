Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412824;
	b=mmPEvY5bSlppcJqR2Xm5vQzttvJW6XENlpUYaID2qpcV8C0L50fpC9hxWecEc3WKdu4E
	 f7pCmukKKO2Hcg5S/wqHunHThE2xPPE5kD9RAARcxWG3ShHTMi9xCVqtgSbwr3nuMZc2U
	 +0rUoaYaSyUzAW0Xz0v31S37lqnPxfI1ccDXGnv2TBsZXZUuLa/CPVRHOBNc0r7oNwUgg
	 jtKgGG0nPOOjx0Si+Nr+lHW4GT7EJoyyfWN4cFpU7M/rKSOORkQl12ygktIW6v1rjRoAq
	 Be2wWJP3fQrKOTzqDsNy/5R/FCEoPiNf5dlBqOGbCUGPAwcs/lVxwViq/M+jtPuZP6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r3PeQNY0DfEO2GjO5oRC5P+QTt5goOUxQY7pwUgYFM0=;
	b=Gcq8dX4ntKNOlyYUowpScYsf6pW0MAxDy7HC3wq0KO/e1ZRo+u6xMYPTndqkvfYpQSdE
	 +SszWpU0PXycHPgQ7EB2d7di9y8y1aspCK3MgUHlCaRGVzKME0LFpigqTxBqRP45IKlw4
	 bB64ivlkB9k8UVgohQ70sXYXWubwuaWy4yeC1ZAmFGNE4dqdwnqJxV7NEp0FU9nfq44js
	 v/4hScOqKLabpc73znV9IS6yyUR841ZXOXkpPjQ3sX6ASrECWy0qSu4f1eszzVQJLJLrY
	 Q702fA+SJOmlSx7XaZ+SpgAijyTitK7WhEeofm0/ELj/Bw7fGDyhwFibhbRzA5r2wkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYdQsLwF;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07742606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 16:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07742606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYdQsLwF
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-702dedeb70dso1763141eaf.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794412822; x=1795017622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3PeQNY0DfEO2GjO5oRC5P+QTt5goOUxQY7pwUgYFM0=;
        b=KYdQsLwF3lUuhJ6ty5RYTwjolw/TuaksX9yO0x7jCvIXn8xWUTsdNONDuqveeHYfuc
         FPaK9IVRnQ0EcLzyY47lDvi5CiOangS0CpbTDsfpbDtMhpNj5U946kcvCUFmept7mVlQ
         57sw6Awm+OdVYF/sS5tnoRVFLVYbMZMCQgxRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412822; x=1795017622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3PeQNY0DfEO2GjO5oRC5P+QTt5goOUxQY7pwUgYFM0=;
        b=SfJvHeLO6Y4u5rk4dw6K9I45l3dYRJeuRn4v47lMKnvbX59hQNFL8TIPn5coLx0AWs
         QGsLgFn0zXJwscsyrtOUdV8xwPeWEsmeEx2NAXvbZdVkftfezE0ceOxm8sOaFLMVLoK2
         yueLPRR94yjEKEEAvrfKXKfbXG/+wcKbO0/a+09dky1Ix1M2WGblIERzCY/j27T891U9
         wHDVL8DmFf8R7MG7T9/v6Dbqn9UCruW8Z1TbR5pgG0HWpIveRTW3NCLUy9uz2VRRmI9l
         VMSWLjNWzoE31r/yeDf0dziiXgLw6eEB3NVAERlysxusG+rcimxPhgWphjtNniHj8qYV
         dpqA==
X-Forwarded-Encrypted: i=1; AL+hErEOmA28+t9/DlRy4pSAQty0ldfI2psEdWo8DhOBQB+UpqBGg46DAR7Pd40lFl1DNe6iF5a6RsASWdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j6Y96tLV+5Tf3XSjps61+4CHQ/ZVUClKo5js7OF+cj46X7cng
	RfE4jCpcZH3qt6XGhUTTvgryHHWY5ez035IsInW5wEux7TxfbRkDX+2nqncMu/11nvw=
X-Gm-Gg: AYBFou3qS8EZ0Pjfq8ujCZXRaRKxDKNZQh3FuE+iE3w3VlcHM6pnYCEvvz/npy+wlsq
	joJ/GdGdeZbvdHAtO172P882Yw+g7IGSxa8egcHoNuvCiyCJ3QK2zJ+alCSuAfp0zjMvkAuArzt
	IiXHbrC0pKN9bC08lQfbv1/JUJ1B2gDMTpZeZAQBAQJSXomhdHvqm5tbuqissBQHED3d5B8Xng/
	KLldCrEMl2yhNFrajpdQC0tyBFrAFjoIv/bh/CtIRzHSfmj9vhkXOz74Dnni8k1YYX1OdFMsOZJ
	gcHjnugF59XJXHt8NnKrkykva+JibIucqzlEhGJLZCBEj03HCajJs0+tWGUJQyJWJJxeyDW8SgF
	FEpqvXWGLlZ+PuUHNcF2NINkt27SKuT8U2KIc/vsliBZ8gIBNMs6WVtnw/T/VJwbwBZ5y3P2GKB
	6mcnQqukDeNcebZwdp18A4aZsLz4PG8miwRuhWB5qV8jNlknM8VgtvKl5juKWxkmdzg24KXDIZn
	a1FGX4fv8sxCy+bgfezVgjrjC8IWPjZuvBpqyhmTQbxiYEmuQSj0j3dgLDg3I5WGJnu5eeB98XC
	u9Ax/Q2SF+VZIR65mraPKhaBTWXz/Cf/p6/iSnwfyE0etx9UEgQDslcGXmI=
X-Received: by 2002:a05:6820:82b:b0:717:da:ba22 with SMTP id 006d021491bc7-71925f79c3emr233818eaf.89.1794412821742;
        Wed, 11 Nov 2026 08:00:21 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae2302d8a0sm3334206fac.12.2026.11.11.08.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:00:21 -0800 (PST)
Message-ID: <89461e8e-68e0-44ad-8e75-57797886198d@linuxfoundation.org>
Date: Wed, 11 Nov 2026 09:00:19 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vhci: do not give back URBs with an unchecked
 actual_length
To: Vlatko Kosturjak <kost@linux.hr>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <aurLXADfuLjs-dm-@griffin.linux.hr>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aurLXADfuLjs-dm-@griffin.linux.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 23:06, Vlatko Kosturjak wrote:
> vhci_recv_ret_submit() copies actual_length from the RET_SUBMIT header
> into the URB before usbip_recv_xbuff() checks it. When the server reports
> more data than the URB's transfer buffer holds, usbip_recv_xbuff() rejects
> the reply and shuts the connection down, but the URB is still given back
> with the oversized actual_length (and status -EPROTO).
> 
> Completion handlers trust actual_length. usbfs copies that many bytes from
> the transfer buffer to user space in copy_urb_data_to_user(), whatever the
> URB status, so the kernel reads past the kmalloc()ed buffer. With
> CONFIG_HARDENED_USERCOPY this is a BUG in the context of the process
> reaping the URB:
> 
>    usb 1-1: recv xbuf, 0
>    usercopy: Kernel memory exposure attempt detected from SLUB object 'kmalloc-rnd-05-16' (offset 0, size 22)!
>    kernel BUG at mm/usercopy.c:102!
>    RIP: 0010:usercopy_abort+0x6c/0x80
>    Call Trace:
>     copy_urb_data_to_user+0x122/0x160
>     processcompl+0xe3/0x160
>     usbdev_do_ioctl+0x14d/0x1900
> 
> Without it, the adjacent heap contents are copied to user space.
> 
> This was hit with a buggy user-space USB/IP device implementation (it
> answered an IN URB with more data than requested) while pcscd read from
> the device; any server, buggy or malicious, can trigger it.
> 
> Do not trust actual_length when the transfer buffer could not be
> received: give the URB back with actual_length 0. A short read leaves the
> buffer partly unfilled too, so this covers both failure cases.
> 
> Fixes: b348d7dddb6c ("USB: usbip: fix potential out-of-bounds write")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vlatko Kosturjak <kost@linux.hr>
> ---
> Tested on host 7.0 (Ubuntu 7.0.0-34-generic) in QEMU with a small reproducer: a
> user-space program that attaches a fake device to vhci_hcd through a Unix
> socketpair (no network or usbip tools needed), answers a 16-byte bulk IN
> URB with actual_length 22, and reaps the URB through usbfs:
> 
>    unpatched, CONFIG_HARDENED_USERCOPY=y:  the BUG above
>    unpatched, hardened_usercopy=off:       reaped actual_length 22 for a 16-byte
>                                            buffer; with 200 extra bytes, 200 bytes
>                                            of adjacent heap reach user space
>    patched:                                reaped status -EPROTO, actual_length 0
> 
> The vhci_rx.c hunk is the same in v7.0 and in mainline. Happy to send the
> reproducer (about 300 lines of C plus a QEMU script) if useful.
> 
> The 2026 hardening of RET_SUBMIT (number_of_packets, iso frame lengths)
> does not cover this path; it is the non-isochronous actual_length.
> 
>   drivers/usb/usbip/vhci_rx.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c89..720dafa72 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -78,6 +78,14 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   
>   	/* recv transfer buffer */
>   	if (usbip_recv_xbuff(ud, urb) < 0) {
> +		/*
> +		 * The transfer buffer was not filled: either a short read or
> +		 * an actual_length larger than transfer_buffer_length, which
> +		 * usbip_recv_xbuff() rejects. Do not give the URB back with
> +		 * that actual_length: completion handlers trust it, e.g.
> +		 * usbfs copies actual_length bytes out of transfer_buffer.
> +		 */
> +		urb->actual_length = 0;
>   		urb->status = -EPROTO;
>   		goto error;
>   	}

Greg, please pick this up.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
