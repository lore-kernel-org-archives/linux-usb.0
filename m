Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1476311C1B
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716698; cv=none; b=MSuKmH4YIhb0JRyjegaVQmwYTCF/REt8k5W0gKZcHDkyFZYG2HRwbCyDzh0sZcSgTvVkvwRcqr3fGu5MyoHXJ/YBYs7/Sl5i8SUdBjVF5pZcoG3iJTY0oiK7WXQFiO5zGOrJNlOKwFWiWdqLujk0xuu7pAab7Fe0scF+Gh86UZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716698; c=relaxed/simple;
	bh=n8mF36/8WD0fTyG6f5UsDyAYOFOJ9vGfsmLDjbHZ1CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDuHspkUg8RLjgrsIN4kxMlxvSsTOoPak6FCcg12l+MjTBjwYOUl1JSuFTiA9e0RckRswZZTyz/a8VlcDJTJzDzlH9+Kq6/WWNa9h4tTM1IzwT8fK2vjSCwCkdv6oD6OecV95Mk/sSm0Xt2caiB1MrRihCqC/NC0epdvBM6LWw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alstergee.com; spf=pass smtp.mailfrom=alstergee.com; dkim=pass (1024-bit key) header.d=alstergee.com header.i=@alstergee.com header.b=4eK8Bt3v; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alstergee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alstergee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=alstergee.com header.i=@alstergee.com header.b="4eK8Bt3v"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso951126a91.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 20:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alstergee.com; s=google; t=1787716696; x=1788321496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meEmQ5oRvTpYqiZ9XkT01GZPwRQVWH8W9y3MbjBuCoA=;
        b=4eK8Bt3v+mg8RTRTzGHFWd+VMMK5jCSl3RmLraSejrA8MNZ3kYFp4fO0ZznyTHmPVK
         g41yl4R53RjpzOm+jUSk7Uzla3HuF/026HpQBvoarQwESlAyhOFp3leNZ4XQ0Cl2uEGC
         IXygy4gGpm4FNMgC+riuBJv+tTiM4oqkYNc7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787716696; x=1788321496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meEmQ5oRvTpYqiZ9XkT01GZPwRQVWH8W9y3MbjBuCoA=;
        b=KHa4/pJ+rdmZ/DfShoIzAAIefdxTOKTeU7gCwgiqrbGJ43X0hYrXfK6z68gbYzxEUH
         pkmLKOpujLtgSdDnIEdsLbW5VqB8PZtaDS6zpM3lDG0a1N1BhlhySga8WHpZVISxUZls
         WF+vMFF5g8jhD9EeKGwA/Z09YNgBq+rHKn7CmFb6Jcby/Ro9AOV6oAxc+qr8U2WHI3XA
         xKEPf80uEZVT+l/TABTIHlKPQeChUkvxqb1yVNcr/+ANoaSB30rziR/p8Az0rOOv5uK5
         HTrCndXzIDZwkx7YbqdPUemkZjdt0pow2N7sXOdk1gcquIsOnR3ms7H5PUB10duLr95v
         9j5A==
X-Forwarded-Encrypted: i=1; AHgh+RpAinLlHwLCeGlrQjxYUpohP2UHi364hUlmTqonfrYBE7zssfvJ11sgdIxQV/cOY6TEm2De4e+j0l0=@vger.kernel.org
X-Gm-Message-State: AFuF++nDR2vbvC42GZeADm4+zXndaRLymoAnguJO0sG5S+x1xSH8Lgaw
	/zo1QAGy25o9nL51XUifBudOcxnl8BDALomn3N0yCCmrlcJptQ7o3UanZmjUxqr5oQ==
X-Gm-Gg: AR+sD12Z5wIsJFLNltQdtQhokG3HpwNoTEWxQfHQa6Psapy3bcJ8PXw/iQjTuKjFmOl
	ayAbq/uS/cH/dTKzQKc41hdioreo5pUedCzdhayAHBJCfVBs4x2MyRrwk8Rkm6nc5SmzIWHnUWk
	B0L9BwSTUmwLq6707EfoHlprSbKrjs4A/rEZht22DRLScymTRgpJyq8cigLpJwx4Fy5iCils7p/
	jq7Isu0pNA7MoM8TS61T31BFM0py5rYyxbdReheeJV9AJwaNG+l0+xjq6z6nCSSnx3w1goipnKC
	7gul5yAtCsok097yxCa61vNpoMi+QOIU4H3jFoVxUQi+OKnATx8Tv0wd6+etpFmGFr0u6wSOkU+
	2a6ll/vSHY+6yfTh49MD3hUzIFaAAqAJ8UfjgkHhiCrKA2xBTiy7cYZ/dmfLdQwZGLFRyHLtqar
	oEgVgfPr/tfB1kToYIJSj1YNpW5my1QrY1teZ7/OD1dXj4cqSPyjBNFvR/+VQ1J2PGTEIfW3S/m
	VYTTe2SRzocUYU0cPQNosdI
X-Received: by 2002:a17:90b:164b:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-3966d8b56d7mr7277600a91.14.1787716695749;
        Tue, 25 Aug 2026 20:58:15 -0700 (PDT)
Received: from [192.168.1.179] ([136.38.122.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d884ca8sm4052089eec.15.2026.08.25.20.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 20:58:15 -0700 (PDT)
Message-ID: <48aea360-bc09-4d0b-8f0d-84e6da3c61c8@alstergee.com>
Date: Tue, 25 Aug 2026 21:58:14 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: do not register UCSI on Lenovo Legion
 Pro 7 16IAX10H
To: Huang Wei <huangwei@kylinos.cn>, heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826034658.2170407-1-huangwei@kylinos.cn>
Content-Language: en-US
From: Alex <alex@alstergee.com>
In-Reply-To: <20260826034658.2170407-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied on top of Ubuntu 26.04's linux-source-7.0.0 (7.0.0-30.30, kernel
7.0.0-30-generic).  Hunks applied cleanly at -18 line offset. Built just
ucsi_acpi.ko out-of-tree against the running kernel's headers, MOK-signed,
inserted at runtime.

Probe correctly hits the ignore list and refuses to register:

   ucsi_acpi USBC000:00: UCSI implementation in firmware is broken, ignoring

/sys/class/power_supply/ucsi-source-psy-* is absent afterwards (probe
returned before ucsi_register).  A USB-C PD charger connected during the
swap remained connected across the module reload: BAT0 status stayed
Charging, capacity climbed 70% -> 71% during the test, ADP0 online = 1
throughout.  Consistent with the EC handling PD autonomously.

BIOS is Q7CN78WW (2026-04), same behaviour as reported.

Tested-by: Alex Bartz <alex@alstergee.com>

Thanks.

On 8/25/26 9:46 PM, Huang Wei wrote:
> The EC firmware of the Lenovo Legion Pro 7 16IAX10H (DMI product name
> 83F5) has a broken UCSI implementation: GET_PDOS returns no source
> capabilities, GET_CONNECTOR_STATUS reports an incomplete RDO, and any
> UCSI traffic disturbs the EC's autonomous USB-C Power Delivery
> negotiation. With ucsi_acpi bound, chargers connect only briefly and
> then drop, and voltage_now reads 0; with the driver blacklisted, the
> EC negotiates full PD contracts on its own and charging works normally.
>
> The problem is unaffected by BIOS updates up to Q7CN78WW (2026-04).
> The AMD sibling Legion Pro 7 16AFR10H (product name 83RU) reportedly
> uses the same EC firmware, but it is left out of the quirk until the
> failure is confirmed on that model.
>
> Skip probe on this machine, which is equivalent to the blacklist
> workaround the reporter verified to restore charging.
>
> Reported-by: Alex Bartz <alex@alstergee.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221142
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>
> ---
>   drivers/usb/typec/ucsi/ucsi_acpi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 18286d3e9cc5..9f36f8cfce4a 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -173,6 +173,21 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
>   	{ }
>   };
>   
> +/*
> + * Platforms with a completely broken UCSI implementation in firmware.
> + * Do not register UCSI at all on these machines.
> + */
> +static const struct dmi_system_id ucsi_acpi_ignore[] = {
> +	{
> +		/* Lenovo Legion Pro 7 16IAX10H: broken EC UCSI firmware */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
> +		},
> +	},
> +	{ }
> +};
> +
>   static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
>   {
>   	struct ucsi_acpi *ua = data;
> @@ -199,6 +214,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
>   	if (adev->dep_unmet)
>   		return -EPROBE_DEFER;
>   
> +	if (dmi_check_system(ucsi_acpi_ignore)) {
> +		dev_info(&pdev->dev,
> +			 "UCSI implementation in firmware is broken, ignoring\n");
> +		return -ENODEV;
> +	}
> +
>   	ua = devm_kzalloc(&pdev->dev, sizeof(*ua), GFP_KERNEL);
>   	if (!ua)
>   		return -ENOMEM;
