Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3F38B7DD
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517915; cv=none; b=T44isl0PT6PC7cHE8CzOqw7vYGYak4qN/A6W8Asf87IQaEJ7CCp9BI4lOorF0I56jF/rGnadC2B8IJ61KoXxAgqQSj6TGjQL6qxoNJ4q6xyZXLARsCPSGRevf//yC0BakWL466uuNVX2bghr0gcN/gqVIt/xxhLM4uskkDoojK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517915; c=relaxed/simple;
	bh=Zarlk50cbweL6mQc6dxqltBiORwIKO1sEMpzl0ssvOI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pou3SArB97/489Txl3/gDjRm2HSN6I9eK0Pw5fsM4kjCTudhWtNu4IraSYzYXwTEBGoIDpZ+6pib5bX08g4t3XjXHuVViv+2fq6+yor1yK7wP7vryVe7h6bCrnDLfRJK6IKQT91zlK/2GRCT5PLYu3jCPYMgypIlU84q+r6qK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eP6NtJgb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eP6NtJgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093EB1F00899;
	Fri,  9 Oct 2026 03:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517902;
	bh=Zarlk50cbweL6mQc6dxqltBiORwIKO1sEMpzl0ssvOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eP6NtJgb2qYPJrtdIQoW64TyUo14n0qx8nvo3Rk0QD3wcAiYhid+QkP23YWWPXFCd
	 qcnD5qiXF23I/BvisEmxIHU2kn2cI/6FloA6I36PXRh8PfjiTMs8lRFug6g/bOYRWo
	 YgUelbLKyjDVPZ7Wqac6BwMcgfY1GWN1eWLpxHM/nFjfoGzFde94I2Tu0jarGNPIUM
	 Tm3wAuv9P47tIcbkD8GuakN0S22MMO+JmLUxEG3xqiskw3F5/RLPJLx+RMmsnkuPs7
	 DCW4wODg3w+nG8TMeelAiFtQ85B/APjgFX5TLUsfenC7+ZkSCSbKtR5jEBDI7onX0W
	 F6SuaNNrlpiyg==
Message-ID: <sashiko-outbox-164794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 01/13] phylink: Add phylink_mac_interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-1-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-1-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add the phylink_mac_interrupt() function to phylink, which
> passes a link-change interrupt received by the MAC to phylib.
> This function can be used by drivers which want to avoid
> polling the PHY and instead rely on an interrupt received by
> the MAC when a link-change happens.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D1

