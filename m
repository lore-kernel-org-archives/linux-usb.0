Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368883;
	b=ULHdgcpExWtGLMJd1edGc/IOvUX8ZCcQeJztjWZi3J4i0QhBQl+1xqULhIlhuv/I8/n0
	 MSVVJR1aSDyT5hNOLByjbyL68VEF8CXwjpLjNnJSfR9Jt9Sf6rUxAXlEqedqeJKbooNAT
	 GmDfqLWbZE4iDU36d2rhjgq+FnfQ9qwfVwJxTkx2eZy+/R6gsoBnH8tVBufjEWeTCbRgQ
	 VDkaV6i+D1VIp5Lsr8mYGZX9CEcu1pnGyq2aYtliZLidDtzCMhnHcyYy4+bmETSKg87Iq
	 bSWpuyLP/Mdyavj0VrbFwsgTOKfIkwg9/L5hkNOfjQI25dBq3vxdFwWBLFLLPZN83Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368883;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vc+swCNlVllQfKVlq8Kko2XDqSYAPB6LhKBdLo1YNNM=;
	b=wmeqw2JycaGgLiDFk94Dzw1LIAlXymAI9PMVXmJ3X06ODIQdVbD2fknUXz4ZkHeJzWmk
	 IT0JY4x6kW9B0Bgh3j2X7wEA+iPzbcTOEIIzjBtGBwSwcVXjWqb0xPIthyGGlrJfrcY72
	 B4HOvnHNUS/G+oLkAjxxqA2lPfrz/m1/2G5oK4SFn9ZzsyBPRLf3PzgkYbzHp7Wg1LeKY
	 yHLdOUO6Rs6NkaB1J5TnPmFWRcxSoAIx+YWkO3YN06YGfD919D+jpBGkL7N0bdSxpY6Xv
	 Sp8y8giLDl/vkImCyY3UxSIq7gqPMFhRQmPGz+JD0MnWG+iSkv8HLldD8em2+ksUg7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCS1GVG8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314C2606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCS1GVG8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C291F0089F;
	Wed, 11 Nov 2026 03:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794368882;
	bh=Vc+swCNlVllQfKVlq8Kko2XDqSYAPB6LhKBdLo1YNNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RCS1GVG8b4tEXzmFoqBktRYZou3Z+zbzXMHHqyrwzjxeXshHFmSM9bSAYEccvLKhD
	 xplwLxixqb1vlTenChKgRAluQwsOAayf4DNoKZ5gRhRNkxyQtznAobwGx5fcQ92SU0
	 jGLBKWHXGBND46F38bhLmkC5d+iRTCMaS101x4ySkb1lVSILho+fEvqNwKPmEytix2
	 /0NmGpq8UxJwAJceMC/1MHIR7IQwiIjItVPDt8Jh8eeMSVZRoEGNt9fKIXapGhZgf9
	 HySUj0mduM4ER+6ANMkW0Nh2akX/Y+O70xX6QK7L0g09N8oMIf9faY47sGDaVwAX+c
	 9Cfb6xg2bo0Wg==
Message-ID: <sashiko-outbox-208225@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbmon: mark concurrent accesses to the monitored flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111034138.12642-1-zhujun2@cmss.chinamobile.com>
References: <20261111034138.12642-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:48:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usbmon: unresolvable Fixes trailer SHA 1da177e4c3f4 in commit
  message
--

commit 68910eb830ad82fcbb29334f2601dba719edc500
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

> usbmon: mark concurrent accesses to the monitored flag
>
> USB submission and completion paths read bus->monitored without taking
> mon_lock or the monitor bus lock. Adding and removing readers changes the
> flag under those locks, so the plain accesses race, as reported by KCSAN.
>
> Use READ_ONCE() for the fast-path checks and WRITE_ONCE() for the updates.
> The monitor callbacks still serialize access to their reader lists using
> the existing bus locks.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

[Severity: Low]
The commit SHA in the Fixes: trailer cannot be resolved in the repository
because the 12-character prefix 1da177e4c3f4 is ambiguous (the initial git
commit requires at least 13 characters, 1da177e4c3f41 ("Linux-2.6.12-rc2")).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111034138.1264=
2-1-zhujun2@cmss.chinamobile.com?part=3D1
