Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625707;
	b=3ietUIYiitKDMuA7cEZU4rZyznCmyKA2X8SX34jK9TkIeKh9/Z0seyFuKXkjqCzo9vKk
	 hd7Bjx2KK36za1rFczGJNAaxJ156aPr1S8ZnW7w4d4KXW25R7rbtj3UGkqZJXH2++FDO4
	 EpK/RwE51giLyI80C+4mVs61NMpw37yfOzPKNM1O5jtBPhMXEywjTD13shgm/TdCttHFI
	 yXvNEBl7C7diCkDhcj0jZ92wCc9MzsutkEXuyD3TnbYiAhI7YCvrKyNHMe433jLxn8oOu
	 kldaN1UlFqEaeoZoV4dR0bKH2jw5RSK8COeypCPE5opx/cTGxVX2lhjbLyULUlmnkPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625707;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=45zYbtgb7iNShWOJTkBlT+hvZc2xUZm4ya5+e6FueeM=;
	b=KffPalDoxGc3i/6j14CEmsp+HdymyRkbQJPMw+VT7Z5ef8pdXNII6ynYfI8DkFsosRqe
	 wFGGcB84A7iOT9BNOjiC3VKV5IO+QaPciacLJTkDV/hZf4Tix0b2O2cugUeRGHicnK4mK
	 x1R8wp1dbyOvkkGlmqvPurTzVIN5FBrQ2Vs4X2ofn/YituLy9+QcHEHcsKh36x+lUlPiM
	 vZk7Artjl9m7NRnj4G2ItJO+a4oasOUBg574sfx39EdQwBhOZXM4UIJRm1UWO6ebQjI/H
	 bD596eS+wEz/AUauJjFHZqtyrtQ+ylWohPrblap6a8fvC/71HynPYjK2RAQlF9Anhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdZegEU2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB5606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdZegEU2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8508C1F000C4;
	Wed, 25 Nov 2026 16:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625707;
	bh=45zYbtgb7iNShWOJTkBlT+hvZc2xUZm4ya5+e6FueeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdZegEU2jzUMf/9xYxNA0ctUOBVS1SmoFWBkJzo7l5fc/kKHwErLr2qnLXRKZOg0T
	 YUs8Ut41hIYP8QZCVUk025Kh3idM2egE/169qcVQS1WbV0EUvUVoDIdhay/LLHnfoi
	 mwn19MkWZYkibwpVgXhQ4Y3hPf3aVAZhUWXtUvOe3rIxbLXaSholYXWXYNyZM53VJ3
	 LUDEXBT/msXAaJ7FcnItvHFRKpXxHkwDDVSA2/ZBftyEy0y19XQC/zTLDMCCcB9MmF
	 q/bxFP06YO6to6y45e3d0t8VFsUi4fYcyBMQDlsHDkTTA9nkMXpnFkyoXar9GiTc14
	 NnfuRSrpfx0pg==
Message-ID: <sashiko-outbox-233785@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: host: don't add the sg offset twice in PIO
 TX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Dagunts" <ddagunts@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125164942.1310501-1-ddagunts@gmail.com>
References: <20261125164942.1310501-1-ddagunts@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:55:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A PIO OUT URB without a transfer_buffer gets its first packet through a
> sg_mapping_iter. sg_miter.addr already includes the offset of the sg
> entry, but musb_ep_program() adds urb->sg->offset again. With a nonzero
> offset the first packet is read from the wrong address: wrong data is
> sent, or the read faults if that address is past the mapped page. The
> packets that follow are loaded by musb_host_tx(), which uses
> sg_miter.addr as it is.
>=20
> With usb-storage this needs CONFIG_HIGHMEM, because usb_sg_init() leaves
> transfer_buffer NULL only for highmem pages, and a sub-page write. The
> highmem check in usb-storage does not catch it, as musb sets HCD_DMA even
> if it is built PIO only.
>=20
> Drop urb->actual_length too: for bulk and interrupt URBs it is always 0
> if buf is NULL.
> [ ... ]
> run the test, and to write this fix and changelog.
>=20
> Fixes: 8e8a55165469 ("usb: musb: host: Handle highmem in PIO mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Dagunts <ddagunts@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125164942.1310=
501-1-ddagunts@gmail.com?part=3D1
