Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396633;
	b=ofdxRSoD9Ul+IwOkx/xQP2zX6D+tp/RmPsfxu49XAQAsXfEKdplsT7v4aKWT4NYs/n3U
	 VlnPbThwJOcTHXu80vQ3qUjnMW2rBjPYgKHGOmoYGOl3RCcDXsvMyjU9HFNKkzdFjMv8U
	 Qupwgpr9+3LzLkreSmy5RKJWMqYZf5aYoUYczil/pgfNlt+QwWAmFBAGy4csAqNW8uLY5
	 iH/JQwA4Ru7LT87utxV2+ngx/zzp664zwpzNR21tjhw+HgEVqJbR6YtC3jazGHKIDt8eB
	 nNoBpsr7WkOg0oEDudPH+bt1h7Dc6VkqgdkqisB+kSNI7rg+uW3kI90UUzMcFHeJTGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
	b=dCPCoCr639LhgGMNzzSlEeftyR3h/vWQEgBxHYS3NVViymznx9YtvWCrD+1uI9BCIQTr
	 btZ5S8vVzru/R27m93+QoCX8Le1XsEopqEM2gVGhxTpyUhYpdqf9hIIs2DutdBRgPnVU7
	 TfNpxijcciDrOmoKp0LLbW4i5sJ/sjziljg+2LQglJHVkqze3Bmpe5dI0AftREu3Gfxuc
	 cl+Td9WQxojQTvZi+AIUVR7NRn4I966K2U4Fbbhtg21Pe8eIBnoQmsv1BXXCtMrIZqYlZ
	 zAZ1ew/LV3PbNESFtlYUVh50Qjb0BDVQNKC2EmIGsJeuvCBDPyQYnc1h6Z1Zptg+AYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3oiXrb7;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68520606A31D
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68520606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3oiXrb7
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b546061d58so6280289c88.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396632; x=1796001432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
        b=D3oiXrb7ZmV6BWAyg9ScNT/pB4kPE7fyRC3Fy7kYNpwrjx3he5btiKZvcUhIe41p/G
         JhAEMuGmmzQPQd4cLdMi6Pji+ComVY+E5+WpVWCvDkb/KE2VjWuqoPzDYDw+vNYAoZHm
         vh9EZrh06QHbkwflnvIKtYD8TWxfbCB9hquDR+zecgKzlth6KSPemD9z+BExFCcES+5c
         mERpZRe01ozEDuHbKLe1TRWij5M38D8FHyCfRGJq9CB6LPzvK6hIlkzov7jmAe2JvRdQ
         +P4NMcO4Vox5Eh/HgYXXkOjWQ/n2T3ZWjhmWkYnLVc5+4WbXYzFcr3PblxFCJhAlcePW
         OtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396632; x=1796001432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
        b=nwMEA/qsBgf1C6W2ZimYKSsGijOp3Iu4j+G7CLdadECW1K1zFTCSanBGuzHtxitNa7
         v9TlYKPUVZhsXcUVMwEuBk3g4nEhN4RJasCTym/Dr3d7rxv1sVtr9Cp6OCJ7bEod/ipQ
         MJhcTtAr/2sMEP21jFEVbBDjfpZ86AX5afUs9jPeajbhm75SMANJI4YoBXyRX8IE/dhZ
         ZZ/ftPGTmBx2YcdDe8FtJqvscrjAOtZ4VbyUhQSEeJWyZO6qxrM6uDZ1VP1/zmlgmjHL
         2YxMWLdPXDzkSl00NA55YicYYCsKtIuwrpjxZoNU7Zm3KpAv0IB7RJrBvY8KopZM3IOI
         mhyg==
X-Forwarded-Encrypted: i=1; AL+hErHTovSt0bgCyTgsFWo5uVuG5EORbgPqNuOOLXtXKwttFYrFfvCOgrpWH1wSw56BrU3XIOye47a6404=@vger.kernel.org
X-Gm-Message-State: APuU4Z97UvMjHRsLtyrvAJ+YTuqL9pc+7N6RyteKYWAuV6aKRxDXQ0J1
	onLKhsR5nLYKg5kSQ1+QXGqAP95MKQa7OAdR44RdWP4Lvib7NvLg8s27
X-Gm-Gg: AZFdTZdpr8wBkZ/tVH+4PIev7wgkuU8r6itOFyjUa9u0FZZIMneml8VBmOmcvf8vcfJ
	ZFTqWyRKEx94WwVdW/20A6xTExdKLll3LqXO89zs5jtYcbrAn5QrDebfO+ZWX4OONGLXvSbEm20
	ACYL54dP22/Kgp09c8C9YUHIgqUiA+eBIcN6H6MImmwdJsbJIUut9c4JKLELVZ1D5qXPn8RCX7b
	4+91blypy+FOCvmHARWSF/QiNEgrRxd+iWBU+M15H0pHf7gaOYRY2TH6VpHCVffDlBPLzdB70rk
	QJ42lrjXOrFUTwknoreCaOtosbb2RYMfg7S/szcOVejTdINJQViF8oNgW4mmKDZVhRH99c0e/o3
	Th7oYTqsbJAIwovtRGaZt3vuCUAYZvE+d4Fbo3ZFO7Pn+GBLXY3CX9kqBdyJhBbdofg2q/pWe10
	FlwYdngq/NwK0vbw7xj7ydY8Wfja2Sdtfc/FnehFwc+ewsSaqcFqcSP0wfg84roVQy2R4o+eJgV
	O4VGleSyTXgn3npN8LvLrPqzL4krDlHNNxA6jAtx/cwkfFFHkHnPugEs38LdaLjQay9xuRvQs8o
	Nt/4j5HY8ZRboUP5nP2ZM/zvt3iV0ZjXSwYHqu19/Yq2a9Od6bzMU6Xm1EzMY1LGSRBaDls=
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr16998658c88.17.1795396632411;
        Sun, 22 Nov 2026 17:17:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm23764321c88.1.2026.11.22.17.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:17:11 -0800 (PST)
Date: Sun, 22 Nov 2026 17:17:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Martin Diehl <m-diehl@gmx.de>, 
	"Alfred E . Heggestad" <aeh@db.org>, Thomas Reitmayr <treitmayr@devbase.at>, 
	Slawomir Stepien <sst@poczta.fm>, Jie Wang <jie.wang@intel.com>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Randy Dunlap <rdunlap@infradead.org>, usbb2k-api-dev@nongnu.org, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: remove obsolete yealink USB phone driver
Message-ID: <awOT9WG0ZdNkIm69@google.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 01:57:21PM -0800, Dmitry Torokhov wrote:
> This short series removes the obsolete yealink driver for the mid-2000s
> Yealink USB-P1K (0x6993:0xb001) USB 1.1 Skype/VoIP telephone handset
> and drops its module selection from ppc6xx_defconfig.
> 
> The hardware relied on dedicated userspace bridge utilities (such as
> usbb2k-api / kb2kskype for the defunct legacy Skype desktop API, or
> yeaphone for liblinphone) to drive its keypad, segmented LCD, and tones
> through custom sysfs attributes. That userspace ecosystem has been
> unmaintained for over 15 years, and the driver itself has seen no
> functional updates, hardware testing, or new device IDs since 2008
> while continuing to attract syzbot USB fuzzing reports and drive-by
> cleanup patches.
> 
> Thanks.
> 
> Dmitry Torokhov (2):
>   powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
>   Input: yealink - remove driver

Applied the lot.

-- 
Dmitry
