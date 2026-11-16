Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841684;
	b=k+S0vTrLBNt++t6HSaUuj5I8CDZWcAG256kTJvyfRYZO0PKYHsKvH+S0tPYUsYKH+/ih
	 4KCUn4eI0hNsm5scjClR3Ydn8Y9VnMAq8G1YHn5tyx612MdWWefWtX4nKfQ01msyss1iA
	 Yiq/4txaQt9YNtAiiBEV+d19BaE0LstpWIHGmBewzQ+Fhsd5BmyxWXt37NxFBG23B+5Nc
	 jn75O+6BOV/WC5LVT0RXWKUlrKcR/ZMkEJ2O/EagLqYrqI7PKUBYSQzvq5HLV4wm6Ejfy
	 HNpbCclZD1lTY3o5E0DF2UbqEWwsHO7tiGZbOR5h36co+4E08gLCyMsG9O5KoPAwNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841684;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ojLplWXWIcpzhY5i5ty6MeIgBuTIeMOu9xP74qxDpBA=;
	b=wNeOnls6Jai/6C5yV+U55gWO6tvhYVp4YksQhmSLbxWHalw31liWBc22QuMelB8zio5y
	 PKZq9rOYzV8MFL2fjU0FphnZh62coli2qxmSV7Jqel01jZbqp7QeJGTPJh0spEQN8cSar
	 ixYhreOLhKPW5rezV9BQyw0/+7uqQV1svQd/5wvK6iz9VGHN8Hc+g3V5ip+GeKM1uY+1F
	 wUYTCrilDh2Ty4ZxFKDfPCQ7FaeSASVd0xJoGexuhBvNbSpeKPyRcBXzkFaLT94TTdS7b
	 TQ68Z3fTVrsLrifenMlQcSV4NxQQxg35Yr+iMzOspsq2QzbNfp/5+r9G9nZM5hFP3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2BBeqiN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56742606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2BBeqiN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155F51F000C4;
	Mon, 16 Nov 2026 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841684;
	bh=ojLplWXWIcpzhY5i5ty6MeIgBuTIeMOu9xP74qxDpBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2BBeqiNJNxdw5lecqok4g5ACJd3b6oM/aZjIRpoT8L0EgC7HpfX5t5nnHIwJoBHp
	 Q3SVpcZ+lLB099T/a5jw/ptdKFIBUh/8tWquZhXL6Xgc7vci9AzJnt1P9ZLt/Seh9N
	 NreWMfYzzmU3u9NuyXdKzsWx9xb6ngthwPMUnd4AR4T29vpn3r+SgkAftUsJLU1hjY
	 gXosN+2eR2FPmni2Yh5HJv7O1M6jaltxiY77Sx1DhTI9JMRL1xJvpG5RvfFPDOTvbg
	 aoodgO1MRtABpwHN5qC+xQ8tzQfaDUb6vo68dmioKxuTLZzZQWjVYjWLoJKwWaVNVP
	 nXHSGC71zU6YQ==
Message-ID: <sashiko-outbox-217229@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: gadget: u_serial: implement flush_buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116150109.1474880-1-mehmet.fide@gmail.com>
References: <20261116150109.1474880-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:08:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
> gs_close() waits up to GS_CLOSE_TIMEOUT (15 s) for the write buffer
> to drain while the gadget is connected. When the host does not read
> the port, for example because no application on the host has it open,
> the last close blocks for the full timeout. tcflush(TCOFLUSH) cannot
> avoid that: u_serial has no flush_buffer operation, so the request is
> a no-op.
>=20
> Implement flush_buffer: discard the buffered output under the port
> lock and wake up the close and write waiters. As on other tty drivers,
> a hangup and an interrupt character (ISIG without NOFLSH) now discard
> the pending output as well.
>=20
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116150109.1474=
880-1-mehmet.fide@gmail.com?part=3D1

