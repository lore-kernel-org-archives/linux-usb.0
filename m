Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019417;
	b=FLW0T1Ji04WroEMH4IEq/7gNiyvpPpm0kWcsG0cVUWHIX5n9FQuyn/psktXkUtYp4AbH
	 Wmz5TonJOSz9Smqq4h4OBTPT/lfatv/dbJIEnyBGsaNSRFdQWDCkmbeFwIINQYqCWP1y1
	 T3JDYib8sDcPWlnIQSqZUcCzAZRvJkHORX6x/9NUZNq9yGuWDKUIjlv7jVf85y05tVpVU
	 mkgivZRyTRv9lsyJS+R74w8YX110tjEUq7rBwlMpvG2TRuqhtBhFrkAHTdhAGXK37dLrx
	 CW3UW7jRCQODk2aG2I/kXaueSqtU2uq7zp+v3CRThx1jWmAi2eCv/kQNOZR6PriyDcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UCy5buCAAPRaMG/y5EzdlGNeV9SlawrqadrCQjrrMrA=;
	b=I/N0d4nF4T8IGX5PT0v4REQ1cZLlQ6dELUfy/nsOS5E+Q/Tk4+FlZwSSuz6CPU/RS6s7
	 hmXcmkWdeGT9JEWGOF/eH6cAmOkmgKaOWdQbDpCzXQug6b06tgTUTCLYaxwCL9C11eHMa
	 t2AFvbPUpDu54HRFmtdJpwy3OcEimkedtYF+bcFf1uGxjv/g01Kx1tm2KtgqJK7Gxj+4P
	 XODHEpMbmu++nxm0xMidDsRyg/9Be7Tyt9D+HuvnVhZmoZM/nFgYey7pTBTbaVWU3mKfq
	 YQksOC2a0w3AfGkP/5KzyQfUGhtv7T4fQpcbS/SG9TglCarQCdJESB0taEk+pli9QjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ano9C4vd;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00550606A323
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00550606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ano9C4vd
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso18968985e9.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793019415; x=1793624215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCy5buCAAPRaMG/y5EzdlGNeV9SlawrqadrCQjrrMrA=;
        b=Ano9C4vdkZuL2/qSA4Ya2bAb+80zZZnOYy82mM5+aY0M0+EE0WBERm9y/9zHGUYLFy
         A/J/afpuP84nvAjI7rcWqD6f0urPAT2qX3EWcO3VeEtngqOUYd3aDpRGLNUhvut54c9J
         Z1oAYUcsTgHRMSyRg/6cngtzc2vKPTxT0qQx543O0cXOcKyyzdbGswe0Pw5NjqBW+gdt
         EXQvMoI64JA/RKiM50EE+XpViU3oNBn1mlYqcO6RCyOleq+hN9EHTwgjQKFKLeoLXggd
         Wp3fgb+3J/jrJqkzmwYP507AQJxFQsK/0FYali9ZlKn3vzAijooDOJ+PaOUjZOT4sBXF
         SZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019415; x=1793624215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCy5buCAAPRaMG/y5EzdlGNeV9SlawrqadrCQjrrMrA=;
        b=08RLSib4CrlEAOewUaCz6vqswHczTKQkWMTc3PXxJ8QibaD/HFUifv3D8N8q8k7BHq
         K7KciIe2pFyIRr0eUWqjwemHsuAS5pRVbosjl5HdQp8sck1RHrI4aISuLn6tkfa9xpGu
         TQKem2p+Hr/5aXGhEzs4vFI9UZKUZNBMZHIaIMn5gYywtxanW2jhiAzSOFVkXJluT49Z
         kGXE2ludkscgE9HDU72I06LG1/EIW4AbdeXHRlNK4pf6unhB+wBuuaeA1UbssVo/SaM5
         huYtmfaJfQBhevA/U8rDTu/iqJ/7nUS+chAhapsxg4RNY3kkB8z7NcKpg7VGO59gEM75
         Cc4g==
X-Forwarded-Encrypted: i=1; AKwUvBzYBdlYN2YMNyOl15zKghyaqXXGHDLjnFTmB+ldkhuv9ycDXr/KbkjBbF1Tu8bhGhWdW3en0zm2S+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBwBXyQdwW+HE1ydOR+YEKMqDJ/1DRe00x/HVX9xIhPNHCUPmz
	xPRkuZWPxn6SjgLU4FZH5K3/Vqnd6JedvqBxebgm1VIgSwqgPmwrgPnNNnZsNafrbbSNykY88pC
	NiCE4
X-Gm-Gg: AYBFou2FlY2dPBV2HtTKBN7QohoqOlo7h+IhIiSLWLSVRggAg/vFO6vNFRia74wPqBA
	/chdu2guwJcoHWXZHGW5aw3fR4D8soId9W5y/6n3nN20WvyNQZgxuUd8DEOsn7neHDSDRpJ3DdG
	7eMJQJbRsFSn9NIIlu+3dWXb6PXi6Y1A2jYTrEzOeRA0Qd8W+Ot4ciQ2esCrhOM7aT3T+eSsp2f
	LUJVGXjO2RzQkFe+gZYlxw7oNs9v+kygFPOb5X6GM2uVauBpUxDwm9Wn5UoHczfXizzL1vx9CzV
	yo/ucx9NSocs8vdr3kSLjf+lpa/AklDEria3iGrZO+gxmOmpkTp1oDmxtyV+i3Ai/2w0vi6lzpi
	1yJY6VOjTkY9XOGghsdjMIv44hTXN5sn5YxnSeM/0noAxSMxzDGdyzNJp2cI4koSSZ5LxfwaAQm
	gBDNJbjjx2x6xUFGwK1mcPYzd2fI2KV1rvocB6vPDimPvVh2sZeJoFYAEYCS7RksXUXuMwwT61b
	LuzZvRqknhx1vrFSHyqMfaJMU958a3Crcn6tNwoPa1n98W3WiC/dD2ohStnwrDb0O2m7G9C7N9K
	djCq48ZP9QDsOFKO+2dpEw==
X-Received: by 2002:a05:600c:c0c8:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4a4de702b8bmr75813525e9.22.1793019415369;
        Mon, 26 Oct 2026 05:56:55 -0700 (PDT)
Received: from ?IPV6:2001:a61:1396:ca01:48fa:543c:8ef8:4075? ([2001:a61:1396:ca01:48fa:543c:8ef8:4075])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm17562810f8f.18.2026.10.26.05.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:56:55 -0700 (PDT)
Message-ID: <e6009e1b-2d95-4350-8374-d5930200ed24@suse.com>
Date: Mon, 26 Oct 2026 13:56:54 +0100
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
Subject: Re: [PATCH v2] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261023013931.388916-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261023013931.388916-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23.10.26 03:39, Jiayi Li wrote:
> USB core normally disables interface endpoints before calling
> uas_disconnect(). This cancels pending URBs while the device may still
> be processing the associated commands. Some storage bridges then stop
> responding after a driver rebind and need a disconnect and reconnect
> to recover.

I am afraid there are some issues left. Let me address them inline
to the code.

  
> +static void uas_pre_disconnect(struct usb_interface *intf)
> +{
> +	struct Scsi_Host *shost = usb_get_intfdata(intf);
> +	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
> +	unsigned long start_time;
> +
> +	start_time = jiffies;
> +	for (;;) {
> +		if (READ_ONCE(devinfo->udev->state) == USB_STATE_NOTATTACHED)
> +			return;
> +
> +		flush_work(&devinfo->work);

This raises two questions:

1. If an error happens while disconnect is running, why do we want to schedule
work?
2. Why only this and not also scan_work?
> +		if (!usb_wait_anchor_empty_timeout(&devinfo->sense_urbs, 5000))
> +			break;

Some commands run longer
> +		if (!usb_wait_anchor_empty_timeout(&devinfo->data_urbs, 500))
> +			break;
> +
> +		if (time_after(jiffies, start_time + 5 * HZ))
> +			break;
> +		if (uas_cmnd_list_empty(devinfo))
> +			return;
> +
> +		msleep(20);
> +	}
> +
> +	shost_printk(KERN_ERR, shost, "%s: timed out\n", __func__);
> +}
> +
>   static void uas_disconnect(struct usb_interface *intf)
>   {
>   	struct Scsi_Host *shost = usb_get_intfdata(intf);
>   	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
>   	unsigned long flags;
>   
> +	spin_lock_irqsave(&shost->host_lock, flags);
> +	scsi_block_requests(shost);
> +	spin_unlock_irqrestore(&shost->host_lock, flags);
> +
> +	uas_pre_disconnect(intf);
> +
>   	spin_lock_irqsave(&devinfo->lock, flags);
>   	devinfo->resetting = 1;
>   	spin_unlock_irqrestore(&devinfo->lock, flags);

Is the resetting flag even needed anymore?
If it is needed, why set it so late?

	Regards
		Oliver

