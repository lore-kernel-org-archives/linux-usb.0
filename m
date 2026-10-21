Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579928;
	b=SVQWobr78A0Xee7fNi6Hdep7MMuGpgd8NTnjls4wZO7hzvAwh16M2Op3hQxNGDTpqjy8
	 DjJN8fa5AcOm5ZqUshjrreEUjmCdOdLo9lKFtpgO0dORH0QaA5gNC7WyAU6aGYs0b2Ays
	 1GCqq5DdOY1AP95Q+ngrTya4eScQBvPtyua7uDbjAWpKoKqlqJt6uCVoAJMcY3W9rP0wo
	 ptAMKfhJaCWm+bGkMqykYM6+G0MTTY2OgqoIHmiXDcSgmL74vqR1Qv4mMFzHMsJ8B+/dq
	 Y245Sx5YtrIl+vWfSRdx7IPtfq/2Mieuyx8tELmHkXZVKgnGUDHbA5Jtky1HZSLljxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579928;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OR6EsEav74IJtyf41JxkTD6yckxG8KK7brQI3WmAblw=;
	b=EwmpQmrRXi/dVwdX5C63vlni/2GQExqCcrPdf/5LiSsljJTgAffmr+2f8GmIozORALjS
	 1T7xbOVLWZGlFE1HLL7kx9VJ++IZwjUe8lZPbUoSrDcCQgq0fcYEJtCvhOYdT0cXq4/EE
	 OpnatPW444u4O0E5HHR+Z0XqsTw7Y5YUTYappyJABcOiOt6QtHxrxtwaAq2gyF/TvfcFM
	 Q32HZbrVSPHpyg1W01QL5vuN19slExJnmyPsGWveap5vx2tFl+KKw8/hm+hSNDsmdV4Gb
	 qORDLxvVwbWGscN2L1p3FgdlOfq/KSOy2bO6DsD0T52HJOeLhHHgyRU3B7qqQ0hnTAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ff1bNdTQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF496606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ff1bNdTQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1111F000C9;
	Wed, 21 Oct 2026 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792579927;
	bh=OR6EsEav74IJtyf41JxkTD6yckxG8KK7brQI3WmAblw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ff1bNdTQbsDXsYEPJXOWB6SUwY2l3GoE8HCE73USbQF8qMyuGGxm9l1mASD28Ydfg
	 r1TQ4qzRMZG37n294oibq5BO9+DW+g175/F5E4u5yj3QrmUg2gst/Sc+hcCYsG30V6
	 6phn9wExIgI2Y7p88+h6sCAI0EZkCgTgavO4VzZaTdI3wwuoZ8c9sYrAxEIG0nPVjG
	 DKsDyv89kLisaO4TihVt9aGlg0HsBOc54Wc+P8YAJgl7rMQVhAr1LRzLFj2sVnI/HW
	 y9SWrQ5592lQ+ZUBahp3PcGF87YjofGA2q8Lzy28sKLet3nrSCIOpMW0m15xuNB7vw
	 BwyAWNeQRXDKg==
Message-ID: <sashiko-outbox-180125@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] usb: mtu3: initialize debugfs command buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261021104720.4106961-5-yaojiale02@163.com>
References: <20261021104720.4106961-1-yaojiale02@163.com>
 <20261021104720.4106961-5-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:52:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ssusb_mode_write() copies user input into an uninitialized stack buffer
> and compares fixed command lengths. A short write matching a command
> prefix can make strncmp() inspect bytes that were not initialized.
>=20
> Zero-initialize the buffer so the copied input is always terminated.
>=20
> Fixes: 4aab6ad24a10 ("usb: mtu3: move vbus and mode debugfs interfaces in=
to mtu3_debugfs.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021104720.4106=
961-1-yaojiale02@163.com?part=3D4

