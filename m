Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972803191CA
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540619; cv=none; b=rqB04kEpgQyuz16fFwzSNFpGzru8M9Dr4xiqYBbqk4DTcsPAMxeKqWUlRencL9sbX73SA90NbBaS2v0MrbzIV7ouQExmbEfzQ1BxRkwvAaU0rnd2zKVOu0AbCGZs6hiQBu3Xqzm8faJ5Crd4FtUOulYbpG7Ta/LLM6yRSXNpneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540619; c=relaxed/simple;
	bh=4Tnq7w69O6VDKA+nr3G4nK/5fBaSahhoum4r86wKWA8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=s3dwE36IYmRJan9pBSfcKox8+67KmKPXIiSSg6uoKuLJ8cXju2L5w3yugJSNgEm8aed9NYa9HnmuQEo//91SuWk8FJmKEjA0e/sQiSp/mxtdkmG0rNiOt/6Ge+ccMGFHVIrx/mVqoFB/B4klQu5wq9hFOtdLEbu/anZ27sMH1z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtdyjmVN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtdyjmVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDD21F000FF;
	Fri,  9 Oct 2026 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540618;
	bh=4Tnq7w69O6VDKA+nr3G4nK/5fBaSahhoum4r86wKWA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CtdyjmVNIRm4EyiHbE3wVCMyXW9peH1ddkLaUY0Ri1YIrQMP2EovRSFTuAnGe2c9j
	 u8cFDgl0nPQMCioBlQ9EZ1Dck7RwjrJJ8J8RrToJDzsNuwfXXdgSBb5dH754O4D+uD
	 XqWZawoURGdYyn28LHNkjDvcEylbjf0KeTICnD64mLQQMT6Iw7jK3VHLJcKkZvwejt
	 Rz5sIVa1QPaXtWn2SJ94FDGAQZoZmtkZNhnLNNMqfu3ZOW+70SQ8S1fvqef0VQa73R
	 1j7J+VmVbjKSmWkbOveZQABkNjXUhtDWNL1SxBhZdRu9envaz5W+v1Zl2uZrHtB/mA
	 VlZr+1F5DkQRQ==
Message-ID: <sashiko-outbox-165200@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/14] xhci: check device notification type before
 forwarding wake event
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-6-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-6-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:10:17 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Hongyu Xie <xiehongyu1@kylinos.cn>
>=20
> The xHCI driver programs the Device Notification Control register to
> only enable the Function Wake device notification (N1), so any Device
> Notification Event TRB received is expected to be a function wake
> notification. handle_device_notification() does however not check the
> Notification Type field of the event (xHCI 1.2 section 6.4.2.7, DW0
> bits 7:4), and forwards every device notification event as a function
> wake.
>=20
> A host controller that delivers an unexpected notification type (e.g.
> due to broken firmware or emulation) would trigger a spurious wake
> notification on the parent hub.
>=20
> Parse the notification type and drop events other than Function Wake
> with a warning, mirroring the slot ID validation in the same function.
>=20
> DEV_NOTE_FWAKE is the DNCTRL register bit for notification type 1
> (N1), while the event TRB carries the notification type value itself,
> so add a separate DEV_NOTE_TYPE_FWAKE constant for the comparison.
>=20
> [mn:] reduce warning to a debug message
>=20
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
> Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D5

