Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296235;
	b=c4H/81w0WO3sE+FpLNAPzg9qtmDTLG/EmZ20+4FT4OeeCvpP7Vvd87Ca57ysY3b6rZum
	 W93EYG69SWD7ViAld56D+1u3Z66MzRAGGtnvTTrGNMzkx2tWhuSzhT7Zm19vsRBkeSCIx
	 DOLUPxA/Rre7zc5mzoK1oXbpTvEXgR9t7tOCVfkoMMEYGKPkVCi3gKyzsze7m7rtNeDvd
	 G+rbdgsN0NWLz9M7fK5ic6YclMMylAgYO4zCUQA0RHiYfpbCu/3dcpp/2rxmu0xzBvQ8Z
	 pBXlcHk4sDnI6u5lijRhEsxgwEUfdvubVghCpEV//7yZvq4uKL9w5QX343Jn62dLobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296235;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pp9O8JnupuIBmjf4BYU3SUKktRAT0ODTWzeHtw0pO4U=;
	b=ZhvsOtU7oTou9wcJ3edzH95p+ccMarpyUUkx8rVBeocmNbpyaNiiRPfHcoecaU7VkJdm
	 tUTFISkuUQ6OWR/i+DGzeuCaMFoxbxo/YWVuyIOyr7gJWvzaKroK1wktO+nGok3IpD0Kb
	 WxiTWMtJwYD7gSaMVd4OsWwYhOczeBE5daNZe1TQyllIjXqQIHZHw1yazwMXQX0qDVSj4
	 SNCyrRTNWp7W/hnClk8OJPEZckYPBcb1wxvUkbhMOW0gt7V76YRUiUJ6+clTbbUB5EUdc
	 Y6VVfJdd91uVU9sRxF/djc0EFwAo7aABEewBUIpMRwUUutJTwe7fHPjA28qxTENolFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="blL/A403";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6460A263D
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blL/A403
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683881F0089F;
	Tue, 10 Nov 2026 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794296234;
	bh=pp9O8JnupuIBmjf4BYU3SUKktRAT0ODTWzeHtw0pO4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=blL/A403Dr+z7HX57sOLiSdCYR4SAi+Br1vI4XxTBgMB4HwDGq9RGpzDRsMhbu5Wk
	 lQnQ/5V+ExBMpeitwh8cQH1D8u4jFvcpWU8nVNe3dKpK4Iq6H2E1g1WEa4qVbX7pOL
	 jGEp3yXZDrznU36UUYwGWrRzslQkb8fImhsICsNgl6Cd0PWEm8m2pSA3a5+6NH5e7k
	 q/C15WU4IUUcdAnYouklA/s2ldsWsgn1VDFcGY3pi+5SBtlww39uoUTFUr9l11tBik
	 2dWSm++PO3WG4BcgrAPrKqm+p8sMWI2mmQOctJbn7T72dBphRYspy+ZARDm+iLsBAm
	 EzcYjp6A4WAYw==
Message-ID: <sashiko-outbox-206523@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: Remove duplicate VIDEO_DEV dependency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ju Nan" <junan76@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110073442.79443-2-junan76@163.com>
References: <20261110073442.79443-2-junan76@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:37:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> USB_CONFIGFS_F_UVC lists "depends on VIDEO_DEV" twice. Remove the
> duplicate dependency without changing the configuration behavior.
>=20
> Signed-off-by: Ju Nan <junan76@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110073442.7944=
3-2-junan76@163.com?part=3D1

