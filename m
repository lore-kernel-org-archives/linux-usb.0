Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412755;
	b=pNjN7igUScyMihrlh1DOj6MBqg93kRRGCnCw6kMun9lgWI0LG7WT3EueryermkBfG5mp
	 TUuGaLBZLfAhkMva0pHz/NYuHrEMWCCPl0ETERJE6uMpnx3BJTZSS1SBXrvwz9m9i8pyt
	 aXXP78eqttFfggFBmkLjJLkckZA3nJdnwRxbyea2M8Y+CA8UT0MB2rt2Wf//AmtBiJmNx
	 i+lvYAa6d1bl7pSQmv1Q93e5d6rVmTTgbBk6Y6mzXLnYfAH0eyV4P+wiupexVcPY3mn6T
	 77pXVQNqLv3hd91WxVKagxiIi7IL50UJvonup4W1q7Fg8I0kkQirs+q9bjUk0+ZDrog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UhAQCwAK9U5/rrP7mXmanlqYZveAuCzmP2/fpjLYuqM=;
	b=wFFtJdShASF78Sn/5LxE15+yfbUe+9v4hXTAHMHp1b3GadFzESQvJ1tpX1VuITmIZBLU
	 RQaN2XgKZkBsFnOORno1owGW1IbXw9ys1G56j9exqfG2roo5S1Yz/tEslC2pb2gDwjbEu
	 hkRhnX7Nb/JfpSxpJfAF4nkX8NPyqkEfML5EIyMjONA19qExVGsGV9oaVfWFC9EaPl7l+
	 8CmktdXGLqJoGe3jroBFt8Sz5FDYhGJftHzt6jb7BDunzfunef44Z4JwrDhST4ujMceRZ
	 dYKHU/h59AgpmfDoC36i7shOqFTekEsvIRoS+een0bAH74Z1uLqrKRyXs28/RXfkmDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="eIEaFm/h";
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EFD606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 15:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43EFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eIEaFm/h
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-483d290f398so1994254fac.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 07:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794412753; x=1795017553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhAQCwAK9U5/rrP7mXmanlqYZveAuCzmP2/fpjLYuqM=;
        b=eIEaFm/h0xSQyHOJvJlNWHrnRysfE5yG0oj86mr569RqKd9SbFcokYbOTsOkqZHGww
         WSmWvs5ZB0rpV4vUiCuG39ZeyN0tgCrDKNHQtgvvb4EOwJi0dQzv0E7iUZm3iPKIWD4A
         SuFMAcW9TSp6JCTkX+jxb48Ar2ToiAyhamfAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412753; x=1795017553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhAQCwAK9U5/rrP7mXmanlqYZveAuCzmP2/fpjLYuqM=;
        b=XthDKHayyA9r2UDyqKSVWMpJ9kWC0lz29kwCVqICYZQY+u5ifZ3KoomJgf7i8bPSpX
         fDen/G69bFIo3W0zsLBp8pajIGQsAe6jPw84mU2NisYbl+NL1BbmleAeXTJsltIfbzSa
         7/WUwI1V1X7Z9orvgrCDuLoOM0iUvxFwUKl+e4l5A8fWjnKhu7N8pOdAejGW86pxhu2C
         hyfuyPup66nkf/7ID48ImEdMe+yotDM9+gGYWRp2/mbJ9DuTwcyjA/YVd8OcaYGZ72zB
         ep3jLc6rEfOfKU1s+f+SwKk7Yws2tylEJEGlQtonkTa9i2eKZUSsX73JpYFC+hPzxsbw
         Vk/g==
X-Forwarded-Encrypted: i=1; AL+hErFzsuT7iAY32KtrO5GxwCHrh0J2QFbixzSI3KuHiIqsuW9R2BdDT+nsS9C2Gy5zY/jhNYeBHeT9OyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5rlr/880/fxmmBhFRWLeIB8R8scPVaB6SoEHr6b9Ofi1Mcmqa
	6Lb2b0gtApzOHw8on9p6xXQNnZO0VMF/5781o9te/cWvNdzZCIeuw9KwsjVrf9ykrJTSbQHxEuV
	JCO7jvyU=
X-Gm-Gg: AYBFou1k9MBcMWILVMY2qvlaNJl56zPDHPhWIyU96SovGCnFEHv7wIRkGf0Rxp53zw1
	/PS/gEhvcQkPwpkFLLEuaGSpgQzjosq9NqHBt2vJj/OhZicgM8KczQUeP1VdWnlyOZiTrXLl0Cg
	KJsqxylQ5UsH8PmYLoHHm1iwPrS3oYUVge2q9mO9O+1A1VkePwwA1FOys12KL7FNt0YqYs3rrcJ
	K/ryiXz/ueA6T1eZXb6oQhMU9PkdxuagJBMIEfY6iDHEiXUz2FuzrOjW4QgnSHirdwim3FgwPSP
	yvVS0lW5MxAL4Bf8oVm3RO9ExqdtbYHFyY6iEEjJslnw5izfMkZQ6L9KIPAfYs6J1fEWHgacX99
	4hc2l+uJ/rP4wVhiTAP90zPRDHoD0SCikQx3OUeG8XiNvT36vl964MQfEfybiPd0VUHSHsCYlJ6
	2+mmxNvfOt+H4x6giPMhtmEUAwbNwFc/iv6TzgqaH4RdeAybsy7RUkGscSvNAJO8b9UL8lMpFsf
	+kcrnyKk7vM1SAvq85qq+M3U2AgK9sOGyLgOt7EaX3XBpBA/EQ05A8/fbq8pDR2oekuyboZkP90
	/Lz6te8jKEJgKdjquxfJmXzmGZz3KpbiX+wZ9g==
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr2096176b6e.10.1794412753003;
        Wed, 11 Nov 2026 07:59:13 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504e7dasm5155792b6e.5.2026.11.11.07.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:59:12 -0800 (PST)
Message-ID: <eeaa6363-7892-40fa-9706-f484a1b84e4d@linuxfoundation.org>
Date: Wed, 11 Nov 2026 08:59:10 -0700
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
Subject: Re: [PATCH v2] usbip: vhci: do not give back URBs with an unchecked
 actual_length
To: Vlatko Kosturjak <kost@linux.hr>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <auw5_lMRbGU97IKx@griffin.linux.hr>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <auw5_lMRbGU97IKx@griffin.linux.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 01:10, Vlatko Kosturjak wrote:
> vhci_recv_ret_submit() copies actual_length from the RET_SUBMIT header
> into the URB, and only usbip_recv_xbuff() looks at it. That check is not
> enough:
> 
>   - an IN reply longer than transfer_buffer_length is rejected and the
>     connection shut down, but the URB is still given back with the
>     oversized actual_length (and status -EPROTO);
>   - a negative actual_length (urb->actual_length is a u32) is not
>     "> 0", so usbip_recv_xbuff() returns 0 without checking it and the
>     URB is given back with status 0;
>   - for OUT URBs usbip_recv_xbuff() returns 0 straight away, so any
>     actual_length is given back.
> 
> Completion handlers trust actual_length. usbfs copies that many bytes
> from the transfer buffer to user space in copy_urb_data_to_user(),
> whatever the URB status, so the kernel reads past the kmalloc()ed
> buffer. With CONFIG_HARDENED_USERCOPY this is a BUG in the context of
> the process reaping the URB, here for a 22 byte reply to a 16 byte
> URB:
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
> Without it, the adjacent heap contents are copied to user space. A
> negative actual_length does the same on a URB that usbfs splits into
> scatterlist chunks: the last, shorter chunk is over-read by up to 16 KiB.
> 
> This was hit with a buggy user-space USB/IP device implementation (it
> answered an IN URB with more data than requested) while pcscd read from
> the device; any server, buggy or malicious, can trigger it.
> 
> Check actual_length against transfer_buffer_length right after
> unpacking the header, for IN and OUT URBs: the u32 comparison also
> catches negative values. On failure give the URB back with
> actual_length 0 and status -EPROTO and shut the connection down, as
> usbip_recv_xbuff() does, since any payload was not read. Also give the
> URB back with actual_length 0 when receiving the transfer buffer fails
> (a short read), as the buffer was not filled.
> 
> Fixes: b348d7dddb6c ("USB: usbip: fix potential out-of-bounds write")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vlatko Kosturjak <kost@linux.hr>
> ---
> Changes in v2:
>   - Check actual_length before usbip_recv_xbuff() instead of only zeroing
>     it when usbip_recv_xbuff() fails. v1 missed a negative actual_length
>     (usbip_recv_xbuff() skips it, so the URB was given back with status 0)
>     and OUT URBs (never checked). Pointed out by the Sashiko AI review.
>   - Shut the connection down on that error, as usbip_recv_xbuff() does.
>   - Tested on mainline 7.4-rc1 as well.
> 
> v1: https://lore.kernel.org/linux-usb/aurLXADfuLjs-dm-@griffin.linux.hr/
> 
> Tested in QEMU on mainline 7.4-rc1 (05441d697f7f, x86_64 defconfig +
> kvm_guest.config + USBIP_VHCI_HCD=m, HARDENED_USERCOPY=y) and on 7.0
> (Ubuntu 7.0.0-34-generic), with the same results on both. The reproducer
> is a user-space program that attaches a fake device to vhci_hcd through
> a Unix socketpair (no network or usbip tools needed), answers a bulk URB
> with a bad actual_length, and reaps the URB through usbfs:
> 
>    reply                         unpatched / v1              v2
>    IN 16 bytes, length 22        BUG (v1: -EPROTO, length 0) -EPROTO, length 0
>    IN 16 bytes, length -22       WARN in check_copy_size(),  -EPROTO, length 0
>                                  REAPURB fails with EFAULT
>    IN 16400 bytes, length -22    BUG; with hardened_usercopy -EPROTO, length 0
>    (two usbfs sg chunks)         =off status 0 and 16 KiB
>                                  of heap reach user space
>    OUT 16 bytes, length 22       status 0, length 22         -EPROTO, length 0
> 
> With hardened_usercopy=off the leaked heap bytes include kernel
> pointers. Legitimate replies are unaffected: device enumeration over the
> same connection works as before.
> 
> Happy to send the reproducer (about 350 lines of C plus a QEMU script)
> if useful.
> 
> The 2026 hardening of RET_SUBMIT (number_of_packets, iso frame lengths)
> does not cover this path; it is the non-isochronous actual_length.
> 
>   drivers/usb/usbip/vhci_rx.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c898..3180dc3018 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -76,8 +76,27 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   	/* unpack the pdu to a urb */
>   	usbip_pack_pdu(pdu, urb, USBIP_RET_SUBMIT, 0);
>   
> +	/*
> +	 * actual_length comes from the server, and completion handlers
> +	 * trust it: usbfs copies actual_length bytes out of transfer_buffer.
> +	 * Reject a negative one (it is a u32 in the URB) or one larger than
> +	 * the buffer, for IN and OUT URBs alike. Any payload was not read,
> +	 * so the stream is out of sync: drop the connection.
> +	 */
> +	if (urb->actual_length > urb->transfer_buffer_length) {
> +		dev_err(&urb->dev->dev, "ret_submit: actual_length %d exceeds buffer %u\n",
> +			pdu->u.ret_submit.actual_length,
> +			urb->transfer_buffer_length);
> +		urb->actual_length = 0;
> +		urb->status = -EPROTO;
> +		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
> +		goto error;
> +	}

I will take version of this patch with just the above change.
> +
>   	/* recv transfer buffer */
>   	if (usbip_recv_xbuff(ud, urb) < 0) {
> +		/* short read: the buffer was not filled */
> +		urb->actual_length = 0;
>   		urb->status = -EPROTO;
>   		goto error;
>   	}

This fix will go in a different patch.

https://lore.kernel.org/r/179328314074.648427.388274461758949120@gmail.com

thanks,
-- Shuah
