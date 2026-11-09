Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204837;
	b=H0syTa8E1v18e48YYnXH10uRs3kF1NOPXcetWpOy0Dp7urhqnsMhflDl1mOK/QDs8ieC
	 Rwtew/4aogmekDlf2S1ER9BJzwC5dbEWlrjk+Gr949Tfy8J7KaF7fnV5xBAp6rDJ/dgoS
	 82q158wAdbpIAmmXDreXiw8zPI4suHwuSmXjvhfkY98diIrPPHiiW8qXH8JZKPXvwNdOw
	 8dapjUDqvYC9fVmw9DTfeAN0NyeL1efVghlR8XRBgMwcStxN3kJx2VUXxajQi6otqUCvu
	 C0WJjFV6/DwpaonQfW5gT2dmeEFcp9NdqfUEjJvXVafpF+L7n6OOO0tQtSbmaL8y4yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yFMO8XjutCmuO5fNp8bQmbCSpbru3mQfeMalS3sumsg=;
	b=Gi2CLUkAp+gR9fE1a5PZ0FM5YWVWtoehhSOvHVB+97R9cr0HXxq3VYtM1oUv7Rj7T5xH
	 lTLT0A3ihFEdJMjhmL0hk7JLF5sALdGpfvWO36LxcHj73Lr9Ki73NyWaNycnLC5AzKTOR
	 vsUdsLFZkYqfoYMteiFh+gi1efzO5YHGZmqaKr49jnIPMwRVvNH/Q/nYndcjtPFdzUDr3
	 up8Plnm5mo0rKBf2kJi4++buexzsccnutKQvLb0xk2HXE+2vBJYcACMWjZxfHMbZKNdYM
	 m4iWCu7+eGhxPXCZkywfUJrV3qf0bqG4jwGyt1hcWQCtmI3yLFShDrLNiPmjKhxlgwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RYkLz2df;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8773606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RYkLz2df
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506C91F0089F;
	Mon,  9 Nov 2026 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204836;
	bh=yFMO8XjutCmuO5fNp8bQmbCSpbru3mQfeMalS3sumsg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=RYkLz2dfokGDh0K0hWxn22i0M0c2ItzrvQNUZR3brIw/WWfGfK4DMW+yRc5zS08BD
	 IeEkPx2eEkItx8nBQ31r2snRJOrFnTodl/fWhPTiXKk3uACOD/6pjtVGiIfg5/AOAm
	 H5hvD/2g0/sNGbQJH1mOUYvfrsmKyNzkT/tYKvSXJhEvR7vrZ7j13imcUCD2lwywww
	 mhkhBt9nerXSN0Oel8xAT6FG3VAEFDULiON8FjOd7ceWUE6f9WG9jO4124UQeMb+Zb
	 5G+raJTLtZds5Pmo3kCcwIE0hepdO5Zp3SW/qNqGLm2dnPpjyaw3uRSsMuRkmqDJCS
	 ipbx2hvbGJx/g==
Message-ID: <sashiko-outbox-204489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH usb-next v2] usb: gadget: f_ncm: prevent double-free of
 OS descriptor table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xinsheng Zhu" <xinsheng.zhu.ny@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261109061110.80422-1-xinsheng.zhu.ny@gmail.com>
References: <20261109061110.80422-1-xinsheng.zhu.ny@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 06:13:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ncm_bind() allocates an OS descriptor table only when
> cdev->use_os_string is enabled. However, ncm_unbind() frees the
> table and resets f->os_desc_n without clearing f->os_desc_table,
> leaving a dangling pointer.
>=20
> When a ConfigFS gadget is unbound, the function object can be reused
> for a subsequent bind. The OS descriptor support can be toggled
> through the ConfigFS os_desc/use attribute, which determines
> cdev->use_os_string on the next bind. If this flag changes from true
> to false between binds, ncm_bind() skips the allocation and leaves
> f->os_desc_table pointing to the previously freed memory.
>=20
> A subsequent unbind may therefore free the stale pointer again,
> resulting in a double-free.
>=20
> Set f->os_desc_table to NULL after freeing it to prevent the stale
> pointer from being reused across bind/unbind cycles.
>=20
> Fixes: 793409292382 ("usb: gadget: f_ncm: Add OS descriptor support")
> Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109061110.8042=
2-1-xinsheng.zhu.ny@gmail.com?part=3D1

