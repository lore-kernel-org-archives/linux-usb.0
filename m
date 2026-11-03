Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687057;
	b=lV+5Z4MyXtZ7HqGrQpCbXaKceVtdQ9u5L31eXHYov2DDBFu7cNGMBMPSLNyLcNnK64nN
	 y059X+EBEE+Yrfcjd8uD7B2dd7WfAOxXSrUdNzjQSrjJc+UUgfGEPjxL0dTcqv57+9bpY
	 M0uL2j/3w6rWyFFEuLTRRkQYP96NHdOF6EC/LDiwmpqslJB6Re32YcPdCnUnk6bnhAoeh
	 oJnIAwi0L6WpNm2f0bxgoLkc5P/AtPPuupmCi8Ca+amBd4NMDORkT1vCrENAtF5wgRyS3
	 zBrn+HdJg2e49Be39AAJa3mqR4YeFCm70sA27zAj347tKlkXez6MFGnaB8mjlDho+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687057;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aa/8SrCqSl3D7FwbQ7xBdMRSbK2XyMjo6GgBT4qKF0s=;
	b=LOfRKY2oALv7U36EfCjMdkbAN9+PUFKi47pVUUMCFmWuTXRX29dp2mtYXwOeUZUjcg+p
	 s42AcX9LaGbS4z9uvq8/mXsZNheE5E9wR5b0+GM320zs0at368d3L2tVzeAOfTKp+Wanh
	 i5Z66N7o2v8rI7S3V/FBfD0pzS6otU6sGGrU/zmdqxmQhhfU3gszvXFndiPYcAZdyREZw
	 P7+0YIZ3ibl9D00+E4XfXkRXsny5ddEJ62XRE2leoUVLQUSBBj4WitpgFgXLna9oh80Ii
	 Dj4fLjYNzuIn7VtNBaQzX8cdOCIhvClShptcwA8/bNExfO+6VjSKMZGCtO9yoShEVXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DuEmb/QG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F26606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DuEmb/QG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0321F000C1;
	Tue,  3 Nov 2026 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687057;
	bh=aa/8SrCqSl3D7FwbQ7xBdMRSbK2XyMjo6GgBT4qKF0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DuEmb/QG/DAkNipQ0b6Vq0oCtiCP/yNZwW+BfeDFWaxR9TCWxUHlP79dCBCq1VTWi
	 IUW1Ui4T9LUKiP96lD6I0hEsnEFCj0atR2/k2SThdkVzEmY039D9nbHWnW3vrQ2gVU
	 vqgMFcUWBknYNqrcW+o3dyqDSmWC462n9k7QiLq2+sp2YosOZhdAYBvCCreaf/VrsO
	 cGieU0OTqrqHQ3FNztaWTiOAtub+B8HBXl0KFUhQ8VhTzVkIcLhgrRGsDEQ9GuiEgq
	 22JJ9qWrDahhQsb0+QZIdfQ/Rbv54f8Ym5nqT0CORVkMmTIgPz203HjrBuM2JbSyRV
	 K+KtoX4+NOFIA==
Message-ID: <sashiko-outbox-194622@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Chen" <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
References: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
 <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:24:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The "wakeup-source" property, as described in
> Documentation/devicetree/bindings/power/wakeup-source.txt, only says
> that a device is capable of waking up the system. Whether wakeup is
> actually enabled is a policy decision, and drivers use
> device_may_wakeup() to decide whether to arm the hardware wakeup logic.
>=20
> Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
> property is present, so USB wakeup is enabled by default and users who
> do not want USB activity (e.g. connect/disconnect) to wake up the system
> may have to disable it through power/wakeup, otherwise, unexpected wakeup
> may happen.
>=20
> Having wakeup enabled by default also costs power. In host mode,
> when device_may_wakeup() is true, system suspend keeps the controller
> and PHYs powered (dwc3_core_exit() is skipped and the genpd is not
> powered off) so that the wakeup interrupts can fire, even on systems
> where USB is never used as a wakeup source and could be fully powered
> off.
>=20
> For USB controllers, keep the wakeup option default off and only mark
> the device as wakeup capable, so that the user decides which USB port
> is used as a system wakeup source. Users who need it can enable it with:
>=20
>   echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup
>=20
> While at it, drop the local wakeup_source variable and use
> device_property_read_bool() like the other property reads in probe.
>=20
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103061401.2942=
139-1-peter.chen@oss.qualcomm.com?part=3D1

