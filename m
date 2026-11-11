Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401136;
	b=PWkf6LRxfpH+hvAZ7XsRne2FBDLG0rvLtQRPAGxdFHKgFPpJ382AhFVYc4NvuGApvd0a
	 ozRaj0NlRu7VtsSx2OMZWn6a4xgPyyPPzGQtRPs+ytWI3ft9tGGfQf9mLFY/D99L9jcZr
	 U/lLz/1ot+wYBYBY/GmfpFZ9krk17TPXQGGRTWRBV5ZGNZKLdPXkgxDa5lnh4paTQJQj4
	 tx12p8W/lGm9wclSpHSsRPATsGIM6oCgc61JcoRyMOihIK/V8Y3vixlUdyEm/bIiPCe6m
	 qa5Ne7eNC+UkcSMZipq8sFH6FNwc1nLrzA8qv+cN57AzIk0SEYXqH8UqUABy9MVs1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401136;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H1QosTLC7Cgri10wDiXhypz0uoU+9IovgXsa1YNi68A=;
	b=HYcEeZDkdzogWeBKjggyc98H/7AhX8gShdLkiROxir/MiHGjn74M5ChvD8xYWFV4Zj01
	 L+masXpd4Ipx4wrgef893V4iGUNgmL75lJA0ti7a7YODQN0bdZ2Y3ov8kn9z0Cv6pQMY5
	 XW85FozbRfyzlBB8szT9nLpo/TUkSmRjPCd82sirrKRwTtcAbbQtWilg34BzsumqUnGMz
	 HPK1ZMnqgquY1udU4lHYDeGf2tKcxz021QNqBc2jBaQaQIrghU63YAd7fDQskt7UqVNv6
	 D2rrcWp6+sP4ZBsB/XQ4HZ1FeBniDaPXiYKTVG5uQGBZ3HtiojiCSJT3kuFG8rlUMXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buBa7+2K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D610606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buBa7+2K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A6B1F00A05;
	Wed, 11 Nov 2026 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401135;
	bh=H1QosTLC7Cgri10wDiXhypz0uoU+9IovgXsa1YNi68A=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=buBa7+2KHApALeWkAFTG9swdRxQsRvKNdaAfnUxf0wVv6scMBhHrf8YRnWuwvItMS
	 RIdYwBpz8RIk5kyZFzWJnr9tvcUeTZLx2wsSYLjHXIpxwoLT+GZnSiFpqL6GC/oQFb
	 tZ+xW3WK2aiKqocs6X5NDFOHa6VQreXXxDTugdbEXel0a6nN7Na5AGdCZXoE3Ty/Pt
	 iNVil8pEMXdNWZErFNGT3trx8fpp4Z6RQGGhAyrXRbiJCi+sjiJcsSSgctlnH8O5qC
	 CY/gHMVvV6SIU+X+oVlokQJsdJO7NiLiLdGHy35AjZtXg/wfcVKAJdr1d18MaWDz+M
	 9PLz5f51G6XTg==
Message-ID: <sashiko-outbox-209006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thunderbolt: Return -ETIMEDOUT if XDomain peer
 returns ERROR_NOT_READY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261111123248.1312997-2-mika.westerberg@linux.intel.com>
References: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
 <20261111123248.1312997-2-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:45:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The XDomain protocol retries the message when it gets -EAGAIN from the
> handler. However, this also happens if the remote peer replies with
> ERROR_NOT_READY as tb_xdp_handle_error() also returns -EAGAIN. This can
> lead to infinite retry loop. Fix this by returning -ETIMEDOUT in that
> case.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 8e1de7042596 ("thunderbolt: Add support for XDomain lane bonding")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111123248.1312=
997-1-mika.westerberg@linux.intel.com?part=3D2

