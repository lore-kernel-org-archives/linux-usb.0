Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274793;
	b=WmPKeruk30Osu7cTSe3kcBejpG4z4ZYO+PehvOP+s2Ad18k5mtJ579k9QhzpGsVS4Y6w
	 DewUM+rcs2ygtyoGBB6nappZoG/95SoECrRPuxwtqwNHcRB+12/PpnrsEJe5bn+Xi5m+e
	 GOy0jn6O477zxC7yMn1qyrDT5rgCb3L0JEgXrKfmjbVDt7jCBAmOw0iSU0PKrf1+DRvKY
	 0wKvt6WYIA5FlEr3yqms0eOiIbyfwzng8lvzp16uTHiW1Otvc5ZDdBhUahtOb8A6W3lN1
	 Eo+9YfMynVOCYq3O6RhT6btKp7JSXeKkfSvGhcC6uHMw3fVdoFL4tJBXBPp2wWj7v7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274793;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8qvqXTCVs6xGHZ5jbRi5a26h54Y9A6Xpjq2bFeZ/HMw=;
	b=HQHoDMZhEAOA7SwdzuXC/cPoyesPqaF8hXUMO1Ew41QwkD+jKaGRoxPkb+gW1TO2XsTQ
	 KUnr0E7Z5uuIV099+XOcafUKVZ/+4/Kf8aau9g7CjR2X7CDnuGQ6ytvI2NlClicutjm5G
	 dfnZ/Jx5ZpyK7aOd1mFBpdEFaIeneV18aDpsuPiRHhvqQ9kiYF8T7kDKE1iWahafnrUp8
	 9ay0YvVPMF9ok9dTbts0NLnwdcnvBCwfbZjrtlmpYXV9lpLitXQwW3taU22wJLZfsjyLS
	 +ErYROGGdsIwIN+sFCdS2Sb8qLFKExOl9K6H9x1xWzWHuzMQQwcHAOi0olN8bFKF4lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHL0s39B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4FF606A32C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHL0s39B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C417B1F031E3;
	Thu, 29 Oct 2026 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793274792;
	bh=8qvqXTCVs6xGHZ5jbRi5a26h54Y9A6Xpjq2bFeZ/HMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fHL0s39BdFPl+f8cCeVxBN9tJSALCH6AyfUCEvyoYMKnDPK+FnTmGuDg5lOgAegh4
	 xM6GWIQdTZNrJZDeRjAcSuPf7I9JahAzG4AqSs8r3vSRAE77w8Pg3Tx9sNgpyA1VUa
	 8PaQgv3PMnplWMuH5HkPlzNxGtj1E4r4rOlGWzXaZhGb04ghTcrgtZVTliLQsd84LN
	 1Slna+0S+6XcpVbX2MXFCA4rBfS98epSjSJ8C77MA1AV77bJ+VqnmzalqsGOc7ZtO5
	 7dK8t1TZVe+hEPRV8nArx8LelgqY2TdOvwfvpCWFuzH+SSTioPLEbKvUE8ZIyzBVSq
	 6Js0Lk5drhCnw==
Message-ID: <sashiko-outbox-189223@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: core: hcd: flush giveback work on stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Putko" <igorpetindev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029114733.2688-1-igorpetindev@gmail.com>
References: <20261024155614.2732-1-igorpetindev@gmail.com>
 <20261029114733.2688-1-igorpetindev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 11:53:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When an HCD is stopped/removed (either during module unload, driver
> unbind, or an error path in probe), pending URBs are unlinked and
> completed. However, for root hubs or HCDs with giveback done in BH
> context, the work function usb_giveback_urb_bh() may still be executing
> on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
> and wakes up waiters in usb_kill_urb().
>=20
> Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
> after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
> completing_ep or clearing the running flag) after the memory has been
> freed, triggering a slab-use-after-free write detected by KASAN.
>=20
> Ensure all giveback work has fully completed in usb_stop_hcd() by calling
> flush_work() on both high and low priority BHs before deallocating.
> Also remove the misleading comment in usb_remove_hcd() claiming
> flush_work() is unneeded, and document the queue emptiness in the
> usb_stop_hcd() kerneldoc.
>=20
> Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueu=
e")
> Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Da5b220cacb0618384d5a
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029114733.2688=
-1-igorpetindev@gmail.com?part=3D1

