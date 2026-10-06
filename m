Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4425649E14D
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304179; cv=none; b=B1J7CTeYEfVN2vCF1eLEarhX2fNELY7qyHPDxXJg4QbaGYfka0TPzB4k9ifJHuypTp6CDLVkkZ1BUcIzoNiUwxs/n9jdvF1W+q7HdPBhngasMy7XWTAkdEmEiLViifDITgVvdR2i/5wa9UjtgiNweMijw0OlQKLPQWHni1Gog28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304179; c=relaxed/simple;
	bh=ZHj78SPabf9vYtcRRXiDkD5d2oVO9EW6L82gGnmY7Yw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ayOehGRmD7QddEiaqv6oa1BllpdtpW1VGHcWjUciBZvBMiwdR2s/ja5Ga33yF3cjuAMP+1upX+VeQScvEOdWxWiaKf4vIm9WzMLHaX7RiHcq660TTGybSZaqegbkQzMe2eV+B3J33cNPx5vC8Y6ad3aGp8nwmj/0nKvQN+Lw82g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ph+YRdz9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ph+YRdz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40281F0089B;
	Tue,  6 Oct 2026 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791304177;
	bh=ZHj78SPabf9vYtcRRXiDkD5d2oVO9EW6L82gGnmY7Yw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ph+YRdz9Uz5ZxXeF5AFPMOrwtMf3jDKzpRf3fSETm6khIBPTlEQW/PhRnIQcgx+iQ
	 fvIhgHPV3JiKwRagLy62Gh3stTXnF/wisQS2PuwjoYcBRdNB3upd7IUxyOYoiEXRYP
	 zNSU5cS5SSNUDtF5kPC9kvzvHA2rAOmwiW+NK7fxBCoQ2wL7qGD7R6H4OUOkg7gpQp
	 5fxJK2A+HFFX4RQ2r1b2q3rBk7ZUErMnHq9emUanxGhyc2yW0SLgbbWIJUr/byh837
	 Vd/GcrpW7Az9lMVLrBU4jg2Ik3pBnRTs/rncJCr9Xuo4nv0ZjeSF90d4ix8Grrr96f
	 oczgrTVymgvvw==
Message-ID: <sashiko-outbox-162256@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] usb: xhci: correct num_active_eps accounting on
 allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niklas Neronin" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006152427.3735383-3-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-3-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:29:37 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Some host controllers have a global endpoint limit across all slots,
> tracked by 'xhci->num_active_eps' when XHCI_EP_LIMIT_QUIRK is set.
>=20
> During device allocation, EP0 resources are reserved before
> xhci_alloc_virt_device() is called, and 'num_active_eps' is incremented
> accordingly. If xhci_alloc_virt_device() subsequently fails, the slot is
> disabled but the reserved endpoint resource is not released, leaving
> 'num_active_eps' permanently increased.
>=20
> Decreasing 'num_active_eps' happens in xhci_handle_cmd_disable_slot(),
> which is called upon a Disable Slot completion command.
>=20
> This causes the driver to gradually lose available endpoint resources
> after allocation failures and may eventually prevent new endpoints from
> being allocated.
>=20
> Fix this by decrementing 'num_active_eps' when virtual device allocation
> fails.
>=20
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006152427.3735=
383-1-niklas.neronin@linux.intel.com?part=3D2

