Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891964;
	b=iO2fIAb0o478GCjXRTC15zlPP0H/KyDxeCZRbJ5DXWB51km59FcFn0/av3vKTlue7emI
	 5K4D7az/WVIkMRl13Yy7zswyDXp+zZYiKhVQlxHNYVYFIKtseO0f7DXQOvAaKKcxQaNrj
	 3VFoFUN7nkjIiJ75n7BtnHDw9y6igYd07D7u8mRcIVwGqq9EgWbrMXxTe1TMELyUyNhHJ
	 VzqgZXJVYjPR5W5DGL/vQI2j21I8Hl1tlOgwYdHiW/PdcEBjtUJFrWhGzp70db1KuOD59
	 ewyYT5i/AOuljeCku9j1xibtqRYCMCvcRxUYR4cVGwcqcaNDyEnh8eY1bJ5lPna/iYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9TqI1wJOQoct2lx9184rb3E1k1ZovDlc58nY5XpJH40=;
	b=cS1Vmc7bgysS6ViNtulf7cWmRlb03q/SQDrTHzP5D+3uy6QTXey/zNmNAYvoSkbrOYWW
	 bA6U/6HQV+WF3OM5WO7lkaUSRoLvW15Qfoco6WiqRVz/uY6ohzPN9grcNdzld5QDGh8Pw
	 a4CP6ifp4zSJHCvEePBawWsiYselRGkJqeOb3NgELCDiYeaIxUNr8Lo8AkyqxqcuJEx/j
	 tsMud+BTFIHEhhcFQin7uXZBESWyjBIehiSKS0c/D5EuqjcMhOvQC8DyCrjiuARmSfuTu
	 oeq22pY0EU0AjzMT4cBKhNBwhqToWxJd3L4N/qWRElXA90c9OCjE4GnB9DAdsCc4A7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I8Pd5Ucn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E27606D803
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I8Pd5Ucn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F121F00A16;
	Thu,  5 Nov 2026 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891963;
	bh=9TqI1wJOQoct2lx9184rb3E1k1ZovDlc58nY5XpJH40=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=I8Pd5UcnYezSZFTX4IyfB4lxU2ysFSyeaUl6uvS5WgqF/dn/TNZw7Byo09w78+WS8
	 BcX8Q8y+uSGbdZLuyTSlbQGoal0zBXg9EkfzBjxGW3Ux9qP7LhI0Z6POWcg4gs9bTf
	 Fhj5zHIR10mIHaF7xBXeu4FbFPszRagXN4vzI8/WwcQZKRmHJJhbifyL50qOGVQFrD
	 vw3tQS+lSp5XFzQEblkkDPXPu/suse4ZMPUEutEJXMqCJFEtHXyP5MTSEFFb679PeG
	 zToTTyqk2DkxcsMzRKu6HrTsJevMKlJTPcLIZJgHu6YYU7PWVPw1Qe1uNgxZnlSb6P
	 546Y/JQFINCTg==
Message-ID: <sashiko-outbox-199306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: storage: add quirks for CASIO calculators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Touhey" <thomas@touhey.fr>, linux-usb@vger.kernel.org
In-Reply-To: <20261105151348.19009-1-thomas@touhey.fr>
References: <20261105151348.19009-1-thomas@touhey.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:19:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> CASIO calculators using USB Mass Storage, bearing
> product IDs 6102 and 6103, always report non-zero
> dCSWDataResidue for requested transfer length
> >4096 bytes while bCSWStatus =3D=3D 0.
>=20
> Information about an fx-CG50 (OS 3.11):
> T:  Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D06 Cnt=3D03 Dev#=3D 24 Spd=3D480  =
MxCh=3D 0
> D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
> P:  Vendor=3D07cf ProdID=3D6102 Rev=3D 1.00
> S:  Manufacturer=3DCASIO MassStorage Device
> S:  Product=3DCASIO MassStorage Device
> S:  SerialNumber=3D0000xdPUBVUq
> C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
> I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 Driver=
=3Dusb-storage
> E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> [ ... ]
> E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
>=20
> Cc: stable <stable@kernel.org>
> Signed-off-by: Thomas Touhey <thomas@touhey.fr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151348.1900=
9-1-thomas@touhey.fr?part=3D1

