Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857056;
	b=RmV9QELWcqWTaecX+OzaQ4QSOKDCXBNzyZtLEnaMyk7ja8j9W/TK/BH1o5rpgR+skjEr
	 zr7IIPhscEwi+2RB35elh3pJgVKFqbeSXrZ86Pq0nstri93U3Wv6pVy44fmnjBxZFezut
	 /6VjqQ4sqpgBr6sT1Fee9ExgZYUC5z3KCtg9bHJ6KPWHzBfFN3R38/hO/1zlQ8PW/izwL
	 7G8v60DLjuRvL4kX92MCRUFfkUF25CAJIFkmsMDlsD5SJBifZk1OzsvJ9nLC4l5vvRq+9
	 KEkO7jGl/dC0wbE9n+1o1CBr8a0bt8a56/u5nuzgwyCR2DjVvv/Sf8QtLA4vId8uqQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857056;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tBOQBB/+I6j520shEqvAMt4cOg7yZcxM00z2BuCzytY=;
	b=OAsoWfOaOIK8fZJXYoSbDitC+WuLIBB+ETugvTV6jFggvGoPYEtfAGMZv9tZOpUCRgDd
	 QS2fwgPyuTaKRkNWRxOY1ldiu/NxnNDAehfq98DDJGprw5n/mcy6snWM0YIFdoy/Vqxyu
	 8FgVzHAsmTQu53io0+tsJLNACZEfQnNcGwtY3tRkLSPOy5yvYLUCRzusyWINQXU8aEvfk
	 zjGRW+z2BphC90OrN2UO2FURUTCREcCybQP2GLLVuP3xvnFMvwfQE5gfMgkbnNGne6Bbp
	 sqJYAgl3a/okjfmlwGBuyTt9Z7G2QjInwkSd7Mi/1EfvnnEDK1XeBfbzNFK+lvI1TTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HUwnVlu/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1532606A322
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUwnVlu/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF261F000C4;
	Mon, 16 Nov 2026 19:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857056;
	bh=tBOQBB/+I6j520shEqvAMt4cOg7yZcxM00z2BuCzytY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUwnVlu/UBcC38tlXTPph2hDU7BGVmL2h6xAoqyJVd7hUu7EjWC9qOnoqesv+P6cR
	 o0PiqXQGL749hYTFGtqyOpUg62w8twm6lNCkfMYHpNlQ+5Pn2tuCXtUU5Rd9fTnQcq
	 xqXzPq5ghF2g9pgqZkE0NqRBwAulvtatyiOh28XYVqaaVEXiHlHBx+gMLWlqrO0t1e
	 fLPkpNkCSprCD07SFMmV4SNTF/RAiCp4QSx4QXEL04Oq93mUi7CB9LIWSAT5dVw/VX
	 OQe6U6Lmkm4yJZ0hB6rOniRgmRIwcGK8Eiwynu8e6Q62+LGaCM2Pu7U++erGgre0J8
	 AFYcufXzHe6QA==
Message-ID: <sashiko-outbox-217559@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] usb: gadget: udc: crg: Add hardware definitions
 and structs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-2-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
 <20261116-axiado-ax3000-usb-device-controller-v5-2-49271ed5c793@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 19:24:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> This patch introduces the hardware definitions, register offsets, and
> fundamental data structures for the Axiado AX3000/AX3005 USB Device
> Controller driver.
>=20
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-axiado-ax3=
000-usb-device-controller-v5-0-49271ed5c793@axiado.com?part=3D2

