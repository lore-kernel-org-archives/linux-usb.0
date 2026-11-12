Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500598;
	b=NAckIz1XFRXGeeYznNB/NRnxF9bY4PTjm8SrZii4m7A+8EzVgD2TVIFMiGPFcMUelryj
	 vDJSrjFe2GsVFrW+LOmODCA+RxsVW4uvCBZ7h3RdwA5ueZO0z0FA2KlnU2vKCzkSLcCI9
	 HDPtFtDhrwuBRENwG9Tp7m7p+zhlYZFqcpXKSedAtUyM3PjyAGQiAK59DRdoQrczQ7E5L
	 ymNPuVNaY2s7dIIsGY2SaqHNNlg9gNd95InT7Ihk+qDiUNX1YsCwm/Lww2VOLJ1ZiyrPO
	 Gk+OQXUvs7EouTik1u1Mfzo9wE6nJr7HWv0Idf3QGJJudCcTfnsTK3MbiRveV16sIzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500598;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O+8g9X5z/sg4lBi1jGOphQ97IpfIiZpwXYS+qU9gUPg=;
	b=Uwn45yMYuG4/dJbNU9h4XWPREt1mIgjwPIcHePY4X7uagBJyHTPQeDlvbIJx78/gBbwb
	 piiGiXOz+6A4cgtlmiVHJkmoxcWDkhxwsrdFBOHjby8NCrW5c0LhhMH5dwQCe6ygoqWb3
	 TX3+KXjSKY54f5t31TbIJ9DbC3GIRyrgM/yX0abO7EezhPwu9WisMWBQEVT1OST6OHfY9
	 VwUcL1aARkRETDpqCH/y0zJLR+1LcA5JGUu3dlIK+BQdmpDaMmetUB9MM2XxlUl4Rm075
	 JB8Wuu4b3YKoHlPB9bN6f3V5lgloKOzIgnZAAe3zDdBplCiHjNeYBEqp4Aq2DHoaEGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsRHIJ2J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D5606A333
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsRHIJ2J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63DA1F000C5;
	Thu, 12 Nov 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500598;
	bh=O+8g9X5z/sg4lBi1jGOphQ97IpfIiZpwXYS+qU9gUPg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=hsRHIJ2J80buawvNPcFUwUx2zxaG6BgnamyGSjKwBxV/vPJJHZKOai19bISEI9KKR
	 +M2ajCU7s551mrbCyIrrNA798hPreFcUdTO37GVN65mVQ/5lXcVXfc7jxT/F/mm90w
	 nAD1xXxpnUkTgKqIb6eFlgwzAk+VvXMONTL22uKPcLXzamid07SDkFXXDd7pISs+dU
	 YE+lWDlWr+Z6xgat9LaA1cBYrmRwm175BY6d4biYYjt8AxyDChgmSQ8gG2dFeyhXcC
	 PHpmJZpZQdBH3YdcYRB6EiH8Kbqe3vtBZYZOSVoQ9TvPl9Qp6Qh5+7CK48y5Z89m13
	 c0JiyBD74y7gA==
Message-ID: <sashiko-outbox-211493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts
 in musb_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chengyu Liu" <lui2012qwq@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261112160448.41566-2-lui2012qwq@gmail.com>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
 <20261112160448.41566-2-lui2012qwq@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 16:23:17 +0000
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
- [Low] usb: musb: inaccurate Fixes trailer in commit message for
  musb_remove()
--

commit e08f859cc70a9eed1b7e88c3628f7b1178dcabc5
Author: Chengyu Liu <lui2012qwq@gmail.com>

> usb: musb: cancel irq_work after masking interrupts in musb_remove()
>
> musb_stage0_irq() can schedule irq_work while handling stage-0 USB
> interrupts, and the work can also re-arm itself from the session
> recheck path (musb_pm_runtime_check_session()).  musb_remove()
> cancels irq_work while the interrupt is still enabled and the IRQ
> line not yet freed: an interrupt landing after the cancel re-arms
> the work, and musb_irq_work() then runs after musb_free() has
> released the struct.
>
> Move the cancel behind musb_disable_interrupts() and synchronize the
> IRQ line first, so no handler can be running or re-arm the work past
> the cancel.
>
> Found by static analysis.
>
> Fixes: c5340bd14336 ("usb: musb: cancel work on removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>

[Severity: Low]
In c5340bd14336 ("usb: musb: cancel work on removal"), cancel_work_sync()
was placed in musb_free() immediately after free_irq() and after
musb_shutdown() had disabled interrupts.  66fadea5b79c ("usb: musb: only
cancel work if it is initialized") later moved the cancel into
musb_remove() ahead of free_irq(), and f730f205cc51 ("usb: musb: Split PM
runtime between wrapper IP and musb core") moved it ahead of
musb_disable_interrupts().

Should the Fixes: tag reference f730f205cc51 ("usb: musb: Split PM runtime
between wrapper IP and musb core") instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112160448.4156=
6-1-lui2012qwq@gmail.com?part=3D1
