Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D77C3EF0A0
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943330; cv=pass; b=kU/jmWvvYVZoBvYDw3OW0eOLhdLuE6+jrP+/sMWvUEDTo2XieBQGl2LkiLp5RGWZMc3SbM8sYiZ3Wk4MMqPmAf5hXKogJ/K3qlJpvrHK4DzNYbTQmstTeMkVi2LH17L3BWHj+Qk4HH2RYwYy2uSs7t22YTBxNmyxaGREawlv3lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943330; c=relaxed/simple;
	bh=1injv9Rl4NBM+B+HS0THOHMdNObE2wuHjPT90v0vu7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=peJL8ATVVl1sfaAbxJk69zRUya0k1QHmRoNPoZ6dyDmsKBaiDMd3MgkBhlFabQFIpvyFmpN3tOdUV8bQckUq8gP7Vb0g/h0g0RjGw9BC0Jf7DtYb/QEcRtdwSZcRs/pYxf8mazv8kcfr39D32RHwKUUyf7D+2qU03E97AMo1rdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkNn7rPf; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkNn7rPf"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66493875766so5012867d50.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 04:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783943319; cv=none;
        d=google.com; s=arc-20260327;
        b=sDP31ZymZs2P5oVFPyZ2KB4dXZl4mIZO9HQeJZ+VWOUpUKaw9cSVRNkVX10gzHBeLF
         29ePOkwiB5PBYTsIYWe9bUjCZzgRaUGHPsQmbZOz0DMbPyfjrxL9rASln8s5RMS653JD
         4JKAsh3Ti3xgwsKJxoSMeJvZW9fFKXucYPYt3hJRb0ng5sfCc1TYoUBRXNoGEALdmRHf
         s4KBCWLPnRRKDk0vZX8dEJfdRRg1MaqqXO66v/RyOjsI9mBfbxBsEx5BOecComZGSztn
         oZcz4qfjnm5M+9wW6777kRwk33DpgV3EEYkF07wv7Q+CNhWKRHrEQLYGmehhRtOzFhQ3
         BBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mEG+/O0PcIT4+oFeruk11rdD0Dcqs/l4Kgd6A6lmTpE=;
        fh=tU1aIqh6kpShQrfcqeZXaDG9N9huAr6Bc7UNDE8+vZg=;
        b=hkNUv7vxT8GBD4nBx1ElctSmjMmY/kCxuhLACsTTcFjVIauN023HD5CvVfjSrOJkyR
         UY8kCXWETANoHh+3riIe7QkMr2XqYfzEjqiDa64jSwefzpe+R3B1V3l0TzVaH0o/BCst
         WFRNyOVhrc95xCFOiiMwAM2f/aHgttsEwwTQVPe+tIgQgOKXY1YbIPLXzOKH5fvCblI2
         nbv3tFLqPFfvXS5XwvZsy/ibfXCg1h0v9nr2Zychwxk2dERMZYpF04f2nK8/iEoaytBy
         GlKDS4ETU+eTlkOCMPp1FQrLvvH/SpxAPnVsSb8F5PQxWoLQAuospRObKqvjKRiKR2+y
         MQkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783943319; x=1784548119; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEG+/O0PcIT4+oFeruk11rdD0Dcqs/l4Kgd6A6lmTpE=;
        b=JkNn7rPfgPxTCW4E0iUBIdWrmz6QeOs6vsYk12goTq3d3i3/LR9C0knwtDA47SrqGx
         d4fPq0UGpkoJvj/14VcrZnwmHXho3zXJ/iO8arbj3cNS1AiF3XZgn5pkA0oQktPSAXnM
         LVn2PElwu4PMid9JWd9y8CCJbBuAJ9jwgj1Denci6vgPv8qJ/jcw6CBAHClgvRHLMmwX
         GIsBCNcgMj3nPrU7KuEiksSxOorpTTqxfWXpalXDCWA6IAupJPaiWNClQdnO5mJ1xCcz
         Ms9ppJ++C4GnAw26EliPrsozhir2/9YpsGhphQyOSJSTucDOhSG3m1JRRuZUhcbujur3
         dyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943319; x=1784548119;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mEG+/O0PcIT4+oFeruk11rdD0Dcqs/l4Kgd6A6lmTpE=;
        b=YZQrKpCurIhB/eWF+vZrCRdSm9qUoFqiLf0EwTgF0AoRHLs0r2w5Fobvc8RuAnmbC3
         5a+PKPg5nLe2iE+/h0yHoBuc6Q5V2yds1QuY6gOu2j5e9BBcg9usY8qepkqkJVO8GKHA
         X2AqdJmwZ3o8VoRbKJG7yMSp2Jpjwv5yQqiSjKxpv6mE4N7qtMYN0EgSREITummkC4O0
         gXHCs0qdQJlGqZdsNDJeZqRl8lo3WQiRIxAcFu22WqKN3JR9r5W9ND4FXBGLFZTYfyeD
         WLpqEoYfgjcXCooB2mPWXuvP6ls4Zxrbq1hRaSvebF2c/EUdxOswRclhX5Vs7g9sowC3
         1wVg==
X-Forwarded-Encrypted: i=1; AHgh+RocnSB13b00aQPFhKgldUEIRqgCld+/Qk4yzAlHJgwih9A4X3u6TprZ+uvPN41VIJx6ktOpIU2vUDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSutXmuiA54HIA7BIwOJX4BNxzlwPQxanLE1Idjiu0iNCVmYF0
	SfiVz9UIxYazz9k7szgjcxAFtqLOnMwvk5LOfZThYcgRptQCWLfOWzIbagD17ZBkX9+AET9Usst
	cPAntqnYx5G9/76npS5iudSGtmPBRXcY=
X-Gm-Gg: AfdE7cn35puPGGRamdf9qrbX5AaQpN09o3FscLz/sZU22ODtmqkKgBlgZHIZSO3MnQ4
	nSGjz0HNWS7UAzxN+LrE9UoLj7pEw/e/OmkvlLzK4mgxDzm71LTKnCJpelTTQlvRgubEqAYybfy
	AhidgGRy6hq4ZA+wIddB3XoE7YvmOmCFSbTCUUB2jP9kSXs0ppGBKMPr4a2Az9FouAWDtVsirZc
	yBwkCG4qe6y9kLM4tdeiCE7zHne1Sfj1NwNhW2m7fFgiJZrU1aV53WemXCaI7WTT2YUFonaLUgD
	5c9a84kVnQ==
X-Received: by 2002:a05:690e:4144:b0:667:e3b3:264b with SMTP id
 956f58d0204a3-667e3b35f5emr4355142d50.40.1783943319427; Mon, 13 Jul 2026
 04:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705091411.282560-1-lgs201920130244@gmail.com> <aktUJSxhLBtlWoFF@hovoldconsulting.com>
In-Reply-To: <aktUJSxhLBtlWoFF@hovoldconsulting.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 13 Jul 2026 19:48:27 +0800
X-Gm-Features: AVVi8CdjFXPB-eUHcBXigPqZjUktfJXA8GDMtbaIq76RLFAQWKb9JIcqJBuLKuA
Message-ID: <CANUHTR9dRbRcAA4fB+uTZVWwzr3T8S5cg2x838D7t5j7yL0g6A@mail.gmail.com>
Subject: Re: [PATCH] usb: musb: omap2430: Do not put borrowed of_node in probe
To: Johan Hovold <johan@kernel.org>
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wentao Liang <vulab@iscas.ac.cn>, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

Thanks for the correction and review.

On Mon, 6 Jul 2026 at 15:07, Johan Hovold <johan@kernel.org> wrote:
>
> On Sun, Jul 05, 2026 at 05:14:11PM +0800, Guangshuo Li wrote:
> > omap2430_probe() stores pdev->dev.of_node in a local np variable. This is
> > a borrowed pointer and the probe function does not take a reference to
> > it.
> >
> > The success and error paths nevertheless call of_node_put(np). This drops
> > a reference that is owned by the platform device, and can leave
> > pdev->dev.of_node with an unbalanced reference count.
> >
> > Do not put the borrowed platform device node from omap2430_probe().
> > References taken for the child MUSB device are handled by the device core,
> > and the ctrl-module phandle reference is still released separately.
> >
> > Fixes: e194ce048f5a ("usb: musb: omap2430: Fix use-after-free in omap2430_probe()")
>
> This was not the commit that introduced the issue. This should be:
>
> Fixes: ffbe2feac59b ("usb: musb: omap2430: Fix probe regression for missing resources")
>
> and this should be backported to stable as well:
>
> Cc: stable@vger.kernel.org
>
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> And again, how are you finding these issues? Still no LLM involved?
>
> With the above fixed:
>
> Reviewed-by: Johan Hovold <johan@kernel.org>
>
> Johan

I will fix the Fixes tag and add the stable Cc in v2.  And I found
this issue through manual code auditing.

Thanks,
Guangshuo
