Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9162A1D95A3
	for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342815; cv=none; b=VHFcbwQ5CAxwyuSMDxXZI4sOl84CQAVENji0y51KPxq4SJG1WFtq6VnzP7NiNJEeHN4zuYgvwnXgdrElsgKj3cM1qXqJjHGPC2vTDB4aifFWkD7bh7U7DZh2jGgT6Ys+fmkIKWWTfdJBGZCRDXvZl1VifaiiPw0sVkOyN+dqgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342815; c=relaxed/simple;
	bh=G9vSnzX4HubY0LrHOodSckebehdEhsBoFgWOBSp5Wjw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMGEn20V4b0vnF2tlBOF2Lbdq8/XvKB2RHzoXhQSuJp5g0eVuMujJUSpj6wolD7EAHNfKnyjvIt4m8JWpB9DPRb98mRVeyl1h8XuzAodYE83pw3+lu4w+t3xb/SM5L8UrJZAJF6Sn4VaVwkS8uCHO94d20q8CGqqqc5+WWGjNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B58w+RVL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B58w+RVL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5739185e9.0
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781342812; x=1781947612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9vSnzX4HubY0LrHOodSckebehdEhsBoFgWOBSp5Wjw=;
        b=B58w+RVL5jscBMGv+ONIOCWrvlysHfVVvEC/YdV/ADpLsyMeRXq1+lZQi2OsidOIwu
         EvM/CnEl08IukaEW0U/noy2DqA49snzqypfTGJb6ldkS9/2LUhgpeNm2P/IYjSUafYC5
         /9t2hrz8WF2W72hy5CVqZpxx1tbISPYOGfiiv4zpfkr4EpaefFDXNmQaMHpufgRNfhU0
         8eUuT6e5dg/FGf9Miq0PItxusDwTqFR+gWZqT5XR3hsEfm1WmqowJNB8yXc2/LrGuJdf
         Ldg8dTd2tgqVLr94fbp9E/uSyo8r2XmlFuRyc82CCJIG4SFlkUWrlEZ1lcy9jr3kDJGu
         LOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781342812; x=1781947612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G9vSnzX4HubY0LrHOodSckebehdEhsBoFgWOBSp5Wjw=;
        b=V0XVkYXQJgLx4eQg4s0yuv7NWG8IgMgqUDyy4OrJYKi8OglCQVR4FRuaCarBVRV0IM
         A218DDGAgb3Ww+i0/Ykldje/BMePOHR0k7qteVYKAJFcLTxVUSUoutFJp/w4ag9Xh8xT
         lyjtqJWf4M4zxdyjILWNxx5kIxnRrSfqcC3nkcdJNzeL46qpsnqZ2kMfxaD4vg+L4MSz
         gR2DaoSDUIa2ERr5B9kDTBM08EzhmGBC9Y5gSqahj/TXRFLrWquxg/Vorg6c41uUrPDV
         J+Xkz3Klul5pkNUocgp7q8Eg9pvc7uOFbIgEDSyhcVZzSfGO9djY26GiRVO+b8/Wq2pu
         e9PQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y/6NhHgatfNQPvLnYY/wZ1rvnp2cKHRzCFCCTZjU+lnxHLeK6eWrFbnAQ4wYxPe+d/6ki25R8Uts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Y4F/kYphJDKNJyoEMM4SfPd7wJRNEkCSfxlq5OGp3t6JFR/J
	HNXvklT+jbcRKgQhRyolNZNefsp8Zwelq+hb6FOSmUHFFvNs0o5y433aOG5DkVhm
X-Gm-Gg: Acq92OGWa39M2MRwoEkAWOJMaIc6edDl5OAx4x6lGpr1hPQLzN3oFpObCaJPh0OQr8u
	7u+pd+7dA36E/gzfisUM/6HAkWeVU+rvs3WWhtPjUESfjSNSbEgs54ncZ9lIixFQ/1pxCCT0zEg
	OTGUqUq4Rg5DA+JKg6hYVT5d9t80tryRHZAjMuz7N/BkdNjA4ZEAXxlMRf30Q9nJFiQfN+Yl+PX
	DYhJa8ZDuYYj7Y642UvJM9RWPpACUw1Av/isP1s85DBelN527Km3JuOxTIb+nY2Ik0An8xs3cHt
	tJshbuetFJvyzawl1fuBAN+zbkyWDMTsHHoVZAOs3X1bUI0MmnX6oH7Z9etzd6wpXu+/nJeBaJm
	DCrBtjw347Og+tEW3AiXolljpyE6r6jlWhHJyaSbVfz0U6A1YsCUzKdCxfuQq/hXndQVmDaRUYC
	HyIaZ4FHz5HFApltRbvH2/PApMdbEhExmRo4g=
X-Received: by 2002:a05:600c:3144:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490ec4d523dmr82328475e9.11.1781342811732;
        Sat, 13 Jun 2026 02:26:51 -0700 (PDT)
Received: from foxbook (bgu176.neoplus.adsl.tpnet.pl. [83.28.84.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033dd3esm58809155e9.8.2026.06.13.02.26.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 13 Jun 2026 02:26:51 -0700 (PDT)
Date: Sat, 13 Jun 2026 11:26:48 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Martin Alderson <martinalderson@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260613112648.2ea61301.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
	<20260330020749.18fbe433.michal.pecio@gmail.com>
	<CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
	<20260404152438.582f0451.michal.pecio@gmail.com>
	<CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
	<20260509180603.6f67c9d8.michal.pecio@gmail.com>
	<CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
	<20260512120334.4eef3d0b.michal.pecio@gmail.com>
	<fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
	<CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
	<20260529001057.1e0403c4.michal.pecio@gmail.com>
	<CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
	<20260529122210.6d2c5543.michal.pecio@gmail.com>
	<CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
	<20260530005742.25893efa.michal.pecio@gmail.com>
	<CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Jun 2026 14:12:22 +0100, Martin Alderson wrote:
> So the ordering that kills the controller is:
>=20
> 1. dj work issues a control SET_REPORT on ep0; the URB lands on the ring
> 2. usb_suspend_both() =E2=86=92 usb_suspend_device() drives the port to U3
> 3. only afterwards does usb_suspend_both() set udev->can_submit =3D 0
> and call usb_hcd_flush_endpoint() (drivers/usb/core/driver.c) =E2=80=94 a=
nd
> that flush unlinks the still-pending ep0 URB
> 4. xhci issues Stop Endpoint to an endpoint on a U3 port =E2=86=92 5s tim=
eout =E2=86=92 HC died
>=20
> That matches the trace exactly: the "Cancel URB ... ep 0x0" appears
> after "Set port 7-1 link state ... U3", and the debugfs command ring
> shows the single stuck Stop Endpoint TRB (slot 1, ep 1).

Makes sense. And good point about usb_hcd_flush_endpoint() - if this
gets stuck then usb_suspend_both() can't complete, which explains why
the HC still isn't suspended either.

> I had Claude patch the driver and this seems to fix it:
>=20
> --- /tmp/hid-logitech-dj.orig.c 2026-06-06 14:08:26.580516662 +0100
> +++ hid-logitech-dj.c 2026-06-06 13:42:15.702948099 +0100

Improving HID drivers is one thing (which should be discussed with HID
maintainers - see Documentation/process/submitting-patches.rst), but
other drivers may behave similarly and it would be nice if this didn't
crash xHCI controllers.

While URBs on a suspended device are weird, it turns out that xHCI
spec (4.15.1) doesn't prohibit that, it only says that endpoints should
be stopped. Which they are - problem happens when we try to stop again.
I'd expect such a command to simply complete with Context State Error,
which it does in my tests on different HW, but yours gets stuck.

I'm not sure what specifically triggers this failure - is it stopping
a stopped endpoint always in general, or only after using the SP flag,
or on a device behind a suspended root port, or something else.

Would you mind testing some patches? I'm thikning about reordering
things in usb_suspend_both() so that URBs are flushed before suspending
the port, or investigating what exactly breaks your chip and adding
some workarounds. We don't need to stop a stopped endpoint, we could
proceed immediately to Set TR Dequeue, but it's uncertain if your HW
would accept that.

BTW, you initially stated that this happens on the first suspend after
new boot, but are you sure that it can't happen later? This would make
it possible to test patches by suspending repeatedly until failure.

Regards,
Michal
