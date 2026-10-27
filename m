Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114112;
	b=Rn25R4WXGUFcougx+J1gtV+mk3a7UPIwVTAYiODHh/b/QYs/QJxN5J5oa7jjVxfgzUue
	 jo6ugJ5IoShofPPXLwWdL2kQ5m1ukGW7jL3ocTogav4K/Wfygptt+cpuG/aK8gxf7F+R3
	 4oOL3TEQRKPANwvcRd/RZL5LRt4D3B0xx08obCQMvQVQ6dF8VT3R1MkfE5s9ItVd2tfiO
	 sCNaGSgyBkXqnQwNi6r/HBOGcqL/f8iQHFJqEaOBNqQ5J+DxI2nGcBgJz3e/idk1fUSQW
	 hz32f1uSdeHIxSyWlW+xUZXc1YS+ZCoqc0tc2qAmY1daX/g92Ef6Y3W5gjPohV4geRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114112;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JFyqdSfPzEWPAgkO5rFeisDlpG1tgTNchRfxg98Wzpw=;
	b=aRwILy14CkPioZeR9DhmXvGK/s2gtLK3ZU5M1rI0ylMZ3yFwX4g069Duyc4oBR/myiN4
	 n187JfngvzdecJ+YCXafFjU8gstAPGsL+a5BCPnN7ryD/yGKu8EJaKgOUtubyG51ritue
	 EVWyI3AzrNUqwnpRLBj1LOa8OjF34GjE3ZhNhqTfRzNnXL45MlfswlMf8vre+izPO00YJ
	 pcQwxV1DQW+lujx7hsVOwVX59GzyEglMMpUQSU/VPv1V371+OhUnXgzW/1g/tTVWY8nbv
	 BwexSrDsROKrePCW4okFDQRC5RFUEYfxY25kp6FrEgbUEdEmU74hXxj2So0wCBYDljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kO6Fn8ci;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA41606A320
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kO6Fn8ci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0281F01825;
	Tue, 27 Oct 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114112;
	bh=JFyqdSfPzEWPAgkO5rFeisDlpG1tgTNchRfxg98Wzpw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=kO6Fn8ciX+dcF+mU44HsXLFI2CfEhXYsfHgKhk/CnsNwbY6R2Isj8+RVW4YDMlZ6a
	 UFiZRoPGoNUzxVLxJBBSYbpit8VQ4wJgfjJmKNpNdYADEtdx9NgrY9Z7XMNyhrwDqT
	 vEDq7L+0/40zBzBJcbNwqcOn6f2/iyuOmdpUQJO6dz26Oq6U5yo/tQc0KWpDhI50St
	 oZd/Mrqq/mJrgwraI4PrRXlfLuGQ1150E2GUB6+nnDOeurlDpOPOFqKng6C4Arhk6u
	 W4WMfWYbJIbjXQ1reFUrVFN/g2SPoFHQbvXuRkJ05piW0YZVYz20grsS4m0C0jRVmc
	 puuUxgkqZipRw==
Message-ID: <sashiko-outbox-186819@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/19] usb: gadget: f_fs: let the request keep its fence
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-9-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-9-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:15:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> ffs_dmabuf_transfer() stores a plain pointer to the fence in the context
> of the USB request, and since the fix for the fence leak it drops the
> initial reference right after dma_resv_add_fence(). The only reference
> left is the one of the reservation object.
>=20
> That one does not last until the fence is signalled. dma_resv_add_fence()
> replaces and puts a fence as soon as a later fence of the same context
> and the same usage is added. All the fences of an attachment share a
> context, and a transfer on an IN endpoint only waits for the writers,
> not for the read fence of the transfer before it. So the second
> FUNCTIONFS_DMABUF_TRANSFER of a buffer which is still queued frees the
> fence of the first. When the first request completes,
> ffs_dmabuf_signal_done() signals a fence in freed memory and queues the
> work item in it.
>=20
> The leak came from the reference which ffs_dmabuf_signal_done() takes
> and ffs_dmabuf_cleanup() drops: with it nobody dropped the initial one.
> Do not take it, and leave the initial reference to the request until the
> cleanup.
>=20
> Fixes: baa6b6068a3f ("usb: gadget: f_fs: Fix DMA fence leak")
> Cc: stable <stable@kernel.org>
> Cc: Neill Kapron <nkapron@google.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D9

