Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113452;
	b=KWXWK4IsGg7N3XmjKkt4sP4EBTLtAkq2r+3p3TGNLWljJen4VBPHExeT1U7T2rZpIIQT
	 vB232Pon/WeeQRFQEO6dSxSbdu1ZEHyrlYp24P9e7y6VDw3eAYwsc2Gmjg1rez0M+gOlm
	 qqVkAnKLRLwxzkzoUytdapR6qOB1P4+GkmwyTTsVKeq3tz6+LH1fPxbPzBT5R414KmZHL
	 axhARveehJKnYn3tbGiQ3SXEfxlY6/PKEhMFXQvlmG1o10NfXegAzzxpzE5dKlvWGGjw9
	 dfsDSoF/SEvdbMPCFGCsBPE8XOmFylvCsZuXzqkTYanVCUQ/xeGIyLT96ilfn40DaEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113452;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DpOEemyM3tjJqpHCq20wuw5NDZ8L9lUMbOONR6p7ag4=;
	b=ysvVKaHHPaE6e/riRBo1LDvxX5szNk3l7vZbeIgvLf0tFieJCyPm+mRfSp/Xy2pRFPJR
	 VYciw8KyysDP6vDgn4BZ2NQfEz8FX58rcfzpBxJ7ji8kc8KvZkjEEY/YrOtHUU20ziSAX
	 gwA3+MDlIpNbnuUNcaW0zs2vJDxyJ5nnkjTxtAgUp+nMcPtiq4aU0OUV81o3ycBMGHmWo
	 FdE/q/87ewwka7qSEb0f+b/8LnISLoWjIwJSNNuxBgLQIJdyozmmGogc0MpCpF6O1Vzfn
	 9AwGcrUsVT/9OwJlWX2xSpsEU7zc574t++NjV6/yoq3BVS8qsgQL4SJhDiQifgFJwWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GEJtdQE/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D1606A335
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEJtdQE/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEFD1F031E2;
	Tue, 27 Oct 2026 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113451;
	bh=DpOEemyM3tjJqpHCq20wuw5NDZ8L9lUMbOONR6p7ag4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=GEJtdQE/QDxbP9rKekuNAV95Ajr1Si1O4wBf1RfnGvAMJc1+elIxPxvDB6dzOf8AF
	 TngYmdsNY6glCIG9/2ojkpiwt/SaCch9sKfP8a2PDPNHtL3v2GMOftVXnnrdZ7RI9K
	 Cn9rTGnL7UrMzAbtZQgIc5vE+VebG3zw+e4pcBTw8AiRufJAx2TGMK8brzau/3/v2a
	 vVNZqKS/0xExRkjCAff0f6DXWpDQGFwkGYnAcHMdj+ItL09b0FYJLkiPUwbC1gp1hp
	 1Uu6yxZrpBk1Y5GADhYjmqZmvGmmcZ7WfDVFMH3Z+2OpkS3ixAaSiuhXXaLBNBO3Ld
	 wdoJlzXfQNdpg==
Message-ID: <sashiko-outbox-186789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/19] USB: core: signal the end of an sg request last
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-2-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-2-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:04:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> sg_complete() and usb_sg_cancel() call complete() with io->lock held and
> unlock afterwards. usb_sg_wait() does not take the lock again after
> wait_for_completion(), so it can return while the other CPU has not
> unlocked yet:
>=20
>   CPU0 (giveback)                     CPU1 (usb_sg_wait())
>   spin_lock_irqsave(&io->lock)
>   io->count--
>   complete(&io->complete)
>                                       wait_for_completion() returns
>                                       sg_clean(io), return
>                                       the caller reuses the request
>   spin_unlock_irqrestore(&io->lock)
> [ ... ]
> Cc: stable <stable@kernel.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D2

