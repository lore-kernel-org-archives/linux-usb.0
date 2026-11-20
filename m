Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172318;
	b=LD+hiild9ZUXk7+OgCWCKmaxtUucEGvBRY5oftsGK5hs8bxCtNYoOUGpLPqGnPaWgPsv
	 ci62yg1z329yHUFrwT62t8oDgJvo5fWeVOnnff5RCfWKfCDqC9y38lq1t2wGf02hvlWrz
	 DLwuVXgGqZtsMyD1bKa0NLUI6dTNVi3nKzJMkVCkIGu7rHwh+Mqo0+yzFQkEPZPnXKaBv
	 qf+770WhhBoR9A3r7C+rBrymBXJxehFEMfFkeGE9TBrqD0NnvEAXx5001OQJ+XO2CYEtR
	 DhRn729Mpm+8pUDr51jL1AVOZlA9T3SpsCbhQNi2Ox32OsK47WyPOvNheEYN6RUwf9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ex6Z1jSQ+4dxlVRkCcqyees5rqcGmwfbNgXE+eJUW5s=;
	b=rkp7Td071f0uxkLtEq2bK78oMIJl0yPiV4227Jjv1+Cn2NU5cwk9BEfvA5szrNvOp4o0
	 TDaSJAZNCNpuQjuiSggPKdf6NiPEUqwO+oflM7l6QIQ2C9q8r61vvrZ2KRc7XLM5hJabQ
	 jq37/C0w8j3zJLxG+R7GY/9IZdMVKr76Lc2blxXwKXWBF0YhNIKDDluFaDtF3rMERy+Bv
	 4njloyX+kNpX56tJ+Ib0hOCgxctUCNGRY0rTVZIQsFXG8sIyq2EbHaPlTd5E+4tI8toRd
	 Kg9aIYbo1OZeAWJFn7wV4+fjvZU96RWJUqdT8y+PCEY0cyale6yt7FxwxTh5oGxjIYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4cODoLm;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02897606A33B
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02897606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4cODoLm
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d427836e9so119103666b.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172316; x=1795777116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ex6Z1jSQ+4dxlVRkCcqyees5rqcGmwfbNgXE+eJUW5s=;
        b=x4cODoLmAW83GYAIaFRCuxIT6N0LYpC30QEtfS4462cRHjQMTIIVo93y07NiFLQ7Vk
         Zl4qMcypwawUtqxIjo6ePDrcRjR4Tw2KMkrVCe4o2eh6A7vwqfBc9DK2OMua9NvWgsAU
         NUnAaxXIIIj1yG46RTPLzBo9Mj0C+VPk0Wsb91PiRh/RUh7oHP42XCrwkT7+5ESafeVK
         76HwVKAqDkdPdQZeHlDTXGJO9SqtYdgh7T58+NCG732FL1kW2fnOsEvwp9KIFg4FP1iR
         6iXLgAltWtDJswWKlPZTOTFs745LhS8Yknu1Vnk5X5GmSE8r/SjhnJwj4YTQVcLscHrn
         5BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172316; x=1795777116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex6Z1jSQ+4dxlVRkCcqyees5rqcGmwfbNgXE+eJUW5s=;
        b=2v5lMtX9TWbW+byF7EF+V5o8rvnfz3tnuOqrMyhkH26+3kY+Dq+B4TeFsVqXDUxZjx
         +HfyN8U/oOC3EGBcIDVxLGZ910fLrronJRsg2hcD2fb7lS3a4g8ibuo9cQsOQ6xr8nPs
         FTHfiroNKllt2JJdHo0QTrAsTBqJ0Z00DgrPMdWF4aoN2abJBgF1szl3w/SxH5yyOkUf
         CdZxHRJbFF5LBiyYnG19Ryuw5xnHlw8t1MmXnoMFBOuv3/l5kRVnlIFq9tji44yn5vDw
         OvOBVl+xJ8gTbd6uSL7ObX+WF+Cnoibex+2u29gM14UlzMvmHKTxe1GZwmFdV5F4iZNn
         0UZQ==
X-Forwarded-Encrypted: i=1; AL+hErFVkAnvxnHw3DnKOs+oZQvX6wQt4/G2qOeR6dHoU5UZ2YNoHjbEYm0RDYqdVzcfn98VE5rnzsfVT0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/CbxZLfA4cr9qWeXyddZ3/eiFMxDOPEsjOEpRhZJfAtK1vkLX
	X98qBXrZ2JHA08Uv8NspqXwKGCsXhFiBatYQ2VfAKjuyIES68ZGUMW0p
X-Gm-Gg: AYBFou1qoSjy4NVTQyxg8OEo+3szmeclX/BPQBwcsAN/4arRVHdYkb9F84PqqLRDdPy
	qveCYKCdMQdeyZQctldfjIggX5UwZlzINEsVXb8+ebFeYBDNv4SQuOr/1aqptUy7C6zefapbrN9
	7xozqk4yyDgq92S4Luu6EzDvamW/VIsSindDRL8Yiw8VcpfIdUqMDZZwPMh6VBJqTz9KZvxR1A6
	JXVdLheQNMLMaE7P6o9niYeUEs7Cqm6uizYlY/ma2a9Shjk/nfp6SnVIASqWShmPG3K8LZXUVvG
	OjurvhQs+Kq/9WqRMmTBlwK6AedEQ8cwduFpFWer98dAysKFU8TVOBOTCqLOlalfs8r4KzIez/c
	8HZJbnBh+HawIR59g4swdzuR1NwG5DfZlT2wlbJPSglWHLt+XRJ58qBeSeyj8je35SgssZxm12a
	q6Xr+JMjDtPQHnkwYM5CKg1xvo5beee+si1mkiL1lr5iu5Ps+F51SnwYAErHisOKPuZaipApxxs
	G4Mg22o3FkXv+5FmvBW11beJPrRfQQjlVeuVUtxhX34/5BQ1iIUh/v0z45htmLycHtY9qc4Ly4w
	FNlo0gtscG5StZjDbLpcvq31iPUvaNyqGB/eTC7+W4pO0uT8yaeSt9IB3aHrkRgRyhFYPgFo0jt
	J+7+xjS3drEJsf039sWZhJDYbkdG1G3LLj059EGWs4YE=
X-Received: by 2002:a17:907:9625:b0:c49:c76f:dad4 with SMTP id a640c23a62f3a-c513ab36170mr274998766b.31.1795172316192;
        Fri, 20 Nov 2026 02:58:36 -0800 (PST)
Received: from nixos-macbook (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm86608566b.39.2026.11.20.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:58:35 -0800 (PST)
Date: Fri, 20 Nov 2026 11:58:33 +0100
From: Jacob Procee <sn125164@gmail.com>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <20261120115833.53ab9076@nixos-macbook>
In-Reply-To: <20261117124710.GA515128@robin.jannau.net>
References: <20261112113005.16418-1-sn125164@gmail.com>
	<avw1kOqmrUii-msr@black.igk.intel.com>
	<3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
	<20261117131713.2db5294d@nixos-macbook>
	<20261117124710.GA515128@robin.jannau.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-unknown-linux-gnu)
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

On Tue, 17 Nov 2026 13:47:10 +0100
Janne Grunau <j@jannau.net> wrote:

> The interrupt controller (AIC) doesn't have functionality to configure
> IRQs as wake up source so it should set IRQCHIP_SKIP_SET_WAKE. Does
> wake from USB keyboard work with that changed?
> You might also need to add "wakeup-source" to the dwc3 nodes.

No, it still doesn't wake. I tested on Asahi 7.3.4 (j314s) with a
local test patch:

- AIC and AIC2 irq_chip .flags = IRQCHIP_SKIP_SET_WAKE
- dwc3-apple: device_init_wakeup(dev, true) in probe, and PM ops
  that call enable_irq_wake() on the dwc3 IRQ in suspend when in
  host mode and device_may_wakeup(), disable_irq_wake() in resume

The keyboard is behind a USB2 hub on b02280000. I had to enable
power/wakeup on the hub by hand (usbhid only sets it on the keyboard
itself), plus the xhci and root hubs.

On suspend, enable_irq_wake() returns 0 for both IRQs (113 and 115),
so the AIC flag does what it should. The keyboard stays connected
through s2idle and is still there after resume. But a keypress doesn't
wake the machine, and /sys/power/pm_wakeup_irq is empty afterwards, so
no interrupt seems to reach the kernel at all.

I didn't add "wakeup-source" to the DT: as far as I can see, neither
dwc3 core nor dwc3-apple parses it (only some glue drivers like qcom
do), so it would add nothing beyond device_init_wakeup().

My guess is that the halted xHC doesn't raise its interrupt on remote
wake, and a separate wake interrupt is needed, like qcom's
hs_phy_irq/dp_hs_phy_irq. Do you know whether the ATC PHY or some
other block on Apple has such an interrupt, or how macOS gets woken
here?

Power cost, in case it matters for the default: overnight s2idle runs
with a key plugged into f02280000 (lid closed, battery) came to
2.29 W with wakeup enabled (atc2_usb stays on) against 1.96 W with
wakeup disabled (domain off, device re-enumerates on resume). So
keeping the domain on costs about 0.33 W.

Thanks,
Jacob
