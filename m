Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792683746;
	b=3KD70dI1xUznP0CdMJaEWYOICyvMWDsF9jPUnk+Vyn+6BZhYg+CDdDbHGGyqn7KHCgg7
	 /nBbJEZxGzMB8Pw1PUoJaG4txWh+xom6S8lx6LX4/FA8peXQvvM3Jj09lwtsJUliwH3eG
	 +FTm+fbsYS2fFAN/pVd6RrAKQauVgDW6nS5lz5nHdoSpfdRAa5WwMUMTcqAMp4hbgwFOV
	 rkJSskTZvHwctnty2VWkVheD3TrAwS9ptHP6DWycbB8Jz4V6TcIMrwR/T3wkFXvmmQG6H
	 sSg4aWxr2YVMkPGuq/Bu9k12JOnoXPMKLyx6wU/nYkYdalX2qTEj7CLbTP8jtNSDldw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
	b=fJnlvVT6IS8UAmFzsMBzPrAhqekzJNlBAG6SxZg7PUR3PrfoQxY913KS9p4dpuKxIOVX
	 /eERIdWyPXTZMfwlPyt24c91YrG9cTfxQnMNDZZmpkRvyDp1I01emnD3fP0SlUz8nJjkU
	 5SvV58qdPmtsV0QSDTfN5g1iNHQbLoKCBeaTDEo6obA128DMI7rLM0wj8lqIXtfgw6KUs
	 Il2y9S2ASkLHCxqfU1dEYzytvHOG4yt2sSy+1LTmnnyL1hpvUnZ8sSm+rmNG/FIOVx2sF
	 idX/0rhaZkcbrjG+M8suSqg9AP96AcfqHkQubE39VsJ5M2nuviZUE45ubbmDJYNHkfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=thRbagr0;
	arc=fail smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99B6606A31E
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 15:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=thRbagr0
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843cf077f10so2183872a34.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 08:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683744; cv=none;
        d=google.com; s=arc-20260327;
        b=XDqAlaq55dRpV1YbpqpNUE+Zx0WoKk5eRWaThoE21DptlQZwig6j4WrDyyXyQPw1IE
         iPqiaXyxpXJzD+pOqjFnSHgwdy/bkZ050MLaltohf4qbdPYUEgHTcycfg0zydiLjd+9C
         G4HsKel1UEFhdJUflmU4cajrzh66vf+wa2Zxm6Ss+g+i0MJ/3Yp4F3LZxVB0rSBurx6f
         S1nIfpLSkVtf9vtviTmdej/qb4T5gWLcqW/FB72Vms7lnRhyx6q1q3s7qglR9RAdr4QK
         EWKcJYyHldfSsydZ/TgsWHoHaqJMDj7K4fAsstnHTnSmm1Cd7OE3LwYx+gXysgNY9Un9
         W9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
        fh=1eTqfCxXsiCmzucLoPL3M3WOjHVtrWWA0kzmPJod6PU=;
        b=ajwTCiJLqNXi5zMRAasD0g1I2C/usjkDtS7Gyfza3MNiErvoYi82yCgdTyZ8oTbrgT
         PgLopaXpZGDuTIlsnKVJbVoOrheftI/NHHOe2YvRQrC2zBBAVQWjyFaUNDHRYy3W/YnO
         6TgCGs5yZlxMtBlPaa6ZYSU2L83ubExCQw2YeI2WMsiaLVl7tQZ4pb5a/eGH93o+VEE7
         8nD7R9SlphFgveXgB8dIb2ZzxQjc7Iru2zsw2SjnDAaxiJO2VM7nBbKM70CalS6ympEJ
         hQUYh1sj0Vp/Tv9H/w/Jv6s13+MqDWGMOdJ53IRGn6C5caJDiA1CPyp+sUHHtEqaWncA
         tCGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792683744; x=1793288544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
        b=thRbagr0kS93zT5v8WW8/66BQkWG+fDEO65a7r6VnGj0XreMG07HdhqEgxotRl9whF
         ROisQRGyvFvzSiYM90RRE4aj2uziHCgMBppP00WiFQRX+sLvhW4kH26eK4K5AVegzHC9
         H27JleWBFMx+GQFx8xUlyoUTdYsNET65seYJnv195QDcFCMUORmh/4fJU0iACBUxBXDS
         dz1A6HV4UbspIVbm6K+kYSAdIP6BISTF2YXWTvpGdfj6fM6NEab8xE9bxChDl9dDOvcK
         OCN4Imhs3ILKO47gRXA5P+uqEZvAteBXPZiZ4Nhwb2fEIMP2uLdfkZPYLpYs09VC2TvQ
         tZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683744; x=1793288544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
        b=xiHXHPJamHq33hQ1TZTr2Qr0sEiXRK/XAKxxchRZdmtiIUrx1bv31Hk04AYyMeFcMD
         jPag66fyn1/Jb1lUtCAHwoHzCB9kcrLSCaXCPYqw2FJK93GgkBydv8nyCUp62DiX6POc
         KYy1I7al9WwcFkXF3h+7syTYsnLAcxDI+PxYJpIfSx8M5CPAUKL8xM1eGnY12lxJkGLP
         abLpf2PBpqb3ppRGcZNVPz7dgskq46zdz1f+iT5WdkQJx7CQv16eA2RjvrJzUxe5WFul
         st7bNPpXRiSPserF4nbcrfdVmGfmLRPvWe2LXsnNaFo2qANaG+txNkObhGJEYkXu2RLj
         y+0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkCaUDYZMtRaeC3QQQ5/srmEf7LCtTG+wsPgH0RBU+EvCROOwLrrPvquH25UkYK/8IV1q5XnyF38o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyCZEuFt/qqk98ntXvOoQetKbLFJFTi4I86eQp1hqOfMGz4E4Y
	2cvWaUKMpcVA/jVHUOgpGuBPu0yuM+W9/EVD5aytw+lX+d9hvqKPvlwlf2waMwnUAfZA3fUAVoW
	Kfifn4vNPRGcX7l/THliWBnFreFLtg9CI79DNjZvQ
X-Gm-Gg: AYBFou2lzjYziU4u/i5MogIjlQEQ0gZEQoCGIlK36pT8PYVnsFxB0W6+sqeX8dyyMtR
	LAApZJ95FryONCDZ2JlyeUR95yp0P+KMkuOL3Vqdg4WFsy5UneSm1xUNu9F9Db/i2mBjaAjORtE
	d5kFF382ANFcoNZc1HiF7VAJpy3HEq7v+bqg2/5g4RVc3hFNhu18hCv6qcDlKn3ZyulOPbRovVS
	W1GuCUKjeYckxTXUSxk2mptbfqqo3kzgYOL0GGMsO1zh0yY/PN3ybk5XOzVpksKOLCyXz9hwIrD
	l/s2p7BBcl1HA7QkavWP41z+BgXGnNp9kaN6aXyN7n3AlhFIUu1NsS89BP5BFrR42rSPF69p65O
	sO1mDNc7DEJt9xCa3oqt8S2l29xiU28l7bCJsiixX1NsrZLcWex1jEUnjqYRHYcttvaYVXNX6tg
	2SMJcPA9Nk5JZtY3ro3cAaT1oYJw==
X-Received: by 2002:a05:6830:2992:b0:844:ec25:c7f3 with SMTP id
 46e09a7af769-84d08505b79mr4053552a34.18.1792683744082; Thu, 22 Oct 2026
 08:42:24 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019135701.2767078-1-sonalipradhan@google.com> <87a4o8ivv2.wl-tiwai@suse.de>
In-Reply-To: <87a4o8ivv2.wl-tiwai@suse.de>
From: Sonali Pradhan <sonalipradhan@google.com>
Date: Thu, 22 Oct 2026 21:12:11 +0530
X-Gm-Features: AclHuK_cY5MAxLFcDxNvPeTguvtEQpkDq1J7THEXa10GvkWtPofM-JBCJrLXn_A
Message-ID: <CALeehfmiOoJS4cwPCzHcAgi5dGpCiS0sTd9FQZo6VWXwVth-dw@mail.gmail.com>
Subject: Re: [PATCH RESEND] usb: gadget: f_midi: fix UAF race during IN
 request handling
To: Takashi Iwai <tiwai@suse.de>, Sonali Pradhan <sonalipradhan@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neill Kapron <nkapron@google.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Fan Wu <fanwu01@zju.edu.cn>, 
	Victor Krawiec <victor.krawiec@arturia.com>, Felipe Balbi <balbi@ti.com>, 
	"Felipe F. Tonello" <eu@felipetonello.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 11:06:57 +0200,
Takashi Iwai wrote:
>
> On Mon, 19 Oct 2026 15:57:01 +0200,
> Sonali Pradhan wrote:
> >
> > diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
> > index 63fb6ee70a3d..c26d04eb9209 100644
> > --- a/drivers/usb/gadget/function/f_midi.c
> > +++ b/drivers/usb/gadget/function/f_midi.c
> > @@ -280,9 +280,18 @@ f_midi_complete(struct usb_ep *ep, struct usb_request *req)
> >                     /* We received stuff. req is queued again, below */
> >                     f_midi_handle_out_data(ep, req);
> >             } else if (ep == midi->in_ep) {
> > +                   unsigned long flags;
> > +
> >                     /* Our transmit completed. See if there's more to go.
> >                      * f_midi_transmit eats req, don't queue it again. */
> > +                   spin_lock_irqsave(&midi->transmit_lock, flags);
> > +                   if (!ep->enabled) {
> > +                           spin_unlock_irqrestore(&midi->transmit_lock, flags);
> > +                           return;
> > +                   }
> >                     req->length = 0;
> > +                   spin_unlock_irqrestore(&midi->transmit_lock, flags);
> > +
>
> Does this transmit_lock help here?  As far as I see, the ep
> enable/disable itself is done outside the lock.
>
> > @@ -678,10 +690,11 @@ static void f_midi_transmit(struct f_midi *midi)
> >     unsigned long flags;
> >
> >     /* We only care about USB requests if IN endpoint is enabled */
> > -   if (!ep || !ep->enabled)
> > -           goto drop_out;
> > -
> >     spin_lock_irqsave(&midi->transmit_lock, flags);
> > +   if (!ep || !ep->enabled) {
> > +           spin_unlock_irqrestore(&midi->transmit_lock, flags);
> > +           goto drop_out;
> > +   }
>
> Ditto.

You are right about this. I'll rework the patch along with the issues
noted in Sashiko's review and send a v2.

Thanks,
Sonali
