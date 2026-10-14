Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8B4E3EEC
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972180; cv=pass; b=IzjCWfjRTw1ZPp3Uek8c8QQbt7RGw/bmbv3/dMiBX1t9AwJmTYguHgVqLSpBMzpCjGtwom73clz+48/yIqHlLeBtQVHxJ5GX6cs5W/Rpn7swXCBgrZW5hV410jqMipzAE0iptlwnhOFSBOQyHKm4C923AGTIJOkhDxHB5gEHGr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972180; c=relaxed/simple;
	bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CxUisJouveSwOR9+kwwe45MOpX+i/M7dJcx5aAbXVKb2/3EE+Lo2JqrKZ+C/kRYZEP9RFkgYh0VI1kVqT4m5cmQgmjj1pkf2J6ywFRtEhNpzkqepZdjuGkZum+FcllDc7DrQWQBcuRi9wKAOhX2477QlevSXb1S9XAEziIP9d+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glqGfazB; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glqGfazB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso6174675a12.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 03:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791972177; cv=none;
        d=google.com; s=arc-20260327;
        b=TbHF8E+2OD+bzG8G2IHN6LMoJQu7pPOKcHEyKUvcOB9LPBClrJd/LsMUeN0xBbBMpW
         AiH8BM6c9b95kKxJzMydk5N93xOyy3H24CX3tB/UrynMLbdaPo0xT8bdmrRGIaxKcEvE
         Z1KQn/41fXukosqrF0GeJJ8c81oxFbqAVM634LY18gyn2io7bhRwjk170WG8VxqEAXjo
         DL04gzifXCYB7d7nG1wk4GgRI5x1rAS1ah1Uk9Fh7xUI8Q/p31y3mxVr/N1Za/3JAhow
         NI8p5r33DAdaIG/vZVNw4/M8Hbln3l+QFiXa/87xMXHAQCf+o8A7sPgDzDkCyRxvnPck
         XPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
        fh=AFQZ6V9Jf5w1J1k+LUVL2sccXlgGSsunG29/ipXSEbg=;
        b=qAvYrl8hdRlAoiiSTFtdpcdfDxcYaVUpIDv+Lyh5PnxSVJoETR7JJK9x87Bi1JhFeX
         T4aeiDurwcL3d47OG8/1ohmp4kZC6c+/5Fionp4lj51A9zVpo1QQLTa31yogw+vndNA1
         1PYDVs8A2niOJx8HnKePRoMZDTsRdWoCZ+GpEg+SThsCpmB58qYhV70Wwj+q8WYnA6Ro
         uvUFC9aLNumx/4v6tRD8j/CD9qWuSPSt4Wq9bhRH0dArzMs1O8VxhxrcZ9wFnTyveK4e
         I8eLT9FugiUpGKzA81i7i/7BanCagx+VwSokSM3jmvz9dTDkNEmZBS7pR8jJs7AT47RU
         y1Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791972177; x=1792576977; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
        b=glqGfazBc5xusIciCDxW4ih2y26V5DdqUeAIJlcc0MYvTkmbmGybWp0wHpNCyvH49o
         QZ5WLl7kOxSVUnOEtyY+WcpoimBLF4j7xvb2Xk69wAYU8Szodwyrpe8yA8outnrM8+3r
         rqxYbJbv2ybVNLrxFBnKUi3htUhbrtYsyePjTK7GAt04T/dJ91XTjv0XfOEEUfcDE/6Z
         CAc3BoYX/7caZU3B4t/w5mN8/l9lEBI6YdUyw7wh9zcFCZDQS80l7WCovU5UXu6DCg1b
         VFYkKePClvH4eQjieFdswXwLmOuTdXTbWXcQ7QLFYymZVD9Br730e0d0mEEK9m32N3Dc
         /uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972177; x=1792576977;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
        b=SGTWHfLJBvFLAQgg8R5J2UOyTNSIcexrFys42C/ehtH2UfZUe/vAfCoLO1H4uSnE4V
         +w9xIzJEvbyvxIpMDAoiOXTnw7AUWV0UYV8i9n9GB3EKzB9HGqit0k8gHGHvkfbbfZ9p
         QKv4U6Q7FR3PvhqrE7MvvZnuA66M+f6ioFmmzIMvU982XhIwOEap3DW56/Vai9v2eB26
         R3Gu8el1SPFrgy9MLFyLORzMFm6cQJQsyaqzFaX74RSmq0uc3Qh0ZpH+eyj+/n18i3T2
         XqorW4hW0Fk++vxbJF+5xfIrKFqRUHWQWzNDOlSlQqJb4OUvRSvdOuP4/KSIYkIEXKuZ
         8coQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5wV03LTTBC7wMW56dQCB3mPSZLwPV32k6Gd2bBE2x1fmgrHssRWiQHI9aPqDf2j57gIGYI1PsAkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWHBE5ReyaBZNBe98g2Rhb1P9CQNrt8IWkpBiXhb5cx0w0L4cX
	nJo3o1P+MqUD+WFBMxChlvFEF7WsvX4cYjZUknglf3Q1LpLewPRuX4kIGa9ZX05ZkrmfI71dsaP
	tKq3EkQ1/Grgud8aIryJxWag4KXiZa9U=
X-Gm-Gg: AYBFou3CwvDOJnsUkLFD1KG2Ri95e6J8Yj8tMe3WWknyRJeDNKkuqedckUIzVXyx3Ea
	OHL8Nk6NJvitEgp+0maREsW0zhPfzo/OhwmAtLZHTE90j5AKfG+IrsOtWjcPoHzIJQBsK3tcr4h
	JiX3hm2zdso5ZPqCeKrZYSNUAANr+3CFzXqWUlLgX2NW94G9ghvvqbKTuH5pogxNgYg+mBOG7ZA
	a6vzD2l/chjcNMhsNS/vTY68aokmInl//KCxjjz/CcZjkm6ICaFkeSVWqpfVCRUrFRg5OvvE0nu
	gm6Y32Y7SQXke0qCW4MqupBq0upn9wpHSP31sGO/3s9PtvVGzQwVHxqa
X-Received: by 2002:a05:6402:51d4:b0:6aa:f260:b851 with SMTP id
 4fb4d7f45d1cf-6b17c2ac332mr13030975a12.33.1791972176597; Wed, 14 Oct 2026
 03:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ayush Yaduvanshi <ayush37735@gmail.com>
Date: Wed, 14 Oct 2026 15:32:18 +0530
X-Gm-Features: AclHuK_5KUbXFqyhRWHejkVpygkLU5hHyftSH2zUVPZDbQX6AQkitHFeWqRkUg4
Message-ID: <CAPgWTUQ5tYtV_YR7SDV7SRsDmvmxsgV5xOdns7Aq93Uy1kg9iA@mail.gmail.com>
Subject: Re: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on failure
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, michal.pecio@gmail.com
Cc: Thomas Winischhofer <thomas@winischhofer.net>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Friendly ping on this v2 patch. It fixes a task hang reported by
syzbot in sisusbvga.

The patch was tested and verified by syzbot using the reported
reproducer, confirming that the hang is resolved. Could you please
review and consider it for usb-next when you have a moment?

Patch link: https://lore.kernel.org/linux-usb/20260907074308.109603-1-ayush37735@gmail.com/
Syzbot bug: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b

Thanks,
Ayush Yaduvanshi
