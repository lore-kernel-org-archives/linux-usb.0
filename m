Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919466;
	b=CoUKIzVa9CRMC7QSOksFBQzET00V7QFq8pgB/vZMbubzQD19/BZ7QQLTLTQkPYbDoIg0
	 QZ01lahPOB28p+7ntsdro5XCy4ZMdRVtCRXzaIF70Ef1WPcE6RGL1Y6OGRy/pO6jP7LS9
	 holv3mjSLHzbNB4GjsBVVDIXmgrBKqnV5+1Ah5cIDLQH3VgbEXMeIczYvugykUOrUmpnw
	 Bgbpu8lydei1cG4AvO2VmuvrLZ3h1cAGUaHHfrM+UDFPgDyNafYWuzEZUXygPi9d4OXAX
	 WzJ5Y7JotDaAtkOe9earD/sdxkH2Kz/fievvjDEjI0lTJcFBt3fS/cDsk1qdLTZm7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919466;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fDp94CIMKpWm7OIlxNKJG0X06/8S8g7LUoXLvUNWh8g=;
	b=pNnIks4ViTB/tCRn3oJO1ZqWxSwXOElI7KKjhry2CdvyD51kCryL12gTTUvx93EheCLq
	 f9KM+S2wkJ2geLECKpmV1Rl5K7kAJw0AdBzs2s9KEkuwKa+4ykhToIVYVhZUIOPPh3rMB
	 nlkrxlG2B4WpS7zEXEqDOl8N8hqRN9leQX7JtRAiD4UEoUtcme25F7dqjab/wT2xsQ3lj
	 QmS1zaJnfb1OAID85xtZZIC8WXx4vTLXu299sb1+A9NAH/Qlmg/EjwGrhRV8iUcSMcFvc
	 ZhPV9VFefFoKHee5PmyMOCXYeVCYOxRR28TBAGncmkfssBBfgLg9XoS3WfSgPd309sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b1I/ctFc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6C3606A330
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1I/ctFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5743F1F000C6;
	Tue, 17 Nov 2026 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919466;
	bh=fDp94CIMKpWm7OIlxNKJG0X06/8S8g7LUoXLvUNWh8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b1I/ctFcJU7O3PAFTlRiY+HinZtLwH8wP3D+FO8JD4ZRwClS0qu8zkUtiNvOoitks
	 eV3komjw//xalfp/+97TF9+QmbGSOGrFSipQaWQsWSbUQ3/fSg4qK1iHrc81ovkpei
	 2SI/rYX6CkMyD3sJ2p+RB+mncwSisJFXQZgRAtJT4LkiLWRO6Y4Bw2DZiUdjO9+7Dj
	 12zIzzVnd5FW0muio1biKsmxfZCyiDed8cTbLrYV1l1cML4L+GngJw6T+zl1dD+fDU
	 mxkl4d8o2mpDuxJHfnJHisF3l/e6AIv1t7zgEalc1Uz+KbIJQW3O+IiKyUn3QnDMLA
	 PwAJhICbntb8A==
Message-ID: <sashiko-outbox-218784@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-1-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-1-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:44:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
> has no internal OTG registers, this requires flags which disable
> related features set in platform data. Add a compatible string to match
> the platform data.
>=20
> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
> work, add constraints for it.
>=20
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D1

