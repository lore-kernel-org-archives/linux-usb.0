Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112767;
	b=3li6VOAH1HEHwZ4scc54x7JPc91P4HEWfvUJJc+oDpnTYG9WPzJS2azi/Jia9s9gdUDg
	 vL8SA0o+RCS9aMZZ5V+yrJbc9p30OCK155ntiW2P59K5rqJkxe078MbSiCKwBU6tAy/v6
	 qVaruVGsKtMVuH3dSPj2LDKp8zfjHnVfkSZcObngSTxeu24oKHyEMEmgDr4hpWxaMub3G
	 nF9DXfC0I+yosJdD5FuZfPrE2+Oq4FT9tsulOwYU5/+OaQHAAuTnLJgzDABJDAql8m5TU
	 XC9IkEq6Ivs7MdozQX59V8l1n8r/sdHUR62jzZNqNlrlxjlHsJzx6+wulAiqFuxMTTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112767;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NpSCP/998y4uJGtA6NHBDOCfh/xt1gkIMGiXgBBmQP4=;
	b=pJfi/9cTmZBwiX7tVSvcUO0UNNrWpk4M2iDy4RoHg0an1pigGvydKc1vrn7UcnsIyRgR
	 +gYOfSCW63hvQoG2RKOxa+2JoxZ4U2UWaSBnv9DaUVzpAz6SwFkyNc5tUwMrIekEQiIHj
	 9tik98lvm/XySaHKQFDnwYm/rI5o7GwKtebAOJumrBsPbAI81KFgZE8AOSOmEKSVdaE1n
	 AWZVcy9YyMouy0fBbyft9MvH8PWYM2APG1aTgAdgW0OUk5rXjBaavn/hP/tqKiytW99+4
	 DDgXsOLKCDd40Xj0ftYc8iyT99cHHtmMTF++zYIzMnYv6dyy8FF9VL+2MM6+K2JZs1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hh55kMDp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9819606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hh55kMDp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231A91F01825;
	Tue, 27 Oct 2026 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112766;
	bh=NpSCP/998y4uJGtA6NHBDOCfh/xt1gkIMGiXgBBmQP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hh55kMDpq+xq13IFI1mD9bkiXEUKIv3mKOhLNe6z5McGsyphO0Yt3v9BTQeCf1rIY
	 C4ODRq+sBhDwkt0JJSlKYoA+oWbWuGIEUarj+/nAySA21MfD12d+IuTclDl6sn9atj
	 WcOhzIRHUZdylG1jCOw0GFzFNlluQkAEG7xXxveak98JEZ7CusV5Fumf+3snx1pVK9
	 eOxk6lmzF/YnKD2ivxZoOOitd5UMz+FRW3N4YuwiQCdXEY6oVMtRBpDQMME4M7KdMQ
	 cD/YQj8fmmUislSqSPmJMLMaiVMOjolyA/qsO4PsEZhVyl3OD3hqqmzg/zmFK0sxp+
	 Izh6me7BCRjfw==
Message-ID: <sashiko-outbox-186770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] usb: storage: ene_ub6250: bound the disabled block
 walk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-storage-v1-4-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
 <20261027-llm-usb-storage-v1-4-d1655e94ed10@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:52:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> When two physical blocks of a Memory Stick both claim logical block 0,
> which happens after an interrupted update of that block or on a crafted
> card, the ENE UB6250 driver can spin forever in the usb-storage thread
> while reading through 64KiB past a 512-byte buffer, over and over.
>=20
> ms_lib_check_disableblock() reads page 1 of the boot block, which holds
> the disabled block table: big-endian 16-bit block numbers terminated by
> 0xffff, the same table ms_lib_process_bootblock() parses with
> be16_to_cpu() on 16-bit entries.  The walk, however, indexes the buffer
> as unsigned char and has no upper bound:
>=20
>     blk =3D be16_to_cpu(PageBuf[index]);
>     if (blk =3D=3D MS_LB_NOT_USED)
>             break;
>=20
> A byte converted this way can never equal 0xffff, so the loop only ends
> if some byte happens to match Log2PhyMap[0].  Otherwise the u16 index
> runs through the 64KiB following the kmalloc()ed page and wraps around,
> forever.
>=20
> The bug was found by code inspection and has not been reproduced.
>=20
> Fix by walking the table as 16-bit big-endian entries and stopping at
> the end of the page.
>=20
> Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr =
to drivers/usb/storage/ene_ub6250.c")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-st=
orage-v1-0-d1655e94ed10@linuxfoundation.org?part=3D4

