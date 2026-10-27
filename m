Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113507;
	b=cl+OlQS+5aVpJEyHn5OZOnILkzXpev67x6dC/cMTnfIJCc/bEQJSZ/+Cb9PPUiX9WnMD
	 nkLGl/PfG1wen7YDaalRXZjSkbqKK31PCH0GLd18Gz0+Or1ggN8MPLnk66LeN7/joSQza
	 ZONcIn24LQhC808U1YC5oPiHBMScgKOfA3glCbRGAqcPx7kjp9JXKMSOwPQrlIFMpb/f6
	 cKP4P0IsVK1Z8SMbHnHMehfLG89ss9jiZSo4l0DtLWuWnkdc09pxqkpU8oAnj1RxixZIg
	 AqLFsJRgv8baA0DewtM6TKWLMMB7/LxVenPXq/19BBbsgTyhnaM1k1ZgrEOMONS51Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MfYMHqrYW/e68fTRSEvrSbgApetRgdaBqIbrBv/3x8A=;
	b=R88HSnKsSuV6pFzRAEvO4OUAvWqbFccXZMh/QtvZRDiZyjVI5hJp/IdCHRC0qjD+/LPg
	 rIre+21vLzV16nkYfJiuNzrKN25Th71OlHmMOBetLeLMIYWbBmpJh8kuKVVi7uQLSTZrB
	 B8rn1JvGabUarXZDg1yWIcR3etz0w8afPOQ8R7YonsiHbGq5IdkqeDX6xM3UlICWlfN6R
	 u0ZPg1HLsizURAVzx5mgh5Jz8JNNPci9OCU6yFpvkDvkDopidhlAsLy84Y8mYOqI53Bzs
	 ULJIoQxS6jMxguHMPFg8Vt54oeIy+wiXr5y6W6O2OoFVKPxkehyZE567LLE/WU5NyJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJZjZf4T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B928606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJZjZf4T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C78B1F01828;
	Tue, 27 Oct 2026 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113507;
	bh=MfYMHqrYW/e68fTRSEvrSbgApetRgdaBqIbrBv/3x8A=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CJZjZf4TNeqRB//XazKwzpqyMrXsnakZ530YUBqwQredVSI3+RRTy3jsovqsyqjKU
	 ayuKKTlLMOkqJsKd4adEQ6IitChLR5H1zyfY8TdHjvJoUlUs8Y+0Z0CsxBdExF+JOR
	 Bkxp2cOyejoOEwOjnNSzwqqvQ0zZhTQUsfMuV0HDPfAEfUK4l8DN6z3r4PpNu0WMGI
	 4E4sr58/LA5O+HWpzc01dWRp6dl7NST3wP/5Ddn5Keh6lnJJmE9ezHEj7wteRyqX5r
	 Bl7Iq14Y1l+EC+i2X5W5i8FOX4bYYy7CQfcsDQvr0+izIUrp7aJN6aN2wb1vSO9fP9
	 cmo3803sNkroQ==
Message-ID: <sashiko-outbox-186795@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/19] usb: gadget: snps_udc_plat: lock out the
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-6-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-6-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:05:06 +0000
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
> stop_udc() is called from a work item, when the extcon device reports
> that the cable has been unplugged.  It takes udc->lock with interrupts
> enabled.  udc_irq(), the hard interrupt handler of the controller, takes
> the same lock.  If the controller raises an interrupt on the CPU which
> is in stop_udc(), and it is likely to have something to report when the
> cable is pulled, the handler spins on a lock which the interrupted work
> holds: the CPU is stuck.
>=20
> Disable interrupts while the lock is held.  They are enabled again for
> the ->disconnect() callback of the gadget driver, for which the lock is
> dropped as before.
>=20
> Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
> Cc: stable <stable@kernel.org>
> Cc: Neill Kapron <nkapron@google.com>
> Cc: Ijae Kim <ae878000@gmail.com>
> Cc: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D6

