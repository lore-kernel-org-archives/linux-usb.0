Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006794;
	b=4vMIXnZGfGDXCmEAMV4OHkotKgrIMz/y+jyQ5xC5wcVIZo1uSF4uI0dZWEKJtGN8tGb7
	 IVRmMvCtF/f64VNbveHj9o7sE4mOvyBftA3cNvzOfFcLl79pftT6lNG3iibZyT6w2sc4z
	 sLsqIT//RR1GjZNMI1GxgfOZpIiJwEMg6tSQ7OTUA5uMteCkqMi2pX8KCkpNdDr3ajGy1
	 0QXf/WQ4wJEEVE/RjsW6JIaBVwdBdUZ7uRpTutkrYvStufGlrE5bfVlc1viwIEsQRYi0M
	 BJ9gXG6z2KxU3blBA7WCTvT0OTnRN2AF9bZdKnYU6VhSjq1xHHRhUl5sPYrrtilCngQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ceWE9MLQ6W89anFuCcPKbRJyPM4u6mapjv/d08W9QpM=;
	b=aIdiGIG05D/ogRby/9cPhmT+xdgZuknorlmru5EJcsFkZ+m2flq4gI6X7h9g6WEsPW/5
	 KD9eLgu7wbO3oFTgYYnCPhixv6W2BcuSe39rpCXnEwYkbacYThWVVjMbaTcrYwXQtzczr
	 maleGyvPTxE9qBrdISV7SNT30f1bEIGVzkUjk98voS0uNjKznACCViFUvP6fv/i22K3Vf
	 szdMEZilLeWrtFSgsZ8l/ZClTnmwGTJfGbLdBHQsUuUqgq6mu6ZmKfF0C9hWszvDOeUdU
	 ftducdhBuN62UqNmdtlrDHIZGTkzXpJdlfpM404n71FHyc5cPS8+lboJidKWlihPCqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnE55geT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69494606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnE55geT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAED1F000C4;
	Wed, 18 Nov 2026 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795006794;
	bh=ceWE9MLQ6W89anFuCcPKbRJyPM4u6mapjv/d08W9QpM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=FnE55geTU0v4yVvDY0CPIv10af74+z+mgPcSQetqRuhJ1/5LBxsvjL1h3e/fH+vtd
	 FUpFztyeg2mUux2JEQvHLOvi7qBy7CvbUUreq/o8+A8/h50xJ3BeU+tOxs6mi++iYF
	 yXZAO6YEupzALEJoy+p5zPg0Eb8JCkiJSBGxD/PrDgzPfT4EmP72w8fIptlbAFYUwY
	 C3y7SSetKKrcEFy3wHT4YfMb7OwwV3Rn4GXq44LW1o9VZpUWU58vYD/eKrYqf1GD6F
	 V6JuAT0hjN4yY6sHHHg01exJo2Oyb5vVyzGw9bT4hQdP7Ze5YImwAZruskQiKeQvO7
	 /CoJKIr58KlZA==
Message-ID: <sashiko-outbox-220955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/4] usb: gadget: f_tcm: reject a short write
 data-out transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>, linux-usb@vger.kernel.org
In-Reply-To: <20261118124005.2428068-4-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
 <20261118124005.2428068-4-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:59:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usbg_data_write_cmpl() copies se_cmd->data_length bytes out of the bounce
> buffer into the command's scatter-gather list without checking how much t=
he
> host actually sent.  A BOT host can declare a larger OUT transfer than it
> delivers and end the data stage with a short packet: req->actual is then
> shorter than req->length, but the completion handler still commits the fu=
ll
> declared length.  The tail past req->actual is whatever was already in the
> kmalloc'd bounce buffer, which is not zeroed, so bytes the host never sent
> are written to the backing store and can be read back by the host.
>=20
> Fail the command when req->actual does not match req->length instead of
> committing that tail.  By the time usbg_data_write_cmpl() runs the OUT
> data request has completed, so mark the command and skip the ep_out drain
> in bot_send_bad_status() - there is nothing left on the wire, and draining
> it re-arms ep_out for data the host already finished sending and wedges t=
he
> bulk pipe.  This mirrors how f_mass_storage stops draining once the host
> ends the OUT stage.  A command rejected before its data stage still drain=
s,
> since the host has yet to send it.
>=20
> On a dummy_hcd gadget, a WRITE(10) declaring 8192 bytes whose data stage
> delivers 4000 and ends on a short packet is answered with a CSW status of
> 0, and reading the range back shows the 4000 bytes the host sent followed
> by 4192 bytes it did not.  With this patch the command fails, the CSW
> status is 1, and the range reads back unchanged.
>=20
> Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP=
 + BOT")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118124005.2428=
068-1-yhlee@isslab.korea.ac.kr?part=3D3

