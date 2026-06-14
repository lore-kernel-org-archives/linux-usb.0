Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CE255E43
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 03:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781408717; cv=pass; b=spFKFHYx6Qp9FzMncV1VVRzCjeMaYZ8lsvCV9w192mSzaF24m5091PeVJC8TF9T6ODegvJz3dmMayiK4KBzIPD+t8mFRLHxn4xtZY8/mpW325UJPyczkmmH8trFwV5yGQR2Cn/eo2ABuUXNl8Vc8f9qgiluCKcnEQiYH5g6MuzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781408717; c=relaxed/simple;
	bh=rDoF07m2efZ+ZLSXCyU61qzwYd+rbAgGI4LUkKYASMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIuNgI0XZf4HfmjYm9vAuQI6llBPTRsArLLUN24vM6RU8CvrgNIkPzUwv7dnXk3Rg5WhY0QNEm+xpC0J/Ld83Oz43V8i5kwHVr7Bw5DZ2/7kmMfYNfa3WRc1nwLcQ/rsMkEeGRX/YvrYtGGjJcLHaQqKhHU6pjAdi9KvhBE1vnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QytNA3FF; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QytNA3FF"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-befd83e0521so603052566b.1
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 20:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781408714; cv=none;
        d=google.com; s=arc-20240605;
        b=PttqKD+yLngXtgJ2V2qi6PQLEsqR9GJlIGsVIabMRIzniVGV5UIjWk1XscgN8CcXjE
         pF+dGlRqLaTSqbMqQVf/4txk/O1aPJXDePma9wlK/S7G2QqAian2YPMrxwHPTinB2m4e
         5sMKcusczQWc3s7G1cm5kNU07sYtICAMI4e/Er8VDhOevXhe/IU3rAZBskyEGrQQnhlg
         jv0uKPa6VLtnYErN/YbwR+qbPBvexe57f/e95C/HY40nroFqgN+d+cp4Lb6DO00v9GCM
         cr3XR74ca7k/lNojSa2TtkZXQzfrJAQ769H9OxXZw4TmGgKSJbC9zpG1Du3qfHeLAWGP
         ct0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rDoF07m2efZ+ZLSXCyU61qzwYd+rbAgGI4LUkKYASMs=;
        fh=MkaqUgxsqpE6MLhdWmZ1xhoPZZLCgfqFyZbEFGqyUvY=;
        b=bHSBaCCAs1Vo3cXmOwXKrlyjwwBBVRPDPxXyCe1aVNIrQ9uHtll2FZo3M/Qln1Cpa6
         vlgGAr659d5jrJudwqSmPZtFSzsiSpW4Tl9U0hkPtIuLaiC7dKFAm4myrEcoiAuq9JTS
         TrSji2sO5RJXEBS1dNkkLo7MujJjVRpDTN+pNIILw9aA2q7m54DSEGPNjwgyEMGBLouk
         Q5S/d2Nsgrv3afSQrZ49xhS5lV3VEAUec38sA7gTa9ASoGfezD9TDb/AvsFjNXgUYzJu
         NR3O6qKmtqS6wJBFxayGATxP1iLnWtPvCMe6dSz8AUMnjrqXtyJXB+9O/aUFA1tBP5sf
         YlCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781408714; x=1782013514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDoF07m2efZ+ZLSXCyU61qzwYd+rbAgGI4LUkKYASMs=;
        b=QytNA3FFDRA2lsaIsadi9/QOfTGmfT1LRHDen1BcRMVKuMGKEC6Rd94C5ds0flWZ+D
         hIZgLYzsfo+PuGASiYgvLjiVSQQ2hToWycaEY0RJ8ErUdl73ymoJs/Cto0VKgz2F7pQv
         sarFAy1qA/nDUU1qahnnulC0fnOAbvTZhJhQ9Vp5f1icVNv2eb9qbpwv2qc5m6RR1G6z
         1uXMGP8zXhm15SRJF3Nho/yvUIFiGHw+uOdTw2+20i4oeBJ9vcM+O1dFrRO5TXFQ7ePY
         CUfHGNW+vGlAAFL+82V1cdhLj8r0LdqFP9FPUpDhDJndlaiWNqpPG50bD9bTKZ3EIebK
         Xpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781408714; x=1782013514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDoF07m2efZ+ZLSXCyU61qzwYd+rbAgGI4LUkKYASMs=;
        b=rJr5oFX3b2awEDwy7A+eNRtxC0WvFtb3ROVb6kaASyv/D3d7rTiQCd+4N3FGgwd5rL
         EW7sr7nXP/QNPFCLblzQClQjgPli8IjMzGjDTWFMmCvEcOwbAbzC9A/+xkcGUuWWgV8d
         ZxmlQWOkfyj/zQgCVLwILsIxPhnccSLE5bCuUyvlTdo412Ryk5Vmw17hQsERLqgvHwxS
         RDgxvQv5Ab+q6YRpoN5iUwqQY4kKy7OGj7smDZYk5vZsNWfaZEahctR21m6uVzjMEmSt
         xVb2B92ke+ysj8Cxi06SoOqmjMwQOvyRXjDKmSr1bTxOLRWKmVlyQtQQYIIobfFlXCS7
         1ClQ==
X-Gm-Message-State: AOJu0YyQkwVJzZ0do2vpvszqExGjxEVQIdnvo0lG8VN4bxUqL9NUIHLv
	6gO1C9FhEZvE+iPxmcCy2S9cmSZGgDzBd2TaHKhA6XjAeWr4vsPSNujcSdqTpvQDRZFUxuXzhN3
	Zg8BwkUZQrEamPKbajW+rv9GughnQQ0Q=
X-Gm-Gg: Acq92OEJd6OrHdX+0O2tO/pcTt/d8CIVq34yHvPoe/KfByQXvMFUi93+AU1eiDtocUk
	Mvyw01JHgMQQYTCx/I1fizAJ9+C7JGfwPgrElapaVssZT8JQ3pvbOwe317O3pJ5wugsIr1mup4L
	c5S4Eq9J1XX8fs5V82pm5Ravx2U+5gzoXShvJmwhy3d7RvWEP1FoZuyB6wGtlh78eOSID3VAUwK
	LGSLh3aIXR6ZMakwClK7uhsb6IQwiBYe3ES/ocKj/Ryf+jaPU+C3ZI2SjpeiKJ0vn1d0XCZskBq
	cYJ/RkrvMHLQZ3FkTIRa2ATc5mAEIYVOzumMNf6nHPhsX1AGlXGXgn/khGfcouQC3yhPEv80BBj
	JBb9mSaH2yHxjt0MRzPrLhtXHAhgM+PFLTIjuLRL8S8ALb+L7FKd2p3J6YA==
X-Received: by 2002:a17:907:3f18:b0:bd8:f7f0:d740 with SMTP id
 a640c23a62f3a-bfdde54d528mr412957866b.0.1781408714074; Sat, 13 Jun 2026
 20:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613201851.63191-1-rosenp@gmail.com> <2026061403-lion-pregnant-b6e3@gregkh>
In-Reply-To: <2026061403-lion-pregnant-b6e3@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 13 Jun 2026 20:45:02 -0700
X-Gm-Features: AVVi8Cc3VDRQxKCCBfkBASwaCIy9u8Y-foSnwb7lFs4x1Q37-jOQbGhJv70N0RM
Message-ID: <CAKxU2N9BLP+H6-Xvu1gX6_Z8jhowAbn60=odyssUhio6XQHmvQ@mail.gmail.com>
Subject: Re: [PATCH] usb: apple-mfi-fastcharge: Convert to devm resources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 8:41=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jun 13, 2026 at 01:18:51PM -0700, Rosen Penev wrote:
> > Use devm_kzalloc(), devm_kasprintf(), and devm_power_supply_register()
> > to let the driver core handle resource cleanup. This allows removing
> > the mfi_fc_disconnect() function and the error labels in probe.
>
> Please don't do this on old drivers unless you have the hardware to test
> that the change worked properly.
iPhones? I have those. I also have a USB power meter.
>
> > Also take the opportunity to shrink the private struct and move the
> > variables in probe as devm doesn't need them in the struct.
>
> Shouldn't this be a separate change?
Not really. devm is what obsoletes them. And actually one of them
belongs in the struct. Will fix in v2.
>
> thanks,
>
> greg k-h
