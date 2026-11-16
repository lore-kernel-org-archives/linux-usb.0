Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821972;
	b=vDA2B1A/ZFKGRH/Vuy3nVMAWVHwg9coKHa1eVLZcPenNzi8VTpdA7wcp6gHeVIaEJiAs
	 7IuVgBuid1ZgOcMa6eL643D1eWB0yAKKLg4u2yzeYXvgHSX6IMf4cxrjA9YwRnR5qrWYF
	 XhICiA4w/08hpm19HaOlpgJH9xXLBHaf4Clgdn5pszfcAXlmEqFqFPwIhynUOqTLivTIx
	 +bJMQKIE8k5DICQirc9iP5I40IeXW8Hj5DKXlI4zifY2nD1eSO2qjAsingnRzkaIzkwpJ
	 RagFpQJHM21vPQQzrHPJ54IWrqo4HDUfWsuAX38EIiMs1CcxkwK07/zEestnQ4ZIvDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821972;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vCUUze08n+GbOc3WNdgAtXsS9TpMp+cdjjAlwhHXu4Q=;
	b=3xVovLlGzhawCRiMqGOCooWpcT/3Eu8Gi/3lz3wQdifej5/Vyjw7noF7Fs3j8s4gwkYl
	 HW/gASv+/KdJRwYRjcxUiH+wPsIzXgzavFIf2o5AJaovHeQGtCW169jNHvWRtYubExfTE
	 5M/Pf6D+ciLhUT2QY50ixgeAKoXBYDQqYnFoU4FpJws5iO7lE1OgZ2bpURFNPgYmJ6K/r
	 j2BjWkKXCVm5mZcKRv1kOMA/3YjoJNGgzh64oPz1kXFn0uNGUptwK5cxxBsaS25oAzRKy
	 SLscrfXEHMZxzqCYTlxdXOJhhXT0KBUIyzSBzL2SiXYi61dwRSecmRp5O4ELxpsTJqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzMxdDAE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2651606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzMxdDAE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE6E1F000C4;
	Mon, 16 Nov 2026 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794821972;
	bh=vCUUze08n+GbOc3WNdgAtXsS9TpMp+cdjjAlwhHXu4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UzMxdDAEU9vj+n9bMCwzw6S1tq70GQMGgGSICjLCQxn33pBR8ZxtUdn0RWLpea8dD
	 HoTp1SRZoi2g+vcS94fXxmWgYTllHGz+KDcjNySsTscIQEBmHlk76V1QPibUNBU/Yu
	 7fHWb7HmYarJD5qc2oeJIaC2E5tusYLgGoectSXC/fYWzUWic+AxZtzjsZtxCrjrxM
	 DQXvsGYQ7SG4uKnXevtPyZ5XOALmwVL+2NJsx+jJRL4gkpVth9f/DzsqIAfhS4CPd/
	 KtP72o35mXbCxNQ7abO/v5t3boqTC6tbiAvCO6FSn9OD6tDgjWsJ2rmFahYP/gAmmc
	 mCWVXfj0Cmo+A==
Message-ID: <sashiko-outbox-216625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: storage: shuttle_usbat: do not divide by an
 unknown sector size
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>
References: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 09:39:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usbat_flash_read_data() and usbat_flash_write_data() divide the transfer
> length by info->ssize to turn it into an ATA sector count.  info->ssize is
> only assigned when a READ CAPACITY command has completed successfully, so
> it is still zero when a read request arrives earlier.
>=20
> Such a request is sent during device scan: sd_probe() starts with
> media_present set and usb-storage sets read_before_ms for every device, so
> sd_revalidate_disk() calls sd_read_block_zero() right after
> sd_read_capacity(), even when READ CAPACITY failed, because
> read_capacity_error() deliberately keeps media_present set for drives that
> fail it with media loaded.  A CompactFlash reader that does not complete
> the READ CAPACITY sequence, for example because a register access is
> stalled, therefore reaches usbat_flash_read_data() with info->ssize =3D=
=3D 0:
>=20
>   Oops: divide error
>   RIP: 0010:usbat_flash_read_data+0x2a4/0x5c0
>=20
> Reject read and write requests while the sector size is unknown, the same
> way the driver already rejects an out of range LBA.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116093452.1528=
6-1-25031212351@stu.xidian.edu.cn?part=3D1

