Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958669;
	b=Lm81oae8Go+SS9NegK+G1lV/2Y3L6ichUGiDYbYbtunwdE8FHfxp/1LGRNGKcfK6hkYO
	 zDA08oFXPNz75PeAVGwRoM72SZnFa0bOToHqX+p0o2NAaeP+mM8kwe9fZr9rmxclkpRog
	 Wj6yBzqZ11H8Lk1XUosTuKysmAgxLEkDivL+mDofaa4x2geq28HDfMAcjseoiOuohQMfX
	 UC71k/xod723AWwuJBzH6eFflhkH9xYWGL9pBpWkqLvDtxKczuUFEhr9R95oPa6PidUvc
	 VWbJ8MQaCUf6BnIYEQCQymZCI8Uzn9BS0as16eSj4ozRNVOhfbvP+d0Lyw2dAIGx2JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vQBnTQDeqPWib9HYEy/76nQqVu/AgiIe/ITMno6I1Ns=;
	b=K1tsKQjuowj0NqiIi0K2Yy0XBndx4UT2x+sJuHsOEkGAZ9QnFMe+VNOI+/dz2JReeT3l
	 gfNnUuGvQjEEbTHz/mWIjMhNV+LhN0wVGzD7RN/Qm6FTYxMire1o7JAvkqQz/zUVw2qr4
	 R6NIuDEJil/0p54KkJqcS4ZMA9FNk5y2/gFPQfe+lc0n2f/ua04HvrRmH8zeBo+QvcI12
	 U9SlFsvBmOulDfM9wphsjG1smZRKNRu7Fo916CqgVJTX/bEEJFPtIIZ7AdRxBWQub4tRO
	 mgu4xwyyRzbXrwNisGzMbGf5srEL5hWGk9b9pc/JLLKY87IJWTWuwuphu0tnn7dAVKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYY0QYHf;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F87606A333
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F87606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYY0QYHf
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e46e449e8so282874f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 01:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958662; x=1794563462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQBnTQDeqPWib9HYEy/76nQqVu/AgiIe/ITMno6I1Ns=;
        b=qYY0QYHfvwNgzBac0451gF21eaCM3pK7oCeOQyEt4slf1JpxRNomaS4qVWQMbcnkqp
         j4jSn6fcIGVAucK0eb6HqE0aXCiGtWoZbEHIm1T2AFBTYeZhus4ahf83jMU/a+8rq/cg
         empsweZSO3DbMUia2kJyQPcomGyMGC92/8jcLqFL0TXv+2kH8Ctz6FxuYuuqmuesiWvi
         6HSYC+7UC6dOW2hzSHuBokB7Xu0I7wM8XZCTdhQEXdHYIMM7emtLRSGHdeiB/68SN/Ht
         tfrd02vpVFZ2PcqEhO2o/oPIh10zOcV4xRiNfQzy3UZuQdn80aEXT07bAhpha1WG65Ss
         /CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958662; x=1794563462;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQBnTQDeqPWib9HYEy/76nQqVu/AgiIe/ITMno6I1Ns=;
        b=ErqzVucQrkDPmVF2sNU5hy0hzfpLY+FjTlJi+ZBe5+Ke77v0JdnBztLLxodykK41wT
         CIDXFfU1/aFyD3mDHmRBqmzFlJk689qL9vLLTpseNy0Qz38SKVly5er6cfMUtoppzmLH
         /9e0VMcAszZgnzf2NFAc3DGfJ3Z4WaOMVZP6P4MMTZuBWY4SQM+x+hl1GupnJYeaIe7q
         9EfXUGqBNLnP9RtFyrEav0ASEqsZKoyYxHmIhBqP/WQkgUgbOqMEhvOm+qHGdz6+KfXV
         pquE/Zcstcz4kFeAruGHdKD1BaaMpGLq4sSQ6mcZXRbbyENu+EE1UC1w/rh8PtprVaTA
         eUlg==
X-Forwarded-Encrypted: i=1; AL+hErF9d63vnmnSLiQByhT2v4YPAsuBM15Ql9EpzCALvm6qhZQidnmmN34svbOvPnpSncp3+Z6UlR2ZAIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qOjdunrNlvwn5WrQNIEXYrly7nCT6NQQqgoiqG0W6w10EY67x
	q3SKr61ofp1nNG1IF6MVr0ukksRXIW1EhQyDc52Rfxv94MeklQcg3kFC
X-Gm-Gg: AYBFou3IONRQZq5gGmbnYFcEBdlx1W/AqNOBCZHLEborU9CogLg0THJxoZhknIwulwt
	rCnAGRuuizBIVTIhz75GHnpcNL9cmK0Qc7OGQ1infUR5j69rIEzXZAy0IR6Ip7MaQYzCml14vjx
	eToix1swFptQG5oZiILsIXGCPK0dKjP09iCip+tHaD5rqOO8+6FEC8Y3WDqAAqUdwK1dz5tyqwH
	FQ4upT4QnVlvX7HWbGQhoePzT8Dxx3xlB73aNWQW7jp/OPIvRZyxLdcCF3CjJ42chF1fk/Be9II
	WfAHXG6WmFY5BApr8eJz61sRgeNoQ5Fo1luxj85PxNcRCa7S1LFrWzwkUnWS/v3Icpivpfr8UQL
	Hf+JhAiyhS8KR6DzrqaNEQswGthnIPuHNtcUDLyTVGPl9JtwWPLBNycxtO/o/6HJsk6CG7epXT4
	oPTHvQkugD+MSRpWxlF/9oP+eC8+LMcZW7KU1ymNdJ7RdT3uoVlVa60TNKIiHu04nHK1xo0vaqz
	AgKC4hboKXWB3feDBV7oIjR8iqgMCmPzXz7RJe/zCaUrr8BK9bT0PTsguO+aQMTRT8PGpI1hslL
	FTXJQW3hbd2K8IGeiFAXTR3vCtdHAVT5j2XD7u4=
X-Received: by 2002:a05:6000:40df:b0:492:3982:a80c with SMTP id ffacd0b85a97d-49276977cacmr4368036f8f.29.1793958661695;
        Fri, 06 Nov 2026 01:51:01 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63accsm2813516f8f.17.2026.11.06.01.51.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 06 Nov 2026 01:51:01 -0800 (PST)
Date: Fri, 6 Nov 2026 10:50:56 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] usb: usbfs: Require claiming a hub interface for hub
 class requests
Message-ID: <20261106105056.4601f826.michal.pecio@gmail.com>
In-Reply-To: <20261106091048.4056-1-25031212351@stu.xidian.edu.cn>
References: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu>
	<20261106091048.4056-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  6 Nov 2026 17:10:48 +0800, YuanZhe Liu wrote:
> check_ctrlrecip() requires the matching interface to be claimed for
> requests addressed to an interface or an endpoint, but requests
> addressed to the device or to a port are passed through without any
> check.  For a hub that means userspace can send hub class requests
> through usbfs without claiming the hub interface, while the hub driver
> owns the ports.  Port requests use USB_RT_PORT, whose recipient is
> USB_RECIP_OTHER, and SetPortFeature(PORT_SUSPEND) is one of them.
> 
> That is more than a policy question.  The request goes to the HCD, and
> it can run concurrently with userspace releasing the hub interface
> through USBDEVFS_DISCONNECT_CLAIM, which unbinds the hub driver and
> disconnects the devices behind it.  xhci_hcd tracks the device behind
> each port and issues stop endpoint commands for it in its port suspend
> path, and it ended up reading a freed xhci_virt_device.
> 
> Require interface 0 to be claimed for every non-GET request to a hub.
> The hub driver matches devices by device class or by interface class,
> but a hub has a single interface either way, and that is the one the
> driver holds.
> 
> Userspace can no longer change port settings while the hub driver is
> bound.  USBDEVFS_CLAIM_PORT hands over the device behind a port, not the
> port itself, so a request that pokes port state is not safe for a
> claimed port either.  Programs that used to do this have to unbind the
> hub driver first.
> 
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
> Hi Alan,
> 
> v5 takes both points.  is_hub() is tested first, and the comment now says
> that IN requests are safe because they do not affect the hub, while OUT
> requests need the interface claimed, instead of talking about recipients.
> 
> I will hold the URB synchronization patch for usb_hub_release_port() until
> this one is settled.
> 
> YuanZhe
> 
>  drivers/usb/core/devio.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index e191934623c7..6d69a993c0f1 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -878,6 +878,23 @@ static int findintfep(struct usb_device *dev, unsigned int ep)
>  	return -ENOENT;
>  }
>  
> +/*
> + * Return true if @dev is a hub.  The hub driver matches devices by device
> + * class or by interface class, and a hub has a single interface either way.
> + */
> +static bool is_hub(struct usb_device *dev)
> +{
> +	struct usb_host_config *config = dev->actconfig;
> +
> +	if (dev->descriptor.bDeviceClass == USB_CLASS_HUB)
> +		return true;
> +	if (!config || config->desc.bNumInterfaces < 1)
> +		return false;
> +	return config->interface[0] && config->interface[0]->cur_altsetting &&
> +	       config->interface[0]->cur_altsetting->desc.bInterfaceClass ==
> +			USB_CLASS_HUB;
> +}
> +

Does this really belong in devio.c?

If anyone thinks that the trivial "bDeviceClass == USB_CLASS_HUB" isn't
enough (Alan seemed to believe that it is, but hub_id_table has matches
for interface class too), then perhaps this should be placed in hub.c
near the ID table, so that it's more likely to be kept in sync?

>  static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  			   unsigned int request, unsigned int index)
>  {
> @@ -891,6 +908,18 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
>  		return 0;
>  
> +	/*
> +	 * A hub driver owns the ports and the devices behind them.  Letting
> +	 * userspace change hub or port state behind its back, for example
> +	 * with a SET_FEATURE(PORT_SUSPEND) request while the hub interface is
> +	 * being released, is not safe: the request is passed down to the HCD,
> +	 * which may walk per-device state that is being torn down.  IN
> +	 * requests are safe, they do not affect the hub, but OUT requests are
> +	 * only allowed when the caller has claimed the hub interface.
> +	 */

Seems overly specific to this case. It isn't safe in general: it could
confuse the hub driver itself, disrupt functioning of child devices and
their drivers, or break HCDs relying on core serializing any actions.

> +	if (is_hub(ps->dev) && (requesttype & USB_DIR_IN) == 0)
> +		return checkintf(ps, 0);
> +
>  	/*
>  	 * check for the special corner case 'get_device_id' in the printer
>  	 * class specification, which we always want to allow as it is used
> -- 
> 2.34.1
> 
