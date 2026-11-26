Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721863;
	b=WEyYHrPZKe9KNd6zK5YYlOsAe8AYYH8mar3YOV5HC1Zha3p+pa1S+vBuqEmnnz2V77RS
	 GzGBFOjTxfATU04yILECUmM5LNet50LgOzDUn9V9TdCOdB/VFn60YDTVnL1Q+w6YpmHgX
	 h8b/MZ/qPlbYItPo+o3UHNt9MwMzt8lAEnpdPYwQgDnDYUUKOkVMywJXcSNv0U9xrO2+G
	 gjl8WvndKDsqRUpT4gVMI0kRQIB1M97m4Qrd0kRx2v/BawPiMWjaHFDuhvc9qDfOOjYoA
	 P0kS+U5O7jovbFZcR3XRwvEpmdz1TWkoNHMlRGFIz5PFLMbncCvPkFQ+UUX8sBii/9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721863;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eke9gEKA1LylHbUo/tQXztfYqltHdI6BnYdeoN6EgpM=;
	b=o4gVVlwLTT1MrJWwaw53/IIXvYE2vCaUVtzPMDa8FYpaGyi9B5Dv3tY1riqdgamFfEXj
	 qFke8pDv2ey97fIyRoonZSJEZvQkNASo6z9rZitpzLTyAX0wd/t9R18H+LIi+DELE6Z7V
	 I2h/GZ/95EomGf6o1kWHFSfwim/QrgAXLdekJaxG9UCxKUVolYC9g/PqfHYuse4P+Y0vB
	 7fRMB89ITsPxOyjCKBbdlegTStneicjJDFojAQrh903xSHbcu41O5ElGRjMoyeQoH7b0C
	 9twCQH1AET7vWPGKV+bDZNQMH8nWc+oqmuIa1AuqRHtBgSUEWavU53dANhwswB5iWEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVV4mwSc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D39B606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVV4mwSc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7931F000C4;
	Thu, 26 Nov 2026 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721863;
	bh=eke9gEKA1LylHbUo/tQXztfYqltHdI6BnYdeoN6EgpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVV4mwScgJbqD/FSXWQtNK4PF+kr/j3Sj119+7fvxlvvpFI89ygPZI4E73uapsgpX
	 TdZLVyGKc81wFqpwiyT4SbDYwFl86kYc+Fl3Xx5VM2bNdtDNhvehiAbjh9HPYwKwI8
	 0QtWgajvQfI8E3OxJAHaCnZyigsZ06ibb1vUawIBf+i96ZXKvjKQrBo7h8vh5sUVeB
	 5SPq0gJLs4qMgSWp3aeh2SUZNkHsm1+D+BajEtXdKQ9eAutXeE8TMJs4slw/JMEUlA
	 tEBElmpZlGSBAAXDxtO6gFD068WkmpopgnGuJ7sO2A2hfm+lQDDFP56LULgQPn6Fcd
	 iQ0qsjbMgeKrQ==
Message-ID: <sashiko-outbox-236101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types
 on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felipe Infante de Castro" <felipe.infante.de.castro@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <CADy1qsYCggH1S=yVEQ44mj0WVr=WimiXLDMk-zyr5KZXVG8SLQ@mail.gmail.com>
References: <CADy1qsYCggH1S=yVEQ44mj0WVr=WimiXLDMk-zyr5KZXVG8SLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 19:37:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] usb: dwc3: qcom: email commentary and duplicated changelog in
  commit message
- [Low] usb: dwc3: qcom: missing Fixes trailer for
  dwc3_qcom_enable_wakeup_irq() bug
--

commit 5db5a7b1febf102a7cdfd576795edb2f79f0c55e
Author: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>

> usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types on unbind
>
> Hi,
>
> The patch is attached as a file rather than inline, because my mail
> client cannot send it inline without wrapping lines and converting
> tabs. Apologies for that. The commit message is repeated below for
> review.
>
> On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM
> high-speed PHY interrupts to a single edge, chosen from the speed of
> the attached device. The IRQ mapping outlives the driver, so after an
> unbind the mapping keeps that single-edge type.
>
> On the next probe the interrupt is looked up again from the device
> tree, which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with
> a trigger type mismatch against the existing mapping. Because the wake
> interrupts are optional, probe still succeeds, but without the DP/DM
> wake handlers, and USB wakeup is lost until the next boot.
>
> The patch records the trigger type of each DP/DM interrupt when it is
> requested and restores it from a devres action. The action is
> registered after the interrupts, so it runs while the driver still
> owns them. Unmapped interrupts, unspecified types and types that
> already match are left alone.
>
> Seen on a Microsoft Surface Laptop 7 (x1e80100-microsoft-romulus15) on
> a 7.3 kernel: after unbinding and rebinding a controller the
> dp_hs_phy_irq and dm_hs_phy_irq handlers were absent from
> /proc/interrupts. With the patch, a runtime suspend and resume
> followed by an unbind and rebind kept all three wake handlers, with no
> trigger mismatch in the log. The patch is against mainline; it was run
> on 7.3 and build-tested on 7.3.6 with W=3D1, not on mainline itself.
>
> Thanks,
> Felipe
>
> On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM high-speed
> PHY interrupts to a single edge, chosen from the speed of the attached
> device. The IRQ mapping outlives the driver, so after an unbind the
> mapping keeps that single-edge type.
>
> On the next probe the interrupt is looked up again from the device tree,
> which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with a
> trigger type mismatch against the existing mapping. Because the wake
> interrupts are optional, probe still succeeds, but without the DP/DM
> wake handlers, and USB wakeup is lost until the next boot.
>
> Record the trigger type of each DP/DM interrupt when it is requested and
> restore it from a devres action. The action is registered after the
> interrupts, so it runs while the driver still owns them. Unmapped
> interrupts, unspecified types and types that already match are left
> alone.
>
> Seen on a Microsoft Surface Laptop 7 (x1e80100-microsoft-romulus15) on a
> 7.3 kernel: after unbinding and rebinding a controller the dp_hs_phy_irq
> and dm_hs_phy_irq handlers were absent from /proc/interrupts. With this
> change they return on every rebind.
>
> Assisted-by: OpenAI Codex
> Assisted-by: Claude Fable 5.2
> Signed-off-by: Felipe Infante de Castro <felipe.infante.de.castro@gmail.c=
om>

[Severity: Low]
This isn't a bug, but the commit message includes the email preamble ("Hi,
... Thanks, Felipe") and repeats the four-paragraph changelog body twice.
Notes for reviewers that should not end up in git history belong below the
"---" separator.

[Severity: Low]
Since this fixes the wakeup IRQ trigger reconfiguration added in
6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during
suspend"), should the commit message include:

  Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during=
 suspend")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/CADy1qsYCggH1S=3DyV=
EQ44mj0WVr=3DWimiXLDMk-zyr5KZXVG8SLQ@mail.gmail.com?part=3D1
