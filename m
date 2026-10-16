Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7E231A3B
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166562; cv=none; b=QhqhrMtKg2Ikk9zWryiagukGoupH/61Iz3JM2KvSsgjyV75nc3Hd6FrmgN7et/ehooGMLkyr74IAQnv4ns2090cRvawO4rTZWcjiC8c4q2GhJRhf9MKp97l2wYwroO2MKaM/Mf+u6RKZO9DkY4L5bgqAaW1sTMbO1/3NJk0LlA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166562; c=relaxed/simple;
	bh=xxn4acQwmBdiqHyfbAJ/me6uhb3iDCo/6WFEEH0oD3I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GV7ncYGKr2OTq3STAzDiE9bMqdMBygxFTkd4ttayubsYkk/sdNeBWxPHHHAKEmdtT4+rjpUKcr1g3jwlPTeUq4P+P4nLx6k4s2rNEje/majT/rIPqg3nkPoTvmOMBCnh75qXUa8HwA1d3d7YvPaPlXkTdWBzAlqUH70phTDnXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjV9PmSh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjV9PmSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E651F000C4;
	Fri, 16 Oct 2026 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166561;
	bh=uKQhhBN+09BhThx6/hsLUt2qCWZtIHA0NLqqjfQJmMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XjV9PmSh4aIZdyS2/uWJn7oH8kQdJSiFMUxbYJaAhvQGR9+vXOd4nWqNf+0Wb9kae
	 e3j7gtUgSEcvvKNzz3CYoZlOtI7d/DAGaE3sdrxT9uH4+oUMuJRNsVo9pB8Dmcbvly
	 okD2Djd4349VQo57cCwBfqAvssQDXHKh/H/GjF4uCrWrsrhJ3HdJcPf8PXsZdpbq1D
	 RE5VKKleQqPzQ6tN9Mg9en3wPVzyKtAc1fnj4CEH5VpQXx+UjRiZ2kokaeVvy53XH1
	 V6wf5q93AAlhJNBtirOuSnhTIaWgGOg/iijFZ8P4DzDLlLaAm6nQqTKcZ7gN9Q9AUS
	 FVvK/70xNKojw==
Message-ID: <sashiko-outbox-174594@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: usbtest: reject transfer lengths the allocator
 cannot serve
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016154707.13098-1-25031212351@stu.xidian.edu.cn>
References: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
 <20261016154707.13098-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:02:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: division by zero in simple_io() when length is 0
- [Medium] usb: usbtest: incomplete limit in iso_alloc_urb allows MAX_PAGE_=
ORDER bypass
--

commit 805535b4eccf7c27a2100576fca5ef6fb016a6bd
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

usb: usbtest: reject transfer lengths the allocator cannot serve

This commit restricts the length parameter of usbtest ioctls to ensure it
doesn't exceed KMALLOC_MAX_SIZE. It aims to fix warnings from the page
allocator when a large parameter length triggers allocations above
MAX_PAGE_ORDER.

> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index 8759df49be287..6a3394800fd86 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -2192,6 +2192,9 @@ usbtest_do_ioctl(struct usb_interface *intf, struct=
 usbtest_param_32 *param)
>  		return -EINVAL;
>  	if (param->sglen > MAX_SGLEN)
>  		return -EINVAL;
> +	/* Don't allow unreasonably large transfer-buffer allocations */
> +	if (param->length >=3D KMALLOC_MAX_SIZE)
> +		return -EINVAL;

[Severity: High]
Does this check also need to ensure param->length > 0?

If userspace provides param->length =3D=3D 0 and param->vary !=3D 0 for tes=
t cases
3 or 4, simple_alloc_urb() succeeds and returns an URB with
transfer_buffer_length =3D 0.

When simple_io() is called:

drivers/usb/misc/usbtest.c:simple_io() {
    ...
	int max =3D urb->transfer_buffer_length; /* max becomes 0 */
    ...
		if (vary) {
			int len =3D urb->transfer_buffer_length;

			len +=3D vary;
			len %=3D max;
    ...
}

Can this division by zero trigger a kernel panic?

[Severity: Medium]
Is this upper bound check sufficient for isochronous transfers in tests 15
and 16?

For these tests, test_queue() calls iso_alloc_urb() which allocates the URB
based on the number of packets:

drivers/usb/misc/usbtest.c:iso_alloc_urb() {
    ...
	maxp =3D usb_endpoint_maxp(desc);
    ...
	packets =3D DIV_ROUND_UP(bytes, maxp);
	urb =3D usb_alloc_urb(packets, GFP_KERNEL);
    ...
}

If a malicious or dummy USB device provides an isochronous endpoint with a
small maxp (e.g., 1), packets will equal param->length. usb_alloc_urb() will
then allocate memory sized for the URB and its packet descriptors:
sizeof(struct urb) + packets * sizeof(struct usb_iso_packet_descriptor).
This is roughly 192 + param->length * 16 bytes.

If param->length is just below KMALLOC_MAX_SIZE, the resulting allocation
size passed to kmalloc() will be roughly 16 times KMALLOC_MAX_SIZE. Does
this exceed MAX_PAGE_ORDER and trigger the exact same warning this patch
attempts to fix?

>  	/*
>  	 * Just a bunch of test cases that every HCD is expected to handle.
>  	 *

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016154707.1309=
8-1-25031212351@stu.xidian.edu.cn?part=3D1
