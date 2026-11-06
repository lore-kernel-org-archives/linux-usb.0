Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987148;
	b=OdNFwBnrxd2NBxZLgbwIBzUvTWQWD8ZKIRd92N06CNTejfCPEmLVKRUetcq/ZP61tV5f
	 9dAXS3/d/cUpCzzlGM5c3LH6SHrlDOVyK5UKBmkeiidvcjwd59LkD06ckcZwAwVJ3uFqh
	 XTUHBlyelxUBZ9dRxQvRM3vvgMK1BcmjNJrnLI+he/0E2UKD7Cu0Kv/nkhdEK27MWwJFH
	 6p9jaIbZlmw9J05khg+2Eto1sLRjnjrT35e7oemz4E+UWOXF6w6dDRB+FQhyqQhDWn1o6
	 RW72uIDOaG/nR5sYvS0x2iyixL06TQNTOJmKaHhs4/04Xe988CvHGbT7vz/vgOoRi6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4XiYi7q0dGV5qPJFG2kaT41cw9uXjo2kk5PzgDtJxCQ=;
	b=YP9PlNehNgvFZcCiy5XDqyI0eNG2DI5lMSINTkCz/YaxlUokGQrFxgZ4gPC3fzyVckou
	 4BfvJ7h5Q05mqOwmLzDdS9H9hLjnXRBwF0vQNwDWOJ0zOtPJXIi8wiiMr4vlKOLcz6YXz
	 GcMAUfWcAPxZIO4ndg2ITHq+qj+t30R0ab1zGETr8EMyHwJMwaiFrSkNP1ggyj+R+H9ri
	 He0iLxSmpCkOE7beQ5+3kvQtIxGXqlSRfvKlkH985ZlJjMW14xW0Ogn0rcRhmc770AV4s
	 5265Y7Il7cZGz2oZLSnbOUCP/5xrQ6ZqXI0hh0nHXUUXkaZAqhocG5sVpk3WGv3+d/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5TWjHaD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91631606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 17:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5TWjHaD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5287D1F008A2;
	Fri,  6 Nov 2026 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987148;
	bh=4XiYi7q0dGV5qPJFG2kaT41cw9uXjo2kk5PzgDtJxCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5TWjHaDg8GMkSd08oxS/nAcWD4pM3S/S2C4VApOtT4hO6UEabsUleTOOdAPfE/sG
	 GfpzCl8YCUF/POzjp5Xv+07RBCvMTDOo3qQ3QPlOU/FG6phW5FonUz5TOiTalbUHNw
	 RPAv6OfdqDPMK0eHwEgJlPui1DEVyOpUiJ1pdioh6eoix2iV3vt0d0T7FsVAk0aIF8
	 zJMfDocXjPQOty8AXrZ6EHc92W9MnKkle7T+WwOW3fmUh6Qod+v+Q4ayfgTJLAgGpW
	 MQaNTzxcGGRXOmqMbOtFVGBhLtBWkjqra6uaAjC3rwov4G06QqCQwHlKr+aHuqXlMI
	 rgOrlgfvlBAqQ==
Message-ID: <sashiko-outbox-201966@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] usb: dwc2: fix a possible interrupt storm on
 stm32mp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-dwc2-low-power-fixes-stm32-v3-3-68d2a0e9bab6@foss.st.com>
References: <20261106-dwc2-low-power-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com>
 <20261106-dwc2-low-power-fixes-stm32-v3-3-68d2a0e9bab6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:45:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On stm32mp1, upon resume from low power (stop) mode, in host mode, a
> port interrupt storm may be seen before the hardware is accessible.
>=20
> The core is able to generate interrupts during system resume in
> platform.c when calling dwc2_resume()->__dwc2_lowlevel_hw_enable(). As
> the PHY and clocks become available, a resume IRQ can be seen with a
> Host Port Interrupt (PrtInt).
>=20
> The wakeup interrupt handler make the controller to exit power down mode,
> but the HCD handler returns IRQ_NONE, due to the HW accessible flag has
> been cleared in _dwc2_hcd_suspend() earlier. It ends-up with the bad_irq
> handler.
>=20
> So set the HCD_FLAG_HW_ACCESSIBLE flag when the resume IRQ is handled to
> exit from power down mode.
>=20
> Fixes: ef5e0eec4764 ("usb: dwc2: Add clock gating exiting flow by system =
resume")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dwc2-low-p=
ower-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com?part=3D3

