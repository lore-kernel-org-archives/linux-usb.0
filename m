Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109641;
	b=U0rkxlxSJ4Z/8CKAW1Gq8oBBP5LngqyuQDgYsVn++tMbE0b6lS8bHwvuKTr+RVbGzQy7
	 JYM4VVTuqWjFAy8pQTKUYsY+wiqD12In9L+cHjeQG9Jl28d2OkuyJBJ9ZSliEDpavgjoR
	 zLQd1fmtu1QPxrT2/LtvEryQXCYRc3VdzmX+b9k02Ue4/VSvXgFEesGSCg2AKlRfnU3ly
	 tTQGfJK7Wp4Rmhi6yMI/uZb3PwJF2OZwpaoRdsB1iwPfl9lbGAwE7C+dX77FkgSR57bDG
	 lexEnBijUB5kzq9+MYE4tLb8fnTftWgWpYEk9virJfYQNmJAMyv3QTdYZSX38KEBmtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109641;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MPovobWVbqKLyycE+2PJZBh4JcIhcv34pjNtyGG1eSI=;
	b=aI47iW0MxrcRmaIm+kSp5srLd73fsdc5TtCJlqgvCXcOf4si4zhxMM5nLYSnX1mSBK0n
	 l4c9cmMXCm5WL2ZAXE4P29TUAPVz6n+1Vv4k/5bDfyz0a0xMfKWRedtOPRCmUKzuloTGs
	 9PreYy7VaYltfsVOGSsd79LzvkfddK7O8xcFOs6S1VNRxPVhEAwiaBuFThJ8OW92/OT0t
	 yOx5DuQw3YQk/Ywhy5C9xIRWNp79KXT010XXmTgAAtr6bjUKQd1vG1YdnFYv/tB17R46N
	 Rex8w7R+5BbCjyCOBHcE+hg6ClQtvakEPusTTlHjUpeFeXIiLFD/GMymA2nKU8wal/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W/Gx+hIT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9E606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/Gx+hIT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E581F000C5;
	Thu, 19 Nov 2026 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109640;
	bh=MPovobWVbqKLyycE+2PJZBh4JcIhcv34pjNtyGG1eSI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=W/Gx+hITwnmDc0HJddqa4JP458PQS1/VVWvM42Yo2eMqfF8jfBgZ4KtNXskpusd4R
	 ZCe4vdnhTv+er38YZpFq6y44BEXWxJ52qulJxwrEsOOEvmnvd+QFIvWNkAaD6MLrW7
	 ObmWYZ8uwQIzpuveWqQ6XNtMPlvoFz4lyJUuZ52sL371J9vm+CwFYD0cdRsT08za2Y
	 pYFhf8DWIv7hu5P0dA+fcdiGJKxFWubxVtCXNMES2GK0gLf8IM2pEqRHtWowNawxIy
	 Lezsxz6wZu/EmIxYZ0w50OmopHP32cD55n/nAyW5hQvXC9y/XY3en4bkF07kB0FYvO
	 CForr5a5I+VMw==
Message-ID: <sashiko-outbox-223702@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/18] thunderbolt: Always take domain lock when
 tb_tunnel_put() is called
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-14-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-14-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:34:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> When tb_tunnel_put() is called with last reference it will call
> tb_tunnel_destroy() to release the memory. In addition to this it also
> touches adapter states (releasing the HopIDs and dma_credits). All other
> users do this under the domain lock except tb_dp_dprx_work() which drops
> the reference without it. Fix that here.
>=20
> We can drop tb_tunnel_lock too because all the existing users have a
> valid reference already when they call kref_get()/put().
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D13

