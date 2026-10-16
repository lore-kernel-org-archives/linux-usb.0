Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE744519BB
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170277; cv=none; b=Pg1WfhnAN47kGYerjUd7TSPzvLB7rY9NPXH5isFghf9ixtUozlLT4r6DrhB2v2yG21WThvnWQxoX12MTvi8RitLfZNztHXEvdQ0FSYhAxq8xnWvnwbD1rKnVjTbmsuu009F+gWVZ/5a+VJdVUUsR4cWZN6N4ZzeaMmRWLMK+yt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170277; c=relaxed/simple;
	bh=3eW0wn7T28ErOO3mW5gpJJTnBHQ3p5VTpE0pYc197fE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=hB6fKYFTVeInTQjul97AaMCmhrFN2JJEmjg989RBPk6DfS0dxsUXaAvxzpycLlgjatNZWy0xxPWHj97cGLO35brRJ1wO3HTeLQ/I+eqivm6uXdT1LhnpG8QK9csNzqNa6suhEQwgY+/WP8FMB5cHeH6Lu93vSjcD024sjAqgGNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4GDBOvj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4GDBOvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD931F000C4;
	Fri, 16 Oct 2026 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170276;
	bh=aJk0FVXOU4pHPq5LHUxEr+ZSf3qMi3fVYuG6/7rdz2c=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Q4GDBOvjPc9E3cY7KLjYZjsaZJFEXu43PpoUH1poB42EnejBb8l/R9MqtgxGaw9if
	 gpmTfQiUKmDZWM9o+NifwiXkAPQIh6k1/aZ+Qv/84JptO9zEqtkE2ZTBjny84Ljr9q
	 XIJ6TWGJbyGA9TcpyIXGXq1jjaB+HDn9JZm+4CZ3iyw+BNL9lnPPnG+7LZHYeXR58O
	 Xb8qMkSC+xmDSJLqY+UfpNDz/eRhV9jbXZ1RmeCDjdUYTU1kMtWIdqHh4OyuQCp9fe
	 Rbpftz8OX+g0j8dUvQ5CyYhTdDGqfVz0aY4oH7ISfw2lSasuP8BaVdgz8QbFjnyRdk
	 oOHPrcBEMGxLA==
Message-ID: <sashiko-outbox-174677@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2 RESEND] usb: gadget: u_audio: pass channel counts
 explicitly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Farrell" <kaf@nwlink.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261016162534.384844-2-kaf@nwlink.com>
References: <20261016162534.384844-1-kaf@nwlink.com>
 <20261016162534.384844-2-kaf@nwlink.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 17:04:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> u_audio currently derives the channel count from the channel mask in
> struct uac_params in several places.  Instead, pass the resolved count
> explicitly, so the shared audio implementation does not depend on how
> an individual USB audio function represents its channel configuration.
>=20
> Initialize the new channel count fields from the existing channel masks.
> This preserves generated descriptors and makes no change to user-visible
> behavior.
>=20
> Assisted-by: LLM
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016162534.3848=
44-1-kaf@nwlink.com?part=3D1

