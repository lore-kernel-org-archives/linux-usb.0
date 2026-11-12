Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520930;
	b=YMuhm5xrXu/cYNnx5SBazm1bPwXEVFoAIg+HMj+brgHdoM0ENS7KUdrfiw+54BBNRQRB
	 7AiZChFq+9MSywPSjaWrF9ckMiuKL/YDjOBGDyVqahz3ToUkyYyurjFR198Auov5rp3Hq
	 YG7PwVhJO74AakW8CQdY2SIH0TEVrB8CsL232IfSPyYG6FlD4NtBi49NNjyPLgq95Ap6z
	 djbp8tj9taczwOeXhQ4tW308Uqyz3ZjjISa6BZ3Xbg4/1KHzcLmUk9bbfK/Tq05jY7SpD
	 lFV4aqGIJYTF96Y7/+xoZNV3Vmyys/hGDC0Y6L+bX7H/XfMqTLvzAwZZhfNbO02s2cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520930;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UCZZYRZa3eBBQrlrpS3TZ7M8JACE/7flIAnDRwh+uJk=;
	b=Mbg0PEY/s+gBVbTyJsedH59q29Vqgh69t94Rf9SFlo7RE1FmHpsJOzxldC6MxT9o6hSV
	 Ju0J+ip+VtW504YYudqbJVO9XebYxhkbKPOgMR7/mCl3Hl6eW4ggnOoiwWilw2QPxO3on
	 UM3zGJHwpCZq6eHHehTT1MCBOzFTFV0AuyH68bo9olAEuvBJJOQPQp7iaKlTOQNylJC3+
	 8ybSl0kx/xvnZBlX+GDXs5WjkGeW0HEYBlWanj8ZZv6IFwAXWC1v759Gxv/0K5PH/TrVf
	 CGRhgfC/QaDyb96yf+FObgkmYKT54NU9OGDL6K512Fs4raZl+ZNetAzGqwx9n1yfOyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFf+4Rdk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A4606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFf+4Rdk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC3B1F000C4;
	Thu, 12 Nov 2026 22:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794520929;
	bh=UCZZYRZa3eBBQrlrpS3TZ7M8JACE/7flIAnDRwh+uJk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=LFf+4RdkDsCVBp6FYtdd2vcs73h824Q9hXzBuzmp0cSHs24mkeEiEbwzjYgtk4vLK
	 nQcnNFkQW8sr8OEz6U1ZB20uEoANdlvCb2YJT5CDn/1/ELWq6WmC+1P7OQMb4Eqm0U
	 u6TI5/3GnQ08RIvaClbpNOCT3MN3BmLFUB0wpFtxjB12G1pCr3gzKpZiYPfYvnPPg8
	 sh6+saKGjOs2bfUZDpzGUIo2lk3berFpWbEs+4d4C58ExgD/jfWRT95h5e7olofhjC
	 5GJxM5aDmMnr1a0TpETLYGSMV/ikEg2uCuuzcJSH9sRYcMbyJZlPz2v2mg4N04CWxg
	 zvfO8rN4Qjuag==
Message-ID: <sashiko-outbox-211883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thunderbolt: Flush the ring interrupt status clear
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Neuhaus" <sven-kernel@sven.de>, linux-usb@vger.kernel.org
In-Reply-To: <1794520303-5758-3-git-send-email-sven-kernel@sven.de>
References: <1794520303-5758-1-git-send-email-sven-kernel@sven.de>
 <1794520303-5758-3-git-send-email-sven-kernel@sven.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 22:02:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On hosts without QUIRK_AUTO_CLEAR_INT, ring_msix() clears the ring's
> bit in REG_RING_INT_CLEAR before it schedules ring_work(). This is a
> posted write and nothing is read from the NHI afterwards, so the clear
> can take effect after the next frame on the ring has completed. It
> then clears the status of that frame as well. The descriptor stays
> completed and the interrupt stays enabled, but no MSI-X is raised, and
> the frame waits until another interrupt on the ring runs ring_work().
>=20
> Before commit 468c49f44759 ("thunderbolt: Disable interrupt auto clear
> for rings") the status was cleared by reading REG_RING_NOTIFY_BASE,
> and a read is not posted.
>=20
> Read back REG_RING_INTERRUPT_BASE after the write, so the clear has
> taken effect before ring_work() looks at the descriptors. A frame that
> completed before that point is seen by ring_work(), and a later one
> [ ... ]
>=20
> Fixes: 468c49f44759 ("thunderbolt: Disable interrupt auto clear for rings=
")
> Cc: stable@vger.kernel.org
> Cc: Mario Limonciello <superm1@kernel.org>
> Signed-off-by: Sven Neuhaus <sven-kernel@sven.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1794520303-5758-1-g=
it-send-email-sven-kernel@sven.de?part=3D2

