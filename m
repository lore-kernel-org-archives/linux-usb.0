Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7DC4F30FA
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567207; cv=pass; b=KUHUUZB1Tnz5yI4fvz3hmIp1UBH61bgHNMU0/DFNZW8yl5v3+rs0vdttk42G7ngJDDTCwLLc2dKqJICUUA3KnAQnJ2sVbvXfuroWS/ECsV3+wItZhBvJEkvBkeF9WZbfzzboXLYAcnPU7N2Cx+F5uIz6ZDbXMn4+i6sax6howdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567207; c=relaxed/simple;
	bh=Lo5m+5XbgBq5KlhQKWJHjSfUKAPx93SJbpxEjeKi29o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUVLLCsQAfT0Fi0ZOfzVBAYXXCBOZrzeXx6cex/PNeivmIeRom3GGwIJgYDQwMI5IHmchzGd3f0dnZslbKcJ05XBwl+r8cXBzhrdOKdyF0V7BpsHBTJE5qomCXdNY4PbPnwwRXMIgyFassoAeSd2cpQCP23RSFDtUdqUsXVEUow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn2qniEh; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn2qniEh"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe60d5fso9208176d6.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789567204; cv=none;
        d=google.com; s=arc-20260327;
        b=WS4mVButYO49+zpTLoSGX+LE8Ei2/GsM2gZCEm/rH6ZFWWPYSiSn4YlN/kVrJOQO+H
         dToDLC5BpEcg8flg5g3DFkA7DS1OTWmnSvW8hI7Q2B5DtBrZpTI4+ycZ5e2bnHjANgBp
         2uv44n/ZSmVd0nf8XxJc9PHZAz5TFol+Dzy88GeNdenOXnXnIwMveaZn0bliykXHS1se
         +ntuYt3KbmKG6Cs3x2gX8Kpb0hO2sqrppNFcO149AWo91/S58tiJuMemZj1h6d85aphN
         +35XUqtGPt17rE16DBgJ0awq3/vVZIFzPegffHIdsgQwOAQdhZEutWSrCSBKvtXoQS8E
         DZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+a9lIvcGaqBqdyOLmYx45wqcMm+lGY50sdj07F25cCc=;
        fh=fPcPdPqdZ9cpkPYaa/vzC6V/oFNikGXqXYz+IZOFClE=;
        b=mftebacAWv9SfSJkivDK4HTwXWF098Ehx0S/YJKq+b+e1BIt9qbbtDdTyp95AU6phP
         VW3WRgzrlFv1bVijoIjIc7Bn6yN9pUCXlmzHcl57AxhmgGuWklXDybZtRCCbNqwZqpPa
         VIJBksYUu3G02CD6SvAvcgAEnHRhudBLtn76WqyUmLZQdulwkb/LHpR1/JVzRPPMGdL2
         ydlZHjOje0DqWsZIK7rdgsja0vjlikZUnkYjNksu07J/HODparnEE+gB6bGjAzBgodW7
         ks5OvsgD+6QfIdGNUJU+2W0UifedciLx5JZ2IFp62unbQBQUYFVno0z7vYC1MeRV6eyT
         46AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567204; x=1790172004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+a9lIvcGaqBqdyOLmYx45wqcMm+lGY50sdj07F25cCc=;
        b=dn2qniEh6yu9wMRNN9Q5DCbpoZbIsjWxO3TswWr0Fqd3XQB5i/nxHSBa3I14t0928J
         IuIwA2SEJqQvpUDkdZRTqDtU5LA9qAxJF/c5wfL/pDnS9auWRu+sebO8t0m5F8J6/M3l
         hX7Zapm1TpQqYhKZ/rOq243zT7qp+ahYdS9qfHgw16W9Mex6H9lqgLnlSw8vLNpaEvZG
         VQ0nXHnVzxXRTxCwmi9TlUO3C0sFJYUQWMXnTEfHz8Hxb3Bjr4ToWVRpuCOGWwd5/7AL
         Esl+d6eMpuSrLDvZQGfR/DVVzYDwewPPFgZN7ZOGYHqnH8hUvFx7/eVmW3QW2kwwp5NB
         +vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567204; x=1790172004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+a9lIvcGaqBqdyOLmYx45wqcMm+lGY50sdj07F25cCc=;
        b=siS92TTDK6CzKv2TvSsCNaAXRIv3tJWpMCTiZqBihfWRTrdatT8tS66ltQJ3eR1U1V
         j17anGZEclLC0KlBCLyQhGODKY0NcHHUbP3GholUaxxR7fXBirXJl7fg6JwgIQAdEcp1
         hZte7ZIOxXIB6v9Uvo0zRid1hlK0Xi4Z+cckQWX9kE+tkyZBvOBojBKDW2Jho4TQ6axT
         TN9vGSGAbXNTIRDvb9glWUzjGjo02HN0hSxHdsgl5pFsKpKeYKO4IqNB1rXUyrnI3pzZ
         cHx4+SHhEkJC9npKPua7HKTjanr/hGRlmpkX5ftnOC+yGKa5huBQZhiZ3HS+KsMpxSjV
         PJVw==
X-Forwarded-Encrypted: i=1; AKwUvBwjOJ5IAwPqwVcc4PnuiWh+WW3yCJhOG0LbBAf2xYNwTEvQng9NMAj0ypUn2gDnIMw66YCOgYn37PQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mYsLvQnK3G0grae/E8Jx9SEeMmJVYOQYklkv0zmo7vNUVaPFsh
	WSippFEZ5DEcwIe1EvjuzEgrgL7k/784jnSF3Bp4Njt0D6tsdgmly1vOxvBDgUxdo1WDhbFxgoG
	wy6J8C+CIeNZPpBmL356eJHdrKgGM+ZI=
X-Gm-Gg: AYBFou2kBv6NZ1G0XLBQwvCb6z8lzWOTZRUhscjUG3NeQGuc/ZzGXd70LcchhyQ3SJV
	AQEj2GKQIa2zEPc8UOx4gPEr5Sn8Z6DdqJgl11/OhHn5gef7L80VuS45WZ8OCfwGDsOLpcPnOTH
	AH4c/AmMsEdLnr6nNs6jnAjNNcIouoZw+B7pKKG475QZ76EDBRbLURJGtnWw7yZcwIHIbJGHH3L
	C8hN6+g0JE/FyOk5h6Hg7pOAzWzQG+ssIu8kulP3qDb1MCjKyNfZPNXNw8+9qaJO59jTwan85Fy
	SKj6Cqr/xdMQ5I1Ft6hVEMZ4fNSvy5ezXRPS98zK0f0LaDYGGLn/AZBxfb0e4Wk5QjLiqM48ly+
	lQZKnqsNBQ1ZpXwQqvq4KSOGWt7qj9VsniF7E9Uystggt0wMZmC6Cjtet2WAI3mZzRseMqNgX0O
	W2PFdpFQ==
X-Received: by 2002:a05:6214:268f:b0:910:3e54:8934 with SMTP id
 6a1803df08f44-9123d7c9ce9mr51289856d6.35.1789567203991; Wed, 16 Sep 2026
 07:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com> <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
In-Reply-To: <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Wed, 16 Sep 2026 23:00:00 +0900
X-Gm-Features: AcwNN1UH0LS5prZ4bk9c-WqdUi84HiceliEzveM4-BHB8J7JQJAMoI93JlxUlVA
Message-ID: <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

> Hmmm.  Do you know where the unmount operation was getting stuck?  Was
> it the usb_gadget_unregister_driver() call inside dev_release()?  I just
> want to be sure about this.

In these reruns, I found that the unmount task was blocked in
synchronize_rcu_expedited(), called from namespace_unlock(), rather than
in usb_gadget_unregister_driver().

I reran the PWRITE callback tail test with both patches applied, using a
resident helper whose main thread invoked umount2() directly. A monitor
thread in the helper captured the blocked main thread's kernel stack. In
three runs from fresh boots, the relevant frames were:

    synchronize_rcu_expedited
    namespace_unlock
    path_umount
    __x64_sys_umount

In each of those three runs, the same umount2() call returned
successfully after I released the callback gate.

USB gadget request completion callbacks run with interrupts disabled, and
interrupt-disabled regions act as implicit RCU read-side critical
sections. The observed wait is therefore consistent with the diagnostic
gate delaying completion of the expedited grace period.

I also added diagnostic markers around dev_release() and
usb_gadget_unregister_driver(). The test harness signaled the resident
helper only after the reproducer had closed ep0. In five clean runs from
fresh boots with these markers, both usb_gadget_unregister_driver() and
dev_release() had returned before the resident helper invoked umount2(),
while ep_aio_complete() was still held immediately after
iocb->ki_complete().

The diagnostic gate used a bounded loop that did not sleep in the
dummy_hcd completion context. In three control runs with that gate
disabled, umount2() returned successfully without the prolonged wait seen
in the gated runs. The blocked task's stack identifies the wait point,
while the markers show that both usb_gadget_unregister_driver() and
dev_release() had already returned.

Thank you for asking me to verify this.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 1:01, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 14, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the revised patch.
> >
> > Following your explanation, I focused this round of testing on how the
> > revised patch handles module lifetime.
> >
> > I applied your first patch followed by this revised second patch to
> > upstream v7.2-rc1, commit
> > dc59e4fea9d83f03bad6bddf3fa2e52491777482, using
> > CONFIG_USB_GADGETFS=3Dm for the runtime tests.
>
> ...
>
> > I also held ep_aio_complete() immediately after iocb->ki_complete() on
> > the PWRITE path that does not queue copy_work. In two runs, each starti=
ng
> > from a fresh boot, after the reproducer consumed the AIO completion eve=
nt
> > and closed all GadgetFS descriptors, unmount remained pending, at least
> > one concurrent delete_module() attempt failed with errno set to
> > EWOULDBLOCK, and gadgetfs_cleanup() did not begin while the callback ta=
il
> > was held. After I released the gate, the callback returned, unmount
> > completed, and module removal succeeded.
>
> Hmmm.  Do you know where the unmount operation was getting stuck?  Was
> it the usb_gadget_unregister_driver() call inside dev_release()?  I just
> want to be sure about this.
>
> > In another cancellation test, both unlink_work and copy_work were
> > outstanding on gadgetfs_wq when rmmod entered destroy_workqueue().
> > Releasing unlink_work alone did not allow cleanup to return; it returne=
d
> > only after I released copy_work.
> >
> > Using the GadgetFS source with both patches applied and without the
> > diagnostic gates or markers, I reran the original NULL pointer derefere=
nce
> > and UAF reproducers and the relevant AIO cancellation, payload, teardow=
n,
> > CPU hotplug, rebind, module reload, and partial read stress tests. All
> > completed with the expected results and without a KASAN report, Oops, o=
r
> > LOCKDEP warning.
> >
> > In these x86-64 QEMU and dummy_hcd tests, module cleanup did not begin =
while
> > a callback still had work to publish, and destroy_workqueue() waited fo=
r the
> > remaining GadgetFS AIO work once module cleanup began. I did not find a=
 new
> > failure attributable to the revised second patch in these tests.
>
> That all sounds very good.
>
> > Thank you for examining this issue with such care and for the time and
> > effort you have devoted to it.
>
> And the same to you.
>
> Alan Stern
