Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446271;
	b=Zhy/SbzAhECUinrm/g/S2DjGgc6MpZErINmpqfBPm5Va5AghVhmu95C8SrJrdnkfRxbs
	 9jAaN1EZcvasiWBkr1nY9F6Ajs+/poTTDFfQ0Mqdc6HIByhbdsgsMt5PnP2hvILgTRh+A
	 3K2N8xYnZFh+txQNwcj7gzxUZutwEhUz5A9FxMd/jDBQZzqUDZzhyJMXwGEudsdwFGRj4
	 qtn39ZiWQ5bFkwDedxBDpLBhHPrhmqnuTypBeEZbsO+H0dszv8mlnjj8egtbx+avdF0WH
	 equYlwQWBcagIyACRnpcCKgqweTRx4sSIpdk5dUnH9euL4ozGqMj95NR8lp1RrL/i1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EkYe6GYsVr+nc0PfgdaYq59SSSWmebCKvabi8xlZtG8=;
	b=kzVPuTY7pbqrHKLPvDkccChw3Q2hq/bvFzMsKMOVXpGlXtXfAgABoC9lUbG9p5kzXubE
	 FEliPHHF2h95CLZJ5ug/KdFsYW7w37G7UqW70Pb49KlvcJQrGTeH2v+5gWE0uEGza6hhZ
	 CCovKkN1bgGjJRgavHGem41BFDhdUNwP4qoklp2p71WIJHt5u89Ptut2rZnErFuN5jO5z
	 phfk9L6aBvrZA5V20GUg+bD0XFYS914XCGKZBGhKTVJlV9AJTQoJK5rj6MnvHnxxp5wym
	 HsmC5vF/4eCqCrXCMA/rV1zYhQpctGqeIz6/0keBdmWT76956jKinmuUCbZFocpwuHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfm9fb9W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880DA606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 01:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfm9fb9W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D9B1F00A05;
	Thu, 12 Nov 2026 01:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794446271;
	bh=EkYe6GYsVr+nc0PfgdaYq59SSSWmebCKvabi8xlZtG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jfm9fb9WLTQh76CElr5TPs8/7WrEB22PHprGtQ8k9g3imf+0MU0CgdkRzT+ljg3uo
	 neEWEbcuuQAyJVYnklDfvKTHsUAy1IhjUnu6+ZS0xafG9MnK43mz9t30oxWkfOO25h
	 g9SAOjvy4fdAF8JWVPTACfMo/K1L+og/Uu8R+mNHkzf3WC0eAc3xazsvULdRwqJYhR
	 0tz8ExoPpQM5vf4yofRx39rEc9GwQwGIT10Mj902lB3gTQ3Bjaq9a9iaeSh/SxOnDh
	 zeMbf5rLoNNTnQUlZGdEx2w51wN4mbyuryVebYKhjgJQuADlVdxJdLKPnitxbuLA2i
	 j62kaBy/S8DhA==
Message-ID: <sashiko-outbox-210055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] usb: gadget: f_hid: fix get_req leak when
 usb_gstrings_attach() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112010928.23716-5-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-5-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 01:17:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In hidg_bind(), hidg->get_req is allocated early; if
> usb_gstrings_attach() subsequently fails, the function returns
> directly without freeing the request, leaking it.  Unwind through
> the fail path instead.
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112010928.2371=
6-1-shishunbo@cmss.chinamobile.com?part=3D4

