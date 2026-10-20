Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483388;
	b=phZOyMW4uk8HULyIvVtHMmE86Uea2h7gt5SVGV3ls94D/eN8fLQpKTp8hLu4BCSkYzYg
	 bhodpEke37gItYMOS9UpI6UO0LEdPpikm1prWOlOSC0Ct60W/j+QKArv6KjaOQMgmx1hR
	 65AHHkygcZRckv5FnxbyikCFwDiOJzwmOolgl0HDYpVu46F1stzryG1KzVCaqvfA1JKb5
	 EM9qbjuErTqTuYITZiPbIRs6F1+B6QT1pH1KBlkPLLlpjryBCo8ySFUty6mBmiaWGv3BY
	 2LLewJPuH+LvejVwv4iYv+uhmpYxihhjOkrTKgy9lw0g5SXPwU9DA4zu2dJ9RtMuJOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483388;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k6ZJkJ4xk2f+UwpEc1vjKfnsbEAg10xaiP0pA3DbaQM=;
	b=U8F0wJMLtw2K/7+hkCY3XQd5NeorKreM3Nb3bWhXhXr0EkMV0Z+NsHszGALSqKkil7wF
	 +XHuC73ZOCsFbMJVPRMW4qqhkzqUMKe7DIvPKTGdAjx8qVu98vrolRO3XGZUWjmbOLRWt
	 VwMsW6eDI8BQhCEtD3cHazgSE6KSbuyMd8O0x86V1y5zdYOeBQ68PJx+HGOXbZMIpkR5P
	 7sHPQeAmAqjpytYJcL/Z07fZjUjP4ybv9Fwv7TCcIG+PXvGq3TDikMPrEofzHD/n1JsdG
	 eA/ysxdDsOltk+pLc9OU7OHhGca6BP7OibXKB8H0K/HL25ZuliWQHHuQVmK0/erVlMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwquodRY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33122606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwquodRY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E1F1F000C7;
	Tue, 20 Oct 2026 08:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483387;
	bh=k6ZJkJ4xk2f+UwpEc1vjKfnsbEAg10xaiP0pA3DbaQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VwquodRYnrKItnA5mwP3WqFEhDPiGS796Nkox/nFejmKa16nIL85G4k9vT8SAolvO
	 EIMAROg5g5c4vSuDL2Mdu8/GamzDEe9Mbp8SmgtHklb6uuUOz67p5pQYgUdSe9mdw7
	 jFviXE70YTQ5jVm2ZLd5rclJWgGya1I2nX+2CPwPibrhlMAYP6yVTHa4cS6EjgBilW
	 Xm99lWbFfjldW3eguZPsD+UFomWmPzKZr+A92JJbS6qRh+01cjhe3Y1Sxy4zuASDaK
	 tfgHBCUNySVJH9mJ9WmOH3atlUBshl3XU2wsVO3mUZcV0zaBIjMYpw8AntrdhK0OMx
	 zVrDZZdd3874Q==
Message-ID: <sashiko-outbox-178470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: take filesem in nofua
 store to fix backing-file UAF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020023050.87701-1-yuz08559@gmail.com>
References: <20261018130519.65850-1-yuz08559@gmail.com>
 <20261020023050.87701-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:03:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020023050.8770=
1-1-yuz08559@gmail.com?part=3D1

