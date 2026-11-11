Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386072;
	b=uHhTUNizKgwqrKOtTvU4UFViuBWc4GwSWjbUgHs7VVEj9K6YsSm9L2us5bEn7ruzAXhx
	 vYvKPJwn+9imkyLEggt7dYnz7K/xOrdpPCRKUT2HJd2amKx4r1VmYQYqciSR/ojBdim3x
	 Vztk0qG0uen5vq4sdpc0k1ntwBagT7zTjOvyTN1B6QKao5Q82ARQVfXAnmmV5p6KEsBWT
	 YczL7TFStnSU2yMsDkWGpme8Jxjh9iI7H+qoqZTYtNjvZ6rCdh77oD79v+hbexpOWxUgB
	 UYYpr987peejnWjarwYDUW3XenG2IZzOrZbAInqYmwRFa8dfzkH30Q3w+tE2HR/7eRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gkrIN7grscyAN1Tpg8KtXb+iXCgvVfbLQcR7djNEHpE=;
	b=thC0j/1Z1QOFzw2AtiB6rmDHXlDrsid6VmyMLaT2dbqAnWXINFO4Lta6XBd/o+Vtf4ZH
	 hpp3DyF1Hog9OyFg4MxhpAfJY+LXayDRHzdGS8d9js15jMK286vkYEAlgT0Bh0NcJwSEy
	 UedQix/pjIB+eKB/w+1b4oVX1NIxuT9lU4h8ZIgIwQrU10WMedrikWgajOOH8cFiKpD4J
	 Jr5/+GS0BAsJnuw9CJmDcOkx0l8/8YA2JgCTy0dxS8fynfiHX9Xs6R6aIq5084FVCo2JQ
	 K7j8TYqExMTu/MpEzimT54Oi9ICrbrM+1lOSpIrJJWJVrFanBPqDGmPCyPV1t58P3sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXjcYt5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17653606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXjcYt5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2701F00A06;
	Wed, 11 Nov 2026 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386071;
	bh=gkrIN7grscyAN1Tpg8KtXb+iXCgvVfbLQcR7djNEHpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dXjcYt5Jo2c8zJZLduqjlKLrhI07eXnDQHodzLhjyHTpzxfLps6Fk9aa8Dk/u33sc
	 KrRWPLeZjHehXgcyEGhGX02nBQkE4Xy/jh7hbMHpIHxsSbNQkLDc1jilbGWZ330O92
	 dD+pLm3WCgck76HIcplXiAunrFcZk1e1WDnEz7OYsr4rqNAxvOFySIyWBk49U1SMyt
	 n5oYJ3Nt55vkQiw8699V8lYx1IAuXcdXFpEmOiUfH68YqrH9gy38uyKm8eQobnwyIT
	 o42kDg6i2axakCU806MoejccMX5WUpXnCNaMr1DaugFSOe+uKlsclWCmTFXVLFx5t+
	 W10xcd7c0MLgg==
Message-ID: <sashiko-outbox-208616@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: dwc2: Handle OTG interrupts that GINTSTS
 does not flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-sf19a2890-dwc2-v2-3-cba9dd4a4256@telaak.dev>
References: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
 <20261111-sf19a2890-dwc2-v2-3-cba9dd4a4256@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:34:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> The DWC OTG 3.30a of the Siflower SF19A2890 has battery charger support
> enabled. It raises the MultValIpChng interrupt (bit 20 of GOTGINT)
> without setting OTGInt in GINTSTS, so the interrupt is never handled
> and the kernel disables the USB interrupt because nobody cared.
>=20
> On a GL.iNet GL-SFT1200 it shows differently: after a few replugs of a
> USB stick the system stops making progress, the console repeating its
> last message with the same timestamp, until a power cycle.
>=20
> Add an otg_int_unflagged parameter for such cores. With it set, the
> common interrupt handler also reads GOTGINT on every interrupt and
> handles any OTG interrupt it finds there, as it does when OTGInt is
> set. The SF19A2890 sets it; other cores are unchanged.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - handle the unflagged OTG interrupts only on cores with the new
>     otg_int_unflagged parameter, which the SF19A2890 sets
>   - do it in the one place that already handles flagged OTG
>     interrupts, and return IRQ_HANDLED
>   - describe what a GL-SFT1200 does without the patch, and the fix as
>     it is now
>   - subject]
> Co-developed-by: Joseph Telaak <joseph@telaak.dev>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-sf19a2890-=
dwc2-v2-0-cba9dd4a4256@telaak.dev?part=3D3

