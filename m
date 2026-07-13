Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1133FE36
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955245; cv=pass; b=j7Jt5lIJB+S2686F8TMC2g2/wstj+GaOBK5xUDV+Lkks0Z6EKZHb/cvQyUYuwWu6qCl27n7YXpw7aOFT/QWWM+cwSlPSrfYJVMS+yHDp38pZVEbrXPzfRDZzFoJdoC5CAk16wiLgI0uplZ12Cjbl0umzY3s+dbJPZxQ+Pjqq9gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955245; c=relaxed/simple;
	bh=mHwWgx5ebvKJn04Nw+Xb7WnfNMjcSdk3RQH0vi7Xp04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBbkd0phORvij6epYHGf2Vhie8yQdxlpaRuyy2DgQ3AxXZTch8aRk4phg/nbizvuAMqz8Q5lgOtWmla2JvSdxQ5LuTQiv4Eapuu6xvR2Hs69N66snG8mepwkUG6n7AnHd5UfYyvI8uYNCCAMRE/wAvrw6OaG6aWOZ1vjNS5OxGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=hVh5u3fb; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="hVh5u3fb"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c89636920a3so1725812a12.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783955243; cv=none;
        d=google.com; s=arc-20260327;
        b=LIXdR3SYiC75HbCyWhJxqreMbTBwNSRWKHBVdgarZOY7tb+dKN5H0Hty1Kx/9UAYLF
         /wCUsry/n/EcN7p+gQttnoKzKeidIyQefdn4zWMjrdmFVCdsfR4dNVeVgZywuT8PViwZ
         DtpCh9RZIra5+g0aNYHKHWu5DNVhh6DIh1/m8k061JTZrz+n5yndeS7fP3iqN3EDtug+
         BcfWIJsuBAcaqv0ntPQlGvxv/eBx4Kt5j/hEttfb5XpuM0pSll6phegksKj6b+i8YlDB
         gLcLja1RAIYAmL3myylgj+JITr1touWPF5WZLl0mRcFuR/EBmttEWC+KlhT+c8BBktHq
         e8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F0ctxybDRM2sOtyVKhHTxyNSxjKGG4g4E1d1l/SSD3A=;
        fh=Lvmg70l7bXplNXVC0vvwJ0Ur3dHOq/Z6PHbwMiWNTrc=;
        b=TNcg7jmEW8umQWEsfJJqizVJNY1Fo5b6EWKbpytHJyDlu3UU341Mx7Ri8oaOxTXbHf
         VwIcw6TT8PLX7x2Qt6BIVoEPGKl1Qn/S7n+kVMYSwu/p56PnCenjHk3LicD/ZnYahghS
         S560oXZIzwjm1zsdAHdCeUCTr+W6EySbIcpuEYEyK2VqLp8woMUc3vnuSjOeVXMmP4f2
         MOZTMzBZ6VEXiZ3xtBZC0UJbYik4ZbGDjwkKT1Td/dM7tsWTigLhLm4rfvP2mtaBFKoP
         9lk2Icmkt36SQ6wBOhjxbUQoW9S4Z9kxTkz6zh1YfLulwze+ADH86HS2Gn/7p2SDOrvR
         2VfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783955243; x=1784560043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0ctxybDRM2sOtyVKhHTxyNSxjKGG4g4E1d1l/SSD3A=;
        b=hVh5u3fbVHzDNH9V5GF11weA7m3QcN216FfHjBJkO6VTh/V6iMvo6dQ6CVfnLHkVx4
         4nk1rCJ1XK81o8QkaDlGuXDYznyGTJd0zIMNeF0V/Tje6ZpPnsJxiHPW1O4y7/121q8h
         BpRblsK1HBm22+UW319UhSmzMvnuJry5UATO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955243; x=1784560043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0ctxybDRM2sOtyVKhHTxyNSxjKGG4g4E1d1l/SSD3A=;
        b=QU4RvtMADhi2QgI9z/WmVEKOzdSjgweNGd4IxI8GcfLi3JrazbgeWxaqZPMs/8/0JX
         I2WJxdKRvQxZUQPxqEMR1AsEvq7f6S25eI6ftEa+bC9AqOEC6QlEu0dJfh+jp63jRAN+
         YG1sXzI40XZYBPVM7GYZSbUxZRfBp2rPDoI7M+6DseofQu42TEPdnWj7X4oa3PIHrzvU
         EFwWYDbVPk8ZERTjWRiH59UogRhlVLbt2AiEUNaUs7JSQt7ERNlxdTKNvKE3sJzfP15m
         QZswbnHdofZGZObUU5FCTjrdyaK6UiIs3OYT960tA6ljDvYMBly4aXLIGreLshe5b0vA
         xlUg==
X-Forwarded-Encrypted: i=1; AHgh+RotJsumU+ysDm3tp+3aO6Q1nBKzYwLpGect67l5Qqm6Trv5Op/DMIyLuFuZGIv+xh4pWyTbiMfPyWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9lWwj8S23zJbmngguOqjNXXrrfaqdq91AgiNvadcZeCs9qxU
	eZQxCVwnNsBUJlqHHYKBvIIHfA6jSj1jtnFmkf+Z/BJalAnPH7A9Mt+sj2T9VtGL2wT0szXcgon
	yXOocgd/VCZNdJqSMyaLeOrPG7hEXiukVXJXP6T+mng==
X-Gm-Gg: AfdE7ckWaQeCS1fWQdIS/OOeWGlqn4fqCQz/QG8/7niKHG7ffLLpraiGOcy16YVSzlw
	S8YxH6DWd85k25t8ZggME5zzceZ1bAK3KPMlDv2Zu7K3adM72k9s2+QtlD4LCqP+V1/PSdC9yNn
	UiseAXnzHIqRPk6CC+RK/bnu5UcW2NTKOGlRDCCPaps00Wfk4LDN37dlLG+n+Mit9V5EUy3V3RB
	RMWKfZu2SNujZCCqrlbHSeJFaQC+7VAw43DTfFtG3Rq17coQh2Lmo4Irn4FVdF1/kn3vTHq2t1/
	dFmKzQfJ7nchMAfkyIeLKzF4PJB9GGA=
X-Received: by 2002:a05:6a21:3405:b0:3b5:a008:683c with SMTP id
 adf61e73a8af0-3c110b263d1mr10451920637.45.1783955243023; Mon, 13 Jul 2026
 08:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713122205.1350933-1-daniel@thingy.jp> <20260713122205.1350933-2-daniel@thingy.jp>
 <02d6c843-6606-4f67-aef7-3a88846d6388@rowland.harvard.edu>
 <CAFr9PX=0Bx7OBzbUXXZPsXdXyCV0NPqi4YaJ1DCeMXGk9UDQKg@mail.gmail.com> <a4fbe866-397d-4fb4-b4d4-e71e7771931d@rowland.harvard.edu>
In-Reply-To: <a4fbe866-397d-4fb4-b4d4-e71e7771931d@rowland.harvard.edu>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 14 Jul 2026 00:07:11 +0900
X-Gm-Features: AVVi8CfgN7Ed9RQxdgeGQk4lBPlbyphynPQ0ytfE1Bu7N754CopXLKnnSNLIqys
Message-ID: <CAFr9PXnBqdbM7gNBpBoq2F2bM+yRrP0HzR6EL1niG9VHsW=sQA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] usb: ehci: Add option to override ehci_readl()/ehci_writel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alan,

On Mon, 13 Jul 2026 at 23:46, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Jul 13, 2026 at 11:37:19PM +0900, Daniel Palmer wrote:
> > Hi Alan,
> >
> > On Mon, 13 Jul 2026 at 23:21, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > +config HAVE_BROKEN_EHCI_HCD
> > > > +     bool
> > >
> > > That is not a good choice of name; it's far too generic.  EHCI
> > > controllers can be broken in so many different ways...
> > >
> > > How about USB_EHCI_MMIO_OVERRIDES instead?
> >
> > Noted. Based on that we'd have a config for each piece that needs to
> > be overridden so drivers can pick the ones they need?
>
> Maybe.  What other things will need to be overridden?  It's hard to tell
> what you're planning from just a single sample.

For the fotg210 at least the location of the port status register
needs to be overridden, it doesn't support sITDs so that has to be
blocked, and the hardware has a bug where the length of ITDs is broken
so it needs to have a workaround to write the value it wants.

Cheers,

Daniel
