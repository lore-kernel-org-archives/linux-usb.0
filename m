Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C0C4AE13F
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328922; cv=none; b=iQau4VTFpmFx+eOttLy2N89ExQJqu+L5P8roFV3SYx3rWYhQl3H8AuNRxHGThzcafPtB5g+I+RF4R7viQDXWDe18IMaHieRPQfk2R4Y/l/5o1fb3IvHyYqrP1pMoXXlxqE81IEu32T9FWK2mxOZ3TLIuhKAqPXaMcBvsEl/UMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328922; c=relaxed/simple;
	bh=B6YVSgQEvKamShurhjCDi2wmp4xQC4rfn2OcJYoBCXU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tWCcWhH9DcHr3PharvsvfEBANNa3PF7guktY3+imV0e1wgvWkWDHmcGoGQfucf89tD5TRszG5ATBCY5x5yK/UBQ/mAFuH8DEbYB7IJFoZTErWQtpgQZCoiQV+V1vzsBCRLsV16vRKh16KoCgGSLHOXT29+PVFWR5XSn0Z41rR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKCO1NZ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKCO1NZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1311F000C5;
	Sun, 18 Oct 2026 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792328920;
	bh=QtAwJ0zHDfyxVDDY1MA+y1MlZGrfIC+ZJtCp6KCQdjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JKCO1NZ538MH92lnvWl4+D1k8WWxXnIj54m/STWlIBcYiPCHpGybsgoHLFMmtjaAC
	 a2p8oLhAhesnsXKsUOhKkdOR8EYw5qp4KJFUrZXiAAJoYwziKWZ+AzHnX4by0dg4DC
	 gYbqXoxJgn/mDu0klKAQgstTBBo2h+2SaYeWpT50hjwDTfqvzpZQeR4s/iY+Xv55xq
	 kgijrz6oZU2hVwU/n1gR2r7DUeLBN5O1wD724FAe/kks/AAmvWltzOvaj2aChidgoH
	 JupB4vw4Ca7eF5ma/YnevQ+NNL2B+Dt1Lf5epAvd3VlFV32xOZXrMOmKPaldy3WucC
	 QhZdsOvC4h+Zg==
Message-ID: <sashiko-outbox-176147@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: take filesem in nofua
 store to fix backing-file UAF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018130519.65850-1-yuz08559@gmail.com>
References: <20261018130519.65850-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 13:08:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> fsg_store_nofua() syncs the LUN's backing file when switching from async
> to sync mode:
>=20
> 	if (!nofua && curlun->nofua)
> 		fsg_lun_fsync_sub(curlun);
>=20
> fsg_lun_fsync_sub() dereferences curlun->filp (vfs_fsync(filp)). Unlike
> every other store that touches the backing file -- fsg_store_ro() and
> fsg_store_cdrom() (down_read), fsg_store_file() (down_write) --
> fsg_store_nofua() holds no filesem while doing so.
>=20
> A concurrent close of the backing file runs under down_write(filesem) and
> does fput(curlun->filp) in fsg_lun_close() (fsg_store_file() with an empty
> path, the SCSI START_STOP eject in do_start_stop(), or forced_eject), so
> it can free the file while fsg_store_nofua() is dereferencing it:
> [ ... ]
> Reproduced on a mass_storage gadget over dummy_hcd by writing lun.N/nofua
> (1 then 0) from one task while another task rewrites and clears lun.N/fil=
e.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018130519.6585=
0-1-yuz08559@gmail.com?part=3D1

