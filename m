Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A11E9919
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901467; cv=none; b=SgHlevhLvreCbWfpxiwvmAFbA96E7sgfgo6aOJo9o4j7VChO/683Z5tKnvstVjZ682Dk+mqOvDUfm9rRZo3jwlJWbtvYcLHi7rMOGWdxt/4ylJkKc3OqywyTV+9ZAFQqrq3ZmLONsLw94WGJFIuE7rOKa4sVbFZcqWJEyrbZKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901467; c=relaxed/simple;
	bh=Nzbs4dMaX86fNTu274xkeOit1fQKxU++1pnky0glSII=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dtetKhhBysoTfqvw4NqEMxWLIOOET/bz7xAEvR1YE2N+dL0tovObA4mcCncQ3WfLn7dUd0WiOMmkXgrlc+UfQDNVzSMVAbNvbYcuE5/r/6vdHekbW1i93emiDA+9uyvDRtNqbPPIt6eF/1ADWnpU0BuWv8qTyUClbS1eddO6qVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2NXP5Pf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2NXP5Pf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C4D1F000FF;
	Tue, 13 Oct 2026 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901466;
	bh=nWWOep2Bf3ffzQXCRkU1BghbxLysoDbK1wB/R5psk/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G2NXP5PfnuNXTZ2h24+oONPSyJ1bQnIiIeAycTilZeQkAhnUh13vba/Fo2bzLx+9R
	 wcOdendgKNtmSCjPnGspEsD99d3tXUP3NIE6TT71A0BDsGv9nMymxKs7vd6Ocd/7wF
	 XktCPP5QddpbWnsPCNfamwnn2wWhb3vEVgvu12CWPCfBfRVANlQD4nn++x4B1KUoX+
	 dig+nv4E3MjMVUCY/mnZ7pv5syYI3xCD5twzV+SCUwixk4ZqQmxLsIDN9aycWA3071
	 PBzQ2x0iEN0s2/CQ7gPA8TBykvRjulClORWR9qzuIyiHFS+E+aSwZ8GLR4xxwBhtuz
	 LinIlfGT1Wz8g==
Message-ID: <sashiko-outbox-169900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] driver core: take parent lock on deferred probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013140615.1226992-1-johan@kernel.org>
References: <20261013140615.1226992-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:24:25 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] driver core: unbalanced parent lock in deferred probe due to TOCTO=
U on dev->parent
- [High] driver core: Use-After-Free of dev->parent in deferred probe
--

commit fa3fc53326d3b088884e2e7e5dc50b5162e40379
Author: Johan Hovold <johan@kernel.org>

driver core: take parent lock on deferred probe

This commit adds a new helper bus_probe_device_deferred() to take
the parent device lock during deferred probe. It modifies the deferred
probe worker to use this helper instead of bus_probe_device().

Link: https://lore.kernel.org/20261007131514.1260696-1-mario.peter@leica-ge=
osystems.com

> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index 18f12c6f910a0..ebd069d98d255 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
[ ... ]
> @@ -630,6 +624,26 @@ void bus_probe_device(struct device *dev)
[ ... ]
> +void bus_probe_device_deferred(struct device *dev)
> +{
> +	if (dev->parent && dev->bus->need_parent_lock)
> +		device_lock(dev->parent);

[Severity: High]
Does this code risk a use-after-free of the parent device?

When called from deferred_probe_work_func(), the worker thread has only
taken a reference via get_device(dev) and dropped the deferred_probe_mutex.

If device_del(dev) runs concurrently, it can drop the device's reference to
its parent via put_device(parent). If that was the last reference, the pare=
nt
object could be freed immediately.

Because we only pinned the device itself and not the parent, could this read
of dev->parent and the subsequent device_lock() access freed memory?

> +	__bus_probe_device(dev);
> +	if (dev->parent && dev->bus->need_parent_lock)
> +		device_unlock(dev->parent);

[Severity: High]
Is it possible for dev->parent to change during the execution of
__bus_probe_device(dev)?

If a concurrent thread executes device_move() on the device while we are
probing, dev->parent could be updated. This happens because device_move()
updates dev->parent while only holding device_pm_lock(), which is not held
here.

This would result in evaluating dev->parent a second time and potentially
calling device_unlock() on the new parent instead of the one that was
originally locked, causing a lock imbalance.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013140615.1226=
992-1-johan@kernel.org?part=3D1
