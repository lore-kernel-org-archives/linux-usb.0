Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957261;
	b=Lu+qZRPM+cRFHUShCaYv/1ujh16+vnGQXc/mUySLDrv8s5gx+n8Il1YD4DETdPshP3eT
	 A5szXrnava30W9NpgGpTsvVH1nHLc7Jsej/68ycxK2ZHWaMNt7F6Avwd1tw6OjLqeBo4w
	 xuhYsc1ySZRrOs1kmdfnNcxPdryoMQ/pnV6OZStFmTzjVtdyn9ixip3tqncFoYXc2gV0F
	 Dt9Onucn/Hi5HZTrEhfZRcluCLI8hLhEvicunc8ziy3LR7FCvjNT6mUh7jJ3yjpjz4nif
	 qVbofclYK8JsDx8I7oAcmpuPFO7ThN/PRhhjetVoXBWvWVVbhXwi/8PkPf+LA8HON+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957261;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bGU6CpBlWhPj0g2RFn9Ly+Tr+fZY/DIs4pI/c2NIOs8=;
	b=r28ZqMfEk76Gjd/etfsnSmlY4kFPyirhw/P2DjI9tS7HCj+KLeYZUe7tCSU+MjLTefDS
	 6agpCs7+idwuUtwomHMhRjqsrHe29o9Lj9SQpiOzJ/rsW5k9f1NZxIV8mTwU8aw5waVrs
	 IU7/HiJR3pP64JcfOtKDE6SVi9GZHejaAl100oBVD+8i89iYaoJylRw/wt+1szB5uR4wl
	 Gn328tHuZYQXaNFMIILCgyOh6lX2oAYiUdNqKY57hIpSCFOYOTMSDslwZyRqUV8dBX64x
	 pd8mUuLWRk44Pbr32zlr5BOl/NrhtYFvJ8eoVKH5ut6DUhs0Qqov6GVQ039uehN12MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFHd605H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001AA606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFHd605H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A485E1F0089F;
	Fri,  6 Nov 2026 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957260;
	bh=bGU6CpBlWhPj0g2RFn9Ly+Tr+fZY/DIs4pI/c2NIOs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFHd605HoYfZ2LrqBo2FLeRIcACRfVGZG48u85tOy8GkUuLK8NPUf3YX6BtF59uZW
	 lyLZaFRF+nT17iLkd7mCpiHZaDI7lWmIs9jHp70Vqlraa/20l9Vl06Bd/duY04nigO
	 mBEPeoLYd91TMtEp/OWb79AwcWCK5mt+DQZgHZHa4L5yRbgNKywwINjeGEsC8ER/Mi
	 Oks4jHGJVD7IDPYnFvqaDYFxFxOPAHJnMEockTy414pALn3waaEDJ3da2/A9kPlmQm
	 mQPy0xXqS3tF7FTZ+tIo4BRfPHZqvTeCkMftQy0om+/sMZqWCrgqrmhd5sOB1BJ5xl
	 IuWltRkQLH1QA==
Message-ID: <sashiko-outbox-201106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpci: quiesce the IRQ before
 unregistering the TCPM port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106091725.1334097-1-shunsheng1218@gmail.com>
References: <20261106091725.1334097-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:27:40 +0000
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
- [Low] usb: typec: tcpci: Fixes tag cites file-move commit ae8a2ca8a221
--

commit 86b087596ae2abb991b5f1a00292c87c28b06171
Author: Yaohan Li <shunsheng1218@gmail.com>

> usb: typec: tcpci: quiesce the IRQ before unregistering the TCPM port
>
> tcpci_remove() unregisters the TCPM port before the managed threaded
> IRQ has been released.  tcpci_unregister_port() destroys the TCPM
> kthread worker, while tcpci_irq() can still call the TCPM event entry
> points (tcpm_cc_change() and friends), which queue work on port->wq
> without checking whether the port is still registered.  Writing
> TCPC_ALERT_MASK =3D 0 prevents new chip alerts, but it does not
> synchronize with a threaded handler that was already woken or running.
>
> Quiesce the handler before unregistering the port:
>
> - Set chip->stopping before synchronize_irq(), so handlers that already
>   entered tcpci_irq() are waited for, while handlers that start later
>   return IRQ_NONE from _tcpci_irq() without touching the TCPM port.
> - The IRQ remains devm-managed and is released on driver detach, as
>   suggested by Xu Yang; no custom early free_irq is needed.
> - synchronize_irq() alone would not be enough because the IRQ is shared:
>   another device on the same line can trigger the handler after
>   synchronize_irq() returns; the stopping flag makes such late calls
>   harmless.
>
> The same ordering issue exists on the probe error path: if the final
> TCPC_ALERT_MASK enable write fails after devm_request_threaded_irq()
> succeeded, the error path unregisters the port before devres frees the
> IRQ.  Route that failure through a quiesce_irq label that sets stopping
> and synchronizes the IRQ before unregistering.  If the IRQ request
> itself failed, the error goes directly to unregister_port.
>
> This issue was investigated and the fix was developed with AI
> assistance (ZCode/GLM-4).
>
> Testing with QEMU, a simulated I2C TCPCI device and KASAN (7.4-rc1):
>
> - Remove path with a real threaded handler parked at
>   kthread_queue_work() while the device is unbound: synchronize_irq()
>   waits for the handler before tcpci_unregister_port() destroys the
>   worker; no report.  Without synchronization the worker is freed first
>   and KASAN reports a slab-use-after-free in kthread_queue_work().
> - Probe failure path (the final ALERT_MASK enable write is forced to
>   fail): the handler woken by the injected alert is rejected by the
>   stopping flag, and the teardown reports nothing.
> - A shared IRQ raised at tcpci_unregister_port() after
>   synchronize_irq() returns enters _tcpci_irq(), returns IRQ_NONE due
>   to chip->stopping, and never reaches tcpm_cc_change(); no report.
> - tcpci_remove() with the ALERT_MASK =3D 0 write forced to fail (the
>   driver only warns) while a continuous alert stream is active: the
>   teardown completes, no tcpm_* entry point is reached after the TCPM
>   worker is destroyed, and no report appears.
>
> These are injection-assisted reproductions; they do not measure how
> often the race occurs on physical hardware.
>
> Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

[Severity: Low]
Commit ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together") was a
pure file move from drivers/usb/typec/tcpci.c to
drivers/usb/typec/tcpm/tcpci.c.

The tcpci_remove() ordering issue dates back to commit 74e656d6b055 ("stagi=
ng:
typec: Type-C Port Controller Interface driver (tcpci)"), and the
tcpci_probe() error path after devm_request_threaded_irq() was introduced by
commit 862a9c0f6848 ("usb: typec: tcpci: fix NULL pointer issue on shared i=
rq
case").  Should the Fixes: tags cite those two commits instead?

  Fixes: 74e656d6b055 ("staging: typec: Type-C Port Controller Interface dr=
iver (tcpci)")
  Fixes: 862a9c0f6848 ("usb: typec: tcpci: fix NULL pointer issue on shared=
 irq case")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106091725.1334=
097-1-shunsheng1218@gmail.com?part=3D1
