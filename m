Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879178;
	b=JjSSpYtFGdZ/r/9sFeotBxOZn6j4tIqCr7HyiljJk78XvRw+PquuX6NOqthmgB8o77An
	 3v1gaId8VaB+GHTk9j3fkbh0up37WPTlNnCHGGZiWM7vr7cff52VPdda2ce6XLWJRL2Y+
	 EjgQxj0GSQh/7ZsfeNUcMaJ69ovWzwXEhVY/bWsz3qP61gm6+P3xNIvgDgdKc6CIKC42H
	 vOxupPj1iDb9JGnEPiUyH66lwDURmzzGnhNFqRP2vl24GO6CZjIsyWzxoL//vNiu3lV0f
	 qDnoFgncpRNaMY4XBCVggcmg9grzWAGSXN7IRSYl6wij+EQPnw775Jy9DGRsBUugiRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879178;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7kDT/08MYgZzSbeK9cCDjGOR825/M/OxHZ+pNiLpjsk=;
	b=vsEKcMWKTeuf/BGzKvVBHPvGuHH3zYbvifMFYro8RU8hopRS3jpH5XSMNtK3j42HAAqe
	 hwN3PIWqdHFC6yBQNV3U8q6jzUYeBYeCgihyVA/w5I5b1BwGSkfVrUs6YPyRjs2HZGi0X
	 gA4y2BxXtbQImP0xLtlcE2mmr8nWkJ2ckEMsakIytZMQhH78MrR26aaoNxDhHVlASF6el
	 k/Mqp42LyX2t3chaDsjG12wo4Nfiyx3XiLWj29sAbi8wLrOeCXteKpEpy97AHtOiEYUHu
	 ubt8K2v9+/zWPsi5vNNZoE44WYp+rv5OPc3BrRUH/YddHh1eMuvM7FryiIr0Zc/WzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pon09bhx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D598606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 01:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pon09bhx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9851F000C4;
	Tue, 17 Nov 2026 01:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879178;
	bh=7kDT/08MYgZzSbeK9cCDjGOR825/M/OxHZ+pNiLpjsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pon09bhxLCs+F4KbEe+rckHg/Nx+0mCbUTytiL9HkjSOW5j4ZNLbJpgQ2qIjtqk6R
	 yR7jPNiTBO045fLsNUhYo7RI05HV/vEuga0LxBrTjOcCk6lKReQ8xTVnhwtVK5VkgZ
	 f/OTh6axiW1fyiAGtsMkkoRSfDMgAVJxq0P12pP2QzS4OoVawQjrCmUygFNJvVTOvP
	 muws5bgnfDngnEDWDB/TcHK9LgTNUaY8Xk1UG3B61qoQ/WiHe6qwkBrfKSCtgR8F44
	 QA7eaRcPJjI+laHSjPz3uzcbPCODpuvgdbEdvEQkGVAK9OuZgb5r+DCbeWkUEHULdk
	 AxkJ9nTHuOUjQ==
Message-ID: <sashiko-outbox-218046@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: storage: shuttle_usbat: set the ATA sector size
 at device init
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117012707.5858-1-25031212351@stu.xidian.edu.cn>
References: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>
 <20261117012707.5858-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 01:32:57 +0000
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
> only assigned in the READ CAPACITY handler, so it is still zero when a
> read request arrives earlier.
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
> The ATA sector size of these readers is fixed at 512 bytes, so record it
> when the USBAT flash transport is selected, instead of waiting for a READ
> CAPACITY command to succeed.  The datafab and jumpshot drivers, which
> share this code, already set it during device identification for the same
> reason.
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117012707.5858=
-1-25031212351@stu.xidian.edu.cn?part=3D1

