Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670556;
	b=3ZBTkljYwUYAF+V3Ke3iC4JjihGtL7uPMYOJeMNvApCJnbhUx9Gcx/oIATiLKegfGxlq
	 qxrdd3hIuDBNu3p+K9GDLIDkrP2MsxkStopZIGTrE07O0/KmRQvqXNfU+GmdpFvmkECZ9
	 yvPyKBZXpNfKx8yAjeibZS3ZXHDRybfmoTGovYbANO8bvA7zGnqzzyddHiYxxbmmKA8X5
	 /Evh3Eqi5P5WjdDRKxvGiIImfHkHbjGS4lYEbKjl11fcEl+7yF4MykM2UNzmpVaerrvvN
	 bZ/MRGnnVCYkGarSADIy27IUPtL3vNw9SBztMt1QmeB4nMZl0dVHAG6XUT9epaebzPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670556;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2r3lIy0j6onf5F7HWuTcqKMxjN/7N+1X6y+n7i05Tu8=;
	b=1vg8PyEwArQwJ96q4IrJHwcXRy3Mc8j8TkNgvUhpx20EG7oEhq2NmmDY5MlUpL47q2Av
	 4G/SqZcMO2UvWXwFERKD8stqAEas+RrS1XeeOm3TIDEahgC71FI7XGRZ5jHXu6kDuyGJ1
	 JR24qA8EKvRS1l0xmnfjU40yZ8iqXqJ1htZPzGaLWVUdfk1G1ICkTNH4dtSR588JbU/Df
	 Btbt1iJaUWD97/w+k+CYxP29xsiU0cWKYlyKCEuOckbs08aexyW4dEn9EycaiwQF4Aw7J
	 FvoU45xkXifdva6PejTpNP9NtWl0EChZtABhPktkHIc8WMfemoP8fus5VSUDh7Qn3HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FEM9f1wq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F1F606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FEM9f1wq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FFE1F000C1;
	Tue,  3 Nov 2026 01:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670555;
	bh=2r3lIy0j6onf5F7HWuTcqKMxjN/7N+1X6y+n7i05Tu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FEM9f1wqUd1L/mWCluXkBPEhLORij8gG+QTq4FVSQl6sjg1tUY+qm7pafcHyszNKU
	 JHATuDXoCPTSY37NvuNWv7FveumtCpxSlMyGyNfnIH4o2KFNOXsxaynuInchrzFqT6
	 V8Suyq+DF70Cp50Geet/BhddaWSzwagHFSnbTHULAViOfaiw4rJXxPyEcsHa2coq9M
	 CDpRjXe3+KsYV11zpM+ADMythtuEfaIBegcn/j8Wm2Z51wVS9H82XpgSJiud556GFI
	 3yKSZiVGY42r9vyPvAknhxlLqnM6WSTKJA1LVjO5PH5N2TWoX5j5bhsn/wbM8ZFGhL
	 QsWyhwn5XiZVQ==
Message-ID: <sashiko-outbox-194438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: ohci: ohci_pdriver.h: fix missing kernel-doc
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103014710.2451967-1-rdunlap@infradead.org>
References: <20261103014710.2451967-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 01:49:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Convert comments to kernel-doc format to avoid kernel-doc warnings:
>=20
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
>  not described in 'usb_ohci_pdata'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103014710.2451=
967-1-rdunlap@infradead.org?part=3D1

