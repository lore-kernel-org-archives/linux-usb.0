Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180183;
	b=uEYC0n8SHUmcYDqXXfyWTKZRjDC2Hv9txbaA1wX89nbyf+XhSPDx3y+Dt2VoMDOgUihm
	 o9SGx5WZae+EaWnytdv5SN4woQOd8eGaVU3OGced61IXZoUFRJJNef71AptOZ+CQ5Cz26
	 X+Y0Rmhv0hEa1kzWbh/+qfir6gBd7o8C3T8Qnua+TFZaCL8fkkScgPpYhXlFs22tA6MdT
	 tgtT5da44LUA3f4uPADm0MWIEPa7EEOaAO/mCmifDF98OK8ZsWz1GEb4wLLU6pS68y+gy
	 K9XOBMWSqEAyqYGURMLOaZUVwCli+BzEX6qZilOwtaur7hwBMPgO+lKJdA/eqRdxuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RasCjunpCh/NnC9QmLv8I/gSUP58pKx7xFWImX02RhM=;
	b=yAu/Jo29bNMK8B6WZGQ01AZP9eMg9hybzd6qzYfC+vKr40KPV2hApJGvL1brU2LbnDJa
	 xti3XR5UqHp/ZLDi3cK49d/8plVBF0er6kFLW2MlMcYTSM8/aqRdXuPt0AGeX9JIOUp62
	 A6ciPzHj9c98nVcUaR2htT1Y5Ij9xm6iCMYKjvylwJgmf5wwWrL8MVenY0kHMb1ahwBny
	 r4dsSGcVEXqc/yy2+jP2Wt0dmpUgUcdGkT4R7AGQXCh25CEUL9+VvxJ8rjShcE8EkVYxU
	 l8IweolG7jUHH/CKo4unjCiKlgLUBgPmE0gaOaU+wvFU2qTlpFzY+8fDXZ3nCPOzZWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO5fdKi4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92216606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 09:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92216606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO5fdKi4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso6110555e9.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180181; x=1793784981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RasCjunpCh/NnC9QmLv8I/gSUP58pKx7xFWImX02RhM=;
        b=IO5fdKi4z0OLJU7M88/lVVb6oujx+gY8duIyBx8erfI51FuYBuaXd1yPV1ZBI7NoOg
         cFY0Q9LmITOxTsPeS93gOoaQMCziY4PA+/tncE48IFF9LRHTnwxXwMQSi1gc07DrcAbi
         +US+GjuAJFUTxb7VS9qX69A4UheQ8Tgm1cVq+w8nMetORtjcvnGD62cFm6SRwrBbCKL1
         g9UzJ8T5x2+Vtp4TIh5aYPMoUosdmIv3WRAbx8W3euHH7pulvB1/YJ6i8Awr7pYR/oHe
         c4lRhn/5iZk5jZALIdNkyQ6p7gvoh5Qy/qH+OqYHc3QhTOdURJfLl3LX214CvBTHizv1
         US5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180181; x=1793784981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RasCjunpCh/NnC9QmLv8I/gSUP58pKx7xFWImX02RhM=;
        b=YA7UaQeWXmx3SJLhYxZrGPfxpEjQlwu265z6FRymkgGrnHYBA76V22aFUUUheOsVTE
         p9vD34lcUCHTr2EOD/RPEHy/jRioQLpQlfYGeXteb7GBgdloLnNIv1I++PfN8HxlpaDD
         lK2xfgYTf3comVF0J0Vud/e3RzuVAS07I9neIRQCqOgs+CLB5TGSKIf04oNLUTBus6Fp
         iq23FmSgIAVXYFJxuWKsU7d1OV65N5vFNYeP6uChbcBKpGxFBiIvBSUwpGgEp2z+v4Bl
         V56heMu2sxKsZ1vN2l4ltI6vhrEbIrRFjWstJDwxM20GqyQl8SKvjtnbOONC8Z8ueiIZ
         jmHA==
X-Forwarded-Encrypted: i=1; AKwUvBypIkABTW0kaa8EU6NMEEzxtwDHls7HtPtTLYb1oElARD2UIPkI6BAggCQOtydx/X5gWbnY6JBhru0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf7P5veImUGrh3HkjeIp05x+dfd+EtL9YMVqskDM+emuGrJvC6
	+Z296/qnWUWWjVoO9eXUuoM5WwTXB5vEaMkduHUA0nHH7nphyu/3RnmK
X-Gm-Gg: AYBFou32J0Y7qVbAbKqZ1ZB4w07BapQYtbxfNS7iv/kUskDvm5BKoQvouKldMKy511a
	EbvUipx/vCe0f7+XVmGuq/7txAIvqYecLhbWNyNKQROf9AEyhz0BpgS7yRk8U8eh1AqjWj2eKD6
	hQHTY34H9EQWRdZWWHUXH6x1LtpbVECulJ99JLp/VQT4gt1BirmdrdQZY4Ozfz/P0F5PAg1FLmI
	kwl8NyPqqPzGX8uOXEVWyJKXGJdMRJXK38SWgqCTkPPKoTyZhLbC8At9yEtlTowqf/MwzQFd54l
	SP5duXhGoQN1MzbEoSO43SgqqoaSpe7tEjaqcWO2gIFz2TPIGCQX2Vn7dBR0gDqt93TDaVcq4dY
	VFoXBcT9oQoTGxX6tZAVLfdzu0C837GC5tralJHAcOB5RWI0r3r/fXodA7vFVkbrMewmkJzSgqo
	W6xAv1lzga6qjapieUjgaebBLu7DL+DFUolK/XPpKOga08CmyOAl6W5WMCPSvmUUBUi0qkRugnc
	aPiL8rvVBHP0mizSeXY02KB6tWSD1UjPMzZgHG70DiDGRCOrf8aUoxQSXYmuEjwI6Me68xDqg5E
	mn/fYVISxCZi0Wj0NJysnEJTUD8NS1Lniaxujw==
X-Received: by 2002:a05:600c:609b:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4a965ec941cmr33454985e9.7.1793180180835;
        Wed, 28 Oct 2026 02:36:20 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9ead8aa0fsm5886335e9.4.2026.10.28.02.36.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 02:36:20 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:36:16 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: wenxiong@linux.ibm.com, mathias.nyman@intel.com, Bjorn Helgaas
 <bhelgaas@google.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, wenxiong@us.ibm.com,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH V3] xhci: Reset TI USB controller on xhci shutdown
Message-ID: <20261028103616.29110069.michal.pecio@gmail.com>
In-Reply-To: <20261021160608.8229-1-wenxiong@linux.ibm.com>
References: <20261021160608.8229-1-wenxiong@linux.ibm.com>
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

On Wed, 21 Oct 2026 12:06:08 -0400, wenxiong@linux.ibm.com wrote:
> From: Wen Xiong <wenxiong@linux.ibm.com>
> 
> Fixes kexec boot. Without a hard reset, TI pci usb chips will fail to
> initialize in a kexec booted kernel.
> 
> Signed-off-by: Wen Xiong <wenxiong@linux.ibm.com>

[ Adding linux-pci and Bjorn Helgaas ]

I tried to make this code a bit more "proper", by moving the
pci_reset_function_locked() call to xhci-pci.c from xhci.c.

I found that when I actually run this, I get a warning from PCI:

  unlocked secondary bus reset via: __pci_reset_function_locked

Bjorn, any tips what would be a proper way to whack a malfunctioning
PCI device with a heavy hammer to ensure it will work after kexec?
Seems we have pci_reset_function(), which locks the parent bridge for
us, but it also preserves some "state". Do we want that?

I'm also starting to wonder if we shouldn't do this reset after kexec,
to cover for kdump. Or maybe both, because shutdown() is supposed to
quiesce the chip and keep it from doing DMA, and we have no idea what
such chip is doing (if anything) when it refuses to halt.

Thanks,
Michal

> [...]
> +	/*
> +	 * TI xHCI controllers fail to initialize in a kexec
> +	 * kernel without a PCI function reset
> +	 */
> +	if (err && (xhci->quirks & XHCI_RESET_ON_SHUTDOWN))
> +		pci_reset_function_locked(to_pci_dev(hcd->self.sysdev));
> [...]
