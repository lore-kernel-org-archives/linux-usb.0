Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398848;
	b=NEkY8ysI9SPjUMRXSze7EaRCczLNQP3+9H0Whj6NCnA4/P19N0lqlXBL61XrLqcNqDj3
	 GfGliSFomSNFLs6CwltiPLf2Rt1vRNKXXlPrnHre8RGnXVsnrsXy8p+ZWIC48UXx9fahe
	 TRI4+6IsxQpEDfefpSe0txLu8Kq3+f3WnwyoQAOJqHSs4KsDkPPE6RMTCmEEh3lvuZNDA
	 ANlqSHoWtccMHXWzD0dDlJrMWQFFInuroC/yNu2VTzoQ7Y9IyTP24OIpFcfVedMi62tta
	 LQjvEZUxclgQb4So3PaW0FGjxcCtp+PYjecyY9eovkV3XITEY/0RF3MjcEtZPI9QziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398848;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kWecpJPGbRlw+A786bmo3nA/kSIcKAM6GVAfORMJ4hU=;
	b=UePnY+H4HUbK0OkMsnFPlTeSk/HJAMbStcg6vRMu2GqA51i1Xgmd/R42CeLF6xYaBwo1
	 kfl2UV9d3PeoTXGBKJZNG2Fn9kwXsRRRmQX1rR8SmOqb6xRs5pp5RBmWr7WWGvYJGhZa2
	 g32hRXdDf4sN+xeVINs1Tk9HCYUmuwe+oJmNFOilzIjy71HwQIHiprJGUAsle4OY2YbvN
	 w6Ehr0sY0XwdXHGeq6ZqXOOf/Q3ERavGIBQFycViSZkT7PqodM40VyZndw6J8z6ngvLpe
	 tVz12N6uYGdkbWJuvQlxpErrJfmDtvBsbtpRXtJUXoCV6lC0g/oCGkJ+ydYmGPViBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l50tjuJ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854A606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l50tjuJ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6341F00A05;
	Wed, 11 Nov 2026 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794398848;
	bh=kWecpJPGbRlw+A786bmo3nA/kSIcKAM6GVAfORMJ4hU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l50tjuJ/RA4gMWNh80gNb8ljeqcde0m502p7yJRmufkpMNp3h+U5jgwrBmHPqaZ3V
	 ItC0SR0A68lmH5FzSA5Rxc8f/XBiDlTjBbFFTCUFAwDXyQ6aqCF9iTqMPO7MDvGvfu
	 Yvf2SUCczHDwr1XdakBYJBNyAqXhea38lMus5dmgvEPlQ93fxSfMOD6Vf+LvzgmFqE
	 0caPYRrvhlXv3vIOHjCOHd9DQZLy1MdXozhVkl2IC6oZFgLKOPLI2NKtxRjwTJuyIB
	 +cSZ8l5kgSAhm5j7z0ij1Yj63tPp3OgaqmX1pmzyPSoWDITARD4xtBObkp1kG/S+RZ
	 cLNS5mhn2o9Gw==
Message-ID: <sashiko-outbox-208935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usbip: stub: reference count struct stub_device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Grzeschik" <grzeschik@puzzle.ch>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-usbip-v1-1-da5217ac71d7@puzzle.ch>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <20261111-usbip-v1-1-da5217ac71d7@puzzle.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:07:27 +0000
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
- [High] usbip: stub: hung stub_tx, leaks, and URB UAF when shutdown is
  missed
- [Medium] usbip: use-after-free in event_handler() reading eh_ops.put
  after wake_up()
--

commit cd9a80911da15b88ceb306a5e8d623b311108647
Author: Michael Grzeschik <grzeschik@puzzle.ch>

usbip: stub: reference count struct stub_device

This commit adds kref reference counting to struct stub_device and holds
references across device binding, the rx/tx kthreads, and queued events so
that stub_device and its usb_device are not freed while still in use.

> diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
> index abfa11d6bde79..27d1e9c8db176 100644
> --- a/drivers/usb/usbip/stub_dev.c
> +++ b/drivers/usb/usbip/stub_dev.c
> @@ -11,6 +11,42 @@
>  #include "usbip_common.h"
>  #include "stub.h"
> =20
> +/*
> + * A stub_device is referenced by its binding to the USB device (from pr=
obe
> + * until disconnect), by the rx and tx threads while they run, and by the
> + * event handler while an event for it is queued or being handled. It mu=
st
> + * not be freed before all of them are done with it: stopping the threads
> + * relies on the event handler, which can miss a shutdown request or sti=
ll
> + * have an event queued when disconnect wants to free the device.
> + */
> +static void stub_device_release(struct kref *kref)
> +{
> +	struct stub_device *sdev =3D container_of(kref, struct stub_device, kre=
f);
> +
> +	usb_put_dev(sdev->udev);
> +	kfree(sdev);
> +}

[Severity: High]
If the rx and tx threads outlive stub_disconnect() because
stub_shutdown_connection() was missed, does stub_tx_loop() hang forever on
sdev->tx_waitq, or does stub_device_release() free sdev while in-flight
URBs and connection resources are still active?

Once shutdown_busid() queues SDEV_EVENT_REMOVED during stub_disconnect(),
USBIP_EH_BYE is set in ud->event, which causes any later usbip_event_add()
call to return early without scheduling stub_shutdown_connection():

drivers/usb/usbip/usbip_event.c:usbip_event_add() {
	if (ud->event & USBIP_EH_BYE)
		return;
}

Without stub_shutdown_connection() calling kthread_stop_put(ud->tcp_tx),
stub_tx_loop() blocks indefinitely in wait_event_interruptible() on
sdev->tx_waitq because neither socket closure nor usbip_event_add() wakes
that queue.

Even if both threads exit on a socket error and drop their references,
stub_device_release() only drops sdev->udev and frees sdev without running
the cleanup from stub_shutdown_connection().  That leaks the ud->tcp_rx and
ud->tcp_tx task structs, ud->tcp_socket, and the sdev->unlink_tx and
sdev->unlink_free lists, and leaves in-flight URBs on sdev->priv_init to
dereference the freed sdev in stub_complete().  In addition, letting
stub_disconnect() return while threads or events are still running allows
usbip_host_exit() to destroy stub_priv_cache and finish unloading the
module while sdev is still in use.

[ ... ]

> diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_ev=
ent.c
> index 0e00c2d000f89..eea9a71f0eac2 100644
> --- a/drivers/usb/usbip/usbip_event.c
> +++ b/drivers/usb/usbip/usbip_event.c
> @@ -94,6 +94,10 @@ static void event_handler(struct work_struct *work)
>  		mutex_unlock(&ud->sysfs_lock);
> =20
>  		wake_up(&ud->eh_waitq);
> +
> +		/* drop the reference taken by usbip_event_add() */
> +		if (ud->eh_ops.put)
> +			ud->eh_ops.put(ud);
>  	}
>  }

[Severity: Medium]
Can waking ud->eh_waitq before reading ud->eh_ops.put cause a
use-after-free on ud?

vhci and vudc do not set eh_ops.get or eh_ops.put, and their removal paths
free the enclosing device as soon as usbip_stop_eh() returns from waiting
on ud->eh_waitq:

CPU0 (event_handler)              CPU1 (vudc_remove)
unset_event(ud, ...)
wake_up(&ud->eh_waitq)
                                  usb_del_gadget_udc()
                                    vgadget_pullup()
                                      usbip_stop_eh(&udc->ud)  /* returns */
                                  kfree(udc)
if (ud->eh_ops.put)  <-- use-after-free

For stub_device, waking usbip_stop_eh() before ud->eh_ops.put(ud) runs (or
while a second event queued for the same ud is still on event_list) also
lets stub_disconnect() and usbip_host_exit() finish unloading usbip-host.ko
while event_handler() in usbip-core.ko is still about to call
stub_eh_put().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-usbip-v1-0=
-da5217ac71d7@puzzle.ch?part=3D1
