Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D8238CFFA
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711071; cv=pass; b=esCWqSLtQPhTyenUhSDrKFgIYiXCYELhv6AmDJ2b7iTZsBl3Oq3TRkMwyGKEKqQUlv8hBd6R1oUoakYHUais9kJNKz8XM1DXj5ruHbXlfUuDWF9f8iay0jQegSnF57MUTZwOy8ywJdn6j+4CHDtA9VAWLCtbFq2RxyEEVrYaLIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711071; c=relaxed/simple;
	bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ih80u0gWmN9DkNv26HL80kb+vIWF6B3riR3oMX/EtX26s9Wqd8i3aEMTXBrzAT3xdlNWq2YMBElU5lWrOLFmm+DR6mv1+D9TVAAEJQobxj2oF90HstdUm49G/aPnNy3mJvFaLuVWkJ0iMHjr0v0DeCP0BAuFuWX6/KavdYiB+KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AV4j0iMx; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV4j0iMx"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c126fe7d0f3so34747966b.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 22:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782711062; cv=none;
        d=google.com; s=arc-20260327;
        b=Dnuqh/kYuf8hYwk4cd1wqiTCLcUNM/LbWoErXtiCqC9sQ4Xdtx2uHNKLSlF1/mMwRa
         WkZGBXKFmU+0KLsDuBfpwT6u7RqJ2k29tbw6g8LhbqdrMoJV8xO5WLk1E0cAlLsgEXg8
         sz/eBYH5+ntp15kCqzZJ5XGael4FF7ZYstAm2+j+4YcSE4JK4IpAaEg5dREds4YSV7Yc
         tjyC03MzIATkGpgnFCj136kp8ZMH3viZ6N+c0CGu3OK+AhHDicB/Ev+w4VYDhrimNzcF
         TdIodSFclqT59N0jhTdiXYKrxQMhjvugsbbr31DXWn8lbPZk7m7M5UVEmYiQsEcVh+EH
         m3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
        fh=pLwuIsqWaWqv1g+B5z2dhQSEqmg8DYyi0d9vyjHUX5k=;
        b=eV63uKA29+yQBIhNkPbbsu/sZvL+JN1oM1OJo0m9oYHzO/lCHrVmDB32tLAG0hpXQC
         WM+tdGzs54lpssx3H/YzkUz6mMOw8IHTgzZMzQM0qUkwgeYUWPc+lXDDP2u2EJ3tBbkn
         O0hW3CCEBrNmX8/0ujkZ85T1QUr3lr3oXhqtCD3EvqUZX2f+y7P6T+KEued5NOZh548I
         BVLTxCmvFZkgQZGW/Md1NL8J2Rj9dwnLd1VONX30Ivpg7FDdwkLc2xJbPdwe249nqfza
         2XPFRB55pgl5AlYexsB1z7xqaGtQvu8kJdKeR3CFnaDRzGwNyV+bkgruqaVhbRORznm8
         oUxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782711062; x=1783315862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
        b=AV4j0iMxr+XjllNcw9Eu7cPbbJJRXgdZRub0lsu6FrFGGmGRRomZmdBv4ITGv20bbK
         ijAiIDEi0drAUIap7BTghHqkmP58Fvu6iVRH3nzKiup5rSoPwdZpbvxrOlEc5a3O0uOy
         0nwUaHB9GbI6cdw2ReM4r3WYhh4gY8bZl7AmAXIk6YTzBbDMfLmCl6fklSGkqaSMqkZu
         eliHS0scf2+h5x0y2jZujNZOX0yBLI8ekRw2Q6sObbclqM2zrXffjAUIGVEo4taiVRzM
         jfAZ330NqTAFuNCRZ/Rmopgfx+3P8T5VD8PpotMvU7YDUQkYknXK5rou7ipfD0Vcpuo9
         8Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711062; x=1783315862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
        b=gvogbjuR1YWll9B8s3js0lHnS5I2phuARbFZnkCGe4434Y+pIWQ1ouquMVZGoAwl4x
         JhfWBwT+ZnxqY1I7XhmyzczV3PX/vggG2CR9jXSjyHZC1CF47zSjhWaM6d/UUF8JfyNB
         YilZHtKQydlkQH1OYadpw4vS55QlJTTtp0F4c8iLWzSo7vQj25Iqaxpw56OvfPtSyFBX
         hX3uPg8jJmYCIPJ7/GiVySB78g0THcfm+f23yAg5/NUv4rPwdZjMQb3QXibkcQ7z9Cze
         mrq+IqNzLm8pJPG9iMrX0Loqpo161/ZLNgtCDBIjPRD023hWRuygjy0Qhl18DRg1oTFI
         mGmg==
X-Gm-Message-State: AOJu0YyzwlOmB/IHMBwRfqMPTGMD+7+OxAJ7BICjjxxkMF96+dUgBcYV
	XtPSseSaFyoyJeyBU+STePPxRIqT9tNJmpdS7zpPz5+6uk1RA5+DRSMmR80s7HJczTwf8zv2UPt
	vUFum2/dylFWyPr1+zZhJpiPK5W0I4eo=
X-Gm-Gg: AfdE7clKGjUF9vQmvTb86uKIyQAo2EQsbJqSed4z6Zj3QvHeEQZ65bjfhsvlSqiz+sk
	ws3/Tq4xd0eM/AItR20pgG6U6WmQz1208Ga/xN53GbXbwoJMAI1dFyx9WbCPsoTvvUCUw4dwbcG
	1ssPojj2knKddV0KuXBY2MY7P39CqM3x8+XqPRCsGqiPAFpLCefYl5SPiAGCGXjrukvKL/A1lKl
	zLRPRBC2usXKUv3aNSkJqpQZHIMemgc9Dtz/nib2NrtHtSHTjlZsh6VXheZY1e8KmBYnBLsyihp
	8d2tuTM=
X-Received: by 2002:a17:906:c141:b0:c12:2aac:2b4b with SMTP id
 a640c23a62f3a-c12336c2698mr415388166b.44.1782711062080; Sun, 28 Jun 2026
 22:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com> <20260628231634.6752f74d.michal.pecio@gmail.com>
In-Reply-To: <20260628231634.6752f74d.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 29 Jun 2026 11:00:44 +0530
X-Gm-Features: AVVi8Cetk7IhAA3m56dYLZoJwEj6Rfc_rSgjh_WDaPAAo5ultThdmtlYIIEH2Xw
Message-ID: <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And here it's USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE, but in the commit
> message it was USB_QUIRK_CONFIG_SIZE.

Yes, I have fixed it already.

> Honestly, I would suggest a third option: something with "255" instead
> of "Windows", because not everybody knows how windows queries
> descriptors, but everybody knows what 255 is.

Well naming ain't my strong suit (if I name something, it will
definitely get called out). Do you have a specific name in mind? if
your concern lies more in people not knowing what Windows does, should
i just make it apparent in a comment where it is set?

> That's a lot of capital letters, USBCONFIG_WINDOWS_REQ_SIZE never
> appears outside this function and personally I would just spell it out
> as 255 here with appropriate comment.

I wanted to avoid the plausible "avoid magic numbers" criticism. If
everybody else is fine with bare 255, I will just do that then.


> > + bigbuffer = (unsigned char *) desc;
> > + desc = NULL;
>
> What happens in the next iteration of the loop?

Disaster to say the least. A memcpy in bigbuffer and memset(0,..) on
desc would be the correct approach here, wouldn't it?

On that note, I discovered that usb_get_descriptor just blindly trusts
the caller with the allocation of buf, it never checks if buf is null
or not. There is only a check for the size. and then there is a
memset(buf, 0, size). This results in a segfault if buf is NULL and
size > 0. Perhaps it's time for a new patch to fix this?

> I wonder if it wouldn't make sense to split announce_device() so that
> the first line is printed as soon as usb_new_device() starts, before
> enumeration is attempted and possibly fails.

Do you want something like announce_device_ids() where it would only
print out the first "New Usb device found..." line? and then
announce_device_strings()?

Perhaps even another macro announce_device that does both? But its
only used in one place, so I doubt it would be necessary.

> That would be a separate patch, of course.

If i have to make this change, should this be a completely separate
patch or is it fine to include it in this patchseries?

Thanks,
Nikhil Solanke
