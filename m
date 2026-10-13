Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410083E315F
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901031; cv=none; b=Q6cQXmOwoyh6CL+nIUjREVGDXFZcMljXW99w9FI7acsVBAG36sT+xA2U3o6gx+uNgrT+0YACv+T7FW5PWXevyqxTklNxzkwU6o3v1u/I1o4arPjBrK5adeuRfjUOTd8NddzFSYZXxieywF74aEZfHFQEb/Qza/pgD0z8KoEVGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901031; c=relaxed/simple;
	bh=+XfeOmE6MjLtrcttoC2tMZmMM6yRD9d36yr21Oce1Fg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uaK/AdqnEmk6yvX3wyvb9uLmLxaxQeUhYygc7XJO4z4fxbiT9tC5FP9mEb65OsgK4ZRWdxggH3Fsi4Tb+W0RtN7BS/JysHz2foLEwzl9KgmPz0JMy+VLLNIuKwAUWOafzhrvnmqSrfCPTBJ4yjrHoLFGU/IhuJXLl/+CJ4xL2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0iHm2Rk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0iHm2Rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0871F000FF;
	Tue, 13 Oct 2026 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901029;
	bh=+XfeOmE6MjLtrcttoC2tMZmMM6yRD9d36yr21Oce1Fg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b0iHm2RkUYup1liyMS+aAmlNV/loHzd6S80LCmft2mEF55wOnU/T9WC3M/+toE1sM
	 nCSM7YChkktAgYwiKdnDjQBndIq2mdV3pgOUR0xX3hQdAyWgZZ7eDtlTgGKOnqGxgj
	 ZE+Lc81g2yxOyOSHp2VAM/RHIXMWqMmqCO2mkYUIQLHkNc5SCpRVrt7H/ufwGEL0Hn
	 YUL/qP3JWRhrVb3D1kg/pSUS5wqzwfCY/Qtp8dAC1Ou39xnwDI7MVy6A4nFOINaSn1
	 6aWryzxxCBOfwulWcy7UN5WouhtgRN490jn7GTinqRDc65oHx1jeWM6Gu445nPjEat
	 zbRVFutvUrrQA==
Message-ID: <sashiko-outbox-169895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] usb: dwc2: hcd: fix possible successive vbus
 supply enables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-dwc2-low-power-fixes-stm32-v2-3-79865a4f1b63@foss.st.com>
References: <20261013-dwc2-low-power-fixes-stm32-v2-0-79865a4f1b63@foss.st.com>
 <20261013-dwc2-low-power-fixes-stm32-v2-3-79865a4f1b63@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:17:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> External VBUS supply may have already been enabled, before entering
> dwc2_hcd_reinit (e.g. the controller is in host mode, without any device
> plugged).
> This results in vbus enable count to increase every time this occurs.
> As consequence, dwc2_vbus_supply_exit won't disable vbus upon suspend
> request.
> Fix this by reading PWR bit before and after dwc2_hcd_reinit() call.
>=20
> Fixes: cd7cd0e6cedf ("usb: dwc2: fix unbalanced use of external vbus-supp=
ly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-dwc2-low-p=
ower-fixes-stm32-v2-0-79865a4f1b63@foss.st.com?part=3D3

