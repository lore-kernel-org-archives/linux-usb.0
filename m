Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901993;
	b=dhKYwvpbHJ5EHvVHyQxFhPapJ9QNbEtQpJdjse5yc/G6l9lInblprulpGF1JAPNkNdUJ
	 vmvfSiShaedS54KICIleDmMi65NxlM1T/nYzirTH2zzbdzjcBrbFTooiVkDs2Gl4MlmDd
	 iocPLYnoEU18PlL9YgiVulmi+FOWrBTfuts27oI3kBFIgkeyz6JV4aaI6vXpJq5+/k1XX
	 ugZ/TLBPZxX68gCapFGFkUQ2apRRRwMNE7S9ZZZKu5ju/PtV1ru4M/a2e2uASseboS2VI
	 sEYE+4KLVq01pyNm6hrThFXDAsNO/cdWvBngvUvQ3jygrpz7e4Sz5zda8+T8RxexLyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901993;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8V+GDUZYDo8Maqg610cgDAKZ4K7cHnnRvQGwPVUlFqg=;
	b=l5l9GzwZsU9vlYIFCmzcwI/C7NC0IVsh6gAGwP09KE4adNNXvsxy+09dFXRANKc+Nkt1
	 +qmB0aKVG5EVauSnJhSqnnoETbsEeByx/Gxem0tDvE3UmERRi+bt0do0yEowclrutcM8L
	 8FRK/OuHnUeEndjxNAnPJTtN1uDDJUdK0dR2LK0HOPpmOxVPdIbRiRM8VxO8TrbHzX3nB
	 CpwGJr28kqQfD6PQ7yf9E2huTxUsmImVz6R3FPqCTtzg1Dq8YzoDryvN8R5FrVoeyEojE
	 csCNRTmtMRPzN0R2HQbAqxCBg18DoGoKxw9DvCWrih2RYRNncxsckiKlYz0u/abN2WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJ0Ax1zu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D40D606A329
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJ0Ax1zu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105F61F00919;
	Thu,  5 Nov 2026 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793901993;
	bh=8V+GDUZYDo8Maqg610cgDAKZ4K7cHnnRvQGwPVUlFqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DJ0Ax1zupAcHOAnFk9x/NRujHB/vzMtGSmKrSwx4ase/UKZYzXn97OGRp+NwPLjsE
	 RsKc51UM5Zj/HwoDPzNE9yq16wKA5a91avFea65WqYVyXWVf/UJACfF+V4MpQ8iCok
	 cnqT23RYCmxDwIO3KVaPNAbPAxdZmQ93hNKlucFjnsJ6BBdAB8DLzS/dqUBo3UhUkX
	 UJxZX1u5n525PbtPUyHvqOShSGYck/RK2MQmxFTsTMoyPyf7Gn6uuTkY/vLkU5RG20
	 rn0RfZrIsH9psMxfcY+AiVsK9QNr7fMk0tEOoGaqLR9yW8CvsYE7XAnPHt6Qv/KYOz
	 EsPcFdARfkHmQ==
Message-ID: <sashiko-outbox-199689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] usb: xhci: disable the correct slot on alloc_dev
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105175106.241182-3-mathias.nyman@linux.intel.com>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
 <20261105175106.241182-3-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 18:06:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> xhci_alloc_dev() stores the Slot ID returned by the Enable Slot command
> in the local slot_id variable.  udev->slot_id is updated only after
> xhci_alloc_virt_device() succeeds.
>=20
> If endpoint resource reservation or virtual device allocation fails
> before that update, the error path passes udev->slot_id to
> xhci_disable_and_free_slot().  During initial enumeration this is slot 0.
> When reallocating a device whose virtual device is missing or belongs to
> another usb_device, udev->slot_id may contain a stale Slot ID.
> The newly enabled slot can therefore remain active, or the wrong slot can
> be disabled.
>=20
> Pass slot_id, which identifies the slot enabled by this invocation.
> xhci_disable_and_free_slot() already handles a missing xhci->devs entry.
>=20
> Fixes: 3ffbba9511b4 ("USB: xhci: Allocate and address USB devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> Reviewed-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105175106.2411=
82-1-mathias.nyman@linux.intel.com?part=3D2

