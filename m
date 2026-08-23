Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDF238BF7F
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787499667; cv=none; b=IR3wgJopDA9frRK82NdRwsY3QM6HF65TlrjSD8V+jgrczKFucXefrNcBqsIm4+s+oCXn3DX/ZRpjUsfRCSh/T0ti9anEYFbBo2PHU3j8nChHqetx3buAj40SJ5QKRbe9NRosUNbglurUkWtqhOLFKtXWiUWC7vWvRNys8qavu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787499667; c=relaxed/simple;
	bh=9eWj5XAL93q32Q5MLRGJkVADfGX6bq+xqj5j/soOMlc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/S8cl8m3hSlTg7CNkzGjsuUoO5jd8gaPH3U6cCtQJHaHxKnyDwZEK6P+jR3yJNBp2Byye9J9CwGUpYdFtg4Ik4xHczPkTbns0MLijW/Om5vACRFSrLCOMw/Vr08inzxdgQRfu+4EmF4yArfnxCB3FbMnsPMhT+WczL8tuemvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRUywmBN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRUywmBN"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso6041423a12.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787499664; x=1788104464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oEct0orVM3nYfYZT6CEjrYWKIotoQoECzwgIHGor4Mc=;
        b=bRUywmBNpFYGKUqxewpyEeHLxalUcnqcTVP3P7M5gMIuG/n3esfH33oBjPaXQ0vI5g
         xASy+1Q4rbv8vdCdbdJR9u+Uw62uXVvCqrmdP7bTChe5f2CXAzN/niimmQCZ2qVNwwPB
         cHLhy+9qUu6IgKEohKCvDfaK43LSl7ROgRlAxS+WUyAxzqvWs/QtH/oc4J7qMF/dSwlj
         l9BniqAg3T8A8QQu1yV/vbR0wiDNBDd8qiXmCVue3slCWXsfB8PrpRH2Zw5fDIbKbC+C
         pqn8tUIIWg0q8Ww/ymVcBZRQO/2Kwrtq7ibn5rPirR61VJ9fv3Uu3GOCRT/h27QlfTZ6
         jEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787499664; x=1788104464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEct0orVM3nYfYZT6CEjrYWKIotoQoECzwgIHGor4Mc=;
        b=TtrlxZjKL5EhavHQPLfx2bDGF5QJQ855Mo9OPWQrSNeeNDINBUlmXLO4gGbg1pJjOG
         ZMmGcvrz5Q7MkV9xbeMJW1Nl/BRH3e+Ite4YUiDslD0Mh4akZMFvvUCvd5ji4qT/kioO
         kGAipVGi9km2d4OvpFk1xhXm2zTHqUdNxsQq8T4fxWmnsMIboqlDX4xHemV3f1oDnD2c
         2sZadv7RbPs8eyDhjPJg33/zka8mAXCAw7blsyJeIOxMRwOvFYyANoC9K/OQsitQIVCG
         21yGZHUfYqwW4HVlX7BO92w6p+lQX3vZG2QVM9Wb4vzxVu/UBva1RwAuYd/ZGisWuTBv
         o0fg==
X-Forwarded-Encrypted: i=1; AHgh+RpSBe1Ad89M/wmfDi1L30XK96QbveWrrcJwlkUAxN5+zqjzoez9KBM/ICLP8hdx5qiKJlcqPhQdm0U=@vger.kernel.org
X-Gm-Message-State: AFuF++k0rEsWxevYgJUfHTCpB/6KlMDGF9ZqJgYQ6PjJW8jjX7Nbjlco
	qRTNFtZznAj1drKeGxXx8083TvlfFBVIhNTZ9i5a2ycm3RSTIQMIvdaY
X-Gm-Gg: AR+sD10wV099YUcltd6+O+m/RvlHYEEnLACGHChzMVPV0lUB1lXNkzxOcAVhQnjgmPe
	X9bDkkwtpEyEcf6NVgNJGxIEozQvQyOZ2Sct3WTjHUPTa4dfc76Oq5A2DAcgdwBQvu8rvDN66Jb
	bDzifS7AFLuffJ6zGz+nyGnxXJgANCBpvlMARwH5Hh8Ku6fMCEE5G3g4WM0U4ZGvEIFi2B/gs//
	rK6OJsfnwSzhgLTSqdc0rDNiMcBln89PPbdLKTECusMduyLmw4KIk0oJGUIeZ52oxWeUzuNJPyQ
	0QcI5k3BbsxPZg0NboK/31WOXxhJ3lA4AgKtA/fqF8zU6Ezuq8sfL1JvS51Fokoc6wFFsRq23af
	LYkpYj1lajGowWai/zKdBxXiSXR+Aix5uRX3BAw9xLUbbVfzsxG/KLBg3J3THhBGknFro+V3AoW
	WVVKXuS9sb3q/eyEgc0+5Zh7uzZCp3BU70K+rH3xhblH2V0zDD3qbDVdGuS43qnzanq5k=
X-Received: by 2002:a17:907:9610:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c246d582330mr1894237766b.1.1787499664318;
        Sun, 23 Aug 2026 08:41:04 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm843708866b.0.2026.08.23.08.41.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 23 Aug 2026 08:41:03 -0700 (PDT)
Date: Sun, 23 Aug 2026 17:40:59 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello
 <mario.limonciello@amd.com>, Forest <forestix@gaga.casa>, Slavik Dev
 <developer.slavik@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <20260823174059.46fec036.michal.pecio@gmail.com>
In-Reply-To: <aosGtkE_diwVJJtB@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
	<CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
	<CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
	<07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
	<aosGtkE_diwVJJtB@eggarch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 20:47:55 +0530, Lovekesh Solanki wrote:
> I don't think a revert is needed here, we're just trading one
> regression for another.
> Commit 8f5b7e2bec1c introduced the 200ms hold for all superspeed hubs,
> but it's only useful for external ones. Root hubs are superspeed hubs
> too so they go through the same code, but there's nothing useful for
> the hold to do there:
> A root hub has no upstream suspended hub whose wake propagation we
> need to wait for and xhci already handles late USB3 link training
> itself.
> 
> Also hubs have a 0 second autosuspend delay (596d789a211d), so this
> hold is the only thing stretching the awake window.
> 
> and anything opening or closing /dev/bus/usb nodes auto resumes and
> auto suspends the whole host controller, adb's periodic enumeration
> does that so on the reported affected systems every SS roothub cycle
> grows from ~30 to ~235ms (from the dynamic debug traces in
> https://lore.kernel.org/all/qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net/)
> which makes suspend move from close() call into delayed work and
> results in the ~1Hz stress loop described upthread.
> 
> I think skipping the hold for hubs without a parent device, i.e. keep
> TB dock behaviour everywhere it matters, should fix this.

It likely will, as it effectively reverts the problematic commit for
those particular affected devices (root hubs).

But I'm not sure what you mean by "1Hz stress loop" and why is slowing
down the suspend/resume cycles or moving suspend from close() call into
a work supposed to create problems?

I would naively think that doing things *too fast* is more likely to
trigger races and break the HW. The whole issue smells like a HW bug,
or maybe one of those "undefined behaviors" that the xHCI spec warns
about if SW dares to do something out of spec.

So why was the culprit patch even a problem for those root hubs?
Can it not become a problem for external hubs, under other workloads?

Also, what if we connect a downstream SS hub to the root hub? Will this
not cause the root hub to stay awake for 200ms again? Problem is back?

Regards,
Michal
