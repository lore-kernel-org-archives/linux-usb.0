Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C12F8EBF
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959217; cv=pass; b=OvVYQSzIgrKSOhzyByIZKYnS8Lh/5tfVLiRiTYEH/4O00jEGHgtu+xvHJW74rSL9YPywQ2Iv4q9s7Zp5zndwXbctNV/RbWwe7RjI3SmEolNe9eTlzOnc5U1s/yC4rz00fj9cxKA5QNmGQRRNosXeqJhjLlU8kiNr4pkc1Kvs6Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959217; c=relaxed/simple;
	bh=xJwoyPmxR1dpYJhmf14+IOsg++KDkD4JXOv7dVFuuFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=atDTdH27r26AZueGBMJMUVp/RpXhCwi2mzDUoL36qIljBoVLeO/vtnE67DOQC2roJ8ju7AMQxNfHV1NgAXT4IbBO4h5edaM0Ob8N15QmqCLV3TvCyJn+ho7R3/Od05I7DLgJpNwxLWj70tmQefXti48jBT9VvIpOQlazx96bAus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=VZlS4ruI; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="VZlS4ruI"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb2df5cc1so1132503e87.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 19:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782959214; cv=none;
        d=google.com; s=arc-20260327;
        b=kSroGBDm0Xb307wiG+5LMgIR+h3pDGEPapIsINHQ5deBZpUJ0WGrruEcmQ2dhBZzpL
         W48HaPztXOk3JgwoWWiGtpLIRKNfCMrEfaBzfzsyIO5hYBFyJM/xt1q+3/8n/5zuwyCM
         vd9cmXGjD7xGNBbZ/a9S6KUAGJla4bqnG2fTN8LlynmzsNlooSry2Rw7iQ99bHhzt/Ye
         XeanqkjurKsC3mlxhgNJ1POlGLoz9vKFtrvi0BAKdrATwpuT8q91+vnhHxvw9jXFJo2s
         mllIaKjwSIQVp/YYAwYuigHrB26oarPdtw3JU2CzP3SA4tbHC/XAlGtQMlkjI3NGKpmx
         ufhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHH5jUg33GgTlunswHEPQHftdc7cmdRP/94BZz7o8pI=;
        fh=QA+pkhphYRROorDqN0RqSLpyk40NPSRLgGd1HvgKr/g=;
        b=SZ1D0Zv8usW4WONK4W5qGZ9gmZKhYNzHWSC8Z+EnqftuisWi+n5ezmbRH9RG4aDDz/
         ks+HRRheWUr88NPrGMqQp0lHWllRqenbt9P4YH4HyxdTeO9h1msflmk6H6AwY/FQLct/
         aQ+ZXcl9Cc3F04lHWjTefktDM1Ha5gMpdzpBedPKvbJVNOPSuymyhNpjn+4V2IoJRDVi
         1KtTswy4y3UHUs3/864OHzIwV+QNjBpQniEAY9ZzIrDsOAdTKti8/RGXS/8kE3KhBQfh
         bYidRBffoO+siTHIYgqBcbsRNaVJjg56NOdQlqMXjgmSXFKKUExRbBDkaqTqnOvzMfwO
         N7xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1782959214; x=1783564014; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHH5jUg33GgTlunswHEPQHftdc7cmdRP/94BZz7o8pI=;
        b=VZlS4ruIYAku5eTuAOtvuuck38oj8h3xOF6Q47v+y6AJLfK6JfJ3sW+2Z883hYDbXP
         lMsBtWVonFJCjiVp+rO5bQW1FuoY7ZBQ7inbgC3m7oAo11+tcIHj8QzbKd4KOT2thOgZ
         DMwmoc3D0ntyEA5aIOs9h2eE8/4N30++b7GBj/aNOuSkcqlxoPjeOa5kImmzELntbhGl
         zfpBaCOvJy4Lo6yG1VhSudjLOzHmQV478h89mkIn7A8JrL/ndEVdeY+N1cdmoBSMuo95
         RxCOBboI7Qj9f3oB9n6cNWPBXHwnYaqqrR/hMUogDhllak9Gn2PPcdpTXyNqvoIG0rrx
         39GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782959214; x=1783564014;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHH5jUg33GgTlunswHEPQHftdc7cmdRP/94BZz7o8pI=;
        b=bisK9Z+TJLENTnFqKaJ70Ae7lzgo+Z1apx+ns4yPg2a7ajXEV7HaJLJuyjJt2oqR+8
         7eiBDArnKU4iEi7jdllbcbNkuKNf7fNOuQBdrL4ReC3ibaqBYXBTjeXwEPP5oSYZzNbh
         dW+MLpl7U6aznm0gkXTFjBXNCqnFjGrssoveKJom+eXrHNrfP0ZWk4nGIySVv7IAMnXP
         /VpecnI+odpfggRz0cSIA5xj9HwYxF2hR9idf1QSU4VjHJKQseo9Q1ydAkkrY8QzUBRA
         iwu2ZauW5eBPmyluIuzTCKFgrNySPBWnjYLiogJA9yOph80gpZ2spus+1eZUEjkDLTRM
         Qc3g==
X-Forwarded-Encrypted: i=1; AHgh+RrulNpZQI0i7eyZUY2K4GvwrR4/oJ9/xp4rAFWnH1pxDhQKzDP8EsUYpp/+pkGuy4ORGRynDaWX/bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXiHmoWM6qUG/BE/T/IxtR9J5ERpbv71WQPm1D/cHDeVsrIdK3
	NtEHAHbfJg0GA7/0tdJKNuxuPe6tcDQlpOL9k4y83kzrJ7rvhPFrVCQWJzlJVpGpFCm2q8ukN5N
	3Zt/a5PMQOPw8UTOIXk7Vbj974P76VY0=
X-Gm-Gg: AfdE7clpRI4mPbemUwVSZYMEOiGZY/JCin4L+ZbDkVdhSVMw1FjPApjGoWQE/bjF/yP
	TToiVyaaN9Od4xn6JFCbgb8rhkViyle1Fwq7yAuO4QsrNfuI0vIidKmp6/+n1Kotz/O0gcHiGkz
	UAnkuihAu7C9lWBvQ+MFUXp/pzpnIREboKM6Woto6IosaRSTXKI4BisVZIVo4FrEAX4QxqKjh9q
	0WwKV3TXnZWbp0emEE39RHuvMpPJbBZaUB0P32UFzUhYB+BY3AFqtNcS4pJMokBw4FQHgVnfQ==
X-Received: by 2002:ac2:5ec6:0:b0:5a8:6cbc:60f3 with SMTP id
 2adb3069b0e04-5aec68b78f4mr713833e87.34.1782959213273; Wed, 01 Jul 2026
 19:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611071201.1235545-1-acelan.kao@canonical.com>
In-Reply-To: <20260611071201.1235545-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 2 Jul 2026 10:26:39 +0800
X-Gm-Features: AVVi8CcQuCo6OlV3Rtzgt7MG4a8-eBG-tsDQnNX-C6Rs8StxFHGVtavdtZTKTkM
Message-ID: <CAMz9Wg_X5D=T4evVOi+pns_x=gD43RA8ZURvk9eyYVBF+OE33Q@mail.gmail.com>
Subject: Re: [PATCH] usb: core: port: Deattach Type-C connector on component unbind
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Sean Rhodes <sean@starlabs.systems>, Kees Cook <kees@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B46=
=E6=9C=8811=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:12=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> connector_unbind() is the mirror of connector_bind(), but it is missing
> the symmetric call to typec_deattach() that connector_bind() makes via:
>
>     if (port_dev->child)
>         typec_attach(port_dev->connector, &port_dev->child->dev);
>
> When a Thunderbolt dock is unplugged, two teardown paths race:
>
> 1. The component framework calls connector_unbind() first, which sets
>    port_dev->connector =3D NULL without calling typec_deattach().  This
>    leaves port->usb2_dev/port->usb3_dev in struct typec_port pointing at
>    the USB device that is about to be freed.
>
> 2. usb_disconnect() then calls typec_deattach(port_dev->connector, ...),
>    but port_dev->connector is already NULL, so the call is a no-op and
>    port->usb2_dev is never cleared.
>
> 3. Concurrently, UCSI detects a PD partner-disconnect event and calls
>    typec_unregister_partner(), which reads port->usb2_dev (now a dangling
>    pointer to freed memory) and passes it to typec_partner_unlink_device(=
)
>    -> sysfs_remove_link() -> dev_name() on the freed device, corrupting
>    the typec/UCSI partner state.
>
> This corruption leaves the Thunderbolt tunnel in an inconsistent state on
> the next dock hot-plug.  On affected hardware the dock's I225/igc NIC fai=
ls
> to enumerate: AER fires a slot reset while the igc driver is still
> initialising ("PCIe link lost"), and the subsequent igc_reset attempt hit=
s
> igc_rd32 on an already-detached device:
>
>     igc 0000:2e:00.0 eth0: PCIe link lost, device now detached
>     igc: Failed to read reg 0x0!
>     WARNING: CPU: 9 PID: 129 at drivers/net/ethernet/intel/igc/igc_main.c=
:7005
>              igc_rd32+0xa4/0xc0 [igc]
>     Call Trace:
>      igc_disable_pcie_master+0x16/0xa0 [igc]
>      igc_reset_hw_base+0x14/0x170 [igc]
>      igc_reset+0x63/0x110 [igc]
>      igc_io_slot_reset+0x9e/0xd0 [igc]
>      report_slot_reset+0x5d/0xc0
>      pcie_do_recovery+0x209/0x400
>      aer_isr_one_error_type+0x235/0x430
>      aer_isr+0x4e/0x80
>      irq_thread+0xf4/0x1f0
>
> 4. UCSI later handles the PD partner-disconnect and calls
>    typec_unregister_partner(), which still sees the stale port->usb2_dev
>    and tries to remove its sysfs link a second time:
>
>    kernfs: can not remove 'typec', no directory
>    WARNING: CPU: 6 PID: 55 at fs/kernfs/dir.c:1706 kernfs_remove_by_name_=
ns+0xe9/0xf0
>    Workqueue: events ucsi_handle_connector_change [typec_ucsi]
>    Call Trace:
>     sysfs_remove_link+0x19/0x50
>     typec_unregister_partner+0x6e/0x120 [typec]
>     ucsi_unregister_partner+0x107/0x150 [typec_ucsi]
>     ucsi_handle_connector_change+0x3ec/0x490 [typec_ucsi]
>     process_one_work+0x18e/0x3e0
>     worker_thread+0x2e3/0x420
>     kthread+0x10a/0x230
>     ret_from_fork+0x121/0x140
>     ret_from_fork_asm+0x1a/0x30
>
>    With worse timing the same stale pointer is dereferenced after the
>    backing memory is freed, turning the warning into a use-after-free.
>
> Fix the asymmetry: call typec_deattach() before clearing
> port_dev->connector, matching what connector_bind() does on the bind side=
.
> typec_partner_deattach() is already protected by port->partner_link_lock,
> so it serialises safely with the concurrent typec_unregister_partner() pa=
th.
>
> Fixes: 11110783f5ea ("usb: Inform the USB Type-C class about enumerated d=
evices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/usb/core/port.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384ce..b4452b665f591 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -740,6 +740,8 @@ static void connector_unbind(struct device *dev, stru=
ct device *connector, void
>
>         sysfs_remove_link(&connector->kobj, dev_name(dev));
>         sysfs_remove_link(&dev->kobj, "connector");
> +       if (port_dev->child)
> +               typec_deattach(port_dev->connector, &port_dev->child->dev=
);
>         port_dev->connector =3D NULL;
>  }
>
> --
> 2.53.0
>

Hi,

Just a gentle ping, please help to review this path.
Thanks.
