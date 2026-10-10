Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0278F3A
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 03:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791603135; cv=none; b=UcCXoHGNLfVRWCy7fWRebEtrRIfDcyvNfqvrYpEAZ80hqtoxDHRn5SKROm67gNUleevGzq4IFlD/hGTOC3lWtBY8YrlShqarffxva7kGvxUrYT1qGrqc3nLSCaAFpkkasyOWTj90meVe2/RCfXJROhcE3irClpB357WQ1grUkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791603135; c=relaxed/simple;
	bh=2FjzLX1QSjAvxbPL1J0nUMZBRrezgFP9LxK7shjovcw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JMCTpvoS92qsc2wVIJMltonIqXNZQgs7GMEdhDu6CVVRDVZn9FPMfCAgTNu6Ne/B6cTl85d/WpKAWbyu2Ew1NTzkPzmc8mP5ZNFIBGEV3pADwXfXQNzH/znWWvE5g3/aroVkrKH6SZuzfp1cv6+84yc2/QW1d6FhyakR6rptDn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDjL/4x/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDjL/4x/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5601F000FF;
	Sat, 10 Oct 2026 03:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791603134;
	bh=bSh5O2l2zTxpt4YLM2nHRZHh+QUGrs0kyM8G35u3ZR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDjL/4x/Q3qjvpFBB1VTueCxNyUpk2d4dwevfSATptHLXWLF5H+oDuWou7oXM7mT5
	 WiK0E7rkbJRzEEwmEjSEKPLvK51wGgbHZzUAjMxqsp9+ivXM8nnAl08xSdH09BTM8p
	 Q3rh5hnURWsLNGuYWaVfcQjlB0DmnQ0JLR9YrFeaHmRyP4QXkIFc1lq+lg8Ip+frsJ
	 0o77OUR2vyjgQ9u8/S/dkyeZ4FGqgjuq4C7B795A1GGYE0xzIWJnIaPgH/HnJliYi3
	 24dj8w/Q28J6he7i824Mh1C/zOPDUeQKYW3hDhFZnO3d0gCHydXQm9dZPJ2HazOlWX
	 xbM03SNcdZdzw==
Message-ID: <sashiko-outbox-166247@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: Add XHCI_TT_SOFT_RETRY quirk for transaction
 errors on TT devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Deng" <dengjie03@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010032518.2040608-1-dengjie03@kylinos.cn>
References: <20261010032518.2040608-1-dengjie03@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 03:32:13 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Low-speed devices behind a high-speed hub on some xHCI controllers stop
> working after repeated lsusb -v: a transient USB transaction error on a
> bulk/interrupt endpoint is followed by a hard reset recovery where every
> command completes successfully (Reset EP with TSP=3D0 and Set TR Deq both
> return COMP_SUCCESS), but the first new split transaction issued after
> the restart fails again.  After two such cycles the hub reports a port
> connection change and the device drops off.
>=20
> The affected silicon does not honor the xHCI spec (4.6.8) requirement
> that a Reset Endpoint command with TSP=3D0 "reset any USB2 split
> transaction state associated with the endpoint": the stale split state
> survives the reset, so the next split transaction carries the old
> transaction's identity and can never match the hub TT state, cleared
> or not.  The soft reset path (TSP=3D1), which per the spec maintains the
> split transaction state and retries the last transaction on the next
> [ ... ]
> On the affected controller every error reports comp code 4 (USB
> Transaction Error), tt_info 0x301 and err_count 1, i.e. each in-place
> retry succeeds immediately and the fallback is never taken.
>=20
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010032518.2040=
608-1-dengjie03@kylinos.cn?part=3D1

