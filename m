Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C42515882
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026935; cv=pass; b=MOZhTfz40GfQcRQDMe1Bo8Q9HhrXAK4wsMWzUJ3mBd3CQMYHa5oo4cxBm8iHPy5ZHD8CWAEV3k+CZQ2zniCM4T+H8RTw0wlbGWv9EJgiBINdjxQMcv6xMtv2OXlOMU/r7nOOY0Xu8TBVehEIBRlGYaIKqYOU1EO/Gqk5XPpP3y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026935; c=relaxed/simple;
	bh=fdjE4gnH0Wjj6x2T5YJwpm7QEqv3UkSMBdQKvdWDr1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRHif8ng2mBOzC2Q5ghm3+fcG+svPT7fnDHXRG3756tJcQyq4/0iDZM3/gl5mMZ43GL38Fg/UZKqKJN4fnvMRBMARtGEclZkJNwsmh8STuiU6AX7g0LmyuAEJA5SxF7o71Q8fgWYtG2vJ3oHKekpTBZCPX0UlGBru7iTn3qS6bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=izO+aHyd; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="izO+aHyd"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7f4f0d1779dso3076079a34.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 14:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790026932; cv=none;
        d=google.com; s=arc-20260327;
        b=FqIx7q12b5O+gMgkxsLeZ58FU7uzqd9mM4a1it3brfvLyv9n3pMqbxwrNgcsRWQg/f
         x82OaokapqHFhOROX4mUw6ZS3xWHNEO4c7mn2WRfnFyJHamV63JKSC6qPVQxjFNDWGTG
         f9PWAjC9mGLNWNxZiPDT1GjZSkzDPaJMXCOGx0KlVYEDUwjkodJO3JU8tm+WhX/q84T4
         Qq76aqj5wbiV69j7oTC0Bu8/st8sxR3ldCavn7sodaqVAKienhwe1b/IYTmjunye4Zeu
         B5fRV5ciaJhIi63Y0GYQAbgahBuAKwnUn+aq+rBtcVwD7ivIdBYuSaTHIJYElmUzQb2i
         3FRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkGfzCyVRo9d6WnAKT1BIHqc2ui9AlqlgmnkzDdY9ls=;
        fh=NB8PKdkJD29WXWF0tjdLposTHS5Vr/9omMxpS8tj9HU=;
        b=p7O27d+70cDt0CoyEVwvx5H67P7NsoxIpbOJw04P3sZjhP62YZLmalTF6SdtOhIbSN
         5TfLYjv1nAzXjlQaXrBSCFx3pflEKtWPecs4oowAsuOhSAB2D0iROd4CABFKJqsDjQeB
         8I2SolHK3ly7aLndCDMjLgodewOP6FmuDSSngIHqZmNIVX3nfHAHQ/H11sv7vUIsCs20
         JmX7gJkAp6nouXYzzDSO5gtJQ7b4b7CAV8y6i+EGKgv9agaAXRskiWCVtql7KxVu1jl4
         J3NTb5rmKxoYzGTT7phVjdYkZPuPcekQrAP47seMk7cNjFHvConTe8WrVSY90DYCCqZL
         fJiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790026932; x=1790631732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkGfzCyVRo9d6WnAKT1BIHqc2ui9AlqlgmnkzDdY9ls=;
        b=izO+aHydTasXiUjC5eLo3oNrzFExF18dRb6xPHYefE+gT1+vmOQrU/Fr7U8cv91xHW
         avnIBa+U+jqeYCqjGCL8DopyZKdkVIz3zRPk8hgGTea31ETL2kcaXQe/a1a+m2T1OBL/
         fTW8zzjhMORUqz1cMgcSW6u97ngUohkGBl6rl0PUrFyxqKkEccpQ4aGECg9WpVD1Fy6w
         jvun2NCSAV5kXE1cXu7WBoLEYQYZ8RsOsqgsr4vbHu1iXBf+/au9R/lt8eTov6jj5FPz
         sasHS7jaU4CyMBmKnmf+LXLndcXz04hRNGUof4XN3QdfOmWcQ680RtHyBP7QkUbHFSFm
         8dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026932; x=1790631732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGfzCyVRo9d6WnAKT1BIHqc2ui9AlqlgmnkzDdY9ls=;
        b=UURKnZJztCr6NIQP7gq2FN52ItrU72iYCv9I3A+gcjRyyaErVr/tIKgMh6n4unVz9o
         hLX1qjGjcmNhKFusqJFIXPjCoAEL8oOsJrkbh+qAhMEUmXkCtp7DH+SYr+oapW+rFVaA
         wng1HycvzzuMWGbqK7aII6+fGo5FktkjHL3lUCXFbyCJW9enu/V3yj8skGD64BOIyOUv
         RAgD5vmVMPlspUXkrfwXHofJE/AkxfJvAfdT7eLXjFH+kWFwiunZuoggF2uUTfi/OuXE
         TXBObj4VVvq0xi9AJSwyEg4c92sHjE4RwV+a5XqWAFicI7M3lrLRlMyO5VyJvBFP2Ika
         WNEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5DjYUTRKxhyqmFp0C6cXhJfYoibf4xTz5STCWngkFhxGFrVJp+2yoMiofGGeLdhe7gr1mw23txHo=@vger.kernel.org
X-Gm-Message-State: AFuF++nhT0bRnAhOtiQIhv12wryeLV4I5fHgjTKg9tKDMZCXNNipnG67
	Le6Mbf9/wtfHaGgkknGDffeMe7hdf5xPo8yJwtZo7EbtCGpB1olp3WlC8prhkwxy+Cwe0iTOLVF
	fMlAJIQFMKMYlw3CPemMoLms5sUyVxFWLeJBmrhUz
X-Gm-Gg: AYBFou0m2RT6ImY5+BltMA+T17dLYQyKkysd9rhSr8fdbzShEoM16KdA9aBt4+V3HL6
	K4aHc3qHY8Krwf2KP9dhyQ6fG1Uy3BdHEKjDbxgZqpSRdnXFMDhZLN8fExJauo7v9hb/jnWkoqW
	YaHvfRuA+W6C65egWXsUvpih7K+9uNZ6AxSmwwbNw9CHlgNsju+O4zjg8dTKMjS2cqNtF0WJFvM
	ysmZeSsmN9XYo5+XLR4RnTxXusGAKaqxVYPiRpurmrcgK8p6X/7B3Hh/s72PfLecTIRPzs6hu/F
	M0L0wYMcAbhNDHe3MyDlnd8TCer95VkxlHawftPuNQu/7zuJZWo39PBq7ZuuxThAcXOhmraV4Jx
	TRCXBPrhsgA==
X-Received: by 2002:a05:6820:4b84:b0:6c2:e131:6760 with SMTP id
 006d021491bc7-6ca99e23b17mr11755492eaf.3.1790026931727; Mon, 21 Sep 2026
 14:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907183041.8253-1-royalnet026@gmail.com> <aqfd5Xm99P4BaTSp@black.igk.intel.com>
In-Reply-To: <aqfd5Xm99P4BaTSp@black.igk.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 21 Sep 2026 14:42:00 -0700
X-Gm-Features: AcwNN1VOY_LuBFoT4pIzKmLjKX4OK7Y9VxUwSptd5YXRfuU5xEGtCdd_eWcP4U4
Message-ID: <CALzBnUEBCiTC-py41V27p1zkQ8YO7WDm=D9wf_H_rzf8RgOz8g@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: fix use-after-free of the kthread
 worker on port unregister
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:43=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Sep 07, 2026 at 08:30:41PM +0200, Igor Paunovic wrote:
> > tcpm_unregister_port() destroys the port's kthread worker first and
> > calls tcpm_reset_port() afterwards.  Since the Discover Identity retry
> > mechanism was added, tcpm_reset_port() calls
> > mod_vdm_discovery_cancel_delayed_work(), which does
> > kthread_cancel_work_sync(&port->vdm_discovery_work).  That dereferences
> > work->worker, which still points at the worker that
> > kthread_destroy_worker() has already freed:
> >
> >   tcpm_unregister_port()
> >     kthread_destroy_worker(port->wq)      -> kfree(worker)
> >     ...
> >     tcpm_reset_port()
> >       mod_vdm_discovery_cancel_delayed_work()
> >         kthread_cancel_work_sync(&port->vdm_discovery_work)
> >           __kthread_cancel_work_sync()
> >             raw_spin_lock_irqsave(&worker->lock, ...)   <- freed memory
> >
> > KASAN report on 7.3-rc1 when unbinding a fusb302 port (RK3588):
> >
> >   BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x10c/0x210
> >   Write of size 4 at addr ffff00010122ef04 by task bash/8349
> >   Call trace:
> >    _raw_spin_lock_irqsave+0x10c/0x210
> >    __kthread_cancel_work_sync+0x60/0x408
> >    kthread_cancel_work_sync+0x20/0x48
> >    tcpm_reset_port+0x18c/0xb80 [tcpm]
> >    tcpm_unregister_port+0x104/0x2f8 [tcpm]
> >    fusb302_remove+0xc8/0x200 [fusb302]
> >    i2c_device_remove+0x7c/0x288
> >    ...
> >   Allocated by task 112:
> >    kthread_create_worker_on_node+0x14c/0x2c8
> >    tcpm_register_port+0x288/0x3918 [tcpm]
> >    fusb302_probe+0x604/0xc88 [fusb302]
> >   Freed by task 8349:
> >    kfree+0x260/0x558
> >    kthread_destroy_worker+0xa0/0x130
> >    tcpm_unregister_port+0x74/0x2f8 [tcpm]
> >    fusb302_remove+0xc8/0x200 [fusb302]
> >
> > With CONFIG_PROVE_LOCKING the same unbind shows up as
> > "DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)" in __lock_acquire, followe=
d
> > by an oops in the unbinding task, which then exits with interrupts
> > disabled and the following shutdown hangs.
> >
> > The work itself cannot be pending at that point: kthread_destroy_worker=
()
> > has flushed the worker and the discovery timer is cancelled right befor=
e
> > the cancel call.  So just remember that the worker is gone and skip the
> > cancel in that case.
> >
> > Tested on an Orange Pi 5 Plus (RK3588, fusb302) with KASAN: unbinding
> > the port reports the use-after-free above without this patch and
> > nothing with it; the port binds again fine afterwards in both cases.
> >
> > Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for D=
iscover Identity VDMs")
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > Assisted-by: LLM
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: RD Babiera <rdbabiera@google.com>

>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index a8cd1959c426f..e47d674c2ae00 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -1756,7 +1756,8 @@ static void mod_enable_frs_delayed_work(struct tc=
pm_port *port, unsigned int del
> >  static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *po=
rt)
> >  {
> >       hrtimer_cancel(&port->vdm_discovery_timer);
> > -     kthread_cancel_work_sync(&port->vdm_discovery_work);
> > +     if (port->wq)
> > +             kthread_cancel_work_sync(&port->vdm_discovery_work);
> >  }
> >
> >  static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, uns=
igned int delay_ms)
> > @@ -8961,6 +8962,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
> >
> >       port->registered =3D false;
> >       kthread_destroy_worker(port->wq);
> > +     port->wq =3D NULL;
> >
> >       hrtimer_cancel(&port->vdm_discovery_timer);
> >       hrtimer_cancel(&port->enable_frs_timer);
> > --
> > 2.43.0
>
> --
> heikki
