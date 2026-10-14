Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB13ED5AC
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968754; cv=none; b=RCyZvhP27xGuIsAP50SrKZ3Z7czNs0ZN2YIdbykjH7Ur3mxAmiZXcFq/g7ROv0FXknBHLyklL9xV504DLB6Jlg77wAdQv6KFacrudFi37S58WmrywcK2OX7Q846ToPx5iqYhIPJBmvYgTZBRcqBJESa/PS3pI4G1AuEB5bIsMcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968754; c=relaxed/simple;
	bh=xNPEqm1m1ckJ498RmfpeW+AtIw7iQC1HgAYZHhJg8NU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rvWbL560SQNskvwBFcM0LfHWS6NyUrP1ezwuoVQCQeqr81mWSIiTW9/R31H74QKUgwtL9Ct9oBktiI6P72vBefxbkp0WgDyavaaOJsNShfEzWG/w3BsqBid26I1096xmIngSstfVldRDWi2CPe53xYpU4Ku6HJhq075/IINgbqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J45BecnO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J45BecnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428861F000FF;
	Wed, 14 Oct 2026 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791968753;
	bh=xNPEqm1m1ckJ498RmfpeW+AtIw7iQC1HgAYZHhJg8NU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J45BecnOv3ineadUKAFmWZ0nzrvl1kuD0iZmpg5LJK5tOMjVHb0jgwkqzOH4GVFet
	 2Gl3AVc/MnlxKRxM7MaLMw8Ej5MWFi22l51SNT5vH7kQI/ciQLcWgXQvcjdx8OO22Z
	 NisNvmODcb6fGH0X4ykGjPiXPCeyGYCy0jqMEd3DkPjdOQK5hclCYtfAZtUbAmphD4
	 jPYr6Ugtepo1ZmVJGoL7AerlYOi4MRDWjqdWeCz+A0asaBqBMl7Wig/tHSpNXLXEzH
	 QSHE6c+isCZ5iznEQkNT7UwfFWdui4lCr9LvY6nOOuDSrRlg+Px3gq74jun4qaR+m1
	 SymIQAU+X6StA==
Message-ID: <sashiko-outbox-171059@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc2: fix fifo reinit in
 dwc2_hsotg_core_init_disconnected
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-dwc2-fix-fifo-reinit-v1-1-d918de90ee3a@foss.st.com>
References: <20261014-dwc2-fix-fifo-reinit-v1-1-d918de90ee3a@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:05:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Currently, the fifo gets re-init, with a running DMA, e.g. when
> using_desc_dma():
> - dwc2_hsotg_init_fifo -> Flushes the FIFO, DMA may run in parallel
> - DCFG_DESCDMA_EN gets cleared (e.g. disables dma desc)
> - then DCFG_DESCDMA_EN gets set back again.
>=20
> So move the dwc2_hsotg_init_fifo() call after DCFG_DESCDMA_EN gets
> cleared e.g. DCFG write. Then the FIFO can be flushed safely, before
> DCFG_DESCDMA_EN is set back on.
>=20
> A BNA interrupt may happen on EP0, before this change. When it happens
> we can't recover to a working device.
>=20
> Fixes: 5b7d70c6dbf2 ("USB: Gadget driver for Samsung HS/OtG block")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dwc2-fix-f=
ifo-reinit-v1-1-d918de90ee3a@foss.st.com?part=3D1

