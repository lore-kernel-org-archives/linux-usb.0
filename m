Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F04071F2
	for <linux-usb@vger.kernel.org>; Sat,  6 Jun 2026 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780751555; cv=pass; b=BISXTn51ui79NVXG6c2lvm/SwjakWkT5/Kx0NYXrfF56OV0Mp7r0qeumgasIpcP6HOXWsN44F+7cdf56Vd5AifQli7PMpl6OXEHEtm9y6maey2YSRuBD2X23udz1Sf+OCTmAsaTh4ZnvPi4s4htBpsLBolHDc31bbSgmXZiFauM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780751555; c=relaxed/simple;
	bh=HQMuWw0xHuA6G0dQECegGEHo07lqs7Y4m7OnEWk+iD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7BnIRirIhaRLa0M/KCrruwzCiH+Un+IGwUSVX5Ehu9EZk3vgmBOwI2sYoUFrIaAk02WRt55/Qg0GBrt1VhJMs1rdOvgqjWITs0vbepvdW/f6Sk1+dEA3cM4jyTSQXANic5d/vWaBxmsctv/AuH+vxVurfkQ5fEfsK3VGjwT7MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ3mlEje; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ3mlEje"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ce9df4732cso29388016d6.1
        for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 06:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780751553; cv=none;
        d=google.com; s=arc-20240605;
        b=ecpyxOEO+x0rZlB+Aevq3iIjkpxeLWXcJwB9QlJbauYUaFWfouEnLj4JyriLf1xr8V
         CLxwVHGDwGaW8krC7FiSz7qiCmecipEnXc6lwL3r7+eHAQJMty0q5O5HeJvvVTAiDxai
         KfdPKQ6neo8RTl/PcRzawjGVMhIAXvvIVzEbfVDP+p4upjedlfmXTzp3kkO/RKnZ/MCa
         lpXjgcJpcwUa7Q6dxY1Zqiv2JrRUY9jXLDvlrqxpe7U1PC/9KzU27gSQt7hbhC5j0gtE
         yod+R+KOdSWvgydEVlwyWxMlxsDcTlqgdD6OvVZ9bX4VQIHRqxetl6OtgeMIA6FQStDn
         1gIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CFjr1lhJTsaUGadLM8K9Vba+LigUx8OxrZPVg4z7Hnw=;
        fh=sx/IvvixBFuqtAXEDYM4F0sU251X9zaL8/ykzkjMLiU=;
        b=bHhFKImAfX/dANnl4oNrXznnZbvf0HHoyGDHQiLT0E6PU3c3sblMTczRFMXkTxwlBE
         YzJK7ZDDvi18EJGyqf7dVUhvY+H+iDSSx6sIZbt9IrLNYIZ4HC8gnIBa7i7Ewk/D1/j8
         z8hUpyVp5SP6sOc2c/Cd7B0TGuRI8im5fwBIHFafPrEqJmnpGnXYugR/sIy40dJztzIa
         SLJgs7ds93nASrkQeIDULkBEE9t7Bty9iYa7PwJLsJ3x2rYdIvrLF2jMMx1zTNwHZk7Z
         h6nTGbtSLIIE3V76gRc/D7PUEReWhXNFUUfXcm2oG3kBQyScOMIQ4Sl1EmlrJvkU5cTO
         hcuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780751553; x=1781356353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFjr1lhJTsaUGadLM8K9Vba+LigUx8OxrZPVg4z7Hnw=;
        b=fJ3mlEjeypKHuDYlBZGA7gZek7qGGHdOmTeDUXC/UUNM2mnI+C9UQP1vMWMXMz2ewq
         4sERW2ypiMs3jxgEUSOMOm3n9wZwg+2oP4EqABJgg1ELQ+7B89wPwqW10huHipEGOqkN
         s7aLKgjXnpb6spoYrIN9pW7glEemqBDtjVCeJoHmz2Bk47vacG0VPVR/Wbxpj+W9Hkz/
         cHASmi81zIH4u050HCU+ZXjK+KE1r3uM6n2MeFZi8vDmOrCyuCUCHIotpokxQt0OwzP0
         lxWn+w7+1DO1UNW9jcMjY2gInniKVrCUxcVByGZtF4gXz4IEfHwlETqp163lsEDobY/8
         N3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780751553; x=1781356353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFjr1lhJTsaUGadLM8K9Vba+LigUx8OxrZPVg4z7Hnw=;
        b=s2pwxDLFnZsh19cxFiDNYLsmj+Vk6FJX5xEO8GrOzPOeVNzCzJK7E6GQnCHVZvTQn6
         F4+apkrDG5BIkPgQttQfZ8aknwSBWuyDFXoCMzIThrC2MkFgjNvPi9RqMH4UjCtS5EUo
         96ELrShDgd8yHw8Qn0bj15tfhOuIIDO6DUfBCXoDez2mE52P1up8dl79J2wwPmEigxJ6
         pzVr4CgjBByp07YDm535I/X6RTCe4vofr+GV3MZ0gFVhytJKlsBTlPvyyoHcCJ7PdRaJ
         1jlLvCLxysOkAabZorXI5PQykft1edvan9KaKY7iWB0DUrFnOuLSLuea8zibg2EWtDvY
         HzGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pNjG1C1CPTZ8j4imDBsQ5HaG4cWc4zeavr+ct2Td4sm4bUd7w/BQVHRXm6cIIc7YjISWorwSDryQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziV6jiiNoMl2+gYILc0ldC7FBLIlVeZAzacGwJ8zLVLTMWOQPe
	Z/gqY9fDXcFdLAquM9qJ6ydeS1fZOnBajqcWFBWow+R/wH2MROJYKKuN/lMzvKQXl9xHV7H6OXg
	jeEWNxqRyguJS/R/D1FoYyb3u7tTfmlrDKly0
X-Gm-Gg: Acq92OFI8O7o1xVfAYF+WCB+LEBsBPL9n4z3JIMpC2ArTzuluRisvjF1mDh85SNvqGF
	1d1vG+fNaGM3JXdTHwlls25ex7laV7ahdhcLnoAIKtNH85+pK6ThQk3UrZ/zCZggRlexHA+2DKO
	EeIlVor5jDfGf4666r6C7O8v8O7nIw0xNROVgwwHJ09etFbcAdFBXx6ztsScsJQeO2L3th1Ap2B
	uxH1+F7YOjYgazR1sbwPZb8iAlYpsCR5ib5RMEU2k5K/5ycITZ25yd12laBxQ/ZWMVIo/q8LMhl
	9kGkg9mO0uUlpgtOj9DChgdxtmXwnTBNzcZfzaTn0KbrAyT+
X-Received: by 2002:a05:622a:1811:b0:50d:9e8d:9837 with SMTP id
 d75a77b69052e-517959d5454mr115021771cf.11.1780751553109; Sat, 06 Jun 2026
 06:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com> <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com> <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com> <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
 <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
 <20260529001057.1e0403c4.michal.pecio@gmail.com> <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
 <20260529122210.6d2c5543.michal.pecio@gmail.com> <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
 <20260530005742.25893efa.michal.pecio@gmail.com>
In-Reply-To: <20260530005742.25893efa.michal.pecio@gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Sat, 6 Jun 2026 14:12:22 +0100
X-Gm-Features: AVVi8CehHd-aeemr0z_jul8v10KpN2Hs32ob_x-TughpGQdK6jCWFic7N4ucybY
Message-ID: <CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Thanks again for your continued help!

I had Claude investigate this in a bit more detail and it came up with this=
:

The receiver's delayedwork_callback (drivers/hid/hid-logitech-dj.c)
reacts to connect/disconnect/unknown notifications by calling
logi_dj_recv_query_paired_devices(), which sends a SET_REPORT to the
receiver via a synchronous usb_control_msg() on ep0. That work is
scheduled straight from logi_dj_raw_event() and is never stopped on
suspend =E2=80=94 the driver has no .suspend callback (only .reset_resume),
and cancel_work_sync() only runs in .remove.

So the ordering that kills the controller is:

1. dj work issues a control SET_REPORT on ep0; the URB lands on the ring
2. usb_suspend_both() =E2=86=92 usb_suspend_device() drives the port to U3
3. only afterwards does usb_suspend_both() set udev->can_submit =3D 0
and call usb_hcd_flush_endpoint() (drivers/usb/core/driver.c) =E2=80=94 and
that flush unlinks the still-pending ep0 URB
4. xhci issues Stop Endpoint to an endpoint on a U3 port =E2=86=92 5s timeo=
ut =E2=86=92 HC died

That matches the trace exactly: the "Cancel URB ... ep 0x0" appears
after "Set port 7-1 link state ... U3", and the debugfs command ring
shows the single stuck Stop Endpoint TRB (slot 1, ep 1).

I had Claude patch the driver and this seems to fix it:

--- /tmp/hid-logitech-dj.orig.c 2026-06-06 14:08:26.580516662 +0100
+++ hid-logitech-dj.c 2026-06-06 13:42:15.702948099 +0100
@@ -150,6 +150,7 @@
  unsigned long last_query; /* in jiffies */
  bool ready;
  bool dj_mode;
+ bool suspended;
  enum recvr_type type;
  unsigned int unnumbered_application;
  spinlock_t lock;
@@ -908,6 +909,17 @@
  return;
  }

+ /*
+ * Don't issue control reports while the receiver is suspended; leave
+ * the notifications queued and reschedule from resume.  A SET_REPORT
+ * submitted as the USB device enters U3 leaves a Stop Endpoint command
+ * pending on a suspended port, which times out and kills the xHC.
+ */
+ if (djrcv_dev->suspended) {
+ spin_unlock_irqrestore(&djrcv_dev->lock, flags);
+ return;
+ }
+
  count =3D kfifo_out(&djrcv_dev->notif_fifo, &workitem, sizeof(workitem));

  if (count !=3D sizeof(workitem)) {
@@ -1983,11 +1995,63 @@
  return retval;
 }

+static int logi_dj_suspend(struct hid_device *hdev, pm_message_t message)
+{
+ struct dj_receiver_dev *djrcv_dev =3D hid_get_drvdata(hdev);
+ unsigned long flags;
+
+ if (!djrcv_dev)
+ return 0;
+
+ /*
+ * Stop the notification work from issuing control reports while the
+ * receiver suspends.  Setting ->suspended makes any requeued work a
+ * no-op (see delayedwork_callback); cancel_work_sync() then waits for
+ * an instance already running.  Without this, a SET_REPORT submitted
+ * as the device enters U3 leaves a Stop Endpoint command pending on a
+ * suspended port, which times out and kills the xHCI host.
+ */
+ spin_lock_irqsave(&djrcv_dev->lock, flags);
+ djrcv_dev->suspended =3D true;
+ spin_unlock_irqrestore(&djrcv_dev->lock, flags);
+
+ cancel_work_sync(&djrcv_dev->work);
+ return 0;
+}
+
+static void logi_dj_resume_common(struct dj_receiver_dev *djrcv_dev)
+{
+ unsigned long flags;
+
+ spin_lock_irqsave(&djrcv_dev->lock, flags);
+ djrcv_dev->suspended =3D false;
+ /* Drain notifications that arrived (and were deferred) during suspend. *=
/
+ if (!kfifo_is_empty(&djrcv_dev->notif_fifo))
+ schedule_work(&djrcv_dev->work);
+ spin_unlock_irqrestore(&djrcv_dev->lock, flags);
+}
+
+static int logi_dj_resume(struct hid_device *hdev)
+{
+ struct dj_receiver_dev *djrcv_dev =3D hid_get_drvdata(hdev);
+
+ if (!djrcv_dev)
+ return 0;
+
+ logi_dj_resume_common(djrcv_dev);
+ return 0;
+}
+
 static int logi_dj_reset_resume(struct hid_device *hdev)
 {
  struct dj_receiver_dev *djrcv_dev =3D hid_get_drvdata(hdev);

- if (!djrcv_dev || djrcv_dev->hidpp !=3D hdev)
+ if (!djrcv_dev)
+ return 0;
+
+ logi_dj_resume_common(djrcv_dev);
+
+ if (djrcv_dev->hidpp !=3D hdev)
  return 0;

  logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
@@ -2148,6 +2212,8 @@
  .probe =3D logi_dj_probe,
  .remove =3D logi_dj_remove,
  .raw_event =3D logi_dj_raw_event,
+ .suspend =3D pm_ptr(logi_dj_suspend),
+ .resume =3D pm_ptr(logi_dj_resume),
  .reset_resume =3D pm_ptr(logi_dj_reset_resume),
 };

Not sure if this is helpful for you? I can submit this to the
linux-input list once I've ran it for a bit longer (it's survived ~15
suspend cycles so far with no issues I can detect) - maybe they could
take this as a basis to fix the driver (I am not a kernel expert
whatsoever!).

Thanks
Martin

On Fri, May 29, 2026 at 11:57=E2=80=AFPM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Fri, 29 May 2026 13:04:49 +0100, Martin Alderson wrote:
> > Bus 007 Device 002: ID 046d:c52b Logitech, Inc. Unifying Receiver
>
> So this is the problem device. Until we have any better idea what to
> try, please add usbcore and usbhid dynamic debug and keep collecting
> logs - maybe something useful will show up.
>
> Looking at usbhid, it seems it may fail to suspend if some operations
> are ongoing. And then usbcore may apparently suspend the device anyway
> and usbhid will presumably try to continue its thing on the suspended
> device. AFAIK any URB submissions should fail then, but there might be
> a bug. I haven't yet looked closely at how it all works.
>
> BTW, are you able to test patched kernels in case dynamic debug proves
> insufficient to figure out what's going on?
>
> Regards,
> Michal
