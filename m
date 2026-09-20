Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE85282F26
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789884042; cv=pass; b=K4plPxd6OF8RX6i9ryduGcAmJa9GRS9App61xTt1G5ZnWxmLFy+NZmuPSxixJ6JDTPqRdhHRtjP+O6MxDLBh6HcAhgCGHkTC8gaZyg8GMTpJQObR1mt0ANmBqzDJldUDxx2vyYZVE42wNHsGMAmmNkHVmokjSNt4e/nR52wvrI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789884042; c=relaxed/simple;
	bh=cLvwa5rFGT+7r6MjV18BDb25CARd3cR08gXPYNvnfLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axSg8WGwOk3d9H2dfWluUebavNSIwPG1FtUmd6ogPfQqIioxjRIb+qFLD4EywnKLpKrkr95ydfdjULimAFFJW8myYXZrL7Lq4e4j2Wc8wrfraXE0IWsxKnpMdR8bzQ3/ma6he1zLj7ew6gJmJlPC4ZI1n4bh13jGyePvUpi7TXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kA1ZBXTS; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kA1ZBXTS"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so3599e87.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 23:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789884038; cv=none;
        d=google.com; s=arc-20260327;
        b=QVLocNoGKQDboDwa8kk3t7KMdAGAu+2VW06smrqaPsbZ6h09qzCoZB5EhOXDtis6hm
         MwjMxIhMAs8FEjnJFYT0kNrw6z82Wjm025GFoAR6e3V7uzVpbPURDEknL/vi0wzGdlUT
         X+j8E+MNkbTtyJLXIdI/Q3YxjaH7I8theuttTt4GfvN6m7i335s+UtR5iTe7WJ/knPtQ
         ZfWw/KHJDkk1h6ErpYW76Hv3oOCMam/fw8IvLCN9HbT+AtetML2R0Dk1gRWoYd99k6dG
         RsqNYpg6oLhtmB37yBE8ZiQMdCo/4ovP6jd3Buq/TkYqxha37jDTxrmgTmOyn+hYEGdU
         1Uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iiRifyt3IpxBEnewWKsQC6QHvxMpYmC0qtuCn1YCgDM=;
        fh=0dwBuHyaPOs6kPItkGN4q3Di0OJ4lec9wexpLzNBFgY=;
        b=pS7pcWhwOxQG5C/zCCmj90WRPRxpcz/7ctuyguWwNJnqZL++FV3LiDEnoIKKJVDPaz
         EZiGf2MPZ9mMlhkWCWMfvAVFA7fvrLLYLywaHAoff3fdszrIoJUXJ96GL4F72DZYnRnl
         H976rNrpRWavFcU5OOBltSN3vUIexTtULuogwX49UY0kq53Atgkv61J2+7LIXUKr1in7
         IXzYjGNEKJ6Nkp+oz2w6GPC5ixgaKP4ifiYAvtv2I59WxABbwjRU3ZcqJ3Mcdmgqy8xO
         OqKrnQwFlQmfL53KRahdIxB0/Y0jTiukrqnYJ5nK0CPBZY6sRr+EvOwLtUQ3LYmp2s/I
         xfhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789884038; x=1790488838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iiRifyt3IpxBEnewWKsQC6QHvxMpYmC0qtuCn1YCgDM=;
        b=kA1ZBXTSczdQgZ+KoEGbFlNQ9gNVp6gbr4vVWoHmUawlZv2U1VQLbzRELB+rOsgOPx
         uUVxDoOskuCxu8p2lPvI9QmcCFNZ3Pq7k6/JA9akeXwJD63jVREgw5cEEQFfS/lgjW5l
         ye4rkt61P8szQ9kjK8d/qXiw0DJMTgDzco2dxgOfSpdzLKawt957CKvNMAX6v1EO6RKF
         zCgU5GjMot8Urcgwpma5hQtlYijAF/KQjpkoosb+l9O2zsF93XVCvy0Sy2Bww/fypZN0
         +33EmqlTsbxbOM8WG2AqaRayqmXBCfVl2AAV6D8sExaYpagVHGq3nj7VAYeilkf/Ozpp
         /5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789884038; x=1790488838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiRifyt3IpxBEnewWKsQC6QHvxMpYmC0qtuCn1YCgDM=;
        b=1bM5Ctd63eS/JaL7pSnjD+NEdiSUQb9etRbdTryjU9zHsGM9OQE980I66JSSQLIxdJ
         JAii9atQNocfJBF13pmPrAKizQyI/w8Vz79wuDGMsFHIkDu3E/5ajpPrLlHqxL9PedZr
         WnHRI1yOy4FPVfVA04uOHqlweObwPfdxBlEmypG5jhyIUxJGkQT14mXiEmHcJR52U+l7
         DeBIBK+gxT9lG7pssnU6ZwM5drpmF1OaHzBXBX6/n7iCnrpxFQU5GF7iiweVewEjRZmy
         owzJMCLrwdZZ92+2FMLu3OvK/J+K1h7VFWi/bB8oKBDuKSl+DTUSy3989I4oKeXy8zNC
         2Mnw==
X-Gm-Message-State: AFuF++lxcKLfJvib4mUY9hJ8NH8YWbIu3/9jDSxqx9Lrum7mdDtVj8Mm
	95oTFEnSqEsJgbOKsjQFOqlsgfdthD2mubilbgR/olTO5fX2m4qH6X9euL0iQoPa4ranArIMiU8
	ncf1NbCnkugXWoY1CRRyPkh25svX04S0MjWUlnBMG
X-Gm-Gg: AYBFou2Qml+xi4g8pzN27HkN1Q5Nhm1X2uIsousmEBC402jrYaSzwuqnXS2prFwCZgv
	K8WZBTLArbfWXfOmMSb8+TZvMsK7lo+kvJZYbtMz8fIt4D5k5q4F/r2sSq4fnNAF1L4Qfm2RjrG
	XhW0v5/MMmuKNjlO47nJwzXfUN0Io6ebcChf2XcD7qNvuLNQTyuEke6yUNWxCtbcy/QUae45NSZ
	kPB7YvwLrtkfD0hyCpi2dXpX5Ux1xDlEfkVB6NtCrrGR/a5irJFgnWmn6AbGvdVf6yoUPVO8Rs4
	U9CARP3QAMmpWLSpFRC0UGC6PNILVUcVr0gdus93VTJpCCfbp/E6I+LpXrD3SOZo7UL0UjTa7YU
	JIdJsC/fToFk=
X-Received: by 2002:a05:6512:3f01:b0:5b8:b502:9a76 with SMTP id
 2adb3069b0e04-5b8c7eae27fmr79047e87.13.1789884034385; Sat, 19 Sep 2026
 23:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA92w6k-LA4tVXyX1mFNOR3e+_mC43F_BXqhXeWqQyFx2D4_Mg@mail.gmail.com>
 <a0934cb4-82f2-42bf-abd8-95a0016fb0e4@rowland.harvard.edu>
In-Reply-To: <a0934cb4-82f2-42bf-abd8-95a0016fb0e4@rowland.harvard.edu>
From: Fabien Sanglard <sanglardf@google.com>
Date: Sat, 19 Sep 2026 23:00:22 -0700
X-Gm-Features: AcwNN1X_4CeaowkGhv9HtFky-nGLMmOeX1T2l2tsXMBPtoXBuVmhouxWncYbp5Y
Message-ID: <CAA92w6my-P4Srfb_AmOm_NjXM6CqaA0Q_Dc_9kgUtM_wCGkHNg@mail.gmail.com>
Subject: Re: Missing uevents after successful USBDEVFS_RESET
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

> You would have to think carefully about the conditions under which
> it should be sent.

We only want to emit KOBJ_CHANGE on an interface when:
1. A driver was bound before reset and forcibly unbound.
2. The reset succeeded in-place.
3. No driver matched on re-probe, which happens for `usbfs`.

It looks like these three conditions are all met in `usb_rebind_intf()`.

I tested it with an Android device/ `adb_reset`/`udevadm monitor
--kernel --subsystem-match=3Dusb`. When the in-place reset succeeds, I
now see `UNBIND` followed by `CHANGE`.

WDYT?

---
diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 7f33fe5ba03b..ec4762d260df 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1182,8 +1182,23 @@ static void usb_rebind_intf(struct usb_interface *in=
tf)
  if (!intf->dev.power.is_prepared) {
  intf->needs_binding =3D 0;
  rc =3D device_attach(&intf->dev);
- if (rc < 0 && rc !=3D -EPROBE_DEFER)
+ if (rc < 0 && rc !=3D -EPROBE_DEFER) {
  dev_warn(&intf->dev, "rebind failed: %d\n", rc);
+ } else if (rc =3D=3D 0) {
+ /*
+ * Emit KOBJ_CHANGE to notify user space that the
+ * interface without driver is ready to be re-claimed.
+ * 1. A driver was bound and forcibly unbound (this
+ *    function usb_rebind_intf() is called in this
+ *    case only).
+ * 2. The reset succeeded in-place (this function is
+ *    called from
+ *    usb_unbind_and_rebind_marked_interfaces()).
+ * 3. No kernel driver matched on re-probe
+ *    (device_attach() returned 0).
+ */
+ kobject_uevent(&intf->dev.kobj, KOBJ_CHANGE);
+ }
  }
 }

On Tue, Sep 15, 2026 at 7:37=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Sep 15, 2026 at 02:48:08PM -0700, Fabien Sanglard wrote:
> > Hi,
> >
> > I am investigating an issue where userspace processes using usbfs (such=
 as
> > ADB) cannot reliably track device state across a USBDEVFS_RESET ioctl b=
y
> > monitoring netlink uevents.
> >
> > Repro steps: (Lenovo P620, kernel 7.1.6)
> > 1. Plug an ADB device into your computer.
> > 2. Open a console to monitor netlink events: udevadm monitor -p -u.
> > 3. Send USBDEVFS_RESET a couple of times (i used adb_usbreset).
> > 4. 50% of the time the event sequence is UNBIND/REMOVE/ADD/BIND. 50%
> > of the time, the event sequence is just UNBIND.
> >
> > When USBDEVFS_RESET is issued via drivers/usb/core/devio.c, it calls
> > usb_reset_device() -> usb_reset_and_verify_device() in drivers/usb/core=
/hub.c.
> > Depending on the reset outcome, userspace sees inconsistent uevents:
> >
> > Case 1: Full re-enumeration (descriptors changed or reset/verify failed=
)
> > The device is torn down and reprobed. Userspace receives:
> >   UNBIND -> REMOVE -> ADD -> BIND
> > Userspace processes monitoring uevents immediately detect that the devi=
ce
> > is available again and re-open it.
> >
> > Case 2: Reset succeeds without re-enumeration (descriptors unchanged)
> > The kernel unbinds usbfs/interface drivers before reset, generating a
> > KOBJ_UNBIND uevent. Because the usb_device structure is preserved and
> > usbfs does not re-probe, no subsequent KOBJ_BIND, KOBJ_ADD, or KOBJ_CHA=
NGE
> > event is ever emitted.
> >
> > As a result of Case 2, userspace receives an UNBIND ("disconnect") sign=
al
> > and assumes the device went away, but never receives an event indicatin=
g
> > that the reset finished and the device is ready for reuse. This forces
> > daemons like adb to fall back to polling /dev/bus/usb instead of relyin=
g
> > on netlink/udev events.
> >
> > Is the omission of a completion uevent after a successful reset without
> > re-enumeration intentional?
>
> It's more or less unintentional.
>
> A normal driver would rebind automatically.  But usbfs isn't normal, in
> the sense that it won't bind to a device without a special user request
> (primarily the USBDEVFS_CLAIMINTERFACE ioctl but also some others).
>
> > If not, would a patch emitting KOBJ_CHANGE (or re-binding/notifying use=
rspace)
> > upon completion of usb_reset_device() be acceptable here?
>
> Yes.  But there are some things to bear in mind:
>
> Adding pre_reset and post_reset handlers to the usbfs driver would
> prevent unbinding in case 2.  The problem is that there is no
> agreed-upon way to then let userspace clients know that the device has
> been reset, or to let them know beforehand that the device is going to
> be reset.  In other words, the two handlers wouldn't be able to do
> anything useful.
>
> Emitting a KOBJ_CHANGE uevent instead would be more straightforward.
> But you would have to think carefully about the conditions under which
> it should be sent.
>
> Alan Stern
