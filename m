Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F99F533580
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985697; cv=none; b=YgBs4QZYgIjlRk3Htl2onwHCAv9kkmBc4y/vQ6V4WByBEa4txb1xGxPLdoI/2w65/e9jvffrZdRPGpVAsCAIe18jVKWxRRhwP/9TdnBDabkHS6JORbxUGppdkR9bqJQFjZAzp+ixIGuIGo2G01ua3lnOg7H0ccY3XWzMDLgZ52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985697; c=relaxed/simple;
	bh=S8VSnOLxylzcJoZe7rdV3NDOP2QDDu9h3DlhfIz9hAE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PkPoPWgR22qA4R5+4cHtK8NvSwOB9b8aPKYWqG5+9c0iM9I4OCABkn42n69suMosryjZpwNB9IhLBLRntEuypSdorNVKZnsyyayhKxpWKP8FV9INX9UUClYYbhZan4TmvlLIMGDfBeKkXvIAbroqNHQK1P86zjMsuodyHO8xL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv4Dsc49; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv4Dsc49"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638101F00A30;
	Wed, 14 Oct 2026 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985693;
	bh=HMFPrZxx/qPZ5MCz+rTbhiMSWy5Gu+wrjiFisFXbTiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uv4Dsc490RX29B+UpsJSWejvWb2tyuCs2w41wIZKBpsPNABUUQXjDk8/VG0gRXJWe
	 8JVDWdrWS8uYPBA4WuLsZ3N6D26S1HSYyZ3KgZ1KVqI5j76BL7J3j38LzhS/TXF/w0
	 Bxsh+CZgULgDzTmpIhiB0IKfYVtg3paC1Mdu2wOMrA1XNuLqb9cJ2ZeCRVh7amWuWl
	 sI+a6/acgZf41M1SO29ypXSj/1k0BqTlQsApp9FeM6G96yHBPQ4Qo9RdSFKvJx+Rf2
	 C6jdDr2hosogk0hkM2yede7JM0iVvW8dhTXIyLB4KpxEelNg7pmmPHPrlvq1ycPfm3
	 RhS53FrCaKj7g==
Message-ID: <sashiko-outbox-171381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] driver core: take parent lock on deferred probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014133109.1392265-3-johan@kernel.org>
References: <20261014133109.1392265-1-johan@kernel.org>
 <20261014133109.1392265-3-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:48:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] driver core: UAF on dev->parent in bus_probe_device_deferred()
--

commit 768aedc18e0fe23bb1bfe38cd117e5b5a7a2fa43
Author: Johan Hovold <johan@kernel.org>

driver core: take parent lock on deferred probe

This commit adds a new bus_probe_device_deferred() helper to handle
deferred probing while ensuring the parent device lock is taken when
required. This ensures USB interfaces are probed correctly with the
parent lock held.

Link: https://lore.kernel.org/20261007131514.1260696-1-mario.peter@leica-ge=
osystems.com

> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index d6668fb8ddea5..43d131fd8085d 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
[ ... ]
> @@ -627,6 +621,26 @@ void bus_probe_device(struct device *dev)
[ ... ]
> +void bus_probe_device_deferred(struct device *dev)
> +{
> +	if (dev->type && dev->type->need_parent_lock)
> +		device_lock(dev->parent);

[Severity: High]
Can this dereference a freed parent pointer?

In drivers/base/dd.c:deferred_probe_work_func(), the code dequeues
the device and keeps it alive with get_device(), but drops the
deferred_probe_mutex.

If a concurrent device teardown (like a parent device unplug) calls
device_del(dev) while the mutex is dropped, device_del() completes
and drops the parent device reference. If that was the last reference,
the parent is freed. Pinning the child via get_device(dev) does not
keep the parent alive after device_del() has completed.

When the worker thread resumes, it calls bus_probe_device_deferred(dev),
which executes device_lock(dev->parent) here before checking dev->p->dead.
Could this lead to a Use-After-Free regression?

Note that the follow-up patch 3/3 does not fix this regression, but
actually propagates the same pattern to __device_attach_async_helper()
via the newly introduced __device_driver_lock(dev, dev->parent).

> +	__bus_probe_device(dev);
> +	if (dev->type && dev->type->need_parent_lock)
> +		device_unlock(dev->parent);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014133109.1392=
265-1-johan@kernel.org?part=3D2
