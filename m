Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43FF4CEE51
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052441; cv=none; b=eaqJ/554fhXCrefzlWMYE29qy0OopOsqL06KTKw9TFsBVzMiDHhmtTrydlGyhawT+wPr1u7IRk6N+OMnuKX9wFPrazfH/j0BVP3JJMK/ddasuIX2z+YDkyOmDdr75eoiHfI61VpHYVDKUgMMfTbVPdS6qiM26POzJXX7IuiQ1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052441; c=relaxed/simple;
	bh=xpdBzxe6zN3JQW45SAq8JzGCNF8423ojCfZenDZb7fI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KjIxcGNGbA1e6gtQU8pyzvoTNJGLEHm7I/wO1TaXTS/JB/ZhMLCOfCmLVsdRxq4eToAl1X3bzqrtvP+lq8JNxNfoEbAdKkdyurl+LO0pyr833G74oTdQUxb/cmNVsGhfELXWSFK9xHeKYPSUGikM6F/oUe+n4ERSJSFblgtuV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dp5/KuUf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dp5/KuUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A0F1F000C9;
	Thu, 15 Oct 2026 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052437;
	bh=xpdBzxe6zN3JQW45SAq8JzGCNF8423ojCfZenDZb7fI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dp5/KuUf3/u3rFbtJBur9iYISilQcJTqfndfPk7AAV3lb0d4cXewTtVL7vlBFAJE3
	 lamI78ypCcVbejYuDrzeTL6SkFVeP+qlxKBNeSwLixV7V8lMDP3oCVF9jrfyTiq7uV
	 wE/WuSRZbpv4MdNol3xyNJBH4VMQ4cv+jBFIATYDyFYGP3lgLQpjakjj/4m3MDcI4Y
	 UirQqq3lFUHb9eSVDpqBo2gSvOK/Pr/m07B05098GFQE3q6Rp8VZW38zMG+SHM9gBV
	 KoJAkaWvTcZ/c5449OEXX5MJ5d8DO8TvkLi90ghP1u1/iIWiJkxl4FgBwYzz0qPO19
	 YCOWDlovTjoWg==
Message-ID: <sashiko-outbox-172467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 04/10] r8152: split rtl8156_enable/up/down
 into per-generation functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-5-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-5-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:37 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> rtl8156_enable(), rtl8156_up() and rtl8156_down() had accumulated
> tp->version range checks to cover RTL8156, RTL8156B, and
> RTL8157/RTL8159, including an early bail-out in rtl8156_enable()
> that skipped most of the function body for RTL8157/RTL8159. The
> result hides which settings belong to which chip, so chip-specific
> register differences cannot be reviewed, and cannot be added without
> touching the other families.
>=20
> Give each generation its own ops callback: rtl8156_enable() for
> VER_10/11/12/13/15, and rtl8157_enable()/rtl8157_up()/rtl8157_down()
> for VER_16/17. rtl8156_up()/rtl8156_down() keep serving RTL8156 and
> RTL8156B (VER_10/11/12/13/15).
>=20
> RTL8156/8156B/8157/8159 share most of the up/down sequence, so move
> it into common helpers, as RTL8152B/8153 do with exit_oob/enter_oob.
>=20
> Each extracted function reproduces what its chips already did, with
> the guards that were true for them inlined and the ones that were
> false dropped as unreachable.
>=20
> No functional change intended.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D4

