Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815172;
	b=sA6Wmvwajhr3VelHknRmU9Do3JBxWLhRiwsAHw+QIpL0Vz1tcdJq8dGjpRnzDsZ+u15T
	 6SpwKzeb6ozVZZHKM8PcMc19fHq1oMxmaDQTpIliIwy8vE955v225ZrwW8d4idVKyIy9t
	 N1ry4cNgTJEtHlmJELyviZTImE4ErB+Kt61y9IwSX+B6huVZPqaxJ8AjX9Kx3nNuTPq8V
	 qVbNIn7cDjjUwRJKIYh696MrpJ9bJpkFgJ3f2/gM6O8m0p8BRh6cOezgh1pNJQorIjdTM
	 alvbv/jPFlj461EgFmBaIcewwE6uAuZYHMyRiEx7W6BDeFNtHS4F+gApn4Kpkfmwi4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815172;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WoGvHN0lpjMykRRVPI1lZmgJhQpk3Xk7O1ANJlHaNAw=;
	b=JC/bdICCNvlVp8Yk2mLUq5uvoIs2uw/K9X9lskLvv+Zdz3RZxdorJKOOo6r9URHiOLZA
	 SmIAYAz3lFa7qzWeVPNQ4CnbdtEXlu5bEc2mzi45ztcwZWj74PjYpOcJtDu1sA7rGBrVv
	 6WVIvqNJQz7Mq4xmriE5i9QZBbHsx0UeWZFW/0XgtbF5sj0r8r82Qu7NpakiAS7SMiZxQ
	 +iApWlThHPN8QeGtIDtbJ6xPukOZxli9NG+bKUjBXfdadlyCuKtROKwKqDxeSADmr0cJW
	 lMUi+muskXqHzr9jFYFaeX1fXuJo1DxKG9ONc3yuuFiqQr2mgavwAY5GufzUb91Hdug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se1qiSF7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA7606A335
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se1qiSF7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648011F000C4;
	Mon, 16 Nov 2026 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815172;
	bh=WoGvHN0lpjMykRRVPI1lZmgJhQpk3Xk7O1ANJlHaNAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Se1qiSF7Hsfe65zv+G+Mp3FdVEcRMRrZIOzZI46ZrWfTRluN4BigMZoyOTx9s/aCj
	 f9xiMBtSkiK+duo7EUVGl0hjmRwc8/M7dGh42W8nCSkQXxN4shQ0YMeUvM3ogK7M2m
	 Qt8ONClbwJ1g9RDTSaDmkc8yw75EbwptBIqwsgem8Go2BboKa0ohk1y42xal0+K94x
	 WzXKvB99G8s8zlhjkiuVyd+T+9JlOvbDFI77nhiV8UF5EHXCghOslpsOSgpiGEPWIC
	 uQok5lHR1bbFOgBLpJVCkyfvHZ6BsMGrT7ZV/gp6x3q4st0+ZaE0Zq1pBuFLIgrgp6
	 zWE45xFkycgBg==
Message-ID: <sashiko-outbox-216462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: sunplus: free the disc_vol buffer in
 update_disc_vol()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116074006.20357-2-ag@ffroot.co.za>
References: <20261116074006.20357-1-ag@ffroot.co.za>
 <20261116074006.20357-2-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:46:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> nvmem_cell_read() returns a buffer that the caller must free.
> update_disc_vol() never frees it, so every PHY initialisation leaks
> it: at boot, and again each time the EHCI or OHCI driver is unbound
> and bound.
>=20
> Free the buffer after taking the disconnect-voltage level from it.
>=20
> Tested on a Tibbo LTPP3G2 board.
>=20
> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116074006.2035=
7-1-ag@ffroot.co.za?part=3D2

