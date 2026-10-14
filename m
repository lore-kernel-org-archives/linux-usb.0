Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714394779B2
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005248; cv=none; b=TZdoaImfCR7ZvUDOE1p8QECoImRITZP2189ReuBqdj6jFKPqOV9Rf6BWfp3BXerrRfPp7HPOo9AQ9Ul66bgSd0qxsJadx8NjmLY1JCGo0JBpBrM4oPEa58s8xHc8uT3GqgQh9mdAourDT3uWKM5ShXv+LMuZQfiAWHW5xLLz3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005248; c=relaxed/simple;
	bh=pMHeM/Rk9ICdqM5mygqr6buHh1sgqn2uwuo/vOpOoAc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LatIn68DfeQOCMbUbD6UHOcOAoXK9VNpvbgmdldiSPQJl9D9jIhgMwrp10J0qPjuzZBpu7h+e0URnc+BssQf29N1+SVB6txKpriWCJdt0x4x8S+BDFcRTmOJTMSP+GNSOuVouegf0jJ3OW/xyKi0c5cEnBm5szI0ewZNV5UK8zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZVda5by; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZVda5by"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DA61F000C4;
	Wed, 14 Oct 2026 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792005247;
	bh=pMHeM/Rk9ICdqM5mygqr6buHh1sgqn2uwuo/vOpOoAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZVda5bykLHPe5C+6Q3IrwnMBkd8994MGmaV/y+hyC/LD3VM1JlcjIxuyWQex8LK7
	 z452DD3iyRfSYTwzT1gMDxTzChucqhVEJJG5VYO29x7eV4l5WJHt+u+CAqmk11qaoE
	 So2MxT2tI4wrKrPVRziENxxbuHyDOVNSomILRm1OcoT7ftrtrA6nplj9uVZq3gUkPK
	 zfht2QR5R4G8ZAmokHo/jkZnzq2A5jprbJlhtTV8e8MBiOjOuzNsLbc1++Kh2qbfO+
	 obcgBsRFoTC8uqXtawv3DjdnyxN3iovgJ9l7h6rhweatbS43ljG1nXl/cccFpA5nY+
	 kzInitwViwLBg==
Message-ID: <sashiko-outbox-171771@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] usb: typec: ucsi: acpi: Evaluate _DSM exclusively
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxpIEFobWV0IE1lbWnFnw==?= <aliamemis@disroot.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014190544.150093-4-aliamemis@disroot.org>
References: <20261014190544.150093-1-aliamemis@disroot.org>
 <20261014190544.150093-4-aliamemis@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 19:14:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On some Lenovo IdeaPad and Yoga models, the UCSI _DSM accesses the EC 25
> times through helpers that take a shared AML mutex with a 1 s timeout
> and return 0 when it times out, so UCSI commands fail under contention
> with the battery and ideapad methods.
>=20
> Evaluate the _DSM with acpi_evaluate_dsm_exclusive().
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
> Signed-off-by: Ali Ahmet Memi=C5=9F <aliamemis@disroot.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014190544.1500=
93-1-aliamemis@disroot.org?part=3D3

