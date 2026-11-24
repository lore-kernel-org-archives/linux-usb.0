Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=VnjhADjRl34cyn3F4avCwqVyNE1XM53v8BxgOHT+F3MNJ9uNLyPcGAE/V/wRaJhDqxSJ
	 uXp84cGRupYqvn/UpVZLSWD8mPJnI48CoAR3yKLO3CSqSAQLHa+HUMk9tN/MhJG3ZAvNE
	 HLseL3sb/WjEOHkzfCx9eZWX3sHkLejG/GiqkiosRCfJW1UfiI7b+2C3lKrPSX3tL3Tgi
	 v3Olp+QdJb9p1GT2f4Zl+E+RD/CFNfqfVHG6ApIr4/SjNQ0P8Y/wuYQK2/Ij/4dUdpCGb
	 4PdfuJCfr2lLnPJi3bcMYLpe0EEqgGt2xESzWBDPuenHceXiBxfYWKiJ9whDa1ZMMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=AZbAsM1kZ7i3hmV3Ct9QhUwGuL58jw7qR/iGfHEfaLMbHCJQCWvv+pll8qBSPf3q3XOx
	 r2L10W/ZsGKt1xiDEQUQ9ObcuCR2t2OU3L0//JnuMMoxSQkTQrc6sLRwrKAiANTmjG/bz
	 nQ/fTReF7vkqQ7ZSFvZuBRPHQVd4VtP6lp/1linHvCfpKQGp3taBidQOU+8TqTyeGTQpP
	 YetiotJAc8aZqHKShIcooe44Ki1bLPxsNGzo3vzgmwdQV9Eol5b216EZtOnkyfYjHhQWF
	 +V/TTegL+M8PcJ6Jww/gXWe3rgAwWEtZH5onasFaGWyuOxpj5wVwaGs/SPdpfeazQ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370DF606A333
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 10:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370DF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso3655049f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=KjiX7YWeSkA9Dw0WA5xjWaOqnyEHCedD00sUzMhE3sKEAvQ2TPIHmIyS+enWPn9hqU
         UHnNtz+vsI9HdnLLJLRNEHpW3n0qDPjDGGb+MMmUEkY4+DtknEToZAEEAwd6ErlDRM4U
         sl6ks9V8P+KgBQBXge6XtIwqjU1IX32GeqDZpfsQ5053CJLA98ICyRMFUcjrF7GwSx6y
         mLBhDMnek6X1+TiwUBOkVQB80sS1Z2oue9zDTiR4H+wlMmpVb+6EJ+EZoBBfGsOtxa1G
         85CHt1w3B0RFKCYDolOV20zywTKINPHyMkeAAvRZwyufXjasNY7vVq1oJTMaEgpAJPJ9
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=uvTo9Fgyfoho2LbrN58WddCBUopLa3RqfnkF+7nwgsnUzb8TbYfgdCpHA1yOZx8cKE
         PQNzkaSJMVMRc2Dq43vO9yxqfLnLO5y1w5YUp3jrRx5PMs1cTpAAHaxGV8R1V2yce1GL
         5KOHkJHYfb9LAZr8ujLBLXFalRtHGzTNs5prLXnqzjLmvmKzRJKyGtGMTCGbiNxv5jYV
         Ukt33IJZRxTZstk9lOvD8cjA2ePtVnLoRdwkTlrTWfzdLB6ESAAOC5MDgxXeAT0ZSyo5
         cAv2j4yxtnb0FgZ0Onq2kX1xkRvaWaKWA9ZONoYxz2AhjpCYsCzy1PdJsBponu0BCQLf
         NQ0g==
X-Forwarded-Encrypted: i=1; AL+hErEPWFzzPdsfHkRl+oVOH/cTzUuWB2YFBsT7tapzMsu166QyOMHjNz4z+6/Ci+zVnFGINNdXqW8BVx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k0XU8Zv8z6k/PtRWX9NK1YwBgVo+WiyHA79B4qnKSDRpnVedx
	qot2EaXjzO2v/mB6hILi1NFgU/4OmmOVLFAx837UE576PvixGqiUbzd8lCh8xdDV2WE=
X-Gm-Gg: AZFdTZdpbD6UMgcqr385AffwG0L+IgqS7gXI/b2kf2ejupO/4WXF5RDeMtdYGusUCUs
	wQt3l+Kpts5SioKtT5eAyMLjisGw0RoXytcNXoFeaRAcrkZYH3tbp2JjpRQNVM02EKOZRJfbcLI
	+GAD1glr6kwK5uEuVTdlHSO3tXlddlGbtdym/YSfBssFskIi8BMVcfMw+hmpsTl9LonP24bCjy8
	fQiE01L20GBNz9539McBdWvISLtjcjZZFl7zZhyWiiXlYuBWUuRYgcim57+axtfxK9zGe8GAXBZ
	PS9cjder21yFPmHJ5oLAieCaT3xjD3xkkpBRi9alvVz2ppwHD8Q5nw+QZwVbEKltgFoV+v3JJ8/
	DaxKUzdsA/Jrn2TAvl92xhwitLi+Kc9TX9xMyIdtfmOj8Q3vuGWQHPIpO6qln8gdhB+czN6JQ7n
	WFiQvTrDSOwib4RjkShRPE7/jvuO6mL77PXDyZv8++S9pLhWP+pcVwiVt9lMnGHGbLrdnHoUx6J
	ZPy+hhOccjIKHQqlQykcdG6KgG7jVcsysJsoznVW6+YnVNn3pxMdXxf8IgMTsJjrS5Y1p/HFlfH
	xyzUvvLPTQAd281O3SMgDfiW/ftbN8egnWk0N1wNjBb73EflEV3ThzbmfFEgQJ9cT18+
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
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
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver
