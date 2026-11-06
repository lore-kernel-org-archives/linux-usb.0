Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793940362;
	b=z+QaAtssDbRVFxZZe3p/ZrptYkG6tXG1DagVvL8ypOKE9/qq/LQAUCP/mNMpVUQyEBey
	 iKrs8SOvx/wxl7vABeWB/2edm8sSxSPpd1ikC2fUGnoDz5yWSdkbVSp+lnoM/x38kZqk7
	 Kyavojr/rVHIry4lMY44/E8OCornIC/dmwpFGlhwWfRGvDAdcNjy+Qse1CvzoAgF7LlZM
	 cgWVbwu1YqDo3EEEcCavVsbgpv41bPZrQa2F4/GapaCd37MNHdQBxoiMVNRiCdFU1MLkV
	 Elqznm1Ef7+2bFlmwfjrwRgj4Q75Ho1fNYG0e4XAheNUEgtkiKb3VucxPDX8wzUxvmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
	b=pqeiCF7BsYEKtsdKWRai611/tNmmDsqA68hlJTkbZAKcJdAg9DxLiZK0TiKztNln0mZq
	 8gsJduQ08PIax4hWuEPEs6Wq4Sz5puq5eu8zqoOds/1dbt7kk+AxnPtR1rGrEB1WfJhTW
	 XSRzAigMjPVq3AzdFBACfMoIieAIovi2+VIt5ZJ8dRANbxYMXt6ihF6WMaIzxsnsQWwEj
	 Nl26K2H/lAOl29bTRQOPlIoErzBd2MBy59n3L+3ikc61/0qJT2q8xf1qNxyZkxUYqZGmm
	 VMAwZmA95fHWIyBqoNBYfW49ebrWSL45ZU3t4jHYT3oHMCRZ2F+eM7pHmU466mx+jjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4nz4rQm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A2C606A31B
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 04:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A2C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4nz4rQm
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab4354db11so1178951fa.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 20:46:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793940360; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdqGgoK3wHnjd0F0WZ1NMyUN7sBXyahjvniUtOq93EET24sKcfnUcowS7CyFkwlegp
         a73goxVqj2J3V0BYWOBM0+PhEcMg6NLnE3ySbcBWlZ7juVPledgFLuKLdi2eRJeSDIk3
         1CLm6VsdIoBxcRPfGlpmvMXJoyzqkJOv8uaiYrqtDza9VeT0VAQDw15OqLYPCpBEPAgj
         BABhq+p+TMbGYf40rtO6XPHpOA9SLqUntmFG0tmqoCeVhhiVkg3UiALZRQbUe2wN3xg0
         RSaVfvtgwTSs/mWGIbcQiYgDUoGjPuWtrSvIta4BsyMem/T41T4+QDRYXLWVNuKk6ugk
         uSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
        fh=l0hk33V+FUOmW/Qwi5WmcTn6i3Kv1RyDPbUcTRVqtYM=;
        b=RDFw0uBUFw7KRnszpfg58jOi3xdslcU6zweQUf1RcrWv8v2S4Z5OFk3sGPhslhJvZh
         tYy9mstJp4G74RFZwSGFXArHDAumKxuWmNJqaWId3WlPHycYX28ms6LM7OibvooPvxlG
         HYbiIctXXYWKyiwk8pFOcvt/yCw1ciHOYP2ooLdM8SFglJH8IXc0ukcOpE03jufad3vo
         sbaN2YbBlZOlF2ffU0jwTQuqHvPY8BeHMPrJ5JwyTTiPlT2ztZkFM4lZBFPbfSGloZnH
         osSdkMdLIV1P1CT8LD6aFNwOWmY645/4FeJ6yAVs96xG7oxigvlawq3nzk+QdVV63dXp
         lfWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793940360; x=1794545160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
        b=r4nz4rQmMEmdI+MeJ0v5dvEjAm7suMwqYOYkYTE3y/uivVXfMfZ355UkXIH1yRCHFJ
         bWv2evfWZgKiKCLqC9dUesRS8Q31fz9yCXOhBK47pntlJr5L4l8rVP91CAwI2BqJoDvC
         0e7sUjk8S8Gdv22S1IX5PmWEbwsxmATL97yW6eAb9f7YG/Zkns3gVePP5d4CwF5HGTBf
         qq0c09izJ38PswxQzOPlbpodJWw3V4iASsNMJtagGD1fGBmORraEP5KvW30wJQscYEdU
         dy7iyyolzzzBs82a/rrJ+IHTqNBN+BsbLDSzwDEAMxOgRoRwAv0UfDfRFoYjunJwJeTJ
         OCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793940360; x=1794545160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
        b=vr9umFi0C8R3Jdeql9el5dkiUI5VTsm3q4lzMhVUv8kGEW0gLpaeTSkcqSL1yg9MkR
         9bWXECaOK7Ps+Efb2xQAOdmTCYhVWYFfI4rKK0DQlgk70cLiGjaBjQ5KoNIO5jX1FGB6
         URbbXSBAYcnlL0J9mTsAUiXTnlSBdmnF65fBRvrSAAgUSdj0CAsmaPVHRIKQSNxTtT/7
         4GgO2k4KvAy+uug/GAC0Gk8FBgMwDK+S8/TxB856FdTAA9cPhJ9Q/AuyDy1NK8g1T6gt
         7L57cmZGwn0q1/Z8VwSk69MDW4ws7X+QMfvG+3wwEUm+WCVDKYmoJXGY9hrwVB1moch0
         OxGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6TbBL8b0J+bUuL220snn1SZLkL/0wu/CfQviaC9AXi1ipyYOJHtE1aUL39ijDX69MjIC5pG+VRjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZEuxXBqHUtOZTMGQqDOqe+E3ib0KTCVVoGumoguZ+s306Ez4i
	+wUXNOm03PxID7/C68g9860A7XusdmJyyNzz2GgL5sUNxIKfUaxdItC1Cdk2NJkdVi6ta4zwZsw
	2Hz3vDWTiR9Qetogfgt2qJit8ocRkF84=
X-Gm-Gg: AYBFou3AXkdZHCZZ96Jwa2HyVf81CPTLw0g1yYjjOxC0UooR1ticVRtmxL3VCBZFw9t
	+otiVhA5x6fM7CWn5W89akxEIjWvJDGrGl4J+9OM+L9ZkE1pv/NtJxvbbghrHrQfPUxwelntb5F
	5Fug4RpQqMegFiLqr760dgVgJZT5/WtpPVYAJ8ewRDxzn0QufUMoF7BbjwoTTFg8QqfWYM4UYV8
	3ZvB/WG1TT21B7QWFGtOGmuRT6TeaQxGMZ7FRvvcI+RwenTOJjNosPRRk4bk2UmThgSr8NgvS6C
	5pZUlaSBkCyhhZisUbWJt9JPrU7OBRtt7vXLbycAw8ByEW4DVsxZ6GH5FJk9RvTGLG/f8tZUlT0
	HNERij6anZbsPFe+ErTppHAXIAmOmurVo+uk4lbpz+z9yGeghCY96vgGvB6wa2ABHn2bFDuSq+C
	zhmBdHJfpmg9eYQuKLhoCkTXg53bbB
X-Received: by 2002:a05:651c:1586:b0:3ac:436e:4084 with SMTP id
 38308e7fff4ca-3acf3a11265mr2431841fa.4.1793940359472; Thu, 05 Nov 2026
 20:45:59 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179378589227.74015.8259496684787732118@gmail.com> <bklsnrvgleshngfc6vpc5kzb3feaxbl4qmaoti7swky2yqpnse@eyboedx6duxf>
In-Reply-To: <bklsnrvgleshngfc6vpc5kzb3feaxbl4qmaoti7swky2yqpnse@eyboedx6duxf>
From: zhang san <shunsheng1218@gmail.com>
Date: Fri, 6 Nov 2026 12:45:48 +0800
X-Gm-Features: AclHuK8pLeYzRFlaA3gG_ANlZlnRkZ-nxT_X8cLPPBq_jpT8Aiwzj23SeaOxxsY
Message-ID: <CAGTEBTaFvEK5Tr2fH=WiLA9+x-S4VnuMuhk3cJz8cOc71nx3sQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci: free IRQ before unregistering TCPM port
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux@roeck-us.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Thanks for the review.

You are right that tcpci_remove() clears TCPC_ALERT_MASK before
unregistering the TCPM port. However, this prevents subsequent chip
alerts; it does not synchronize with a threaded IRQ handler that was
already woken or running before the mask write.

In particular, tcpci_irq() can call tcpm_cc_change(), which queues
event_work on port->wq. Meanwhile, tcpm_unregister_port() destroys that
worker. An in-flight IRQ thread can therefore reach
kthread_queue_work() after the worker has been destroyed.

We reproduced this ordering on a KASAN-enabled 7.4-rc1 kernel using a
simulated I2C TCPCI device. A kprobe paused the real threaded handler
immediately before kthread_queue_work() while another CPU unbound the
device.

Without the patch, TCPM worker teardown completed before the handler
resumed, and KASAN reported a slab-use-after-free in
kthread_queue_work().

With the patch, devm_free_irq() waited for the handler to finish before
tcpci_unregister_port() destroyed the worker, and the same test produced
no KASAN report.

This is an injection-assisted reproduction, not a measurement of how
often the race occurs on physical hardware. It demonstrates that
masking the chip alert does not by itself exclude an already in-flight
threaded handler.

I would be happy to provide further details of the interleaving or test
setup if useful.

Best regards,
Yaohan Li


Xu Yang <xu.yang_2@oss.nxp.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=94 10:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Nov 04, 2026 at 05:51:32PM +0800, Yaohan Li wrote:
> > tcpci_remove() unregisters the TCPM port before the managed threaded
> > IRQ has been released. The IRQ handler can still queue work on the
> > TCPM port worker after unregister has destroyed that worker, causing
> > a use-after-free.
>
> The ALERT_MASK is set to 0 and chip interrupts are masked before unregist=
er
> the port. I assume no IRQ should be fired again after port is unregisterd=
.
>
> >
> > Free and synchronize the managed IRQ before calling
> > tcpci_unregister_port(). This ensures no new alert callback can
> > queue work after the TCPM worker has been torn down.
> >
> > A KASAN test using a simulated I2C TCPCI device reproduced the
> > race while unregistering the port. The corresponding teardown
> > sequence produced no report after the change.
>
> Can you describe how the race happens?
>
> Thanks,
> Xu Yang
>
> >
> > Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
> > Assisted-by: ZCode:GLM-4
> > Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tc=
pci.c
> > index 6717ac914c6a6..580dd5256d0a3 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -993,6 +993,15 @@ static void tcpci_remove(struct i2c_client *client=
)
> >       if (err < 0)
> >               dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", =
ERR_PTR(err));
> >
> > +     /*
> > +      * The port's kthread worker is freed by tcpci_unregister_port()
> > +      * below, and the threaded IRQ handler queues work on it without
> > +      * any port-registered check. Free the IRQ (which also waits for
> > +      * an in-flight handler) before the port is unregistered: the dev=
m
> > +      * cleanup would only run after .remove() has returned.
> > +      */
> > +     devm_free_irq(&client->dev, client->irq, chip);
> > +
> >       tcpci_unregister_port(chip->tcpci);
> >  }
> >
> > --
> > 2.34.1
> >
