Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2B4E80CF
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559647; cv=none; b=LrdLOB7Dm1w7yD+tTU+lbix2hFdY9YHbXTaa8kaQZcFRUBCX1LlaG7oKlPnmUMOPHkStdCFtBxM9vGyPMlpWP8lEhH/rizeMOs7QAVKcT+IfH7ApTEc8ZPj/ps02BS3bkXHCTr1eQelZqa7FZwk05odM+ooZWLcjwddnYrLFQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559647; c=relaxed/simple;
	bh=ONdgQv6tjZPFLIikwgeyik/SK+muU39NS9waI+U4At8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nEhz7PlNfNiMRWF13ja9OEsnmU1x5FKqbi9i2dhn2MStDqHWAL/6K4hE/+aKsjlGnk70IUT6vcm8/ZDPR7YLv7CIJc3GpJRqlI60PYZtwAvY9P6BOyDbxWHE77TPGUrTcUDCJXkmov7ZlOVIZo6hWIjXzeNsrG6EaEo5qLnXTzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMCow+f1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMCow+f1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017321F000FF;
	Fri,  9 Oct 2026 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559646;
	bh=Lg54yVUweamQ07Hi3BmJpBE/fwcV3odGJPHzjbPW9dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NMCow+f1g9sP+4rf5waZ3nMdi3/JhoHI/YTfBKnCd8/DuzIytW2zUz8XOP7ND6/PQ
	 LaPpEEQ6blYrsnqw6FejLscch+7pKn7CFegZW4n/enafjXA2ezqiJurGDcZAIq8Ent
	 JYAYOK7s73aPe264+4PbfwOTYWsDf7ed80WR/b/a88jRNpnucQ1Q+wxqYL1TH9CrqO
	 DTcqMPkuuMB+V2QlgbdMKqc9y1e/iR5zwP98CWmB87lZI+r0vaC2rVF5QWgVSC/db8
	 Ilsim9ced8l2yJNCTqX6E0lwdFXbahmPYLAjFgpNX+JDzt+unA4mQweKmrMSdrLmGR
	 UpD6DZ7TqnU1A==
Message-ID: <sashiko-outbox-165772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/11] usb: xhci: Unlock for command abort polling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-3-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-3-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:27:25 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: xhci: 5-second udelay() busy-wait in sleepable command time=
out path
--

commit 8ece4a222044715c34357d2e1240af7af9feef1a
Author: Michal Pecio <michal.pecio@gmail.com>

usb: xhci: Unlock for command abort polling

This commit drops the xhci->lock earlier during xhci_abort_cmd_ring() to
prevent stalling other CPUs while polling for the command ring to stop.
It subsequently waits for the command ring stop completion event.

Link: https://lore.kernel.org/linux-usb/16f65081-5a3c-4c30-9811-9017796a337=
3@fonseca.com.pt/

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
[ ... ]
> @@ -521,25 +521,27 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhc=
i, unsigned long flags)
>  	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
>  	 * and try to recover a -ETIMEDOUT with a host controller reset.
>  	 */
> +	spin_unlock_irqrestore(&xhci->lock, flags);
>  	ret =3D xhci_handshake(&xhci->op_regs->cmd_ring,
>  			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);

[Severity: Medium]
The patch drops xhci->lock here to avoid stalling other CPUs, but
xhci_handshake() unconditionally uses readl_poll_timeout_atomic():

int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
{
        ...
        ret =3D readl_poll_timeout_atomic(ptr, result,
                                        (result & mask) =3D=3D done ||
                                        result =3D=3D U32_MAX,
                                        1, timeout_us);

Since the context allows sleeping (the lock is dropped, and we call
wait_for_completion_timeout() right after), does this code burn 100% of a
CPU core in a busy-wait for up to 5 seconds if the hardware fails?

Could this use a non-atomic polling macro like readl_poll_timeout() with an
appropriate usleep_range to yield the CPU instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D2
