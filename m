Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AA72BCFB
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296326; cv=none; b=stDEvIEHm34nKIZOoRCqKFUzNEuOed5RYjAhQaZdHTdLqviMjaP6HjB7XOA1/qOWsBVlymWoqmCrLTeO30DiNAbDjPldCxdPU+G/h65r0fsEL3ADPm6KwtxAiMSJQsxflkgQCRubNZfZVTCphDJg4IXs3l2hIWKovgpEKKAeB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296326; c=relaxed/simple;
	bh=GGEG/iXcpX15qUuubohwdpntNlJn0sLBn6ojdxqc81k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AuPZ47rxirActEfF82cGPxon3kVGPixv0911iap8cclwxXn2NW3S1eA45cGMKfg1mXWENr/dPsD//+IkgnvEPDJ5NuFX+8cCQz40jc8Fu5UE/c2g4A0x2UoERoXk4r59yUfzh9uhLQfdShEh4ghntbkQb1uiBaqnm910W9b9yuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VeoEbx0Q; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VeoEbx0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773296317; x=1773555517;
	bh=msKiFDEI7WW9jpJXjs5mIiIQtN0ui9UCxytc66kG8mc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VeoEbx0Qa52sJUotNe1muW5U5DuxCcQ8bf849dIfLlYGZi//CBDRUUL7WhrGaPNvY
	 VonDKN8vEDePXMuB1T1X+nW/xL6LeUfise/JI0T9vL1ISQtfyjAT5jc9fTzmp4/O6z
	 BhxnANsbIqoH9svjUg24dg4kMRMI1XPiE47GRdOSo52i77TdmuHK5NJz1taw01xhZj
	 j9A4xOPki/9YovCjBo0oByL7PGRycEbhsi6rnjmc77coKS597FLTTena+KLT/ZrBXg
	 GqCzL5I8U396nYH7KAf/3IUjAdTR/YQXqVESO8Sz6PfTSvkR42UPCnH18AEPJ8W7vi
	 dg5/ebpVff7Sg==
Date: Thu, 12 Mar 2026 06:18:31 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN VBUS detection
Message-ID: <0_Uzay_JH2Pb9Ff9XJ6VD5Y1EgtfjUQPIK7JPpYzBS9te24xw6JEs5XH2TDzIvGHmDk0ke8AuDKXYZWhQA2mMtmVkpnpXAMCePPZgAQqLZ4=@pm.me>
In-Reply-To: <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me> <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me> <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: c35c85aff5daf4509ae0e410cfad3f3ca9bb8ea7
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, March 11th, 2026 at 7:06 PM, Bryan O'Donoghue <bryan.odonoghu=
e@linaro.org> wrote:

> On 08/03/2026 23:20, Alexander Koskovich wrote:
> > +=09if (IS_ERR(pmic_typec_port->vbus_detect_gpio))
> > +=09=09return dev_err_probe(dev, PTR_ERR(pmic_typec_port->vbus_detect_g=
pio),
> > +=09=09=09=09     "failed to get vbus-detect GPIO\n");
> > +
>=20
> I'd prefer if this was bracketed since it is over more than one line.
>=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Uploaded v2 but didn't carry your Reviewed-By since there's a fair bit of d=
iff, can you look at v2 and check if all looks good?

>=20
> ---
> bod
>=20
>=20

Thanks,
Alex
