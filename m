Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948E1DF27F
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517904; cv=none; b=f1h3ZFFmdzuQd+Nocf0DuWcamXrXvfHKwYVDTgI4F3w5s2vKvKFpkaS6Du+JfVOKkQ833NGHDOEFd37Wegl9YCOKzl1ImufOYf5qEtFahdYNtAjO9AnAiMFWmYucG6zU3NpekHHs0u1jSZn2R44LluBgpdQLoZTUYyd41XsK3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517904; c=relaxed/simple;
	bh=7j2Pw1O180HAusIWx/qfWJbl4shAPkcV7/KBtLZ0+lM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Z4GnihPMtiMJ89hsf+ONEaC6uEKLVxgMo6cAm7h01640+CYQFcFySLP9XRT/1b/hCfFoNk7Oe1e7j4sl1yPyoRRX1xL0Ws7OIZa6gbV3efnfqrml594jv8pKFbHV1gmBZ5xRFAVtgwxGPo4c1alH564bWpFiGMwX7obZxwUk35w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCI+NzRc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCI+NzRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E101F000FF;
	Fri,  9 Oct 2026 03:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517900;
	bh=7j2Pw1O180HAusIWx/qfWJbl4shAPkcV7/KBtLZ0+lM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VCI+NzRcLNMxsNASwN8pDqqLAq64BTsInPGGDeaMgw9T19VmxGawXdeQMqgumlylT
	 UWd0XzON+Mp2uYNEdl6LNRcLEmiEYw9vPZTImNhwKh57nhSS7JThH/rIkp7sJiotbA
	 GBLfRhuanfVVd3V9dT3jTKHOBEIRmVfkj2Ky8f88IO7QpywSd5yFAQ9bUFXNWpmfOR
	 CN3DB5avKNHPXxifTb88r75qdhAsefd4wzGXNos6wrEL9wFaBincBqGraEQaNRYOWl
	 hUZXzQMv6/xDygfmnMv5LDExbcSCe0pMSEOJMkKyg/iJyHsa3wH593I9y8uYiWdmU6
	 LYrjFoUKtKPSQ==
Message-ID: <sashiko-outbox-164791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-5-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-5-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The AX88179A uses a simple HW configuration for EEE
> via a single EEE configuration register without LPI timer support
> Add support for setting this EEE enable/disable register in implementatio=
ns
> of mac_enable_tx_lpi/mac_disable_tx_lpi.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D5

