Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696004;
	b=qGbdaYPatBMNp86rIBdZU0pgBUxqoQXSUsjJdchlwyTKNS0t/dEB+WhGV6+4axnK1GnS
	 1qK9MMgDp5wiWR6LBUipbOOctYJT9MY8xJa/kB02Y899/E39hChQpnmo7Pngv/PBTd1ow
	 +ckPGuf1k9HjtNolyYCPVJLNF4VxuKBOWDjRcrxFxOaEwoqC5KZ2bgd1CJbAccLqfg0Gu
	 TbA7D0fZdGke2IJmAPWwclKhjtdo4/Ocsge5WdsVA8VgqFUyyiG/eWEVIEfbsfN7HLgZ5
	 HM+CIIg+wp58XyklwEtZsebzmf3m9/tgTXhysL6hUc5izNCmaqRgLAgNuBWTKzWTk7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696004;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iqB1PAnHC8g0zbRdWvfo2jPlXJMjY8bj4sWrXbz9h4g=;
	b=jFmRj06mODfTeHX3o6pG953yNtHle8WNODjxdNuZWhQQXZXitTbWXnINCNyZc990WcMr
	 f9/j6uscsHImfFY84BDfhve7Xtr7MA9glifsY4hD0GjQYUpAWy/MkyHJ1hiWswLC6wQcU
	 9vOSURU8GaeRUC+kBehWoZEz4wJWTBjWJKr61nJQbS2gVmYvHiFWyTgZXUh6oITqstCIR
	 fEVCUZNmDPTnpboW4elxTam0nzIBrIS4NjQIEeXyHcUtpYpVcSXEEDEGCcFsoc3lA2slF
	 dWy5Heo/86mvyVZYyBD+VIZiPrp3GCFew4dGhEnOju8GG4kWTMk5s+luWGvBeQofW3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSVNNvqF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD1606A326
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSVNNvqF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B6E1F000C1;
	Tue,  3 Nov 2026 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696003;
	bh=iqB1PAnHC8g0zbRdWvfo2jPlXJMjY8bj4sWrXbz9h4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CSVNNvqFrjKKIoGsSAZt5ucdh7lj3TmoECHerBwfiwJzXRqCgpRe9v0MvvLOMGf0E
	 5039lrhWUiRV3xNlBtYAZM2lsMBgk/b5xPB1DUJvHwDb6INkx85J/5yjYvtUUbzZcD
	 +AAV3J9JmZJsIYcAdnpKhi3TVKN4qhYz6raT945kt6y0GZxieq+eVDPYzIiWsgfLJx
	 1NlBVBzA8Opll/pc3FvKuzUoKHomVXEfD3zdmQjvtQHZS40q8vzvup5jNxKu4gQODX
	 fA1r8uvwDVa570Mz7zJtbApI5XlqWcUhb7rzV5qaymTymbaInvTLMSslSjR2R1J/vf
	 dkNFV23JUnN5Q==
Message-ID: <sashiko-outbox-194894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: udc-xilinx: guard EP0 dequeue against
 empty queue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Ximo" <lixicaicai@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103084722.1821982-1-lixicaicai@gmail.com>
References: <20261103084722.1821982-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:53:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Wang Haoran <haoranwangsec@gmail.com>
>=20
> The EP0 dequeue side, xudc_ep0_out() and xudc_ep0_in(), calls
> list_first_entry() on ep0->queue without checking whether a request is
> queued, while the enqueue side __xudc_ep0_queue() already guards the
> same queue with list_empty() and the non-control endpoint handler
> performs the same check before its own list_first_entry().
>=20
> list_first_entry() never returns NULL on an empty list; it returns the
> container_of() of the list head, i.e. a non-NULL wild pointer into the
> enclosing struct xusb_ep. Switch both functions to
> list_first_entry_or_null() and return early when no request is queued,
> making the dequeue side consistent with the rest of the driver.
>=20
> This is a defensive consistency fix found by static analysis.
>=20
> Fixes: 1f7c51660034 ("usb: gadget: Add xilinx usb2 device support")
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103084722.1821=
982-1-lixicaicai@gmail.com?part=3D1

