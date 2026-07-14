Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62803D7D65
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053536; cv=none; b=Ui9T7+Ty1ylFqEeg6PrnT2zKZ0C9Jnt2ePtjF2DmUknEwJ/zmHABAagfmvBRqg4dfi1Ken0XXwZ8Ar6I4QMKNbwXM9zrnu7IwxE+Cbt/vWIIGx/h7mFe1+sVw3p+XneD8gSC74fqnCzF6L2CqxVsggcIwbKgAT/iR3q9THRtmsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053536; c=relaxed/simple;
	bh=GUQiZVnvyblyYmPUnGk7w9kozmaRu3795r/F+XDtpdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubdObEvPs8SqgYihpSQ/VfEWrBjzoryie+wuaBac7YThEM12/bnvxfcNRmcV40BNtxKtUUFTBShtfFWKnZ+uVfdAba5DdXH1arQkAUu06D2bq0b1u7GlGKsHvYLAVRrs8HPKj+i0ElqUOYJ8jKac9oDAFUs1ak1dWkiHLQgXXAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AyDctlib; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AyDctlib"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso11038535e9.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784053528; x=1784658328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cRBijGnW1MWHAmm7rN0D7TcOhmMrBvTuTtZRZ3u9v0=;
        b=AyDctlibyhMErq4akXpL9kUEhmumtBLkMnmt4QMS58Vi6NHTiaSkabLcPy6CDk33AQ
         GAqaAohXBsakbpNHX3BBOe+RUaOeXkppTXGFy8XCROjn9I8yFYZ3JpmJEdo3XvkBxOtZ
         htmFgdN0IqfzYBWx6N01a8oSJdw7/xQt8E7nq0swcsD3FEb0q6Beu0bGGlKMzA2diiW5
         KGQolyd+mWxpxaSFZttV648hQbAw2QpD0OVaflIQE9NpQ/4SVK4GxY58fe3VuFpnnK+P
         Lm1jOBeUEPcMqEdBNhf/47aJKoXboyODoKl1I4Mx85fFoDpUt1rAeJs5cOECny+cpyww
         gIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053528; x=1784658328;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cRBijGnW1MWHAmm7rN0D7TcOhmMrBvTuTtZRZ3u9v0=;
        b=dLoAGufBvWstjKwUTdhMxyvZzyyKuVy7YzhLwpxnCYmjuISmT9cxFYjq71emxW4yZh
         u+po2Up38UEEUGQB0LrSMqDidzbrxQROyKBg3gwiFovWQ/owzEsS+2k+ijnNdjmd4FU+
         B0T34uBIV70eUUiXhYIrrSr9bcsmqdqOGfOsZx3pW3G7YTmISzoaPY10yWIGGdH1iSps
         EGJg7lTc6HLBvPOjL+gbUENake+SPzqUjHDg2m00LJGCzqNqLvAER+c/16q1d+hFxlwr
         BTZXcImscKUSB56YU764//5NOEyZkGUAocCBpQ+wOx2x8EkVXqPwcUk7Pq+moZo+9Let
         GA3A==
X-Gm-Message-State: AOJu0YyDDo+NAtPLcu7HOuvgSMPZMFPxXCgfSF5p98MyoDMyUxv71VVs
	h+OvCMDqpFhGUZzErp2Nng8mRj7xAm6Mfh5WbHip152Pa6UrdbCIB+y2IxQVrSMWl4k=
X-Gm-Gg: AfdE7cn7rWZra07EnzBCAN2kim8vjgybFgNM7rVZDTANFufyGQj2u2GsJWtXq9JOxza
	wgpFFTvYurRW1/Iex5pmMD3xXx4jtkITITPTHih+THLjUonWo2gRiZxanN5caSUGQaiZ39LqOWY
	2LOXVzd5tNb5dtEj9XWGSkwkdZN+yPWF/VFeYmHqFSJSAVHJYXEBuo7mT5BfqtVjCxToqRB8Ebe
	4lGCGzDHm5dqRQwC10rAHJ/ltRZfOFA6qTYLo2VXJP8/i93ugW3ZC84LBnAXhPx0FBoH9VjJk/a
	FacLj9o4+xNzw6YGOv4GLEXztzFce62c8hkarmGnVHRt5uC5SN8EasHUOoQjizMXQa41gk3MtyW
	VhGgAT/tIuUjTohReIge2oMcRwYye2ehe2J85XD+225Qszu0CGLHxsbmHVPCmbg4ifnOpxBvTyx
	FaLaWbFlxb7FXSoIADMEIAidTMjtb5Pdni/A8BP92q4rtYCzsQsim/dQj2RZbN3JgiiQ==
X-Received: by 2002:a05:600c:c4a2:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-493fd45f96bmr130187945e9.18.1784053528076;
        Tue, 14 Jul 2026 11:25:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950871d1bdsm92527485e9.1.2026.07.14.11.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 11:25:27 -0700 (PDT)
Message-ID: <4e7abb00-f0ab-4008-a0bf-5ccd90102aca@suse.com>
Date: Tue, 14 Jul 2026 20:25:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: sierra: fix slab out-of-bounds read in
 sierra_instat_callback
To: Jay Vadayath <jkrshnmenon@gmail.com>, gregkh@linuxfoundation.org,
 johan@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Lukas Dresel <lukas@artiphishell.com>
References: <https://lore.kernel.org/all/2026071453-reminder-ageless-dcea@gregkh/>
 <20260714181142.10976-1-jkrshnmenon@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260714181142.10976-1-jkrshnmenon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.07.26 20:11, Jay Vadayath wrote:
> The interrupt-in URB buffer is allocated based on the endpoint's
> wMaxPacketSize. A device declaring wMaxPacketSize == 8 gets an 8-byte
> buffer from kmalloc-8. When such a device delivers a short packet,
> sierra_instat_callback() still dereferences transfer_buffer as struct
> usb_ctrlrequest and reads a further byte at data[sizeof(*req_pkt)], one
> byte past the end of the allocation.
> 
> Reject the URB when fewer than sizeof(struct usb_ctrlrequest) + 1 bytes
> were received.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Jay Vadayath <jkrshnmenon@gmail.com>
> Reported-by: Lukas Dresel <lukas@artiphishell.com>
> Signed-off-by: Jay Vadayath <jkrshnmenon@gmail.com>

Nacked-by: Oliver Neukum <oneukum@suse.com>

> +
> +		if (urb->actual_length < sizeof(struct usb_ctrlrequest) + 1) {
> +			dev_dbg(&port->dev, "%s: short interrupt transfer: %d bytes\n",
> +				__func__, urb->actual_length);
> +			return;
> +		}

I am sorry, but you cannot do this. Not here.

> +
>   		if ((req_pkt->bRequestType == 0xA1) &&
>   				(req_pkt->bRequest == 0x20)) {

This is the test you need to check how long the reply needs to be.

If we look at the full evaluation of the package from the driver we have:

                 }
                 if ((req_pkt->bRequestType == 0xA1) &&
                                 (req_pkt->bRequest == 0x20)) {
                         int old_dcd_state;
                         unsigned char signals = *((unsigned char *)
                                         urb->transfer_buffer +
                                         sizeof(struct usb_ctrlrequest));

                         dev_dbg(&port->dev, "%s: signal x%x\n", __func__,
                                 signals);

                         old_dcd_state = portdata->dcd_state;
                         portdata->cts_state = 1;
                         portdata->dcd_state = ((signals & 0x01) ? 1 : 0);
                         portdata->dsr_state = ((signals & 0x02) ? 1 : 0);
                         portdata->ri_state = ((signals & 0x08) ? 1 : 0);

                         if (old_dcd_state && !portdata->dcd_state)
                                 tty_port_tty_hangup(&port->port, true);
                 } else {
                         dev_dbg(&port->dev, "%s: type %x req %x\n",
                                 __func__, req_pkt->bRequestType,
                                 req_pkt->bRequest);
                 }

In this branch:

                 if ((req_pkt->bRequestType == 0xA1) &&
                                 (req_pkt->bRequest == 0x20)) {

replies must be at least sizeof(struct usb_ctrlrequest) + 1 long.
But in the else branch a length of sizeof(struct usb_ctrlrequest) will do,
because they do not evaluate the signal.

In other words, you stop processing messages if a message the driver does not
care about, but is valid under the specification arrives. That breaks the driver.

	Regards
		Oliver

