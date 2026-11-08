Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177889;
	b=jRtxJjFqY7sk4cRcbcIqJ9yjsGPKK3RofgNTvbWxZYwOLZF+Gfjh6uU/P+jVEeHvwcmU
	 OgziE3moi/hSrgZu4BtPmdD9p2IQ+Rqp6G8Y/eYsZw4weuZmLo/2vjFTM1fm1WTHhoJq5
	 UWPjvLvgpQt8o9+89fCkfe3peJB16EbIE1k6ZoOKea43ZR7twYyg09F7Uddg4zoB4AO3e
	 5eaXIurV1BeFgm6eNVdMnZKVVCaQDwbHPVj6v67AGOsycmA1ubPjsDHbyE0UAL8OT9iuz
	 mPMDMNELYHfMBZGQYtpZBQIDNkSbpJrs99j9XT8aN4WFVUzzUx6HYY6G1ID82Ql8g4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177889;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=g1CwH36nhLXqw+8XCuUnUv7MfkbZsFXyFt3hVg+rxdc=;
	b=e3RqUkQSjrH2ynfCNyLAwtjfV9EZ492s873yMuR8sJh5mBITJnLgY2vM9iZGsLElxw47
	 Vv9aFyQXdYUa+RoHm1NCtarQ71wDskyrETHirf/QCBtbuA4oWWGBpZX6tTZuVpWJwXCVA
	 htjR++AkIqITfx5bEJ26AL8eTlwi+pjjhChs2p74KYRN40iOQfuCj0A42dkxdILJ7WGmY
	 bULCTgVKva8q9UkRhXo4ARAyQQaqD8w/LepyTZoSFhxCOJPV7cVYWbnS63tS1HcWfmVrt
	 yXpptINoAxtTdHrzbL4p0sKrrTggvtift1l5nSz4nKDWkuoyBWT+/cVQa5qZCwxDk/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="frTWl/n1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA6D606A31C
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 22:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frTWl/n1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293D21F0089F;
	Sun,  8 Nov 2026 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794177888;
	bh=g1CwH36nhLXqw+8XCuUnUv7MfkbZsFXyFt3hVg+rxdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frTWl/n1sVH+iWKGr1cT5ZNiWvFWpIRgdDuCW/G4kt+CCGcb8ZYDViku9fuKeRNg3
	 6s1ET5fs9mYtuAxaKcxOuHXb7SAwEZU/Sze2HCWzHLr2Lot+5G+4uejE8Iy0vjxtAj
	 qNqG0rx2Vcg+KOldPTEAIXnKL4y9TgrPdPnjw8IOdU01NbNerKmxXvOJuMn2rVH6YM
	 OtsAd0GUA0Bj0BJORT9U9yzAP6Di4nRLov8t5i8LO32CuDEMjQYe/vAfYb3vdcjosY
	 xI473ZJZX72DwQCX04ueGqtTClcQwndhGsAIahAXqwNs1IjUSnptRpOuCBmeZtngYJ
	 F/QDbd7cc/kYQ==
Message-ID: <sashiko-outbox-204126@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: free report list on release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Noah Weinberger" <NoahWeinberger2003@proton.me>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <1QsGBy1k7rgvDtVuIrw8wkuScqkmKf-h2yKjARCmaLFH2TFGvlr8izECUG0Pq-FRMo3NqA6bmTOayxrZ8xc0xwSOKjLLpz9flCzQomrlnqk=@proton.me>
References: <1QsGBy1k7rgvDtVuIrw8wkuScqkmKf-h2yKjARCmaLFH2TFGvlr8izECUG0Pq-FRMo3NqA6bmTOayxrZ8xc0xwSOKjLLpz9flCzQomrlnqk=@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 22:44:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: gadget: f_hid: missing Fixes/Signed-off-by tags and
  changelog/style nits
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] usb: gadget: f_hid: memory leak of hidg->get_req in
  hidg_unbind() [1]
--

commit 6b437be3613ff7b4c0c239461caa731cf0c00ade
Author: Noah Weinberger <NoahWeinberger2003@proton.me>

> usb: gadget: f_hid: free report list on release
>
> Hello,
>
> Entries added to hidg->report_list by the GADGET_HID_WRITE_GET_REPORT
> ioctl are never freed: hidg_release() releases report_desc,
> set_report_buf and hidg itself, but never walks the list (and
> hidg_unbind() does not either). Each distinct report_id used over the
> lifetime of a function instance therefore leaks one entry (~72 bytes),
> which adds up across gadget reconfiguration cycles.
>
> Free the list when the device's last reference is dropped.
>
> Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670b=
d (v7.4-rc1, 2026-11-07), drivers/usb/gadget/function/f_hid.c:679-682 (list=
 add), 121-128 (hidg_release).
> The report-list mechanism is newer; the leak is present at HEAD.
>
> This was found during an assisted (AI-supported) static source review of
> mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07);=
 every code path cited below was re-verified by the
> reporter against that tree. The patch below has NOT been compiled and has
> NOT been runtime tested, and no reproducer was produced - the triggering
> conditions are described above instead. Please treat this as a report for
> verification rather than a battle-tested fix.
>
> Reported-by: Noah Weinberger <noahweinberger2003@proton.me>

[Severity: Low]
This commit fixes the report_list leak introduced in a139c98f760e ("USB:
gadget: f_hid: Add GET_REPORT via userspace IOCTL"), so it should include:

  Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")

Note that 4e0a88254ad5 ("usb: gadget: f_hid: move list and spinlock inits
from bind to alloc") is a prerequisite for stable backports so that
hidg->report_list is initialized in hidg_alloc() before device_initialize().

The commit message is also missing a Signed-off-by: trailer, and the
greeting and testing disclaimers belong below the "---" tear line rather
than in the permanent changelog.  Finally, the diff adds a second
consecutive blank line after the list_for_each_entry_safe() loop in
hidg_release().

> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/fun=
ction/f_hid.c
> index 3c6b43d06a6d1..dcf6dce1e1d6c 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -121,6 +121,13 @@ static inline struct f_hidg *func_to_hidg(struct usb=
_function *f)
>  static void hidg_release(struct device *dev)
>  {
>  	struct f_hidg *hidg =3D container_of(dev, struct f_hidg, dev);
> +	struct report_entry *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &hidg->report_list, node) {
> +		list_del(&entry->node);
> +		kfree(entry);
> +	}
> +
> =20
>  	kfree(hidg->report_desc);
>  	kfree(hidg->set_report_buf);

[Severity: Medium]
This problem wasn't introduced by this patch, but does hidg_unbind() also
leak hidg->get_req when no GET_REPORT request is pending [1]?

hidg_bind() unconditionally allocates hidg->get_req via
usb_ep_alloc_request(c->cdev->gadget->ep0, GFP_ATOMIC), whereas
hidg_disable() only frees it when a GET_REPORT request is in flight:

drivers/usb/gadget/function/f_hid.c:hidg_disable() {
	...
	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
	if (!hidg->get_report_returned) {
		usb_ep_free_request(f->config->cdev->gadget->ep0, hidg->get_req);
		hidg->get_req =3D NULL;
		hidg->get_report_returned =3D true;
	}
	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
	...
}

When the gadget is unbound while idle, hidg->get_report_returned is true
and hidg_unbind() never frees hidg->get_req, leaking the usb_request on
every bind/unbind cycle.

[1] https://sashiko.dev/#/bug/linux-b7d8a0a0-a788-48be-a1a4-1106b659764e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1QsGBy1k7rgvDtVuIrw=
8wkuScqkmKf-h2yKjARCmaLFH2TFGvlr8izECUG0Pq-FRMo3NqA6bmTOayxrZ8xc0xwSOKjLLpz=
9flCzQomrlnqk=3D@proton.me?part=3D1
