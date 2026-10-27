Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113604;
	b=eBn4fRWNIdXHkj3W6AG5wNIZTPWqg0r9TadinMBd6SwSaau2hyCJRDj+lHvSe8brCG/E
	 YPZmbaFC+JZXSfZByEYwW8TKP5HYZVOkWXF3L9wIa2mYDxiColp7x1k0QgIuEP1kgwguj
	 FotY6Z1OJpnbt86JANKIJkEhUWEI5CtX7mGjMJXBIHsBvxjv+pcsYbDy0SrNHvPcnMga/
	 5Yp2KN1pxZTnE25UwP+AfRWFxPVbrrPh94/pI7brjAmryyqItqvJoRB3Ky3Khp4HfSdwU
	 Th5zPsz/LTstrAgKOd6kpWjzIKNWs4F3RuQtQ7oWkH7aAUYwtUWjLGHFcULnSWdhDBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113604;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dE4gJ35wU4fut6uSdv7kgy02uRvaqkDVExuKS8fu4Uo=;
	b=qCDKA8P/hoe6/CV0KFblDAFaz0cbUwKltmdEYNYgw/0DbVzVKE7QM1k+sUfMIw7nsI8J
	 T+Lqez/XV8j2JiMbyKDy6OLOIPnHtOWXivhwh4fNd9TTnBI5yd8AaNQ20cN495mLSQcem
	 4TaUx21cxIs8qyZdCM78QwKRoSVuEhBte1I5op4eSs1O4cTAtf/mYvpDF16hEBNPIK9uD
	 C00OKHZBEh6UofVk386Q4BE+fOkBOOLgGWbRiF9dTq+gpXSB8oirkSmJvPBbFQDXw3AYq
	 qSMG9MCNyGJsIsO2zL6LzaTbLEagEkjDUhj8J5alnrfp5CgqcTBfrV0yOvBq0HaxKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mih3CtLf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75779606A326
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mih3CtLf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D741F031E1;
	Tue, 27 Oct 2026 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113604;
	bh=dE4gJ35wU4fut6uSdv7kgy02uRvaqkDVExuKS8fu4Uo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=mih3CtLfstdCyqqQsT5Zeh//3vHb1rCbixnZgbpXBHkWHjt5GDFbJhn+5N9Iou0vN
	 +zcKfi/g6o9B0vfn5Gwq+A9DAH0YAfniykTQyC697fAzvIbYhT2nCk+ab3UcTj2+WV
	 seBmdlSvaPBBTwV2zTpDO6WeEbqqCXu2g573KC8Knm/gFEWAtGcnZLLzsfDCK4ieCF
	 ezGe/TvxTQLYDAxsEt6Qcln36mugguZCcD7aBeZWiI0PSZ1lkrRmLh4pGeNHKSV2Gy
	 +jD/yWLMVxBVF+wyQmqOGv9KNb1R0mjFfoUTkoAMM93tx+xr1MZdSIvR1yd+7Zi31C
	 SQA01g8atj9ng==
Message-ID: <sashiko-outbox-186799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/19] usb: gadget: bdc: the resume callback is optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-7-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-7-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:06:43 +0000
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
> handle_link_state_change() tests gadget_driver->suspend before it calls
> it and sets DEVICE_SUSPENDED, but calls gadget_driver->resume untested
> when the link comes back. gadgetfs has a suspend callback and no resume
> callback: with it the first bus resume ends in a call of NULL.
>=20
> Fixes: efed421a94e6 ("usb: gadget: Add UDC driver for Broadcom USB3.0 dev=
ice controller IP BDC")
> Cc: stable <stable@kernel.org>
> Cc: Justin Chen <justin.chen@broadcom.com>
> Cc: Al Cooper <alcooperx@gmail.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: Neill Kapron <nkapron@google.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D7

