Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653165;
	b=Z1IlNcl1oa0yHTcxIU7dsKbWJoAYx5mojcWM9rBSCWbmGuPLytZIeHPW+cWsYcsjcbOo
	 nJ+vFBGmJ1/iJHaUodqSBXeO/9EY4I7yLi183BUd0WX0Kqo7DEs+U8N9NJYgnTxZ0jVmi
	 HkKM4/X4aKvhEkHjxLKzz9qbl4zbTTNpSv5fOgl2xeCcrurdk5Y515YQN9YbMVUVwYuG5
	 bAxorasAEtjaz/ZVMVHPEHTOw5VuI0x7mLQgYRBM2iz/BeLXWP+urIp5O64F3qzJGDmlz
	 0pngJHlMTU+1t5nlMnAtlikECMsL8NX6Ez1w1UzXUnuPi7GGinPzNN9ZYY2S6y6aOPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653165;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mrLSzxN4q7tLcV1UWhB/u0DzeZWi/9DTbRtDxFUVM84=;
	b=sEWzzSnbaBZ6TsolpEJj7ulcb7EG0ZwE3SUd1+hihppsGNgM0WlZXkFavSca5R9kxQhx
	 ZSTehyV8RYfyany+0Sw0Cqp8Rd4UDfpoiQ5BqH9SrHgqqjQJn0tmy+pDAM539dxs/sWkh
	 12+2NxyMQ8zoeBJ+uCM6S8N+19ajjubTzI7iQIyu4/cL4X1FrRpMPRT1CQzqzsmahavdP
	 vQn0mihvxXHYtJ6wiPrLNpnud/EkN3FG3J2D/Q/vIGtH87qhRqn3+ogr0Vfsb/d7jgVOT
	 HvPGqYqCWL4meb58i8L3H+54cbNal3yzrIQ+mIy1bnjxY4FJnmK3KGWVWJgk4T+ONng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J7VaHy/R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E1606A326
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J7VaHy/R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63CA1F000C1;
	Thu, 22 Oct 2026 07:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792653165;
	bh=mrLSzxN4q7tLcV1UWhB/u0DzeZWi/9DTbRtDxFUVM84=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=J7VaHy/RWwVQTrip1BfYE6Ul7hecfwgxj46f2Sw7Jve4HllYK6Gj0hgMIkJY4LStV
	 yfwoQNGJd0N73WcLznDhpa78oytTUlF/OeH5xjyxssCWbQ/KCenfwXj/fMIh5v6rPi
	 NuM22L3eqAxuNQ8Y72Cewks5Tv8FcDtZvRIhAaiLAU3vyY/ohZ7bjG0EeqtS0vJhMg
	 HPc91MPcaa/n9QgW30/BGTrIdnl2DCob62gXI2YphiNxO2Jx+4LefOXW0Rm+SxMU3B
	 D7ZlWw/8QOt5cwewLv0beA2qM7lJWZnxVx2BfaYIO8tvaPNu9RoDUu76I1hPJpv6CO
	 +uSHQ7LZJA2EQ==
Message-ID: <sashiko-outbox-181116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 5/6] Input: tablet - use usb_make_subpath()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shihuang Liu" <shlomojune6@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261022070929.20820-6-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-6-shlomojune6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:12:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The acecad, aiptek, hanwang, kbtab and pegasus_notetaker drivers build
> their input device physical paths by appending "/input0" with strlcat()
> after usb_make_path().
>=20
> In preparation for removing the deprecated strlcat() API [1], replace
> each pair of calls with usb_make_subpath(). The helper formats the USB
> path and the "input0" subpath in one call, avoiding a separate buffer
> scan and append operation.
>=20
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022070929.2082=
0-1-shlomojune6@gmail.com?part=3D5

