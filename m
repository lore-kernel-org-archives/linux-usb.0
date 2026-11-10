Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295840;
	b=lsJnbAtPte9bjCYfVMPq+O0G0z2T5ZbqzdcdmPrPu7SEHe/OzNPtHNWeVDlA71nNcaNg
	 7mUAEuZvwQEvvsOyV15Y+jYitjtKIX3IiLq1Ia6CcWFvAPsXBpE1H0XXYxxghuC7onxuU
	 pleHEFwDTN96YlI/9z5sFv6qn9kQZqf2j/F+tjiecBsBir2OV9i0WHCgru7cl4xgigzwz
	 1bg4itPZRmADNRTxiAn1d8gdw/ubgTflex9MV9Yiqd95knWkwwqHEaJjj3tYSbZIhV9W5
	 omibCTdn290XdGr/p8ODM6sB2TxDgCK/0knOgtE7VW4r/Za7p4ApyvJhL+d34LIz4Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9BmqCrnWA+vYnxRz4y8YGN4103Pu3D6uxItb+3l82Hg=;
	b=yvnVZL9m+dlu9Lc84rVBtBbOeqeMtpfcCI3ZMYzJr3BmpT857fUrrRkZceEKmOxTE0d3
	 y33z6xo5jccQfj6fw5ePU8uE5Ox6PraOvYkA4ZKEh9EMdBRLs6498ULgV4szs57KRlSmP
	 CQypLtiNYg0wRaxLkfr8qzxClpSvyv3gvwzrJgOZOWNz61JHh/7rqQwa8hHYY/6UOPXl1
	 tkytXET+AktR9xGvRzC2e7zPR2lu1yB3W2JwPS9Bukc/HIUtKBmPdrxRvI1pGG/eeNP3B
	 fqgcW2vRgIQ/+Pk6SdQXo5nkS5FI8e0O1zgwtDw2Zw7LtwEZErKsFslGzIfi8DGKC8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P98/VDPd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD01E606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P98/VDPd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B9A1F0089F;
	Tue, 10 Nov 2026 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295839;
	bh=9BmqCrnWA+vYnxRz4y8YGN4103Pu3D6uxItb+3l82Hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P98/VDPdeKE4P9uTwscF2qTAjna45HKQc7o42V0jUw/BuWxTUpBYH32lCiMDPRm1d
	 0tDjSmULMzzzNyINBsrxtS9ybM2iwj984NF1XDupY/NNLdOmyLD31mK0aa/+y+iJJf
	 hWCK8ywx2Uff41mtF8P0NhWVsz8A5sqV4AU8q7luzBXLTRHgskvczgVuYzOYoys/mR
	 HDJt58mIZ8CHLP9SZHpxSuayvjEcVksRTD/D0roBJe0Z1XjVUMUj64k9PAkzEntNk9
	 mkE3SspN/7fSx48hd5laUB7IN/ciI/Q56A1Odfm1I+zfzgALprr0rz/FMdJaQNS5RK
	 WhyHT4sqJRdig==
Message-ID: <sashiko-outbox-206496@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing
 the root hub ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:30:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> always reach the same host controller. On the Rockchip RK3588, the
> SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> which EHCI root hub port shares a connector with which SuperSpeed port.
>=20
> The USB core already reads a hub's OF graph, with one graph port per
> downstream port, and uses it for the port connect type. Allow the same
> "ports" node on EHCI controllers, so that a root hub port can be linked
> to its usb-connector node.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-usb-port-p=
airing-v1-0-9307e29d2ed2@gmail.com?part=3D1

