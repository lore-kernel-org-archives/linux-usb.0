Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2A36E478
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454572; cv=none; b=AyTXX3SzMdnXC1kLMAtgb/cEnuLNEjgWJe9iy1UOCqSeDNDrnghOUHhBsa6Vx0CUqGHQM23mq8wKP3yFHTRGvyLsWDfDl25/xJOT/wHUq04miP19orRCxcz3P0yOrit1N5t8I5EADVneb+3+xJU26gX+nJCr2yv5BgmPpj3b4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454572; c=relaxed/simple;
	bh=e4wh8k5S9G0ULPslHxGFjvETPiXMDjfoHfIlUwB5f0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcxqrzN56hgk+WbI18h3pKv9nS5z349/odZwnTf42UTY12YLsqDRex4y42ImBzjnix20w7JBTaiIKloBZGM2RC8kRfhiOL0H2rM2nJGgzDKnwtd78taHj0q5SsvXQz+i3lqm1DfnGJe1BWf7cUXcSDdFwVxuP58a/Z4FqzjAkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MjCtSS5Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MjCtSS5Z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so24582445e9.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791454570; x=1792059370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8etGjMJEeVxrETmezgIDHyTK7amt3qspU/qe6Xo8zl8=;
        b=MjCtSS5ZppmmoQiK32B2etd8AUOfdp/Mey4MKj6HjFkEnknGFKna6YDju/beRZYg14
         QnvCaf5combpVGv2EhI7zLrCQzTjPjUKC29f3SFQ7YkLOK4ztDtQIeqPrib6Pm+OS9qX
         zYeUtcAOvYRj5uU0IZZMdb4kPxATITZOQiLO0Hrqe9cecyRBdEOQ0yYdB8Cyo+dPSv0v
         5YVgeSfUcAWAVD0Bo/g1UPNZ43o5+rCiUH1Yvpcx4GcczTftkhw6JsDUS0O/1SFK1qKW
         YuiWMDBvzEaBXyL9q5ZfZpeRljMViOHv8OSfx8P4C+/xJHc/s0Ok3SiLjbYgjPbAaH6k
         gG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454570; x=1792059370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8etGjMJEeVxrETmezgIDHyTK7amt3qspU/qe6Xo8zl8=;
        b=Kjgylc6aicHbtMp+i+9xyrky2zMOh0eMydBUYpIkDGVE9O88XA2gUf21bDJsBnEDiJ
         rei5ZiDmKt+By3PnSL45It2zAhJTzwy3e6xis3V8JbbM33m1pEkq2hucoADWykGU25FX
         SBeDakgnmE9jonv3qwGz4JvXBEEbMaBMtoU9JqCW2As92IYNn7BAf0r/YJknV5G+DK9U
         WlJlcAUZTbkUDKZmBeIZfVDIIGdwpiYZk7kCJIbUv/b9PDM8iN2Un8p5PQE+WPD9A25J
         yhCgvD9F+oRo5z3XqBt6+c3L+SwWv3CixqnGNeXMkZxWvFpnkuRxZdV4rCkCp8DjDtD1
         T67w==
X-Gm-Message-State: AFuF++kiZ5c1CulDhLGzsYOoAN9Sx8Jvw5Cg3mK1FpSnm8aQAGsKX8yN
	wgg91JjilCiDtRZGf+kdoN+ud66dUldimO7+anLsgWz6CoggxBF5yzPgIc2ig5JL8E8=
X-Gm-Gg: AYBFou2JcLKULcElzfS8B7T/FDbL8FnIVkiywlKVf2KjDqUOwLespB5Ty7z+8e2VaLA
	jR0eWdeaX6V5p9WIyQ5YE0m/AULp0HjvhOtx/lhlIMXVf1TtX1F1AHpBF3fDfnPD9tGl1vj4bLO
	w/CsXZJa/81yEECps64jMYtA7pUTOlbW7VbkIlM8pytPz32BW6UzOKcXT4Pfc0SkGdov15aOddU
	OUCfHkbmcK5MQ9WkcX72Bxk73KOhjOF4J0cJtpz+W9D1lEqY/xpNeXHnotwvcZ4pbZNT+4h7O8N
	+0ST4t2wFqZ0t/oPCkPdE4rJuQJJFJ5It46k6782gqYcT/y1yPmtkwIphoi6qtAqfWly3bctmYi
	+c0TKiROjO0oFrZgTMyQKZpwSAc3OjHE4Rob/kLz+1JPUrwwdDOe/H4tVg2PMOls8aGiqaUNnai
	Y9bN6TQGmVgbCxsr9oeo67ORc5UfDmPAjFthgmiUm8GgAr12GVWS9m94u/+XYDrPdTDfqirKiIb
	1zmMxOcqBXsCeegny5xbyBKl9KCSnd4xPiuT8LV5Tk=
X-Received: by 2002:a05:600c:3ba7:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a18043b426mr99970595e9.20.1791454569556;
        Thu, 08 Oct 2026 03:16:09 -0700 (PDT)
Received: from ?IPV6:2001:a61:13be:f901:8903:c5f1:e7c8:72f0? ([2001:a61:13be:f901:8903:c5f1:e7c8:72f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843bd060sm75338045e9.14.2026.10.08.03.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:16:09 -0700 (PDT)
Message-ID: <f713829e-0fbc-4ce6-9508-9d015c85e614@suse.com>
Date: Thu, 8 Oct 2026 12:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] usb: xhci: Add support for eUSB2v2 1024-byte bulk
 packet size
To: pawell@cadence.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
 <20261005-eusb2v2-packet-size-v3-1-fde610a3c47a@cadence.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261005-eusb2v2-packet-size-v3-1-fde610a3c47a@cadence.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.10.26 10:18, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
> 
> The eUSB2 v2 specification (bcdUSB 0x0230) introduces support for
> 1024-byte maximum packet sizes for Bulk endpoints in High-Speed mode.
> However, an eUSB2v2 peripheral will revert its internal maximum packet
> size back to 512 bytes after events like a bus reset, disconnect, or
> deconfiguration.
> 
> To support 1024-byte bulk transfers on capable hosts, add a new
> is_eusb2v2 flag to the usb_bus structure, populated via the HCCPARAMS2
> E2V2C capability bit in the xHCI driver.
> 
> When an eUSB2v2 host configures an eUSB2v2 device, issue a specific
> SET_FEATURE (USB_DEVICE_BULK_MAX_PACKET_UPDATE) request during device
> configuration to switch the peripheral to 1024-byte packet mode, and
> allow the xHCI endpoint initialization to accept up to 1024 bytes for
> HS bulk endpoints.

[..]
> +int eusb_update_max_packet(struct usb_device *udev, struct usb_host_config *cp)
> +{
> +	struct usb_host_config *config = cp ? cp : udev->actconfig;
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct usb_interface_cache *intfc;
> +	struct usb_host_interface *alt;
> +	struct usb_host_endpoint *ep;
> +	bool has_bulk = false;
> +	int i, j, a;
> +	int ret;
> +
> +	if (le16_to_cpu(udev->descriptor.bcdUSB) != 0x0230 ||
> +	    !hcd->self.is_eusb2v2)
> +		return 0;
> +
> +	if (!config)
> +		return 0;
> +
> +	for (i = 0; i < config->desc.bNumInterfaces; i++) {
> +		intfc = config->intf_cache[i];
> +
> +		if (!intfc)
> +			continue;
> +
> +		for (a = 0; a < intfc->num_altsetting; a++) {
> +			alt = &intfc->altsetting[a];
> +
> +			for (j = 0; j < alt->desc.bNumEndpoints; j++) {
> +				ep = &alt->endpoint[j];
> +
> +				if (usb_endpoint_xfer_bulk(&ep->desc)) {
> +					has_bulk = true;
> +					goto found_bulk;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (!has_bulk)
> +		return 0;
> +
> +found_bulk:
> +	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +			      USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
> +			      USB_DEVICE_BULK_MAX_PACKET_UPDATE, 0, NULL, 0,
> +			      USB_CTRL_SET_TIMEOUT);
> +	if (ret < 0) {
> +		dev_warn(&udev->dev, "eUSB2v2 1KB update failed: %d\n", ret);
> +		return ret;
> +	}

Why not handle eusb2v2_mps_active here?

> +
> +	return 0;
> +}
> +
>   /*
>    * usb_set_configuration - Makes a particular device setting be current
>    * @dev: the device whose configuration is being updated
> @@ -2123,6 +2188,15 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>   	if (dev->state != USB_STATE_ADDRESS)
>   		usb_disable_device(dev, 1);	/* Skip ep0 */
>   
> +	ret = eusb_update_max_packet(dev, cp);
> +	if (ret < 0)
> +		dev->eusb2v2_mps_active = 0;
> +	else if (cp && le16_to_cpu(dev->descriptor.bcdUSB) == 0x0230 &&
> +		 hcd->self.is_eusb2v2)
> +		dev->eusb2v2_mps_active = 1;
> +	else
> +		dev->eusb2v2_mps_active = 0;
> +

You are effectively duplicating the logic of eusb_update_max_packet()

	Regards
		Oliver

