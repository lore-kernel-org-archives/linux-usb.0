Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114883;
	b=oEbC3ERHCSFdKD+OBf+LC8lHL61OC07KAWcJMgDg5uys1BcLG/UXKKHZoX9KalJ9lGIQ
	 fyhLa7jLlf2dLDQxjhZT6AgzeveD4SYRS5hmAEQP2+OdXtuxZWcrWkPvW0Y1/DYKKgh3g
	 6wPOQo68CyZ4UoJGNl1Z2sDh3aNWGiVmBrSbG2XTe8ZipkVuxHd4CVMJLOGaUhqvzHWal
	 QPO27LoQhjJW53Ovq2gav+cH3KsvCMX+kdGwzSW3bP3dUnaU97dKoQPFRFhUth/As1lRM
	 /Ez/dNST94xEZ4pU7lIivR+fQiCwwtg2bc6SSg5jmx1qyvwhymGPmvmykwIgjyC/OoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114883;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qgEDV40rx4YJMJJdQ2GWua6833DCs0XcRW/JB4gb6Hs=;
	b=FOZEkN1WP0xQIzqHoUYVedWjoRpKRX+0f/NdnoDdA/XQG6J/F5C+rwWeVsLqOSOLMFAS
	 aBiNftsBpp/yOBr2Oxu7dqJW4QTygIF9xnCfzhzQEIvOsATBjdZZnK95PvBA3bG5FrMVI
	 1oFFxm7nzXO7G+J3ucW06rTzMQeSWag2IkMGOBjPX0zfW37CPly01X2XmS67s6sXYeRIU
	 hylOf6rhnykFESH3E0o/1oaA4F9XSE5pBZ1PhWhQgGSp38unsTIcyhyfe7KZBBaWpct1E
	 Wt7eqd1Ov7pWgcLu5kKlgCB7DD5x1DeIn2GN7QeC68HuceJn7vuAJCxpMQrcXyKztHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhFPJNQ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DA8606A31B
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhFPJNQ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E601F01825;
	Tue, 27 Oct 2026 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114882;
	bh=qgEDV40rx4YJMJJdQ2GWua6833DCs0XcRW/JB4gb6Hs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KhFPJNQ8fpOL5LcamWCHczoLG3YlC1HFVuFN5u8ne5LlWewjLdpOQePk17miSJDah
	 AQfxZ1t/Bw0l+RnAMNcJED5AsOwR2cIldFTDfL5Gk8Gp+GYKv3GNy9shao9ad91ZVt
	 XcaEUn1XRwFrlGr20puKKpSzK6v+5WA7Kgqv6N9WgcKp8qx0OYCZXboBhlRMExOOX6
	 MRdFRjl2JD2N1c2seOqF+MP9dCYw23NJdpLd3p/jlX3onQj28J9noeWIq5sCKPsOR9
	 8XyHz048iRbp+uJmUQbq7vI1htmwXBy8mjNS0oJ4Wvn9wxcn7WwZPrl2azvNgRczbN
	 HYWA0XjaaHBhQ==
Message-ID: <sashiko-outbox-186837@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/19] usb: isp1760: wait for the TT clear in
 endpoint_disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-18-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-18-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:28:02 +0000
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
> The driver sets qh->tt_buffer_dirty and calls usb_hub_clear_tt_buffer()
> when a transfer to a full or low speed device fails or is unlinked while
> it is running. The hub driver stores urb->ep in its list and
> hub_tt_work() hands it back to isp1760_clear_tt_buffer_complete() after
> the CLEAR_TT_BUFFER request to the hub.
>=20
> Nothing keeps the endpoint until then. isp1760_endpoint_disable() frees
> the QH at once. If the device is unplugged, the unlink of a running URB
> queues such a request, and usb_disconnect() goes on to free the
> usb_device and its configurations, which hold the struct
> usb_host_endpoint. The callback then reads ep->hcpriv from freed memory
> and, if it is not NULL, writes to whatever it points to. A change of the
> configuration or altsetting only frees the QH, under a callback which
> has loaded ep->hcpriv without the lock.
>=20
> The HCD has to wait, like ehci_endpoint_disable(),
> xhci_endpoint_disable() and fotg210_endpoint_disable() do. hub_tt_work()
> calls the callback for every entry, also if the request failed, and
> hub_quiesce() flushes the work, so the wait ends.
>=20
> Fixes: 74ad60292bf0 ("usb/isp1760: Clear TT buffer on interrupted low & f=
ull speed transfers")
> Cc: stable <stable@kernel.org>
> Cc: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D18

