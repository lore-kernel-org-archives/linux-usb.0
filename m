Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414475;
	b=xYzaWwiSojQVBafTSsrSjtbvZSttXnVg7WgC34xjkZMSJeJE5ayeqLKLSPit2fgVvLfa
	 sgMr8KVtXsXUNur0w7GY/NB8hjcZZale2NdBhYEbGAho2LmYHxPtJDKuZNkhrkMyOCQeq
	 jtgrL2dwVYsNQih/9w529wX1XaM9dHOJVKTKldqZjpB6bxVATzIEdpXY8wXUjLa1lNesN
	 HouHIvBdrx83pkeQqteoN/HUbUblCWTHgRKEn8/okv7wbA8fEYVzaWCyKN8KhlP2na7PS
	 tTsQ8TmpOfTBnqGy3+2Lnf2TB3M+yep+hAXzn8lx+OrkjeWk+YBAcDaF6EgVuD74gQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414475;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lu1YSvBvwVRle8y1Zi+EHZxgZgXoCEE7GmuiaLL6YAw=;
	b=Qb26vYdxVbr68pA/lbRAsp5CksnQDG60wjPo3OBpWiVEPb8sipXZL0WAhtyS1lihJXjt
	 ycW8QW+uEf757n3o9fWTANqNeDtx/iFmL4nQuLJhX4dqUs4MOQJWp1AXcxfXXdpDQfUFR
	 64OlTg1YxqPzVd0fgzABbzWme26w5LvyT+xGc2lFCZiFw2BajtRi5QgrMMvD3QzCNKuQk
	 Ln2MfQG9klGOl8el3iAPqTpD2Ef2jIzl+5lW3bRhF0SGcBsX21PFI+jFlR/pcH5QMIBJA
	 Q0zAqJhtvmj2BhsnrjW2nlAEdCxP/08LESn7v0tuT5GCXEKuXzUaaWZlrJD+xdeV3XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVMqmRWj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69C606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVMqmRWj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7251F00A05;
	Wed, 11 Nov 2026 16:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794414474;
	bh=Lu1YSvBvwVRle8y1Zi+EHZxgZgXoCEE7GmuiaLL6YAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVMqmRWjWo2tUowQ8pTVOQmKeuGxHc6m/ESPiCl/g8zMwakM7R8B8nvH6HhKKoGOJ
	 shoGNQ/XgiV2Ruq7f6BLfWNFzDnrlnriaIi2mwsRq+jnF50VMjGRJYJf3tsXl7oeuO
	 OEVHSXdVUPyrnjZXQFwuHphSl1CNIdW0LYrXfYf7OQs3H1L6I6c2RHcv1chHXKfErt
	 hnDX1ldaHjx4VyaprkDk/StblYKKvDI2p2INO03ZzPBOQ6pSNqqALU7FJzz2qBIcoo
	 g3fMb1dmDRf++HOuj9kua0wu1euB39J7CTJKy8kUnTQbcJkVgIdwDnqfNkBYlKTES5
	 JBZ7bepq4Y0xA==
Message-ID: <sashiko-outbox-209283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: Check the alternate mode ID allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changyul Lee" <lcy8047@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111154503.3621477-1-lcy8047@gmail.com>
References: <20261111154503.3621477-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:27:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> typec_register_altmode() stores the return value of altmode_id_get()
> in an unsigned int without checking it. When ida_alloc() fails, the
> error code becomes the ID, and the alternate mode is registered under
> a name such as "port0-partner.4294967284". A second failure on the same
> partner then fails with a duplicate name:
>=20
>   [    0.423055] sysfs: cannot create duplicate filename '/devices/platfo=
rm/altfail/typec/port0/port0-partner/port0-partner.4294967284'
>=20
> Return the error when the ID allocation fails.
>=20
> Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111154503.3621=
477-1-lcy8047@gmail.com?part=3D1

