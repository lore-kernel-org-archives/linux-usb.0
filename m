Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFFD563297
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965027; cv=none; b=ut2Z+Efo+tBw8Ua1i0cJoO7mqSQMolBEyQJCpv/v1Gv68PVXcmWm4c4jYJvrRoFsvRBj42BokE4kMOECgyFPHj9Q5MLKNAeMC72OduZC6LS3sxbWfSr1esI+YVgdRShiTj1Bq2Yx2pwqb2WFMYkJllLP+U8YDmHxnHwE2QFXdTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965027; c=relaxed/simple;
	bh=DyMlPvFbWzlzyRQkr6wpkaRtoQ3anvGVl0nBoh+a4jc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PR9RSMbXSKRN+kTQt+Brxq3ViXvWip0DFF+IVKZJ0gOnspFxTiRYI1xwjjyqMrx362B8jphi6cQPB+m7kwt3meR2ACG8b0VRwn55PFgOFoppsKeY5JNZmSJXbV4mvdcoYvj/SGUmtcbPh6e7DGFwPfBMgf/tkLYxW4hut4FUBQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8AfXbq0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8AfXbq0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so6396225e9.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965024; x=1789569824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZae71d9OhtBZeeJosXyHI6vXicBpHlGo44Y/4JegXY=;
        b=o8AfXbq0My867Hcvg0SXEDhhqcJZnRXmOGN33r6+w/YKkfMT4++mVtdnNGJ0UQAOfy
         YclIQk7haqnOiHCp/htHQnDoOHY66JFz1+aT4qA9L8t7OaPRn2zmUxz+01mvS2NcFWGy
         5WLwc97b2kGGy382zQcpvC5GsOmrZaWd3scQD2qkLM5ryUYc5jdGjWSTqr7MKGPJqSoC
         veVP8Ldd1FUs5AbVYRjsgDObcfoar6S9PoeacNndQ0FPe/y2ajef3OD0jBFK4v2tlGQf
         Zi4OJ0YOkjRuM8F0AncJA2bLJYexP05mEvA37tnLAsnLrst7JcNSZEnLWyJDaNZvg7mx
         Lv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965024; x=1789569824;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZae71d9OhtBZeeJosXyHI6vXicBpHlGo44Y/4JegXY=;
        b=BkdCyeW0feUWW2X6PDZlByXjJhAh9ycoZnfz+Fd9HMhzLECQtOO0wi68xaR+9u2J2+
         xFhXeJvKwL703Z7/Z8hd3eEWj46wrbja2JwRyOMw1k+igvdg1JVjEu7zPANrx/O3Nj8L
         Qu3USsLIMv4M34uk53cx7nuiPTO2UPxvnQnj4OLXi0CpKCH0J4QtH/o8Mls4cCOYeqJH
         G+15bVfXQKDpL5ooB4wgq/TOt+rnHuo+L9SeoaaekKgl0NakgjWH5d4zQfHj7RyvwquN
         mWXHcjZyLCHvpq6RPtUqcHJZdO8PD+eLVZ98SIo+9tj6JRHEuRIk4Yl+i8t61gwyu/jz
         YivQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdArOldy2hlx4lSaBHgGNeNAFuDWZmAnNETtfsyJ7DYC/FHARMUTyrSwRIRVbOj8x2RkFxtIVhahY=@vger.kernel.org
X-Gm-Message-State: AFuF++mf9nqeSGCy1lfEVvTnzzYnfzRE2O3WbVEkVrISGlYgj4x9y1ge
	JtEDY7yD7UycRa/6HUao0ZQkvYffZ6ak3cTnLLNGa73B4hJBN9860Spe
X-Gm-Gg: AYBFou31LW6/85RNhUVUcCdaYzwWVRrNLzH1sb9DxJx0kIzbRgTZLfUjHiKbsBnXJk5
	fmEGikVNV/muyEvDvRkJ25OU0JPcLILxlj1qstsS9tXGmK7z2zJYOh3lJ2P1BEimBIe8ftyWmKJ
	h0lBasltuDPGAB9tX428VWYefSQTwb22pEwi4h9s3FhaZPDH+qG5Wk9vLWw88MVDuZTIcA+djn5
	HNmNuU9aFpM9eW2BJZWe8Kcbr8EpI8yAKM3M/U2hCwdugHvd07ZsOCFy/nNKDvsVVp1ePWjtRGZ
	07Xkq5PJrng1rhfZ/4/abEct2ygk1erT4VeD4greme2oph8MU54TF7MV+lklU7FD9tg6lKJjlkC
	vK5Syw4jkKQ5bSy9VsYAZ2n9b/LPvqb3ldWcMB3MkJftYbru22TrgfstD8cJTfjVWZQW6gh5Y8y
	QtC3eJ0LTqAmyNjLl+nCvEjvNmXBh10OiO0Xql2jO3YUiWnkbKkjgeZTydMypqWxo6X75AueWlg
	JRGA9VKHtYWWVjVj+mq
X-Received: by 2002:a05:600c:3543:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49d1f354321mr93264125e9.9.1788965023436;
        Wed, 09 Sep 2026 07:43:43 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm562802765e9.12.2026.09.09.07.43.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 09 Sep 2026 07:43:43 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:43:39 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 parth.pancholi@toradex.com, francesco.dolcini@toradex.com
Subject: Re: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined
 state
Message-ID: <20260909164339.7252469b.michal.pecio@gmail.com>
In-Reply-To: <20260909125842.528340-3-festevam@gmail.com>
References: <20260909125842.528340-1-festevam@gmail.com>
	<20260909125842.528340-3-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Sep 2026 09:58:42 -0300, Fabio Estevam wrote:
> Currently, TUSB73X0_PWRON_POLARITY is set when the
> "ti,pwron-active-high" is present.
>
> However, when "ti,pwron-active-high" is absent, its status could have
> been set previously by a bootloader or by a previous running kernel.

or by EEPROM.

Do they bother to put the chip in a wrong, non-default state at boot?

> To make the state of PWRON_POLARITY deterministic, always write it
> when the "ti,pwron-active-high" is present.

That wouldn't be too dangereous, but...

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/usb/host/xhci-pci.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 75aa679f7d79..833c55c3213a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -684,10 +684,16 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	dma_set_max_seg_size(&dev->dev, UINT_MAX);
>  
>  	if (dev->vendor == PCI_VENDOR_ID_TI &&
> -	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0)
> +	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0) {
> +		u32 pwron_polarity = 0;
> +
>  		if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
> -			pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
> -						       TUSB73X0_PWRON_POLARITY);
> +			pwron_polarity = TUSB73X0_PWRON_POLARITY;
> +
> +		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL,
> +					       TUSB73X0_PWRON_POLARITY,
> +					       pwron_polarity);
> +	}

... isn't device_property_present() missing here?

Also, I don't know those DT rules, but doesn't "ti,something" imply
that this must be a TI chip, no need to check IDs?

Regards,
Michal
