Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C14349BA
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 19:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005089; cv=none; b=Zi3q0VbrQ92f/0qNF2o5QnZGei4SmuelDWo/N8ZK/QurCLORskpg/wOE0lB2T0zqLi57+RZvQ67tbQP5Qkty4kDWTLahF5lbt/mpk9dREdJhABxBgiYQXcvH3TUdecFLqLJgCllE07xwl5IxUOYEI1Pqa/L/2d6RoPdPkkmfDHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005089; c=relaxed/simple;
	bh=5ZPepna8J9KfBGCXPHJortzi4YRodOCSNReGJFhRRX0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EorYcOHMXMJvrauIcOWnWnS/zWuVyXoSr1LwoGk6lcBpnn0Oem8dVhde5SLmUOuCku3vkztM1Lv0WOwS/mvLr2bBRDyci/1Tkq4Yth8rRniLOt2WZtAmS2r5VP7gxC7n8Cs5Zgstruv1OYvUQYWg259auQEt142A53n/ZfU8Z9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULGn7OqC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULGn7OqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F72C1F000C6;
	Wed, 14 Oct 2026 19:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792005084;
	bh=5ZPepna8J9KfBGCXPHJortzi4YRodOCSNReGJFhRRX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ULGn7OqC5Fw3A7yEAZqepG7X9b8wHpXmd3QjJ/PfVtwf0EUCczCoOuLinlCsUxJvF
	 ECA2e4Hw4jaeEmdxdLiM1bw7m0aM1VvITPdwfTVWk8Vjdkx6pbForic4ixmoRjBlql
	 /DASWQkBJhHozYs32nm7ft3bScXAYkrDPCJyBPXMiF/6KyrzIcaViuPdqDk0AXP1ob
	 MEiK2ca0aecm0ZhDryjyS7BlHmnI1DRg9RgCfDHCipNp1XEGNQdnAQtUDLaHKgDtLH
	 ELzjsvxHWBAMneGiIRzlJUwD49pxOApJJP5ftb5ez2CV3KMSyF5mNsLPIH3CStFOOS
	 XhcC2FJUP/4MQ==
Message-ID: <sashiko-outbox-171757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] ACPI: utils: Add acpi_evaluate_dsm_exclusive()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxpIEFobWV0IE1lbWnFnw==?= <aliamemis@disroot.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014190544.150093-2-aliamemis@disroot.org>
References: <20261014190544.150093-1-aliamemis@disroot.org>
 <20261014190544.150093-2-aliamemis@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 19:11:24 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add an exclusive variant of acpi_evaluate_dsm() for _DSM methods that
> are known to break when interleaved with other AML.
>=20
> Signed-off-by: Ali Ahmet Memi=C5=9F <aliamemis@disroot.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014190544.1500=
93-1-aliamemis@disroot.org?part=3D1

