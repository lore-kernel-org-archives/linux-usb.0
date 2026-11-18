Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987139;
	b=u/AQJRdu5vc7rX4f3vsyaFeAPBUuybLrE/1x6jyMj6qBM8dPRVs+LjXJ2C9QiBBt/HfO
	 clDTjINUTbvpqRfDr4sfEgB4jQTeJG8nEmgj4gjXKrhfOxmJEdX9k+HVRqKOBM2PpQ7ic
	 UmRUXE67g5jLFy3mlKodxGt7u0UFVL+aP1S66xYfn4pIOuXQ9EmQpRaIHVi02F60uu0mt
	 FNSGxHzYlKqF/YzmZjK+n14dLyAZRla6cDGFBBN/cNIp8q8CcSu8r+ox1o9CC/ZOthf5C
	 IjmKka23uLUfNp5lTnBi+Cd5nj1YiTPqRgdmIbZXt/Dd+ehJmUR3vcL2MrDAxgNpIDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eUPwvh/wrkUq0cE4smHBa+13xIMtlBaO42g+jL70iwY=;
	b=0r++I/96IxyDfXo3+YUHizsCx6ULqzdImG9HXS4p8U7i1mL+mIr1XKZN1f06JKXMw8FJ
	 XQ26Iwgb6+lW3t4FRsUr4t59hEy7ViIJiSar3lnODobFjc4nOm8A6FnBJWKWGwWcLfuGl
	 T316JPz0hv4CltXsMGkedR4KDiZQGfTWDrVHwQR26TdQ2M5tT5sJLpK9puV/fRE7d74Du
	 LZPyCAvEQ7NkMZ7o2vEGOTmqzkDvzq8ld+FG6maA0sNSaYxn/QjY6wGLy1e/hYeP6+Ga1
	 ydxz8UyUDGbQS9uLGQUOf5TnCoT0Qe7HYTI9q0fqqATP26MqP+bfEAddhgjbHKvVQWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixDM0xCV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC498606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixDM0xCV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578511F000C4;
	Wed, 18 Nov 2026 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987139;
	bh=eUPwvh/wrkUq0cE4smHBa+13xIMtlBaO42g+jL70iwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ixDM0xCV8uksoIMIbbJ1hoirrWweK3e2JSyi8j0mulatlkZQHbUA5WyBg4nFAzm3e
	 i8YeIhQD7j0Rim/WNuP5KGUHfdMFXxrs4UzhpXys2eDOM2Vt6U1Job1G0HD1fDGGiZ
	 Vuop+IOxwxcia9/M2dvaSEXwSEujsPhJWoPU1NAvoBCAesG1f7Q7AWOaNPYCdxbj8c
	 4/IV09K/1diMvmgcgAsu++fLi0//dy1kB6WYoZMTBaRY30wFCIPHH5LC1Wvq37giIN
	 oWUh6wVbNg/w1RCaRZUxqc4NbFKztofYu3wDs44f/6ORO4eEqfHUQe7mS4GVYRk/gl
	 nb451nxsUVaLw==
Message-ID: <sashiko-outbox-220310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] usb: typec: tcpm: Keep the Soft_Reset target
 apart from the VDM one
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-1-b6decdc95e66@flipper.net>
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
 <20261118-tcpm-soft-reset-sop-v2-1-b6decdc95e66@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 07:32:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> tx_sop_type holds the SOP* of the VDM being sent, for its retries, and
> SOFT_RESET_SEND also reads it to tell a Soft_Reset for the cable plug,
> after a VCONN Swap, from one for the port partner. Nothing sets it back
> after a VDM, so once a VDM has gone to the cable plug, such as Discover
> Identity on SOP' before the first contract, every Soft_Reset meant for
> the port partner goes to the cable plug instead. The cable plug accepts
> it and the port goes back to its ready state, but the port partner never
> sees the Soft_Reset: a source whose Source_Capabilities got Not_Supported
> is then left without a contract. The VCONN Swap, in turn, overwrites the
> SOP* of a VDM that may still be pending. This left a FUSB302B-based
> source without a contract until it was unplugged, after its partner
> missed a message following Discover Identity to an e-marked cable.
>=20
> Keep one target per context: vdm_sop_type for the VDM and its retries,
> and soft_reset_sop_type for the next Soft_Reset. Point the latter at the
> cable plug only for the VCONN Swap, only once, and back at SOP whenever
> the protocol layer starts over or a Soft_Reset of the port partner
> starts, along with the SOP' MessageID counters.
>=20
> Fixes: 6bd181ba60e1 ("usb: typec: tcpm: add control message support to so=
p'")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-tcpm-soft-=
reset-sop-v2-0-b6decdc95e66@flipper.net?part=3D1

