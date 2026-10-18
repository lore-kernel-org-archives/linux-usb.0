Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77594CDA37
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792337067; cv=none; b=ayzZy8PeA7KyuikodnbramdXGZC9SYb1+u/S1/1suLQS6va9AP00KjGXl0AV7fx14dtzuRNSVR72UOJmXduDVLV7kNkAg0rN0XxlYuIZQcnCKB92yZBhz6gke8kEcS9x93a7Z3giRr0ESXrCA12TTTZ4p3Osw/NR4p86Srnb8PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792337067; c=relaxed/simple;
	bh=JBNu50vb4JTAs4wbvLIgl2er3nYYhYfqKrts7hK6w/U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ly92HIKnpz60TP0qqh8usMlbONLxDdZ7b1iaChODifY6DI4bW+n0tgNwDDoC41aFUa2DQ7GYrJmziuvL7qE9yurLYBaS47Vqu0TEfeSxqKu4uDifjhTaMsRa4pDKqsgeKR/7XcNcSBMjnCH0XvMYwCCt8CXkTnBAX2MdSFepB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYLqJCI+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYLqJCI+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A324C1F000C5;
	Sun, 18 Oct 2026 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792337064;
	bh=JBNu50vb4JTAs4wbvLIgl2er3nYYhYfqKrts7hK6w/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NYLqJCI+9KndxX3MEQ1z65jmNQnCOsxGb8Vc6LO4Q7k5c8tUIO8coXxCLQLm2oduF
	 yDV/JMNTZ0krulrtsbutg/m7NJkCDetRLat5/zY0+7QCIGK+OG1EsZ8YirXOgJwAdC
	 DWCGb1N/pe92M+1BfwYk98XDcnEo4qIKbXFdkkdCiqdQmkd/kbcZ5yxA/Z1ZI/dFfM
	 1dNsNGxtbbpVPastMNwPI05lLATid7ZWvI+io7+zmWaFlgFMydemm4QEMGtlN6kTBE
	 Rw0+2DxDKeRIMoXVuBu0Dp9MlRNbWVCQGpQtabGVUoix6Y9dkXvRvBr1lR+Jjstd+8
	 3YbUGePvNwxTQ==
Message-ID: <sashiko-outbox-176234@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: lan78xx: avoid NULL PHY dereference in
 WoL setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashant Sengar" <prashantsengar25031@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018151830.643511-1-prashantsengar25031@gmail.com>
References: <20261018151830.643511-1-prashantsengar25031@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 15:24:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> LAN7801 supports fixed-link configurations without an attached PHY.
> However, lan78xx_set_wol() unconditionally passes netdev->phydev
> to phy_ethtool_set_wol(), which dereferences the missing PHY.
>=20
> Only call the PHY Wake-on-LAN helper when a PHY is attached.
>=20
> The issue was reproduced with USB Raw Gadget and dummy_hcd in QEMU.
> The unmodified driver triggered a NULL pointer dereference.
> With this change, the same ioctl completes successfully.
>=20
> Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
>=20
> Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018151830.6435=
11-1-prashantsengar25031@gmail.com?part=3D1

