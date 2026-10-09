Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9600F342173
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559713; cv=none; b=PmW/CtKJCGLKWXk4X8/j2L6niOusbECshd8lcpvKqmglARRJUdn80SJyZzKwF6zPD2P2c7XsKgyU61hw7+ZNyqQY/N2RQAYRS2J5tbP89BJBZg9836WDduZsGcpw80tNeImzkQ7enW5e4QVQwSlyhVmt6An03B5Uvjm+OTzU73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559713; c=relaxed/simple;
	bh=Yb8LejhSN+dARXhI33dbTva688EsTFl1nJQsKPMOWJk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ajS2EWK1Q/UCvcIP0G2YQzmrlqiUZ+JzM8cDyaTlDq39Rct5ZkEuk/kPrNrhYyjGRfIFBCKX5Z/qNd5EheHy/0jZvd6buIKb4BhONlx53PP6Dq1E0wzoKkmwu6rgP3Y7CHrPEzpne9WNZvB0FeUNt/70yv32R6BKv/7pC6UVT/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkmpqLlV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkmpqLlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565EA1F00893;
	Fri,  9 Oct 2026 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559712;
	bh=Yb8LejhSN+dARXhI33dbTva688EsTFl1nJQsKPMOWJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DkmpqLlVcmiWrA/WmgzCL3x7PHG25w+OaAARYvdACIqcsdKJBxyEvGGkBH5kTRpGH
	 d1SRliud/T1Qi2snXFkDG0r7WYpgN8t+wYVpQc48hYu7dTOCN2beA5gBdB/ayCx9yO
	 ce5w+NWoOC5s4XZTpreC4ArVTKCUzWVh/l3x/F3E7kZER+liOrFJw5Yvpfm3FCq/Wa
	 rZ1GtsfSNyMxgCFdenFsyU2iYQODUC4gNFBHflk/NahV0cFQGRFm/ZDZrNFGZSHOJI
	 CuvFZBA6gQL2qoTkUORuOczlJtezTxTg1Wtnx7+MGwoigNPEmL6B1OMK8rn4SI4EU9
	 reJBB7bKyJwUw==
Message-ID: <sashiko-outbox-165774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] usb: xhci: Fix bounce buffer overflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-11-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-11-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:28:31 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> High-speed devices with out of spec 1024 byte bulk endpoints exist and
> are allowed by USB core, but xhci-hcd always sets packet size to 512.
> The exact nature of these devices isn't documented, commit fb5ee84ea72c
> ("USB: Accept bulk endpoints with 1024-byte maxpacket") only states
> that they "don't work with xHCI host controllers", whatever it means.
>=20
> But somebody (or a malicious device) can try, and then the driver will
> allocate a 512 byte bounce buffer for this endpoint and may write up to
> 1024 bytes into it if particular scatter-gather URBs are used, because
> xhci_align_td() obtains packet size from the descriptor. Fix this.
>=20
> As a side effect, TRBs will be aligned to the packet size chosen by the
> driver on all endpoints of all speeds. Alignment serves the xHC, not
> device, so this is fine. Only out of spec devices are affected anyway.
>=20
> Reported-by: co+fd80bc5967eb22c3@bugs.sh
> Link: https://lore.kernel.org/linux-usb/D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLk=
idn@bugs.sh/
> Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with=
 a bounce buffer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D10

