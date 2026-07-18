Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E063D3B3
	for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2026 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784341622; cv=pass; b=AXThzZ8aGSz6E5fpgSSqD6ELysTcVuhiRSLiZ1N4lcH6OoYpicObjJlZoSY/WX4lodjITi75O1SwEO3S+BRor589zOlHsB+8QtaYoVfsgvsN9ul3wQxHcyWb4A7mRDcL2xC7QLGCeBw4isTSzNc9gWu5sJQDoKNu6haYDCs9d2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784341622; c=relaxed/simple;
	bh=pgIV7aKbqHytik67W+b1EwdRl5JQN5YDhvZ8bL8PJnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLsENmFafJS8jOsyr/Doecu0ozkfpCtkNFpAmmIo8gNVVhpBIZNJ1u6UfC/sJqVdj/Y7N4xaH70OSJ5P29yylcZ85ULOds4y9VHKIs0J0Pfq48QsN9346NoKZG0hb2cS9Fl5fmQwMpKkE/+NUyhh1+pDnPiagCPq0MCgIIBxkTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=EcIB5JNM; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="EcIB5JNM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so4198096a91.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 19:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784341620; cv=none;
        d=google.com; s=arc-20260327;
        b=CaFwPDk29bmYNWu6DJnZrI5RYHXctNjkt9BVTRDY15H9P19g8kvPtIVFpM3Z18yxYG
         /bJcl4B08tvzCDJLtPfo46pRU4fGKHyVWYasX3pe5wp07hIj/xc09hM1O2LUKk2n1eEm
         sLQNbQbo3TiyMG2XeYdpLkBzIYud6gx+6ufDC2xdZVbgGTmBdBltF8sT6p8kicJIHO+R
         3bjeFXlggd9YYhZIu1zUZfkAw+TJQwMi6/AoeH6gPjzcT2+wxGen7yTIpUxspU5yV+MJ
         0VokcwVqGKZYx5jaU7TH4bCv3tbJsSkgLCyBeZL5LJg4gc0XZaVTqMzofFoEZSXY1uQC
         QZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9G5E4Bpqv3WVAkSn3RpR+71BbPgGPWbp2fY+GvAIce8=;
        fh=CrvWdkxKjD5fXwdJA2HKxqnyRTkmPUdwsMF1cJSa5Wg=;
        b=qibyKoMMcm/thYic+B9u649sUMeO2zrSeebruOD221kNh27N5zEluCftGUXf/5iQHh
         KgEHWYhyr4FGA5ySrZJ9SPkD3Yv3FRiw9p3gtS7CXGRqNIPKrlClWLUs7/7t3w3ZYdj4
         uBMeOAnkjniPcKiKFD6Fej168eqQNYfGg6mOhN12qTmVxFQsTiuE6Y7enhBT+SQmUQDH
         PzlxXTBPSpWcy5kh9ZyDbUN7bLm5rPb2V0AmmrLAlUbXr7V4QkleRD2wx1ee3tHXfQ8D
         +ZxT8F5GHt/cauMTGlB8F/sDszBQ1XozKPl9a3FgYYVnPLWA+RjB1jfy0qdVmm0g50oa
         AzPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1784341620; x=1784946420; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9G5E4Bpqv3WVAkSn3RpR+71BbPgGPWbp2fY+GvAIce8=;
        b=EcIB5JNMXG2A+Unq+m8rfO5GqyzI0m8m32A6lICzxckn2D3+W3It4tf0vVlhqzLk/h
         rmbKmxcJSgHGgqF/KBCRNqlPk12QFHVQqzka+AaW7sXQk+g8338/SUrfRHKWoZ7zrHQF
         v5yF4qvCEYV7LyoKLNC9mscAnRtAIU0XqTPw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784341620; x=1784946420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9G5E4Bpqv3WVAkSn3RpR+71BbPgGPWbp2fY+GvAIce8=;
        b=LZzYWC83YJ381hZJpqbT1zH9D63w5D3Biy6FGnz+bkbgIEqrjs/Pw4YQdw6oXQNmbR
         4KUkBZRYnn26j4AQQXRA06MW1IQdEFCQuCOCSsWcOg2C46XORTUNGPv0TuKPCLcoIId9
         pGznB+iX0XApjrcqBhDXC+5BgBCqvqqJO8o9KHbZrEi7ZZfhcZ5gZzpLCloLIag9U99r
         hCfV8B7vos1iNKfSy21A+WUDgduotIHq+sIj+ubLyH78OIq5CexfefmT5jEoNfkUhaqL
         xuoWlv+Ar+4jpbCY1r/gWs+iotEoRE5gxT4hpJhwNnGV2RKjwyXWJUe6kpDtjMCwkUyI
         TmaQ==
X-Forwarded-Encrypted: i=1; AHgh+RplDB/ItpU1apX56NKRX5pZ9f5Jb1gD3U9nhN08jDK/hbpBaZhAEIJJHqVLzobG7FCuu9nc8Jrc9qY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XNCtSGo/tKhwnNZLJPkZDcPsipvL90HYRa7sJbvSSoEHRRdF
	35YkXBGoX5Clz6U9Y7UV75n/pm8mneGuYU79QB40fORlBGVUhHoNuZ25VQM3+nqjMOkWCQzx5Jw
	KZTRxz22k70xegey6jCXu9Du2CkJ0UEQ37fS7oEf59A==
X-Gm-Gg: AfdE7cmV/4JHzVkxoV8VsZYHz0i0/ThYYusYxcYSYYx11x6He4zHCy3aaFxRh20vWf/
	zAF3C3IIbZ82Z4Gl5VEvExi3akVTrDS7tXXtVu33ZNqIwwXHbqLP4aFMC1I38oSBjrE1EqlYVc8
	EFJ9fCmlwM96R+LDPV+o234fgmPhXENxs5xJKPu121T72kpL2J78ursUIzncD/lLXgPnvG6fnaU
	Or7tBEDZmOdHNnic+3PHSFjnmdXi6mwCzzhbYZB7/gRz4UyPQVD+gfZ5z0aaTAkqC9bGC+CO8OP
	ogg6zVZ/VSpsQ6u9fGiH
X-Received: by 2002:a17:90b:57ee:b0:383:f52b:d616 with SMTP id
 98e67ed59e1d1-38e4b40292cmr5642393a91.10.1784341619978; Fri, 17 Jul 2026
 19:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713122205.1350933-1-daniel@thingy.jp> <20260713122205.1350933-3-daniel@thingy.jp>
 <alcfzDBAtuSZG3pq@hu-petche-lv.qualcomm.com>
In-Reply-To: <alcfzDBAtuSZG3pq@hu-petche-lv.qualcomm.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sat, 18 Jul 2026 11:26:46 +0900
X-Gm-Features: AUfX_mzvkLkU0tGjxRt_cqQP6T2a8k9TlUOp9V9nVKwGtnu0RXqS0l52QTS11FA
Message-ID: <CAFr9PXnfQnaz7C3gsZS=2Pq3Dg+VhR8V2L7EN7zdDVXSMeNZGw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] usb: chipidea: use the generic ehci_writel
 override for i.MX28
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Wed, 15 Jul 2026 at 14:51, Peter Chen <peter.chen@kernel.org> wrote:
> > +     select HAVE_BROKEN_EHCI_HCD if SOC_IMX28
>
> Is the SoC you are trying adding support imx28? If it is not, I could not
> understand why you add this patch.

I need to override the accessors for ehci registers to use the ehci
core code with another USB controller. The only in-kernel example of
doing this is IMX28 hence I used it as the example of what I want to
do for the RFC. Also this shows that the IMX28 code would move out of
the ehci core with this change.

Thanks,

Daniel
