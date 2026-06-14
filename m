Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460F2882B6
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781455287; cv=pass; b=M4WkSDfMsC0K9y6YymQF/Th+Tlljp52REa1F7/zp8J9tW0zrUat/MFmHzm/4I7nB9kreFuLi0cV4xhnskWGyDOTS0FmDre6RSsmaHpIdFN9x+G96ngLBtbfqwiPBQV9r79bR+Sm2TI3Gf9NTuXs/gmsNQ/Zy04w6KovrPzZobDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781455287; c=relaxed/simple;
	bh=x2Xxe6/MF4mW14P6AHGc0otqfJbxn0XYGyTgCjIhVOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeUxZI0dgkkjWY7IHKie6dHBbLMVTwjwnnHs7L3X2NiOGg+hIwc/pFAsUolwv88N0xdN5UUmclsPdWm/qw3qP8S7BCOx3xTR7D/7dBH0GQMkz8/FfeW21RBnDX5+KJxuzhfCo7TcNu2RdWBan6wYSvFxwbdG7uyV07dx3ahfBhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYWoigtq; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYWoigtq"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5176fc0cc72so28067561cf.1
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 09:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781455285; cv=none;
        d=google.com; s=arc-20240605;
        b=fcoG012GbIr026SZGeEJfR1jwUd/McQUfUWX1PoFR/hEFDXx93jt+DPeazvLzlZSNg
         /Ki32+d3gpcWF5c93Jldxt2DM2h28heQiT7qgJCRUeYqsnuO4bLcOvyW/Xzapz2CGJs6
         glS3k+Q2yZDKT43zgEmYqU1Uu+iuaCweuDDbN0QFx/LaEt72uz0U3+HNDXAG4QLux8zy
         kPgdwJIGtwplADgGYlwFUY7ZKbGpkuYQwTvFvj9GTSpuCZxE41vYlZUh3YbNq+0xmFpV
         L7bATm2s4Eqig5PqceG3qJ5UN9xoDkTEP3IxQobrgFZvmUEKb62bzQP2ULXISCjzuBh5
         rCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x2Xxe6/MF4mW14P6AHGc0otqfJbxn0XYGyTgCjIhVOE=;
        fh=PTDiPhSoxv79/LtLdjng6ZC1xCweB0fDfjxXqJtKtiU=;
        b=XGzm3g5YFmcsOReeDLBWCaB+lxaC56IjYLMVTU6FEFS089IUNZNVgR7x5ogNkxVR0n
         +ieZxtJE1gHrLygWxnUUMU0mV7xgtBliUw9vgJqdmPl6K103YFAkTB4mvLWGyt5i7Noz
         KXxOIlE0DhAYSd1+gV5hLo+UnEG/qpa+GY67gopJro7g4Wew9gmYqHAH7AYlZ4+Wb2Ur
         dfQWwrPko2blgKL2aofGj4/v+Hxfiw5vb+LUBE0mpDlWLCZWvDiSy+I/5OjZbpitwHMs
         J4iipcAqkrOxpcNx1GpxdG1VeWo3tVYeN1Sn3x+h+hDoSi9AJEnOrxNW1xZVh8VBIZV+
         +NJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781455285; x=1782060085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2Xxe6/MF4mW14P6AHGc0otqfJbxn0XYGyTgCjIhVOE=;
        b=SYWoigtqcPDLRXzvJTYazsVe0qPErmy3VP6sJOp/lWMBg9jDDsbAGHArGvU86YcJrQ
         M1QN2atbgK7+EloHmfu22covvf+2IITK0cFEBkOBFyy7D8NK6pUvwvhYKP/x75EOQDEv
         0JosJrGkfVt1NlvgAuTal2AaRDzoP4SLh7R+7T7/k4m3FC6cZTmyrXFrfzDfk1ifAHri
         WqJyFYAsxmB7/Eg+rUSU4iZxRJn/LHWrloy4OW276MAulGl/WHpwWVgVKqdOnOc/crqM
         YXIHyISsXeWV51/b3wo71on3R7wAj3t3YIAsWYVlLu+xHojk4J4pi1CDSGeKc4uki6cm
         li0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781455285; x=1782060085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x2Xxe6/MF4mW14P6AHGc0otqfJbxn0XYGyTgCjIhVOE=;
        b=s6+RLp3KOokzU8Z0lxpeXGQGekgBYoarKa0zRSG9iiSug+NLWRRZqhtGCNM0v+aFYT
         JoKC5w+X6/3n8lkHp+5xaZb0a2zKicQToQR4+2mIfV+pDmNKdwJeb4lanK8WWVpObyAx
         ktjhDvRehGWutcTNYFZC4cPzGJeSFABjytN/FDKHEZF365k8LcSzdK2faDPgjudBbZIC
         yHg8+RSGDi4EQXAhKDLdDpJBwPY/Jko7YZCKHJDRGdFkmJKKSzQ2IfBQjQHOP9Tl4zzn
         Pq+izT9G43/rCLPEcwMAIM6XDisU9zelGLFYqrlZNsk2rsPRjfEwT8PsJhytfAxSKlX7
         0yrA==
X-Forwarded-Encrypted: i=1; AFNElJ8G/PTZLc6uwH8EX3iqbPme5O9jox4R0z132WHglsxPpQE1yyFFxhrHn8JzOVgH6zwsfMSUWaBcXkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHH38gtq9OHwkKfNaek3y1cMGdgVNPDtAPMthI0z4npl5ACRRB
	m5+zE8yH9Ey8Hk8MglMYTZN8nhqPaHcsjMAfaEBV7e+h+7ij6zJxFf0bOcpOHtICVt2gDE9TkLj
	ysyNvnUDPS7rxUYgByU6ysuRkU38CwwJBbA==
X-Gm-Gg: Acq92OHpvzHu5JNElR7RaT76PSejb8akOtunMNok75p9AgGRD4jsgvJvfCj6Z3SxC1n
	uSUo9B3mZa0uL57nxe92XSq8slLDvloJKmf7Nr/AP2XRJ93v32D3pSbkavFZKDeqorNQSUYYoKg
	gsT8SVXRQx7qb9PjgzoYI1SNoI3QukeiYbHdg6hKXUkwZDVACUBGjLnopSeXA5PuPWbrA6qEIDr
	jgyio8Fl7TW/5cHiilUDK70tHnnAuVzsyjVVYHC+t91v+Oyp6PibgGWXCkXw7zLSITD3GXI5B6K
	Wf989d/ckGnS0RcbJ3btPbHdOFVEQaWIr9EVBW+wZ8blsTjv
X-Received: by 2002:ac8:5d42:0:b0:517:8353:3497 with SMTP id
 d75a77b69052e-519533b50f7mr123866481cf.23.1781455284722; Sun, 14 Jun 2026
 09:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com> <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com> <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com> <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
 <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
 <20260529001057.1e0403c4.michal.pecio@gmail.com> <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
 <20260529122210.6d2c5543.michal.pecio@gmail.com> <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
 <20260530005742.25893efa.michal.pecio@gmail.com> <CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
 <20260613112648.2ea61301.michal.pecio@gmail.com>
In-Reply-To: <20260613112648.2ea61301.michal.pecio@gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Sun, 14 Jun 2026 17:41:13 +0100
X-Gm-Features: AVVi8CcRAPWqKhECo8pQXBu7fcEKEvCkN3FM6PRGOmPjI_zIDzn-JbMD9wvIIbA
Message-ID: <CA+_z3hTJh1fiC_cqXWAseAyFVjWf8c2Qht8dPt4MUTX+DJqDXA@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Yes agreed - would be great if could fix it for all. FYI I have had no
failures with my rebuild logitech hid driver whatsoever, so that
approach definitely works.

Happy to test patches. And yes, it does happen on subsequent suspends
so can repro a bit easier that way!

Thanks
Martin

On Sat, Jun 13, 2026 at 10:26=E2=80=AFAM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Sat, 6 Jun 2026 14:12:22 +0100, Martin Alderson wrote:
> > So the ordering that kills the controller is:
> >
> > 1. dj work issues a control SET_REPORT on ep0; the URB lands on the rin=
g
> > 2. usb_suspend_both() =E2=86=92 usb_suspend_device() drives the port to=
 U3
> > 3. only afterwards does usb_suspend_both() set udev->can_submit =3D 0
> > and call usb_hcd_flush_endpoint() (drivers/usb/core/driver.c) =E2=80=94=
 and
> > that flush unlinks the still-pending ep0 URB
> > 4. xhci issues Stop Endpoint to an endpoint on a U3 port =E2=86=92 5s t=
imeout =E2=86=92 HC died
> >
> > That matches the trace exactly: the "Cancel URB ... ep 0x0" appears
> > after "Set port 7-1 link state ... U3", and the debugfs command ring
> > shows the single stuck Stop Endpoint TRB (slot 1, ep 1).
>
> Makes sense. And good point about usb_hcd_flush_endpoint() - if this
> gets stuck then usb_suspend_both() can't complete, which explains why
> the HC still isn't suspended either.
>
> > I had Claude patch the driver and this seems to fix it:
> >
> > --- /tmp/hid-logitech-dj.orig.c 2026-06-06 14:08:26.580516662 +0100
> > +++ hid-logitech-dj.c 2026-06-06 13:42:15.702948099 +0100
>
> Improving HID drivers is one thing (which should be discussed with HID
> maintainers - see Documentation/process/submitting-patches.rst), but
> other drivers may behave similarly and it would be nice if this didn't
> crash xHCI controllers.
>
> While URBs on a suspended device are weird, it turns out that xHCI
> spec (4.15.1) doesn't prohibit that, it only says that endpoints should
> be stopped. Which they are - problem happens when we try to stop again.
> I'd expect such a command to simply complete with Context State Error,
> which it does in my tests on different HW, but yours gets stuck.
>
> I'm not sure what specifically triggers this failure - is it stopping
> a stopped endpoint always in general, or only after using the SP flag,
> or on a device behind a suspended root port, or something else.
>
> Would you mind testing some patches? I'm thikning about reordering
> things in usb_suspend_both() so that URBs are flushed before suspending
> the port, or investigating what exactly breaks your chip and adding
> some workarounds. We don't need to stop a stopped endpoint, we could
> proceed immediately to Set TR Dequeue, but it's uncertain if your HW
> would accept that.
>
> BTW, you initially stated that this happens on the first suspend after
> new boot, but are you sure that it can't happen later? This would make
> it possible to test patches by suspending repeatedly until failure.
>
> Regards,
> Michal
