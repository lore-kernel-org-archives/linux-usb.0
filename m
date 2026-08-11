Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B2443C7BD
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453659; cv=pass; b=JlPGnbTCx2wAERssiPVTfWykPUhu+I0AxMy7w5enP3KxBZfUC63O1dZlawgrGfmyiVaPIbUwbWKwaKZnycrmo26qixqn/wWwQFhx0anLXuTaKsS/cF/zJJmQxxftKmNWQSpp6ygrIs3sqm+plsIMOa1nAG9IHxVIl5g0oECCM/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453659; c=relaxed/simple;
	bh=tR9R2U7bD3UHwrWbp5R+7VDzqM21wHkG3T058D546N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPjQlKOvSyH/+WvPQMYvIzP+Kq0qLmj9Pp1o3fT8ebohmn4T/fzxoZ1bvHEtOgDSz1t+SLADW4OGvWxfLh5hMAjCL7gsH+b75s+CpZ8z1xYRGN1U5WNDlD21r49vozdiDJw5AUpMtruoWQUGPIsWu1dxjBKKjOP5bckieud/H54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hi/s7R6Y; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hi/s7R6Y"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f39cfb65cbso886201a34.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 06:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786453657; cv=none;
        d=google.com; s=arc-20260327;
        b=fRYFuDaaRljrjyiZrOIOB9dx6JinBZdI0Vf0YI2z6CAH9QlZKeE1n776tMJWHsfJEH
         18czLnQco0hhiEPmNyKcNcrIkKHgvb8vMSm+E9UR+gFvFZYfwKpfKcN/EhkAgbztTBEw
         RKUPvQ8kaVsNIhF1twUbVtVPyYU1BvQS6CCTJiNcNUPXGWaRPW3ObWnV/rf/iqkib71+
         xFKCyl2NpD6IQq2Nz2G7Q9ubaluA0I4964/bciQXxPqW2/bjitisl4GlXtq4Y0z8rGJ7
         P6jUvOavpmfTPloEUn6A7ilS1an84f/kls+NZmpCpzqN8gD1yE8CwxMmY+0fy5qw0TQ/
         r6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tR9R2U7bD3UHwrWbp5R+7VDzqM21wHkG3T058D546N4=;
        fh=VrUQHZJ9AdCLiA/VrShBw/kEXbsf7o2o6dHMhtcdk/o=;
        b=WFw4eDecS38aryKnYrxm81tUIMrxV9pwYmhMfRvzKEGL5v+vGiv4ycmKTLn1QaudKd
         VIseU/WivrjrPcKomjas/W40fhZ0vJGgOGqPrISCABsUs9vZ0RjwiQd6uUB30LCOt88i
         03eqn1QmwWMUYsgyDo3bi8XpWDXJLWUa3GUPf6MYIacC7V4AYsFV3+YGkYaMeZpq5epw
         HDI5hFqZoZ19rT8ns3xZuevq517X9OlO3W9TiS9JcEgUm0vlpBdYCb/TUe0ZpUIEqZUI
         SDWGqS9r9JwkoqChC1cu6qsoWrSyUjaw6mq+6RVOP3jaj7LoadmxU+MGicf9qirQuUY9
         PSxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786453657; x=1787058457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tR9R2U7bD3UHwrWbp5R+7VDzqM21wHkG3T058D546N4=;
        b=Hi/s7R6Yg3uXVsx2INq1VI9jIcyJ19lAqIJ67WG9ZQ9tmtEwF9iFeX1MknbljMROg4
         ux8ligRJJrgKjJmxOawbYFUki64ySHDpwiSuBBpX2kxmzubnodu6mlJt96dznw9TsbL9
         0GwjkvUc80li4IRNOsfdw1eOUhRaD6oAWJRLjar+/VCpl/lt53nzsABTsq9jxBtuMvPc
         eIXAJnDAcXT0T+2S+oqcw/8sK6IuuskmlZDGOgPGBIM4iJKvmSCl2q7ZrJUKXT++LyCC
         XTn/9GiPImzxp8VgNfzGVsg4lmux9Sxf0lJ+PXCeJ+L5pfOyf+D/q4pe4hFghrmpU/r+
         +uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453657; x=1787058457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR9R2U7bD3UHwrWbp5R+7VDzqM21wHkG3T058D546N4=;
        b=eu3t72Qxq61VI354ZnHq+uEDBZBj3QsiLh2E+pzYwVX9zETedby2tDDubqlRmKQjKv
         MttrmuY7axVWFnsgPECo9dzpKN/XI+Lqz203JpVCUVetpQiAUefLbMBZqTC17uEOtWYd
         ZSD0sQsQXriaZ7jM3N1tQH9hlfrsRVcUgPr9h7wJ/UEWVFbD9NWgw4hlzrm+A/3ypMfz
         0k/FFjjDsRzuP6OviohBTG75Rvekv5He1O3Eacj6XsK+omvChz/8MZKrWWhxTu0NK398
         YMMwmi9+axuJBwY6xdRnVxgB/CN/z0Ss/WxJuIMTvdJOMu3PCwZaTjFXrhJ2l443hrEg
         LO6w==
X-Forwarded-Encrypted: i=1; AHgh+Rrt7Lym0ce2l9gP+Dn3ANJRELt2szTXPx/E1ANaqByXj181PnoS+Td38kBluj+dJBA99tcN9CKLYPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5bcgJwuWqMCo2isvLmUoO1AAWkCT8SPXMNmxNjY1CbPXdhpb
	FApwrAECuZKdf3ZkZ28XdXsEMUTSMzlGUs+/Xb0G9c9m1cUJUZxYLyd/Pkp1yKl1X06t/SesFkB
	uUvGVI6jfxh1IABRr+to+C2Ix+t7X2XZmLfJ7YK0L
X-Gm-Gg: AR+sD103N1U+BNssT/QlyamqsHmb775CBD/joGWrY8Ayieme9IQykZir+eGih87Z8UD
	2F68PDs8ZrFeNuZdzp0HTPcYYdclwEBc10fRr3pPz5xOjf+6Ys+LSlr7rTD6/uR6QojUqw8lHGG
	mrDiPV0MxJFpNvBwLa00GW3KellXoUbgJZyjs5miPGNzptyI3Z9bkot0qQQaXhEfeawnjeJ8EfR
	zdJqJW89XP2Zg+xxVKOrtIvleqj6UdWlmwmQmwjWBn8qZnLl1UQIs/saMW1QY58BCkaaZwncPrS
	YmE0Eb019KE9dZh/FlaU6Lh7ASuh4oJz+sO5lp7WBU+5nbI5OjuqTMsApwROqIiGYEjBZ+xkj8u
	CpXcFwx0nak0ehB5KzWTM5+jV8I/rgrjWQgcnzlTGXw5/5pCWwxK8Pflq0TN0Axke6G2FCzSDm7
	+eK2nqjRcA4TZi
X-Received: by 2002:a05:6830:2a8b:b0:7e6:efb8:fe66 with SMTP id
 46e09a7af769-7f3a83be911mr2234501a34.12.1786453653917; Tue, 11 Aug 2026
 06:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ee9bc932-2fbf-4e8f-90e2-6cf604be9ff1@mail.kernel.org>
 <b47d2b37-0aba-46cc-afaf-cf824d99524e@linuxfoundation.org>
 <CANp29Y51K1Y0Z77oUEQmDpVPjJuz3fQhvvZp2=fw3GWSPiCg3w@mail.gmail.com> <34d4ca1b-ce89-444f-bb02-245287edfad0@linuxfoundation.org>
In-Reply-To: <34d4ca1b-ce89-444f-bb02-245287edfad0@linuxfoundation.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 11 Aug 2026 15:07:21 +0200
X-Gm-Features: AUfX_mwvtn3h7hNqRwJX1cg6RvUezxiWY5Wu99Gv0uwmP6_b0fFWHfXPkZhtJsc
Message-ID: <CANp29Y4NLVebq6L7STgcFJYSJo81ZpO4hNvaJQT14OGDZqwzxQ@mail.gmail.com>
Subject: Re: [PATCH] usbip: fix use-after-free in event_handler()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Valentina Manea <valentina.manea.m@gmail.com>, 
	Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>, i@zenithal.me, linux-kernel@vger.kernel.org, 
	syzbot@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 9:33=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
< ... >
> >
> > During unbinding, we must wait for the scheduled removal event to
> > finish before we can safely free the device structures. From what I
> > see in the code, once we have reached wait_event_interruptible(),
> > there's no way to abort the process or somehow gracefully handle the
> > error.
> >
>
> Yes I agree with you on rewinding being hard.
>
> Care to explain the scope of this assist?
>
> Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot

It was generated by the syzbot's AI patch generation agent:
https://github.com/google/syzkaller/blob/master/docs/syzbot_ai_patches.md

We manually review the patches it suggests and upstream those we
believe are fully correct.

--=20
Aleksandr

>
> thanks,
> -- Shuah
>
>
>
