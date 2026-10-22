Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677622;
	b=oclLSjFCAGDoAZgfqyT5eFpyb8EiKvbMwuQA9FhK5+3k3aIffAywyLKIFAPjMH/1ii5O
	 iL3SLR6Zx75ElBvfp/qN3lUSBPMal5FCGle+1xzIsVeUHF2+sbRM1a6fc2xQWk52M2Zo4
	 Bci7SsdA+nnFcjS9YAJ/IFlMhNIujbCEjhfmmf4RyYGQ4qPwDVJ6/PASx96CCJj+eUZfc
	 SlC5mWg8J7tIdSYSnGTFqEAluH2Vhp6+14HTSy8TU1Wo6jRp5rnZbGqcIFDXLtu7ufCbL
	 pu7quteLVsKe/bMW9yDOH+7Qgp35RBbbeLqvsWLyAROHXEdEPyJ/T/mLthHIfWiihpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677622;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jh3JKj6ed8EikkrWAUIdJfGPIpflZkPLv8lW5AmPobw=;
	b=cbxZARKDYROdXAd5xJ3t05rYrH5rsXU3VlBzaTUH0JuViGEVrXKrTA79jdX37NJqDnKw
	 WKHsjkABMqtgdN0Yx6azVNn9Jlrmb+1lNDhgDGZZDIZuKpqhbHRLQG1py5VwMdKwp4xrj
	 QCRib5YUKXwoS8l6RmgfXN62w/kwQAdeWHhji1d6K4cV2EWtvWMd4xnd0w2UsWkhrWl5m
	 1jDgpztv8/zL+Mme9fVTsBCrw33OpbV87WSWN84RDxx5K1eGnW2S8338eK5LMt3OH1TJv
	 kPVolhr0byIqxJqmDSZli83pzh9C/eu9UakW51vjuOkW9w4V9/T+DnaHBqNj6HnXqBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLFUnHqr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E25606A31A
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 14:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLFUnHqr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF5C1F000C1;
	Thu, 22 Oct 2026 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677621;
	bh=jh3JKj6ed8EikkrWAUIdJfGPIpflZkPLv8lW5AmPobw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLFUnHqr6FHLyCCUn5C5yXrQw6JsceJAUkJfhwo7aW8Hp/XYYEy5wSTdzKlmQbuzS
	 U1Gu586QDXbB5u6b1wID/9yNLQUzCK+mqW8nhZPeL9NrQgB8+13ZxtVPkNs6Pi5d4m
	 UENirO5TtV2MStyoprPneQ7hv9Lt1IhzH3+trq0X5dAFCqif9/1rgZkTcRx84AKlNR
	 WRJATreK93+rXrpTcMlk1/iNfUUhOVL5jBRzpKQfh6liKTcbxV3jPS90rge+MiFrVO
	 9RB2TLZefs3anOAJK5imx5Tcp9IaIzZwMtk0aGdX2eelftcCNY8XlEJ1TrKowyw2YF
	 Rx+mZlngvxmYQ==
Message-ID: <sashiko-outbox-181602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: gadget: f_tcm: detach gadget when dropping an
 enabled TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slawomir Stepien" <sst@poczta.fm>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022134926.1125473-2-sst@poczta.fm>
References: <20261022134926.1125473-1-sst@poczta.fm>
 <20261022134926.1125473-2-sst@poczta.fm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 14:00:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Removing a TPG directory via configfs rmdir ends up in usbg_drop_tpg()
> through target_fabric_tpg_release(). The target core does not disable
> the TPG first, so if the TPG is still enabled and the gadget is bound to
> a UDC, usbg_drop_tpg() destroys the TPG workqueue and frees the TPG
> while the bound function still references it through fu->tpg.
> Subsequent USB traffic (tcm_setup(), bot_submit_command(),
> usbg_submit_command(), ...) then dereferences freed memory and queues
> work onto a destroyed workqueue.
>=20
> Disable the TPG through usbg_enable_tpg() before tearing it down, so the
> gadget is unbound in the same way as when writing 0 to the enable
> attribute. Only do so when the gadget is connected: for the legacy
> g_target driver, detaching a never-attached TPG would call
> usb_composite_unregister() on a driver that was never registered.
>=20
> Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP=
 + BOT")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022134926.1125=
473-1-sst@poczta.fm?part=3D2

