Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C073AAF4B
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897799; cv=pass; b=maTjkRHObg4hssfH0iD05R4dQVUmd2dJLIP0qrY7phUN5cWk7MX1pAfezePVkcw+FgWLSghI7Kg98klBPLRrPXasr95tvT0oH5vj8mipAu6M1MxvlI6baPxOQyUCqlIeZDidoa+5Vrn20g1C8vak6wLtO97oo3rlhS86I8rJ6fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897799; c=relaxed/simple;
	bh=xoMiV9pBhr3XdnzLt7GGRC4M0vLljGvUyUzXHHfPtsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbrlXl9V18smsQgIMqWHrNJFX+kQqZMfqSFBHeQ2Tn8Sjv1eD4/gWM7Rn2rrYgE06qSkoQry+Zih68Dgw11Zrpl5g1v14FNfSC8P2IN8xecGgLOvtrtJYbtVR85GU1xHJZ9xa95+JWhUCIAzp89wRQksizGWToXfaReQxKH+J9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=NND2t35b; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="NND2t35b"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d7195706f1so7471645ad.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 23:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787897796; cv=none;
        d=google.com; s=arc-20260327;
        b=ocEeC3tzTm25oiuHMWQq+oU5PQNkU0FPVNocr4Y0x+dPca8reXBTL77et86TyK2zOT
         j35ELVxjdqbOpbgeSws31hz5dQLMYoM+LgIeTRSysu3ZtHzHiQ63vPpEqeaYajOQiw8s
         aqhxXnE+mP+/xW1KlsCcXUZ6IaXMI1mMxzxDdyncyoQsVAEcFVfW/F2VwMQZCvneRbXE
         Qdna9tL5SIe+WIVg+7bD725hL0OJs4EfyGzwDtiNgwodNSBi+wj8T81UhrgJ7xQ8lLfU
         Qep5UyNNueeHF/uuhMGWZk7t0wzd2QL66SzyJ20dSJbNgfz1FseIWV6SCg8+40zB+S96
         Wb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sflMmxyu0cD4KSTlFZjH7uOclQyjcfSGu1IXDQSkpX0=;
        fh=czHbWFEPuZYyY5xPaRT5b6jPsmFpS2hb3M6sc7pSj1Y=;
        b=ZYpAstCaOCDFOLKIl1nG5m7m424gEz4r/+D5X70Q1t0lXEAfyOK0Q6oX1coUU51hQY
         F+Ovnuv7/xUHey/nCOGWD7O5nU2px2RW7w58PQRU6iAmbG4Zc7ssI+cnlIHrVMoRAliP
         CaTeywPo4wM2sRpjPOuyJxwhnemz5g0FL4/D5oOfRmE+ZYRzKX8fiamOO/z7H4SXG0U4
         ae61jk3nFQL+1ra6aqTQxWu0M0ZBdzvjJPxfRacl15A6p0zdj8hjag3+XRQ1b50s9IvE
         /vNx2k2sP37JazyxnwTxTI39kS7RtVyYsH5wpZaxl2vkNnTLa47Tu1grxdPo+x9dKRLV
         xT5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787897796; x=1788502596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sflMmxyu0cD4KSTlFZjH7uOclQyjcfSGu1IXDQSkpX0=;
        b=NND2t35bzFhYdKArGYhMr+2WTbTIAkJ8Fw4Skou7TtZGW40Q35u0YdV1hdVx6jhWnA
         rA9T2e3f/oHtTN0DpLEKlIqOOgDd8Eebhr4bF3iMHDPFttP5FZZaGqNlC0DpSwSfqETi
         R8ItiRI0vy4BwYXvfVl4wvupyUN6UzBj5nlXjAoC56M8AqY9IECOhQC+NMt8rsf9Khi2
         zG0HVSRguedbYAuNXFh9wROG0QbnFNpkRm7hJLYOBDR90n1L7p7rJf7VFT/FVl7+N+Mf
         /d2Z6KSKunWTImE0DZnGKC0sYAAYV3cObKo/h5DPfV+hWwlUKOhWPngG/ADiagXo+skM
         DhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897796; x=1788502596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sflMmxyu0cD4KSTlFZjH7uOclQyjcfSGu1IXDQSkpX0=;
        b=LI2ZqnYZaUu875Pl4jEskepElNHBrWhipnyF82NBa7Zp65J7B8zJ4ngY5fudnIeeID
         uQnxFIqJFdmFFqJQ8ajzHrerFm320EG7omqwyQX9jYqmuIR6FWwAfds21n2BwrJRz6cU
         EOXz2PRDuRKNNY0h2U2x70XjpdJsBlpSvMTnykotUA2eXeT64/TvLqSx73c35aOa2Lhg
         LP8UEQO+U/ojp7ZCKMLM9NpyyU6iMamVmZ65H9WSccyWnnOT5GkRPXEzLtcXha21VSjJ
         L6G8FRHmSDsP9dAUPSsuX1n2YVqwrRU7BzP/1I+fP809san7l/hm7rDLjO2zObvvE98T
         /bTg==
X-Forwarded-Encrypted: i=1; AHgh+RobFca+ThZ6eQSQLlZrI/1nJ2yLTR9NH0roFT69/oMeFFfrARFgWSIY45m9KkytKQ4JbQWgKz/W2lk=@vger.kernel.org
X-Gm-Message-State: AFuF++mehNLGRPfqMAGVrzL9n/1MxyQtSFZ5ax3N/52Q2nbKJRoIXNZM
	6Qe8Z8QcVTdhCOe7W07FqDd0GDbB3NVXqJf2z5DK179PjtpaSih3ikdNwGj236HCrnE2h9/JwrA
	Ngtao3ig1+U4jfxUnWSUWHIeqfsDU+eAT41VhObvG
X-Gm-Gg: AR+sD11eT/PZNJZw6RhK5uR27ZDKM809Eqjy2VDPhamx88P5HuzNuWVjQG+t6WBKHEU
	vSyJnAGSVPJPda+H9ieXqTMxNeiXUQXrb5ELhSweZSa2W+/czSnjPPcN+ynAl9bzYTx/zk6qiQa
	i8fZcp7Ue+hUNkXBwTCJ8S1TROzGqjbfGBDkAdutPBTLUJFgqdZFL4p0GMw1ROM7S2VA3pG5c8l
	o7pHJveGn2uC+4/7RzqHjENEgnynQxYx6ufbmmFSOaJM2+CIzIR6xSSr/kURJYBkfBrpOw9+xiD
	t2YUTORRkjeFjILslWCh3O0EdTsAZ+crrPuHz/r1rqyUpM/j/AH7FOvo4AkCWY6NwHT/hzVmo2l
	XZJmENuHvLZq/g11iLpyn8uDJjq7UpbKYAJuJy8tIYUH6ViQ0/j6QuHW6BI3FxAY=
X-Received: by 2002:a17:90b:440c:b0:381:6c5:3f63 with SMTP id
 98e67ed59e1d1-396d0eab08bmr9179421a91.6.1787897795025; Thu, 27 Aug 2026
 23:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCh2o46zgc5Be_Z5=6NNJTKnd3W29zeMJ+gBCgL+4fFLAg@mail.gmail.com>
 <2026082853-proofing-pungent-4e23@gregkh>
In-Reply-To: <2026082853-proofing-pungent-4e23@gregkh>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 27 Aug 2026 23:16:24 -0700
X-Gm-Features: AcwNN1VKlBjci1xgsuY-L9s1bkbRjRQnZ-ek12mQnwOMDHFbKaacflx2cNEeSn8
Message-ID: <CA+0ovChEnx=kEPqK025rVH9EXRBk-dvSTts8+2ufw6bmt7nrvg@mail.gmail.com>
Subject: Re: [BUG] platform_get_irq_byname_optional -- dwc3-haps registers IRQ
 0, WARN on first gadget init
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, falemi@asu.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg,

You're right; sorry. I've stopped sending.

I'll resend individually, with the reproducer inline, and a proposed fix wh=
ere I
can write one. If you'd rather prefer that these not go to
the lists at all, say so and I'll drop it.

On Thu, Aug 27, 2026 at 11:12=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Aug 28, 2026 at 05:34:05AM +0000, Farhad Alemi wrote:
> > Hello,
> >
> > As part of the kernel research at ASU's SEFCOM
> > lab, we hit the crash below. Crash reports can be found here:
> >
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/149-usb-=
dwc3-haps-registers-irq-0/
> >
> >   dwc3 dwc3.2.auto: Configuration mismatch. dr_mode forced to gadget
> >   0 is an invalid IRQ number
> >   WARNING: drivers/base/platform.c:492 at
> > platform_get_irq_byname_optional+0x1ed/0x220, CPU#1: repro/9498
> >   Call Trace:
> >    platform_get_irq_byname_optional+0x1ed/0x220
> >    dwc3_gadget_init+0x607/0x2170
> >    dwc3_core_init_mode+0x2f8/0x790
> >    dwc3_core_probe+0x2345/0x2850
> >    dwc3_probe+0x100/0x150
> >    platform_probe+0xf9/0x190
> >    really_probe+0x267/0xaf0
> >    __driver_probe_device+0x1e2/0x350
> >    driver_probe_device+0x4f/0x240
> >    __device_attach_driver+0x270/0x410
> >    bus_for_each_drv+0x258/0x2f0
> >    __device_attach+0x2c5/0x450
> >
> > Our reproducer.c is available upon request.
> >
> > Happy to test a patch if that would help.
>
> Again, see my prior emails.  No idea why you are still sending these
> out, do we need to set a ban on this address to our lists?
>
> greg k-h
