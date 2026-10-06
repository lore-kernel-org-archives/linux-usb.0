Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7314A0914
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303880; cv=none; b=tt9p5spnVocpAupUYmlugnJI6GlSW2PaFjEO5PAcprvKdv1EthgY1/MbmC6eTXwLjRqbWdGXB2pW6Kwuqq4puV3/kIYQ10VlFAVOD63LI54SDkuNh7YgwmfcoARhqmlVHWHj94vg6wNdZ+YFacNsPAAM84HVtYm+5HqnR6U6n6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303880; c=relaxed/simple;
	bh=TNda2B7XrTgO5ARvZrZjAQf98whbrEjCH+oM2lkf5xY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YSqylOZwqqjK0g1YGfXqKd+4Z3nYnwvadqeKquVf/55q+D468vtvYuTu4asxcPoulH2OFmZ0AqmDeZsaI5TWpOY6ihN7IW8lYZuTH8cIx5qqQRmQ3WT0k4LIV+709geZ94Rg6ANkOAo58FaCB8n/dK73rGAK5vzRmiTwSLLuM7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhjEzhXk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhjEzhXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD381F0089C;
	Tue,  6 Oct 2026 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791303868;
	bh=TNda2B7XrTgO5ARvZrZjAQf98whbrEjCH+oM2lkf5xY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IhjEzhXkvDDJgHxxmRjAcPpEfSDDiH9t0rJXDtqYh+6WCnXE4EHjGLCAfq+GhgpUr
	 P4G05bF7bDOvb04Quunawgj423cuX6gZ/i8F+e0bCMEihpGP+vbAjxaEcQbBIBtBcE
	 bsDW7fM7pyvlYi8s+fMIEuUHv2GqT4mWyfSiwyIEyi+x1IYaLoQgSBZPgRPsEDZyZu
	 mBgtQWCeSMfaOeR6092u7wSr3ADdIT69+EgEwyNgwiuphEWIv7bAytp8FsGo7aS6V9
	 hlDv35N+iS8A2ynyEmYtMEyqlENRlyFpJKliD2z4q/0yg7US+6OgV1emZOpOf2xeoW
	 6BlJXdyLx+xSw==
Message-ID: <sashiko-outbox-162252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] thunderbolt: Allow tb_ring_start() to fail
Reply-To: sashiko-reviews@lists.linux.dev
To: "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <13c3bccc590ec4a87bb718da0de40a3d041846d8.1790854235.git.Basavaraj.Natikar@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <13c3bccc590ec4a87bb718da0de40a3d041846d8.1790854235.git.Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:24:28 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> tb_ring_start() returns void, so its callers cannot tell when a ring fails
> to start and keep building an unusable tunnel. On some host interfaces a
> DMA HopID also cannot be reprogrammed until the host interface has been
> reset.
>=20
> Hence, let tb_ring_start() return an error and unwind the callers on
> failure: stop an already started TX ring when its RX peer fails to start,
> and disable the DMA paths enabled before the rings were started.
>=20
> A stream can also stay open after a failed resume. Therefore, free the
> partial allocations, clear the ring pointers, and let the subsequent I/O
> and close return without touching the freed rings. Check readiness under
> the device mutex and use a wake token so a wakeup is not lost across the
> unlocked sleep.
>=20
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790854235.gi=
t.Basavaraj.Natikar@amd.com?part=3D1

