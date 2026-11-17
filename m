Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935738;
	b=qWAgriDMDUQTCA5hTdLLgGKFxIT6z3lLnJEuVjdMKmpuZ+fddGV7t0C5AY3+rM8+H4E2
	 VXteuDgPGr2N7g9sS3L18+ynb98t+fC1MJQ06T07VKKVOo+nJqOiCMvfZJHcQiidTili6
	 6cL2UT8DbIiQKWzT9N+Og6VuepFWkS9oWJjzyoa/6Lyoqbk2/gVHmAMQSNFfbMFnVvIet
	 cGMNhod/eMwiNPHTbEnT9VwaY+kCmmkjg1KgqP9UqFmSJDPDrlGbBnTSY2meL1yCNq/41
	 1JBpvHiDeLfCjwNd06j4m5x3xqYMvJ+W9dXkSsvE/fl3Ew3X1pikP3bf6T7cPR0g/tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935738;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qHNUBj3KDDXN6pdrUCVwnyzUoPgM8/rmulz8OCcTz1k=;
	b=PC+dWbXx8227UR5unQ4GKGXBHVnmG5kH9BkbbRNRIxs4d8G/h4h4+AgJbI/PFrjgkgPN
	 Pn6XZ/k9RFYZzqM42t8WKBIR/OjQgQyiLD26WgbY1rfpX4WTcRDbacDOX2q/x+rcOeSmH
	 ei6MHNl8BtGmsnxzUSr7z93aK2mzjnKA3XgzHeEX4uVsznE9lPmTTgPPLWZc84Yk1TghD
	 KQzveTnkbZ+T+Bid3BEQFU7tMSl9COfHl4E9bQJNvzbzlrXO6eI3VPCt2oT96RiHMBeoN
	 r/VNWZrVOYuVTfnf6nU2cE21LvI91kFGIVTJmDzu+5yUf+j5OMgpHwj7kW1cdehMfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTjMrLUY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE40606A330
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTjMrLUY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B93A1F000CA;
	Tue, 17 Nov 2026 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935738;
	bh=qHNUBj3KDDXN6pdrUCVwnyzUoPgM8/rmulz8OCcTz1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iTjMrLUYfC1iv3EcHqSgVySfXsuByisOLQFzWVd6dYDJOYzuJ8nEj5z+jkcFzBWUK
	 Ps2H43HUsv8FFmFLy1DqgGDZL1cxlxhOrZOzH8dfadu+IIWBxkWDMK6kBst8TptLtD
	 mg7klopI1lHQjyyD5d5lMDp8WpdYekO58TFkBr/99Ta/3byjN9iPq71vd8efdsDIqO
	 XwArH47HnLETFObf9DXsnA+Azyxe3RYAZh0aCd6UC82yZdzmMZZomoBolPTLat0jl+
	 ZI/gznCjlyhqnGt1NVEsgNaQzQ/yYTFcW9H6pghj5NIN8wI9dVbpX3JT+5F9aleDlH
	 /HMN96EBaAp2g==
Message-ID: <sashiko-outbox-219218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] usb: dwc2: hcd: fix possible successive vbus
 supply enables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-dwc2-low-power-fixes-stm32-v5-4-0f197e0e6362@foss.st.com>
References: <20261117-dwc2-low-power-fixes-stm32-v5-0-0f197e0e6362@foss.st.com>
 <20261117-dwc2-low-power-fixes-stm32-v5-4-0f197e0e6362@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:15:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Relying on HPRT0_PWR value to call dwc2_vbus_supply_init() shows some
> corner case resulting in vbus enable count to increase.
> As consequence, dwc2_vbus_supply_exit call done when clearing
> PWR bit won't disable vbus (for example upon suspend request).
>=20
> Address two case that has been seen:
> - In _dwc2_hcd_start(), external VBUS supply may have already been enable=
d,
>   before entering dwc2_hcd_reinit (e.g. the controller is in host mode,
>   without any device plugged).
> - Upon resume from low power in case registers have been lost. In clock
>   gating mode PM suspend flow doesn't disable vbus while in host mode:
>   - dwc2_port_suspend() enters clock gating (it sets lx_state to DWC2_L2)
>   - _dwc2_hcd_suspend() nothing more to do as already in L2.
>   - _dwc2_hcd_resume() - checks HPRT0_CONNSTS. If it's not set (register
>     loss) it sets HPRT0_PWR and call dwc2_vbus_supply_init().
>=20
> Fix this by adding a boolean flag to balance vbus enable/disable calls
> instead of relying on HPRT0_PWR value. Clean the existing checks on pwr
> bit. A mutex is added as dwc2_vbus_supply_init/_exit calls can run
> concurrently from hub_control and dwc2_conn_id_status_change.
>=20
> Fixes: cd7cd0e6cedf ("usb: dwc2: fix unbalanced use of external vbus-supp=
ly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dwc2-low-p=
ower-fixes-stm32-v5-0-0f197e0e6362@foss.st.com?part=3D4

