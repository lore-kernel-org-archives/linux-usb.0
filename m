Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974076;
	b=qlpzDmIMmVwspZAiqEH2hICiNcwlVdBh32k4knQnnAYCut/zKE8Q+F7CvGiK5tL3Z0Po
	 tn7QJH5z7Esa1fsiN62ko6ureos0YFsRqe7+ME836kFRAv4lfQevz5pE8NC75PFNhPl+J
	 aiZzCYd7DQtardpmFQIQbbpfsG9S5JM0stKri+8dWwHZcAB36desB9EbHtkT4Ri4l4+7K
	 I+DirehzNn9TvCYKOHF+NYm5aXk5MsFMFKzKTfo5STAa3NJQfdzhNMLICuFD6nxCnyi6H
	 XEJDGLkUDSRP0bwORpb+PKg7dU+iyKRH2MHZWRG2K4+7HE3YKNVCFoALU+w1lQnRGnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974076;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6xWc6kQVCKyGos0TkHzmiJUz15Rl6dEy+H+kidaCuwc=;
	b=IVnVXb06JrTFwRDotxbBOFwvBWLVrf9jergocE9ktgHZKwhPAWpG4Clfnjlp0xTjnW3c
	 O3lFoIUgliAXLkHgIrOVpjnWESXMPoz1gP+3Gfct9rBtHCZ63MP6AH7mIIsFddYdZqd4z
	 10Nxx5GniC3EEWqvGzDxdvXuC9ckpQ2d1xgK/oENoUMfQhyu7jOemT0HOnqgLFLlOCoWm
	 wzAzKT84D3IrDsql9IDshIUxCYlJq5kmFicyuis7CU4G7ocjTVD/qpS8vsI9MTnBh1hgX
	 MRcucdl+qs6cCrLM8Vojx7pUQBbVZYwi+BoFek7JL4YRwwIPXlp0FOwDa9npwne2Mbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0qUIjuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586B606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 03:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0qUIjuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0731F000C4;
	Wed, 18 Nov 2026 03:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794974076;
	bh=6xWc6kQVCKyGos0TkHzmiJUz15Rl6dEy+H+kidaCuwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0qUIjufV3wfU0JpDSPHef0qbZBp0k0VQPXYDQLpv8FsHGvWr8XT9mGkFiBcFYAgv
	 C3rbAoPqhBd0YN5R1IqE9a+z61vMWA4N6BmGDd0LmbF3e5PkiV6BOruRC8fSQteCBe
	 /JqZeoDh8BMZG81MdmRv2FVUG9oWqOCt9hP2i8hq/qJ6oNXVELfZAkZStBeF241aFu
	 KRWXp5t/9c+zW0klpu9x6OJVCasGFFOYRxuR0UClfFghaMZZGdMOtPkDLoNU+ouDKm
	 T9LUeyo3HNJFuUW3b4uO88nbQyy4XVm9FFrDMjSbTcDoiHVQQ10rf4JHTDpBTgl7Fu
	 Kh3EMcKEixTUQ==
Message-ID: <sashiko-outbox-220056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a
 stopped queue
Reply-To: sashiko-reviews@lists.linux.dev
To: "William A. Kennington III" <william@wkennington.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118034122.315979-1-william@wkennington.com>
References: <20261118034122.315979-1-william@wkennington.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 03:54:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
> whether usbnet has stopped the netdev TX queue. Since commit
> ad70411a978d ("usbnet: fix kernel crash after disconnect"),
> usbnet_start_xmit() frees any NTB submitted while the queue is stopped
> and increments tx_dropped.
>=20
> This triggers routinely under bulk load. With the default 16 KiB NTBs,
> usbnet only allows MAX_QUEUE_MEMORY / tx_max =3D 5 TX URBs in flight, so a
> bulk TCP stream stops the queue constantly. The TX timer is armed while
> an NTB is partly filled and keeps running after a subsequent packet
> sends that NTB out full; when the timer fires while all 5 URBs are still
> in flight, any frame left in tx_rem_skb or tx_curr_skb is flushed into a
> new NTB and dropped by usbnet, causing steady tx_dropped increments and
> TCP retransmits.
>=20
> While TX URBs are in flight (dev->txq) or completed and awaiting
> usbnet_bh() (dev->done), usbnet will wake the queue again. When the
> queue is stopped under those conditions and cdc_ncm has buffered TX
> frames, restart the timer instead of flushing into usbnet_start_xmit().
> Keep the existing flush path when nothing is queued to wake the device,
> the interface is down, or the timer is disabled (tx_timer_usecs =3D 0), so
> the timer cannot rearm indefinitely.
>=20
> Check the state under ctx->mtx inside netif_tx_lock_bh(), matching the
> lock order on the transmit path and keeping tx_reason_timeout
> serialized.
>=20
> Fixes: ad70411a978d ("usbnet: fix kernel crash after disconnect")
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118034122.3159=
79-1-william@wkennington.com?part=3D1

