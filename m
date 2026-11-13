Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599368;
	b=0A+UeobqsLLe+VWnXfTlhPcSSEDTtKlGS0BWEa3kMizrCZ7aJYhf4cBGWWYs3Nd2Q51/
	 hSOgaXetlM2D433sOAniKQhIW5wDjaB2niK8l8Fx959IkaCwmXZuK/PqS5rnRfS5r4SL3
	 Tk97YvT4LvH85fII6U5/sYKQqKdiHA6D/7KPjOFOBYzlmKPQITgeqmpkjw7v4JJ4ArBUl
	 5Tq+YdyM+80Siw6uCeuDIaSzoLYi0NfrByquVlRHx1dytLGAmhgSy9H2Pg5ObwOeUkrXb
	 nJAJ4L5V3Toci8zLJaZse6OxeDZeWpoOYCrhbQjYdkaUjvEqFdsdH/pk5pSinMNApiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599368;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iYcv7Xupq4ln/cAbRdEA9fqeHs2mmZ7OQQsvxTxwXEM=;
	b=vy1g2aITBya7dYr2SKQVpNoMsHHmLpryOJyoPW9JnT/xMUXBZmzZRRGvz6NIVqErQ9aM
	 fUbv+htPJFegRKZf3BsuDhRrUH4WEcQckZSS3CVQyXdbGcO3RTj7JxPFy1IKeMBlJV05M
	 xowKlZJlKVVlM2qoFWCHmttRSoBoKarck1xGb1r/EE0yiDzcZVkRNm5aNIINMWXGQLxWq
	 FgfbP7ipDnu7GN2JUUneHtaM3MbJ/aAr8xiuu5u/RJMOs60+aJSUn6Kn9rCj6h544lTOQ
	 blHk83MfN+DwSsKxpWclZLjAVStnE9lixPf5fdzn7bUvMwWjmwUs6OTMcY31KacE3mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoFMSNBJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9F606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoFMSNBJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D24E1F000C5;
	Fri, 13 Nov 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794599367;
	bh=iYcv7Xupq4ln/cAbRdEA9fqeHs2mmZ7OQQsvxTxwXEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WoFMSNBJ4lz0zr6eSy4jsGfutI2RkKLmGVQQFPs+V7H/CpnPdFESLYpm9Rh1Jnw2N
	 l0xKZJ4XKm9aN/t6SnO67w1BjAgbz2Xdg0/uZ69prbN6TmmPDiTW8YMefQPTWVj49r
	 docek4tCT6tr7EIlgBquCe5h17WGS3uKrql4tlVQTFGKhurNbFgAxw+9pKwi4JMz6g
	 ctunywRPHuBZyDtvJhJnzg6FpC8YHuUDpjvFxl3rrsdn0xaVMtkFnIGWRHj1Eor9/t
	 zdrVzXUUmZccF2XX6CRWPjeq2oOk8C/EfrVdVAWt/SEv75medwiwyio+juhxojsZ8o
	 RwWPMW2RQE5sw==
Message-ID: <sashiko-outbox-213572@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] usb: dwc2: hcd: fix possible successive vbus
 supply enables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-dwc2-low-power-fixes-stm32-v4-4-08a8c962a09e@foss.st.com>
References: <20261113-dwc2-low-power-fixes-stm32-v4-0-08a8c962a09e@foss.st.com>
 <20261113-dwc2-low-power-fixes-stm32-v4-4-08a8c962a09e@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:49:27 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dwc2-low-p=
ower-fixes-stm32-v4-0-08a8c962a09e@foss.st.com?part=3D4

