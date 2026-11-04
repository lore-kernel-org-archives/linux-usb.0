Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798626;
	b=uVhIbqlw6cz4yiaqGkH75XKSpB1TgtHxAk6zmXK06rl2h7zrm9dwsC3HbAH2lYsoE1rB
	 zyVdyNcVMotsECFJOYyf4C9saPchyXMg7Dx1HnKrEnY7sDPU4dGcTkVD3xPLUeE7veUuf
	 tTFXyyHcXtOuFkQytwCBYTYiCYID/quYqjj/NaLmybZLyuePtOYDhFpRELxWOLh9s+zUh
	 Zgdbj1FpQVlTbP/K3RqspbQEuOQMSyNsyjHB8Kct+152PkhtPxxgGojTwP3wR0LpphzLq
	 XktgBP2k5eK2a4U1ABRsK/cz+pjHa9vv3ig6QtYtE9JfOKdcvCNvmuCETQ+L9d0FbSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798626;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FSOKoZF/bl9Ln9qtMNip3FlaX8iBu7/8SRsdB54vt6g=;
	b=d4VbHIQLHVv8jCpeZZE9z93yW0dZ9dnZjihaQpTEj+6tPpQTjiZ6uBcFoAr7h6YUWgmu
	 UuLwqdQVJZMhDeJ97LUk0a590YjRW+wJ8GHFKystr+l4QAnrsw8YKTfplgyWdLzpm+YAq
	 bKxG+vLtOYCJotsS0ucuf7V04cOAXOr/rcyrvQkvIe+vUAKa6WQdbXQYkCt0+4CM+EyUa
	 66W+GSwe7KLJGkBEBF2K6GEDufw0+TGTLg3UKdYGX2+6Q6z/ZteMSgFnAFKBIDa+pE2vz
	 sMLF8UH9/Y4TJmWqxCEfHJQG/bTQ+1PRu8wpQRowpbX6/3Dqn3ZM78ayHG373ATG5BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLztr0Ey;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBF5606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLztr0Ey
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A12A1F000C1;
	Wed,  4 Nov 2026 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798626;
	bh=FSOKoZF/bl9Ln9qtMNip3FlaX8iBu7/8SRsdB54vt6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MLztr0EyJUlY6IThk/N8eD0oOKuI7z7GH0gsz1jlp/kj7iUaNO2F8E3dNYirh4gDd
	 PaAHp9lzOrQYgQyEiuFiKcXNoGIAr9SPYT8iMKFZOzUzOVPkvfn9/5oJObH7JAJv2T
	 Nxd/wtRhwe3x5WzRKcMdwQzvcfN/E7Ncevl3Vhgjq5SOBKWMm6uN+ITKb5v9wLaGvq
	 mbUzWLNYNjF3HTNFET0BvblvgrLjefIheRus4rQftaxBInzMSA8Zexa8Bat/AyvpCi
	 Tocozq5bEdzKkO915B6dw4vMniITdI1OXm3qSrMS1UDR0dvyQEDWUJltMFJjc8ct+e
	 bnjKmiVwr84uA==
Message-ID: <sashiko-outbox-197337@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: dwc2: wa for isoc packet tx fifo flush at
 periodic frame boundary
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104-dwc2-fifo-fixes-v2-v2-2-2bb13820f662@foss.st.com>
References: <20261104-dwc2-fifo-fixes-v2-v2-0-2bb13820f662@foss.st.com>
 <20261104-dwc2-fifo-fixes-v2-v2-2-2bb13820f662@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:23:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> If an isochronous packet is still being transmitted, when the end of
> periodic frame interval elapses, using dma desc on dwc2 controller,
> the device wrongly flushes the pending packets from the tx fifo.
> This can lead to a huge packet is sent on the bus, leading to the host
> finally reset the bus, and re-enumerate it.
>=20
> Workaround it by tuning the periodic frame interval limit from 80% to 95%,
> on the affected cores (2.70a to 4.00a). It makes the issue very unlikely
> to occur.
>=20
> Fixes: 540ccba08599 ("usb: dwc2: gadget: Start and complete DDMA isoc tra=
nsfers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-dwc2-fifo-=
fixes-v2-v2-0-2bb13820f662@foss.st.com?part=3D2

