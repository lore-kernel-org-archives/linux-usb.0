Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680173;
	b=cJB8Qb5Ovac7epcOIH8WyGNcY4qFBOg0GX+bSwZUvliBz/psxMIE9iQQy5fJB2A8cqD/
	 L8gxDv91/rIyRklUvvTqFNnY5v+KH4L3cqATx74CP/qRHQK91MY5hhIDx4UzVbGFDxzcg
	 vK46UBh3ROEZy/8/1+zHRBWIOP4qtc1x05la/gvb6ACkf141ZxUI5Y7CwIbbz7Q0Xj74W
	 ZUSRU/sv578K/R1lhBaIuhQXhmsrPVjTWq9Xizcrny97HUR+lndMeLsn/XBOZ/4kr+gJh
	 yPLCi0q+5PFcsmS36CSJPuVBREykps/ZCaV55PV1D2Vo3ZY6ewm9SZi6RJf1qaH6GaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mNczNHVyxV9cdewv1HI4NidKQ4Ei13+bl7j/5fO+sl0=;
	b=Ur0dH/rMVyFDbzoB8Xk+x1zQ3JE+MjQ/c68aJVQYGggFwARyTiRq9cMBNnSWD/RHZXIg
	 /J00e2skMMlGpKjCK2uII/xZjHQ7GpB00hA99izdBqrB2yuUjBc43loN6z0Ov1pW4/TkZ
	 8zWUsCYTItcDJuUCkGMO1C0ea8pOEkkTspLflFAW4alUQJB0JGaOpNrgera4+OJfBRTqO
	 6qibGP8Njlpt3rHjS4cAN+d8DZdJMMP0jUXx9o4xPQ3sWXJcgrjwkENnJdbbjxFdd/7qF
	 Ov6TxYg5MEAJlZu+TdLrKK6qrDJdaiIcYyTyt2dBZjs8kNYjdkTYON2G6TrAclWOUqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoRCqUHw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CAF606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoRCqUHw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722811F000C6;
	Thu, 26 Nov 2026 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795680172;
	bh=mNczNHVyxV9cdewv1HI4NidKQ4Ei13+bl7j/5fO+sl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WoRCqUHwTUITucxhkL8tubGPmJEjj4YP4egk3LJLQ+ezbdVCeE0QcIglaqchgAgJT
	 i+huMpMkxs0VVptCGPgQLi2k5Ay+0sWBejBricFUG4gVfZCVoWQCvwluoXKvyt4yVs
	 HtVGXOjvU1xlyHz1plPjoJ4wHePp9ivd4JmUF238qaGU3/UIBq0kPw/l70r1tSBUnC
	 jn94YbkEBx/QMvXiOK7MTm3+akOB7MtxkoFLwRAMIO9aYg9qXEKggW+j8+CN8Rnq4a
	 qn3EtM1umI6b0A/4vSpCpr1w4iEP1cvdFeGYgOAHE4vVzREpqw4eSDcfsAQJ2Ut9xO
	 nDjp3o7o1esfw==
Message-ID: <sashiko-outbox-234983@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 0/6] usb: gadget: gadgetfs: fix ep0 request lifetime
 and control races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-gadgetfs-ep0-v9-0-81b464c6e641@gmail.com>
References: <20261126-gadgetfs-ep0-v9-0-81b464c6e641@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:02:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 6-patch series:

- Patches 1-3, 5, and 6: no issues found.
- Patch 4 ("usb: gadget: gadgetfs: NAK new setups until control-..."): 2
  potential issues (2 High)

A detailed review has been sent as a separate reply to patch 4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-gadgetfs-e=
p0-v9-0-81b464c6e641@gmail.com
