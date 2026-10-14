Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF623645D
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971563; cv=none; b=BbWar3mmX8TDzxlYEep1PLUqmYvGiiI8ghvFC2ArabupWwZcp1NEwGh6UpqDf62jbjAcmKecXf1pwE0Gz5EF7NFGIenonyF313LaQ1qPZA96sx2J+LgJuJKdRzMJj5YJF8yQvBLfoEajDqQdqhsYwSrDZEIMZT5X4pFlY5hpiS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971563; c=relaxed/simple;
	bh=JZb9Bw5ghu8Yf+Zbw1bBNchgyX5sK/wWegSctNPcWqE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=D3D2+zmX2DQSc04cRuateyODzXLBxvj75rBClpsHCXQGnKVhv3eL7ZHKNySHVbUe5+fr65ZLfgRXHMvBOeQNkMhvlocpI8kfQuejiU5HdVoSYvt59fcb3rRktKG8BT9mUKdaMEPAQLB8UZkPyw7kyl3oDyxXCVUzboQ9+rCpdE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB+zQ/dM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB+zQ/dM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA11F00893;
	Wed, 14 Oct 2026 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971562;
	bh=JZb9Bw5ghu8Yf+Zbw1bBNchgyX5sK/wWegSctNPcWqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RB+zQ/dMcq1WFnuIsBUJ2jmtkCyfTQvABxoK7zhaioRQKwyeeea4ybUaGzj/Zx1si
	 zv8z1/SJ/DAF5eP3GOlrxyKonY3bqinPjqVMi+bjlzYZRTGykaRFM4kd29FVtOGffz
	 MJM8gwPtcSB1od3uPp20ycWtT6qi5lDI6/st1OJelOeRB2wIHSjDgyMRQHi8Tplkgw
	 sRqjmR7RjlRm8MGRuqu5fEm4z7cTYGpvNyoHy8EKkD+0+MJjJSeWHsqGPLn8NRy15t
	 cVtwwCTowTGHPd3OSJqcsx2y1qgGy9eGDandmLmUXGSGzhE/jiS/Ns6eLomZLnOgE8
	 CuRAXPPmqRB1w==
Message-ID: <sashiko-outbox-171098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc2: wa for isoc packet tx fifo flush at periodic
 frame boundary
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-dwc2-fix-wa-isoc-v1-1-f261ce0852bd@foss.st.com>
References: <20261014-dwc2-fix-wa-isoc-v1-1-f261ce0852bd@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:52:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> If an isochronous packet is still being transmitted, when the end of
> periodic frame interval elapses, using dma desc on dwc2 controller,
> the device wrongly flushes the pending packets from the tx fifo.
> This can lead to a huge packet is sent on the bus, leading to the host
> finally reset the bus, and re-enumerate it.
>=20
> Workaround it by tuning the periodic frame interval limit from 80% to 95%,
> on the affected cores (2.70a to 4.00a). It makes the issue very unlikely
> to occur.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dwc2-fix-w=
a-isoc-v1-1-f261ce0852bd@foss.st.com?part=3D1

