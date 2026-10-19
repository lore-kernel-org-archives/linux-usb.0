Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1394973B1
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406456; cv=none; b=h8TS4bpid03tubhuUmsQPEBNhjS9ws+tM5ZT44m9Xo/Oef3dL2MPgQye1C10OcY89rPX1eWRpw1JIAlmERQXQe0TRfKBMfCvk724pbtncbvTZYWPPe2STArUl/zkNANwz1Vc7McOEcKI0CYF2UIUHlrFf8s+Ogbj77hWlYjFrgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406456; c=relaxed/simple;
	bh=h+JMJFzYrNOx8h+Bfe9eaDPC1KxN1kx53KKl6h0ZFdo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mq3Ot20VDhGK1iFnuTm1xT3etELTmCZD1jeYdQz4sdcmNzohNCqCHtH9aENQGBVISoDmQl8HhRB6YH8stQmBshvU3nJH4YAf+N+SuP2rxT8wrVLJqCfCdwiTfoct7zmtEdnU8QvB/i+sVkpVnCpe6yTRZ+1dz5phMh2TD26IJlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReB5gbZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReB5gbZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D4F1F000C4;
	Mon, 19 Oct 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792406454;
	bh=W0Dt/MxiJck1ccJW1XxAS1jahfiMwD9V4PYDR9AEhe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ReB5gbZ243OABmRJ7A+kD9PKWWiqkipqvKxxwBcX4R1AsXbTBCbtZZ14P1ae5fllF
	 MkSXv0xx99o47CRSIyiT2IddhTQe1dP5PJKPDsSG5j1fJiDAJe01NGQXkUmT/MDcad
	 HgcSCYabu94MX3KWvosOxoCTK0EFTcE/QM4SV4dHXNa+AzxcrzpGdAbE7fKLGVY8Xl
	 CRe7mpx2fh0HDzK+vXU+q9p8zHdNqSNlJgYHf2eJyhtAF55v5XW86vJ0zj0BmkIkkh
	 m2Zkn5bjCaWr6v4e0UioAvKupE+fzHijv3jkgjwaswMLtvjulssaHXLJpTBDmRgy4G
	 PcJigKwJL6+Ww==
Message-ID: <sashiko-outbox-177007@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: serial: sierra: validate URB length in instat
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019103849.3716324-1-tristmd@gmail.com>
References: <20261019103849.3716324-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:40:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Tristan Madani <tristan@talencesecurity.com>
>=20
> sierra_instat_callback() reads request fields and one byte past the
> usb_ctrlrequest header without first checking that urb->actual_length
> is large enough.  A short USB interrupt transfer could cause an
> out-of-bounds read.
>=20
> Add two length checks matching the pattern already present in the
> option driver (option_instat_callback): one for the request header
> before accessing bRequestType, and one for the line-state data byte
> inside the serial-state notification handler.  Use dev_err() since
> failing these checks causes the interrupt URB not to be resubmitted.
>=20
> Fixes: 033a3fb980b041 ("USB: Sierra Wireless driver update")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019103849.3716=
324-1-tristmd@gmail.com?part=3D1

