Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263244;
	b=ddCbcfByS2DNBOTwCJtVhBGTUXuwEvFsOjopV5LagdxWDnNJ1RBPxLQIE5Km/tCjuuxt
	 WTDuQnKEt5obX6h3fZYYI5UUDc0y8dZnOCpxxRnqG1iHKuhsXCVtR2hmRNgK0NVlAGxs1
	 VvETWPePtC+Q2oN8S0LI1RRWdHT4NGWkLEnQkSvNzJc/fcXu7qhn8muLm8sDqccYIVqwQ
	 8emODJo4SdZk9yPEx6sTQf5RSkeW3Sx0sDCCWNgWr7x6qSKy4SNmxvEHS0BxfPC2CTG78
	 NGvWQaceTlWF0d2K55QImfEcA3yvRwqvFZEhhq63sXoM/4d/n2A1KfOvIugIrv3868g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263244;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mtAR5b7tdCwWoVmNePkOazmLOf6VmZSTkZ4HOeorcBc=;
	b=lO9Zjkw9S4rJyg8XQHrtH/wkP30Y7ISRH9iFGB7yFj3ypNbdyQtmeqsIwiRsuD/ggXlP
	 N4UvOvJmP04tLN6HaMzQVuuhA2e38R5yRoqE7q1P3J3GNhEXetsphzOvKGUefZ8UCIJET
	 GurlNHgOK8f6Kd6nmsNmVifxZdGoCHU+BuSwDeYcxZl4WVJXUOGeN8Pja0yj1+rvGPyZP
	 /CW+OwySPyB6nK6IiujW4RZ8jmzixKiZBhLRbCljRhUAEoZT4Z/ZIHqdroI+KbVdEM6NH
	 9U9+dbBtmw18sZpseFUJIMGHYlz8P9DLsZcgKUjnrTVyQqRRsZD6g+NpFy8TJHWuoBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKsPMHJo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB755606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 22:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKsPMHJo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B471F0089F;
	Mon,  9 Nov 2026 22:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263243;
	bh=mtAR5b7tdCwWoVmNePkOazmLOf6VmZSTkZ4HOeorcBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mKsPMHJoS3x9pVKKsgPSwcnliW0WUPfUKuD5y/kdnhUTPSJBMrNl+Th4EIN0IsL/7
	 Z5zSYLwqcyadtBuKp2xLenjqnk3Aa3+O/JWcG9ksiNJWQxE1bWB20I07aYZgZQKTqk
	 qzgj7wlLHYbaAphG8Pmijn25asnQIhGYesOIg1TxZWASTHJdxbEGpvewaiOi9i246R
	 6iSFUAjTbIZn3e9MWQ0ljjcKqXofFf4tP2y3jggYayfk0Xf2nPHzT53nkssepLcngU
	 5sXRjaHQcWeyhzQkC/EjZdTLvQimxUk2fdrPpEPqdCPFYmh8t3pzV1tOxzAkxm4urI
	 cTYF4lQYbscsA==
Message-ID: <sashiko-outbox-205726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: bound NDP length against the NTB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Noah Weinberger" <NoahWeinberger2003@proton.me>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <VFFcAz18YOCdAGLJxQp8TZxPPL6-T5bPEHLSdIkdyWPj4Rr7dRgBoUrlYHMc_CYxsZXLbk2_xPPKx8uMzHzck8QUAC84Q2ZlluLo7JG-Ry8=@proton.me>
References: <VFFcAz18YOCdAGLJxQp8TZxPPL6-T5bPEHLSdIkdyWPj4Rr7dRgBoUrlYHMc_CYxsZXLbk2_xPPKx8uMzHzck8QUAC84Q2ZlluLo7JG-Ry8=@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:27:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] usb: gadget: f_ncm: missing Fixes trailer for ncm_unwrap_ntb()
  bounds fix
- [Low] usb: gadget: f_ncm: missing Signed-off-by and raw report text in
  changelog
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] usb: gadget: f_ncm: infinite loop in ncm_unwrap_ntb() [1]
--

commit 11f0a9e46d1b84c8d72b0c4bd312240ac8168fb4
Author: Noah Weinberger <NoahWeinberger2003@proton.me>

> usb: gadget: f_ncm: bound NDP length against the NTB
>
> Hello,
>
> ncm_unwrap_ntb() validates the NDP wLength only for a minimum size and
> alignment; the sum ndp_index + ndp_len is never checked against
> block_len. The NDP *start* is bounded, but the datagram-pointer-entry
> walk then advances through up to wLength/8 entries regardless of where
> the block ends.
>
> A hostile USB host can send an NTB whose NDP claims wLength close to
> 64K while the block is 16K: the walk reads 2-4 byte entries past the end
> of the RX skb, continuing as long as the out-of-bounds-derived values
> happen to pass the per-datagram validation (index/length checks). The
> practical overread distance depends on adjacent heap contents, but KASAN
> flags the first OOB access. The bytes are not returned to the host, so
> this is an out-of-bounds read/DoS rather than a disclosure channel.
>
> Bound the NDP length against the remaining block, mirroring the
> existing minimum-size check.
>
> Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670b=
d (v7.4-rc1, 2026-11-07), drivers/usb/gadget/function/f_ncm.c:1254-1346 (nc=
m_unwrap_ntb NDP walk).
> Longstanding code.
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
This fixes an out-of-bounds read in ncm_unwrap_ntb().  Should it include a
Fixes: tag, such as:

  Fixes: 9f6ce4240a2b ("usb: gadget: f_ncm.c added")

[Severity: Low]
This commit is missing a Signed-off-by: trailer required by the Developer's
Certificate of Origin, and the changelog still contains the conversational
salutation ("Hello,"), report metadata, and untested-patch disclaimer that
do not belong in git history.

> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index ab6da3ef87836..3cc90fc02e270 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1267,7 +1267,8 @@ static int ncm_unwrap_ntb(struct gether *port,
>  		 */
>  		if ((ndp_len < opts->ndp_size
>  				+ 2 * 2 * (opts->dgram_item_len * 2)) ||
> -				(ndp_len % opts->ndplen_align !=3D 0)) {
> +				(ndp_len % opts->ndplen_align !=3D 0) ||
> +					(ndp_index + ndp_len > block_len)) {
>  			INFO(port->func.config->cdev, "Bad NDP length: %#X\n",
>  			     ndp_len);
>  			goto err;

[Severity: Critical]
This problem wasn't introduced by this patch, but can a crafted NTB trigger
an infinite loop in ncm_unwrap_ntb() [1]?

Right below this check, the outer NDP loop updates ndp_index from the packet
without checking that the next NDP offset strictly advances:

drivers/usb/gadget/function/f_ncm.c:ncm_unwrap_ntb() {
	do {
		...
		/* Check for another NDP (d)wNextNdpIndex */
		ndp_index =3D get_ncm(&tmp, opts->next_ndp_index);
		...
	} while (ndp_index);
}

A hostile USB host can supply an NDP whose next_ndp_index points back to
itself or forms a cycle within block_len.  The loop then spins forever in
softirq context while repeatedly allocating and queueing skbs via
netdev_alloc_skb_ip_align() until atomic memory is exhausted.

[1] https://sashiko.dev/#/bug/linux-7e5803c6-1df0-4e59-9dcc-28f332907cc2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/VFFcAz18YOCdAGLJxQp=
8TZxPPL6-T5bPEHLSdIkdyWPj4Rr7dRgBoUrlYHMc_CYxsZXLbk2_xPPKx8uMzHzck8QUAC84Q2=
ZlluLo7JG-Ry8=3D@proton.me?part=3D1
