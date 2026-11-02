Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627262;
	b=wxjysTNSB4M/JGD1OZg76E24cRbldl2C5eOBZLxn59nJ1rm5Inl0QnAIHG7Fts2yTLos
	 DlOQypRG+2b+GF3Rt6Rrxoy6orFToFmVbowwz/sZFvg1RS+8G+xS1tdGj15Xp/XcFDa2F
	 A6V/SO+OwL1lxMwzfw6OcCdHk2EwjY9rqdmmmXp0G3Bn3u2aoyYpDKhHXPQ0UplVSr0ag
	 ux8xZR1nVlrpj+UlzCVkXnhmricqYr0KoW8yvlLLo0uM8IUmZXSZmVc0ZmvrbbS5itmUf
	 55cdjD8wH89hTALtJlmT6lcsZ5nc6zcdXDDLFd3LYk22kaAeJKAY64dstgeytD9z9CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627262;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dKnMPTxu6C3c9imeKsgoo/aeMUZcg0YAXsEX71shqBk=;
	b=j0yV3cb7TbRc97o2zNftVRBVqG4oauFMtkSvY5P3Lk2Aal6IxisJlzgnjzT4zVjnLVzF
	 fPspSj+Nwb7bZpChVC0RfTk7S0uvpY8HD4e1zj9Z6PB0f8OVOLsEtoYmqdn1XCeAib41k
	 m7Ngo6jZLl8LcklzrTsirCg2fCwxDCYwFNN8iw9tp/NLH6g2Kd2iX4Zi0929uSJ9Y50ds
	 CwyzojND9WoMXTkdxfE9J2dmx6+N858P2+MW2lTBG2YvavH6mXYvrkwY00Il9V2IvWvt2
	 0SSUSW5jaOwwdhfADoGEstOk6Z1oETwpeUzxOt2Jsc/cz/JP6sPtiZmMfQ4qcA2yDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BS3nx/aK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79BF606A333
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BS3nx/aK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F7A1F00A1A;
	Mon,  2 Nov 2026 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627261;
	bh=dKnMPTxu6C3c9imeKsgoo/aeMUZcg0YAXsEX71shqBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BS3nx/aKj8P+zdBXL9uWidZe5p7vM1z4vi2g5/etxL5N/8Tpl327yfUQPAJEeJx6V
	 xHVGxHORgkVtk2DRTskie9n1SDgdgAygX+HbvKA3kErNcw4T41ByXppypbHs1w/fNq
	 TflXsjTqqVlnn8tf0qd9OCunKT/j8UZv4oosMmaWxfea/6Yd9hFu/+quvQfWwgKbz3
	 OhbHwASkxMPZsJKafsEiS2GnDk5d9rdz27toIDzTORlEGbggyyyoQzo+aZjQAhS2n8
	 JY3dovZtyXxkLVsKdJraJFVrz0ma4djpMBaH2teKOwj7qEQuNGWx7mjihkxDgBiQDN
	 gmLdCMfAbsrGg==
Message-ID: <sashiko-outbox-193503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Send PD messages longer than one
 SMBus block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-fusb302-long-tx-v1-1-0d2719488c3b@flipper.net>
References: <20261102-fusb302-long-tx-v1-1-0d2719488c3b@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 13:47:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The whole message, tokens included, goes to the FIFO in a single SMBus
> block write, which carries at most 32 bytes and silently drops the rest.
> A message with six or seven data objects needs up to 39, so it loses its
> closing tokens including TXON: the chip never sends it, the transmission
> times out, and the truncated bytes stay in the TX FIFO ahead of the next
> message. A Discover Identity ACK carrying a full set of sink-vdos is one
> such message, as is a Source_Capabilities with six or seven PDOs.
>=20
> Write the message in chunks of at most one SMBus block. The FIFOS
> register has no address auto-increment and queues every byte written to
> it, so consecutive writes append to the 48-byte TX FIFO. TXON is the
> one token that is not queued but starts the transmitter as soon as it is
> written. It still comes last, so transmission begins only once the whole
> message is in the FIFO, as the datasheet recommends.
>=20
> Flush the TX FIFO if a write fails, so that a partial message cannot
> stay queued and go out together with the next one as a garbled frame.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-fusb302-lo=
ng-tx-v1-1-0d2719488c3b@flipper.net?part=3D1

