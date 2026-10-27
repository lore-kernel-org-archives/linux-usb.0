Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112716;
	b=2zzPODlCYClok0uqVEaKSMnxHGez7SsdlWhSsYypO1KiRQUGmudzRYhl+Wp+jV2Njl08
	 uY2xAk0KXwvVD6lRp+k2IgAZCGbHGqaiyuAeWfSVAehRT9Bpvepo0PwYqqSATYXqvtflQ
	 egHjZBM0kNO8po+gTZr0lXpfk3GsWVNPSSfdt3TSFhwVsAnTXZ9SCTzeffUS6pcOgMgkS
	 9kQjuw4GM7FeER+lQLyx1EHkHfMEor8xVVcXmN+cuS5ZwAoys44oDkEbmjnxlQsBXatPs
	 gvfB5jppyrDjbr2u0LPzxgvZuwimGe95DzofG9gSn+wSreFU0hQX3RUYppq1VPEo9Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112716;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jshi0YlxWRt8+t/qro3243KV/dto1j9NUI862SgCI9Y=;
	b=ID4DR4KfjQhqxSDEq0vSRYLBLQy35c5B73J+ieKpOEbGdSnL43CXVC2CjcWK8vcvtfZN
	 bD6JbrhZp04uW1GpKDpY1KNj5pHvs697Pzj58FqKce8ex2vNl9w/7vrEAbfEz72uoxYnc
	 f81fOg5XMgGwH049rDdZhJWlelwgbYynByartzxsKhNzS20flDTU/PZgm9ASWjZZChVBn
	 EoOVWRNx20PQSA9XM1hpyCqytXXKPoF+jxE6LpqMkpiIgKgBx4kq2LUXXbN4Rd4N0WMPc
	 DTf9fi6ttW0DKNmhPlvXXzaHpr6GyqlYgFaXHpqtb19Y8GlwAWfFbu6aOK206RlGhyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgHv7VCI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D160A2622
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgHv7VCI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8BD1F01829;
	Tue, 27 Oct 2026 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112715;
	bh=jshi0YlxWRt8+t/qro3243KV/dto1j9NUI862SgCI9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PgHv7VCI9PWnwdEHremJ4zxvAOH+R2izbshK+Std/QpIFi5ukgm5RUUypaI1xuB48
	 V/wz4WMoiN1kBhCTRBNpZu+glFvf6TCphlzDZbQ/Ej8lM/x2G63i0RbPuoYNZNLjhM
	 U2wBiSpPSQ/tlf2Hwk+5LTSQLouI6WKyWC/4J0cwYinxKLL/lJ7UHqecyCOY3Z9Los
	 KhGatgFfDhM6zcEtkQUdh1/1vtlCyFahKutAeP1VaxTkwj7hKY0IX0m3a15dnbaO98
	 BUYNdYWWiPAzkoTpG7k6XNTQxG3DfV2B4HLfgxHMaedjMIYYHphdLSpngwLDsFUBdD
	 XERJ9ScdjbDGw==
Message-ID: <sashiko-outbox-186768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] usb: storage: ene_ub6250: fix write to unmapped MS
 block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-storage-v1-3-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
 <20261027-llm-usb-storage-v1-3-d1655e94ed10@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:51:55 +0000
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
> Writing to a logical block of a Memory Stick that has no physical block
> assigned yet makes the ENE UB6250 driver write two bytes far past the
> end of its Phy2LogMap allocation.
>=20
> ms_scsi_write() looks up the current physical block of each logical
> block with ms_libconv_to_physical().  For a logical block that no
> physical block claimed during the scan, Log2PhyMap holds MS_LB_NOT_USED
> (0xffff), and for a logical block beyond NumberOfLogBlock the macro
> returns MS_STATUS_ERROR (0xfffe).  After copying the data to the new
> block, the old one is marked as erased without any check:
>=20
>     info->MS_Lib.Phy2LogMap[oldphy] =3D MS_LB_NOT_USED_ERASED;
>=20
> which, for those values, stores 0xfff5 about 128KiB past the start of
> an array that holds only NumberOfPhyBlock entries.  Unassigned logical
> blocks are normal on a card that has not been completely written, and
> the card contents are under the control of whoever supplies the card
> or the reader.
>=20
> The bug was found by code inspection and has not been reproduced.
>=20
> Fix by only marking the old physical block as erased when it is a valid
> physical block number.
>=20
> Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr =
to drivers/usb/storage/ene_ub6250.c")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-st=
orage-v1-0-d1655e94ed10@linuxfoundation.org?part=3D3

