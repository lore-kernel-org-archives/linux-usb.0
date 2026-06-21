Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE225A359
	for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782070943; cv=none; b=ZwcXlN9bkGP2Br/f1yPLS1Ba+SxWYwJdB0An6QYHlJTqCeGrSZHjh/16RwmFpTwsetB7ba17jglAlmv3XHd3DYY0ZwJUPJEZQmiSVjz37BlI/QEFDn3bDxoGTaTU7PLd/CAbqk3jPnxWXaESvP8wJXevThU/+f7d8XwBTEY4xgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782070943; c=relaxed/simple;
	bh=gbOHMASwMAysDE2JATmQQ46nLDAFxR92pwVFyZ0FXys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CuF9cPpCA1ltqKxXZfgMZhab3OF9K2QfqxW3/dabCvWMa27+ZHQUXh568umTSFbBDfjmrLS2ixJt3HDwIKZyLsmg/TQoVT7lPhTvUIuuBRh1WhpEC+Ml5HoQje92RV9Vb/Io6wtsNsnIjNiJvIE+2TmtpGnDIMzLe158A+SHKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmMyAfkn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmMyAfkn"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-399389dae01so40239191fa.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 12:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782070940; x=1782675740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTedf7kSJIAjk8YgNnHHVaB4yXVpCgU6kl+IywnlrzM=;
        b=cmMyAfknS5phjTakQuZQ+HKkrwlsQV46BEhBW7Hbf5y6XxC7cRoz862HMDHjKtaSY/
         sdw3zxz+oSVq48ec+esW4iXB+Djd8wmNiAed7YZBG9RbYqS41zN7hll3X/zxnGptfA5p
         OX3Bgs+/QG1iZlPnkoqPWavFHodcK+i1mVqNObYqifwvEHJ7JDtWJvwEgVYXHk0om1gl
         5uDTXm1vykmraqrkzpk7lZpTecpbm4ITT09JB6zl/2sepoaIHda/ZnJIbb+VSWlEGrHi
         dj2Fs0pA46sZdsz1qT43fccritds2lj9fSsNXc2vRTreL40vjKjM8b2NB666ajauh1x6
         74hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782070940; x=1782675740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zTedf7kSJIAjk8YgNnHHVaB4yXVpCgU6kl+IywnlrzM=;
        b=EHd+FBNwTka9+hZGXR4ZdBjPW3QrLyRucECdV4izB0leMjGhlA43LOaN6nKTq6ObCO
         MZPelGgty1x7j2PuNggwjv8oayQrEE9UgStXJ3jcsfymNWxKvz1rNSId7WKPJkl1+QP3
         uJx/dNyRlrHAIojdZfElxoCemcNF+1Oqnmx1i2bduIPPdYD55YT/K+Ia2FCV2EOc9x0Y
         9OOXzgrOVm/PEpliGBIKRpFpdNAEDkvikTIxBp9wIdMZIVNiABJ4tv+Y3Q1+PkCVdWL5
         0w/UJrPNUI6DbhnZD1AS+o5UJzDzfiqDVEtxoqihWfuqd15RqZ7VIYyq63m2AWiHHw7p
         FiIQ==
X-Gm-Message-State: AOJu0YyrqpnfpOeYAJGAQ4YDtA1UibWJNpIvnwZxJZpC86ay2R/2cHgu
	DDV1O7zgHEpq+qQVFKYdBMYY8jZC817q6TAPwXixUm4yt7uV0D8+8WWh
X-Gm-Gg: AfdE7cktMqRSCzAYa+BVZn9koxQDQ8y6A6s0ua5X90klNUDQiABiJkkWPNA/3MfgqGa
	w8k2BO8F5Y9KDlQ/AnIImeqKpMMmpRqkYH4LmkTXD0J+9zKOmr8Ww3ubOkDRO7o+G6Wl0FrlsrF
	Rovo4PZZOKH7Qxe9T29USM1m/OgnlpmxSeMVyD2uVfocB9h6Z10+/jB8V2sTedxAvyxiCHxc2rd
	+OmAIAO4doh8bhfIkB3t/jWbPJlk4A+CesW/JanKtD7omfVQ8MKOfqpxU5hm6l0QTNhjzAifpO5
	xL2bV1jgc2u5XhIBTqlih06KRHl1tgkDW7ngg42eClObd6Cd6KyCCPGTixc1xNku2FhW7yfqGWm
	rJnNqqCNX/y59pnCUSo1k0GoBOLjNFc0AdM4bshrIfKgsBWpqHpRefXRPhstd8zGj7eCEEVMcrv
	M6vdiB6nySVoifbyLvtxE9Cw==
X-Received: by 2002:a05:6512:3415:b0:5ad:4c0f:6444 with SMTP id 2adb3069b0e04-5ad5628c10emr3673614e87.19.1782070940206;
        Sun, 21 Jun 2026 12:42:20 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c2b9590sm1227137e87.68.2026.06.21.12.42.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 21 Jun 2026 12:42:19 -0700 (PDT)
Date: Sun, 21 Jun 2026 21:42:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ingo Haenlein <superscalar@gmx.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] xHCI: AMD Strix Halo [1022:158b] isochronous full-duplex
 USB audio instability (frame active: -18)
Message-ID: <20260621214215.378d505a.michal.pecio@gmail.com>
In-Reply-To: <d7785c3e-4062-4e2f-90ec-15dc86ca11cb@gmx.de>
References: <48aadb68-b4d1-4dd6-82ca-76d0846b4ae1@gmx.de>
	<20260621202845.77536cd3.michal.pecio@gmail.com>
	<d7785c3e-4062-4e2f-90ec-15dc86ca11cb@gmx.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 21 Jun 2026 21:19:39 +0200, Ingo Haenlein wrote:
> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Miss service interval 
> error for slot 1 ep 1, set skip flag, skip now
> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Found td. Clear skip 
> flag for slot 1 ep 1.
> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Miss service interval 
> error for slot 1 ep 4, set skip flag, skip now
> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Found td. Clear skip 
> flag for slot 1 ep 4.
> [Sun Jun 21 20:44:14 2026] usb 7-1: frame 5 active: -18
> [Sun Jun 21 20:44:14 2026] usb 7-1: frame 6 active: -18
> [Sun Jun 21 20:44:14 2026] usb 7-1: frame 7 active: -18

OK, I see, it's "frame %d active" and I searched for "frame active".
Anyway, it's sound driver reporting EXDEV completions, as expected.

> Regarding the related thread you pointed me to:
> 
> https://lore.kernel.org/linux-usb/18b4e4f7089aa4f1.da8dbe994ae3bb77.445e21b98b0b205b@GordonMsi/
> 
> I checked my Strix Halo system against that LTC/LTR angle. I do not
> know whether it is the same root cause, but the error class looks
> similar: AMD client platform, USB audio isochronous traffic, xHCI
> missed-service / -EXDEV.
> 
> For xHCI 0000:c5:00.4:
> 
> /sys/kernel/debug/usb/xhci/0000:c5:00.4/reg-cap:
> 
> HCCPARAMS1 = 0x0118ffc5
> 
> Bit 6 is set, so xHCI HCCPARAMS1.LTC = 1.
> 
> However, lspci -vvv for the same xHCI function reports:
> 
> DevCap2: ... LTR-
> DevCtl2: ... LTR-
> 
> The upstream internal GPP bridge / root port 0000:00:08.3 also
> reports:
> 
> DevCap2: ... LTR-
> DevCtl2: ... LTR-
> 
> So on this Strix Halo system, xHCI advertises LTC, but standard PCIe
> LTR is not exposed on either the xHCI function or the upstream bridge.
> 
> I do not know whether Set LTV would reach the AMD fabric through an 
> internal sideband path on this integrated controller, or whether LTC
> is USB-link-scoped only here.

No one knows outside AMD and I'm not sure if it would matter anyway.

You can check if it's the same issue by running "stress-ng --stream",
which is supposed to "fix" it by keeping the SoC out of idle.

Regards,
Michal




