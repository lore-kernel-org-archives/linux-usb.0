Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084470;
	b=tCvPjp4LtHaKQ/shYdm3pxqbLQj95+VlHQEaJd/5J2K+aH0TTSoZghC2S2VgshCCvj8I
	 L/tT7x69mSEJMoJP/IZX8kt4fnvt+mhfUXnJh9+O2FA1shBeHA3GbWhhmmo2kh0LwI855
	 xP5jbLNbyOjnaXY/kqNswcm9YYiuqU1mZEvtticNOgnwT8xM5i8D4RXi6YPjTOmnmYeFV
	 luGpA1Tzi9ALjHuS/St3sYYS/Hp23k/GyVKDREO3JjDtOHM56H8Ggsm+dDKUm5MYj12QE
	 ETxrPWtFCo1k8YrlIOfl7YodgywK1niY5INMxhLKjyuyLWU6lIkSizZz5wK1Jclty7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/eGA/9FyxHZlhxVbur3HLQR9Qp8Z0tGBZw8xVbTfyoA=;
	b=pK2xJ2opBmHOnCfv/+JdI8n5sc7ljvPlL2kijRp1vi6QKCw5uA/hT6yfDcplOz3TVlMO
	 BgbVoMM2HfggdB+L8CXaOvWs8J98I0ynNA5SgCAipWsj1f4rEA91Iv6pslGhf3I066tPQ
	 ZJShtcb+9snpntoq0p4yrCtevQ3brW8IEOXthlWHEv682FzA3o5G9P9ArxkaqzYO2mpXO
	 QZMYLrA3hyn2UyYj92XOToGvAySlsgvjPc2mWofRXlY+UYTDP7RSJjZS9oRwKJjT8XtDn
	 1NjwkQypwJrWsGeKkj1rUqZ7tX3NwyyIeZGjTVd9XiDtU0SN2MBTswkK3GFFn/fsHjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z430ccma;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F5606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z430ccma
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987A41F000C8;
	Thu, 19 Nov 2026 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084470;
	bh=/eGA/9FyxHZlhxVbur3HLQR9Qp8Z0tGBZw8xVbTfyoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z430ccma/GqwiDheATISnSHwXvbHjs+lzVODchdRe14Lv/qFr9dt+jQJKq7XULg0o
	 h+TDL69u7Y0Q8k3O1Kg6opivpmVMlPIEkQoYhGqWSBR0Tln8ip4u5XZZ46q5EJQV+5
	 j9Zlipe/ZQCTfTu2JeM5rdA56B+uvMlM3Rgi+qfTT3J9h4W/6UTz1EopT0f+zVsW7S
	 rpvvJ5u7ZCiXku1B1JkkbZXcezUgahCGXAKM1+VFJnnUm78xI3CsJKMVccZFUkcQ0v
	 GnKZ2j/C3/5kbKprbXb9mWcEtlvQzHrejk9tfj6bWNrtM2cYRxko1n1yfTs3IYeWqz
	 /H1Sb5r+ounsg==
Message-ID: <sashiko-outbox-222960@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] usb: core: Pair ports of different hubs through
 their connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-usb-port-pairing-v6-1-32bd7e36e426@gmail.com>
References: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
 <20261119-usb-port-pairing-v6-1-32bd7e36e426@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:34:30 +0000
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
> On the RK3588, USB 3.0 host 2 is SuperSpeed-only and its connector's
> USB 2.0 lines go to a separate EHCI, so pairing by port number gives the
> SuperSpeed port a dead USB 2.0 peer.
>=20
> When ports 0 (USB 2.0) and 1 (SuperSpeed) of a usb-connector graph lead
> to different hubs, pair them through the connector. The peer must be a
> "usb" node (usb.yaml) or under one; a mux or PHY there keeps today's
> pairing. Root hub ports are found by the controller port number; graphs
> in the dwc3 numbering don't match and keep today's pairing, as xHCI
> registers both root hubs before devices enumerate. connect_type is
> looked up the same way, so such a SuperSpeed port reads "hotplug".
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-usb-port-p=
airing-v6-0-32bd7e36e426@gmail.com?part=3D1

