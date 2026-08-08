Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8D37C11E
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786216494; cv=pass; b=pDyAQ3pMqwE/c1rDoobQTT617TJKyr02+jB/s23BfV+hg+9XUfcejqJTP1FcKuENFpCj8RwgEmTVu0ffOVcYw9qt0TuI7ArKEnTfSbDhhn1TY+Q2pLgJWEqRn50tTeEclIVeVUoa0k1oOxC4EOjbsU8KnPYT0xxvbjjAyQaLNas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786216494; c=relaxed/simple;
	bh=jcfNRkYf9NQYY+54kEHrbX5m6Wp3dLAN8A6vIJMYslc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMS7B5mP7i8rWHN6nOIQ8WAEHKts/irzKOvzwqvCw1a7TClz8toxmQLPtmAKKmid8E5P44+p03yvzvPs4HCp0acampMOmz/pUV7sKnZi6Eu4o9uuRBovozc/7Pc75HqIK76EzgTy56GR1Nekdsj0CyQOsMIyaZ+tC1ZU8U74VpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TudukuXS; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TudukuXS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84eb992a881so385660b3a.2
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 12:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786216491; cv=none;
        d=google.com; s=arc-20260327;
        b=PiwkA2sFPwtlHfLpbt4pn6t8W9k6W/D/RXTTEyiYYAIPeIAMoAIeAUCuuZ05Hktlwc
         xu+7gk8Uq1+Q1TSINAqHuK9AeLJPROXfws0KUCRRhdWmYtbkPuJu/yKaedY9Gy4n3bvZ
         JUSTWEEY1z65NizkhL/J+kNfC0WCzrWZJ0ygzEGygUQJl5hRbL9LZcz5bT3GdjKpTVJx
         bAd3Jyiovt1+nEJ4BxGGvwEXcZjEgLooouFAYiw878U5fY4BYI3vZfOljZEsnlzWMOZs
         Lw7mhR9YT2Dk39x4M7TWliCrrujCWISeWwbbTpZeuEgTaI3L0SjH5076MxuSaD/ieh/z
         H1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wK9wqpI099mwVpp801HhlmE6bUIqBl4aKz0i73NnApU=;
        fh=KUfCkiTE7LuphEkZ54C0Ki6Mb7kT0lqkUTjWEk4K4J0=;
        b=imBKNytPALNNEwXLiYqu6QE5M5TG1Ka11VjjKGiciDHBGa/0rzAy1yX+RnzOSQRRA5
         3L1JuGeDaAKBxdhDeXaoGUkI5j1mjrpZthRG9LRQifNaYbsRmU26BwQfCvCgCAPw6gFS
         gyA4RhmjTaThYurFqgtdhnHOZPyrUtxQF3jR8z9xh7isfyZtzEN8LOGyPCO1WFeknBO8
         8ZBcnJw/EL5LIFbN2DDD5j0vBWg7I6dWmZhcMIjOTRxqgex8oLNyBuxUNfSf5qbnVSrX
         JnHMhj1kAbyCQEvB5EP63hAgaGQRL12TZbRVQ5OAe/9jG9KepLVpZ3nraFBJ9z+OWiM2
         T5DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786216491; x=1786821291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wK9wqpI099mwVpp801HhlmE6bUIqBl4aKz0i73NnApU=;
        b=TudukuXSM+25fkr9D3BPKzXqinUCRPYJByNo+HyxaPw7SBmKi85XUnHUip6hrHPqaj
         c1toM7lMLooaCnXHgwElin+YeABAHR7F2LFBQxy01M/+46/6TFqPXbIkROYic9LgxWu0
         A0q7B+dF+alZWMRDunM/QScRjjNYW/xRAVHYFZkPFpml7knGIc/4xKVmEgXStdGqH6Ya
         uu68bJZaKITwiB3k281kTOfxVFQT44gB0/ypWpoBnms3tMwTMEBhTtKF1pp8VDpOBi3e
         XpUhVkmRI8fq48xig0zYjspT5NDVmdQlP6lCsVQdDhFsK7JL67n2yJJXxHKAP9lRd88Y
         1hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786216491; x=1786821291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wK9wqpI099mwVpp801HhlmE6bUIqBl4aKz0i73NnApU=;
        b=rgHhNx9pR3gAT4LTYzkPSsNYl/m6phMd4S2KzJzEIM1Tn3YH/d6Vm+lwoyLVD4p1CM
         cDfOejemYue91CWAU2gTFikXCu+6+QcJBFx4U0iV1FgsqhWok00Y+H9Ox9cGOFwCj8RZ
         OOrqAaiSc9MUkYOhZE5CsEe5xNbk2s3t66XajrPNmhltpyJ+P4OoNziToagBnMe40GIG
         ETAeuoVQ1GeHNMt68DHclo2hg45EQlJbpyf/+Y3Y2QA1i2dTeXYKIFUykKR1niw85mA0
         2XuRvyntglKQaLFhWYF/yHU9M8SYTM7wlM72ZRqRqyfzekRMm+di5F4CBNjubo+34STu
         siRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3cX7xG9+Jj9JWZ7Es8KKuXT+pde3GhtPsq+aK7D52uFMgweRRYakDUW99PBXhNbSoWAd7/CFCNOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhf8NIXwrRZ5cSGNYRh+8s46WN3SXxkNCwJnT87UKNtsRJ6mDd
	7wa/6CCt3CaBv4mxiajTYL6AOILUk3IhqBKYPdblxC+doNgsoEGM/AHjoIHHCdPsmc5wqPz2Th8
	IkkIqF9C4YxmW9n+UJAiqx03LfPTYZlA=
X-Gm-Gg: AR+sD12rq/9nYs4lbAHLoMXoFU7eOvScjtd23S9KbItXPz1jCy5mhy2VBNgPi4ipBCM
	IYxYFIjK6BM+P3ryRcq0972bNI3UsW8Nky6njbo8WI+d1RnGgnzPjYVbJqgxXPOLah8gRRHgWBs
	PYyqbXig17mI/6KOE1sjjLuk8EeBoZo0T6ZGR2KI/g2emEzSZK/Hr5nk1wBGjUgUD0e8IrO/m0a
	Eqscr8urPBidOr8kg/aFOqqbP0NPP05TJ0YL6TVc/OPgZTriNlsxU/i6sM4/+r4lHp8RYJa+6K5
	CNUu+KxTLbmHmdW5elnkmGOdvHDxfFfJSFJg6ZmJicj7aA/Y08yYp4wVXQz6bXGEDVxU6L0Bfax
	ugY6rFSE52mNQbR8qogR/C/PEvuhynF52KIfg36ZCdnKBCrtAtQVbcAzLFZ90
X-Received: by 2002:a05:6a00:10cd:b0:848:8445:6956 with SMTP id
 d2e1a72fcca58-84f4fe9f90emr19439281b3a.18.1786216491212; Sat, 08 Aug 2026
 12:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
 <anIhyHL4Kl-DX2G_@eggarch> <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
 <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
In-Reply-To: <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Sat, 8 Aug 2026 15:14:38 -0400
X-Gm-Features: AUfX_mxx3SsufAIg-Wf6N1blTe8xZ-UtnyMyKt6wp1L8lq-UQvDnztJkDa16FCY
Message-ID: <CABWMpWSkJgmoZACA4LYEbmsbEGJMYLyixwv2V3tZbneeKBxpWg@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I also completed the test with a separate PCIe USB controller based on
the ASMedia ASM1042.

The UPS enumerates normally on the ASMedia controller and the kernel
identifies it correctly as the CyberPower LE1000DG (0764:0501).
However, on this controller the failure mode is different.

The device and HID descriptors are readable, but the 504-byte HID
report descriptor is consistently unavailable. Ten consecutive runs
of:

    lsusb -v -d 0764:0501

all showed:

    Report Descriptors:
        ** UNAVAILABLE **

NUT behaves consistently with that result. usbhid-ups successfully
opens the device and claims interface 0, but then fails while
attempting to retrieve the HID report descriptor:

    Unable to get HID descriptor (Pipe error)
    HID descriptor length 504
    Unable to get Report descriptor: Resource temporarily unavailable
    No matching HID UPS found

There are no USB disconnects or xHCI errors in dmesg. The device
remains present and enumerated on the ASMedia controller.

So the separate USB host controller did not resolve the issue; it
changed the failure mode. On the Intel controller, the report
descriptor can sometimes be read and NUT can operate for a period
before communication becomes stale. On the ASMedia ASM1042, the report
descriptor cannot currently be retrieved at all.

The same UPS continues to work correctly when connected to the
Raspberry Pi, so for now I plan to leave the UPS attached to the Pi
for production use.

On Wed, Aug 5, 2026 at 8:08=E2=80=AFPM Jamie Stephens <jamie.stephens@gmail=
.com> wrote:
>
> Thanks again for all of the suggestions. I wanted to provide an update
> after spending some more time testing.
>
> At this point I'm no longer convinced this is simply a kernel regression.
>
> I've now tested the UPS across multiple kernel generations, including:
>
> - 6.0.x
>
> - 6.18.40
>
> - 7.0.2-6
>
> - 7.0.14-8
>
> - 7.2.x
>
> The behavior varies somewhat between versions=E2=80=947.0.2-6 gets the
> farthest=E2=80=94but none of them provide stable long-term communication =
with
> the UPS.
>
> On 7.0.2-6, the driver successfully:
>
> - Claims interface 0
>
> - Reads the HID report descriptor
>
> - Detects the UPS correctly as a CyberPower LE1000DG (VID:PID 0764:0501)
>
> - Retrieves battery charge, runtime, voltage, load, and other values
>
> - Completes several successful polling/update cycles
>
> Eventually communication stops. At that point the running driver
> repeatedly logs:
>
>     libusb1: Could not open any HID devices: insufficient permissions
> on everything
>
> and upsd reports:
>
>     Data for UPS [ups] is stale - check driver
>
> One thing I find particularly interesting is that the UPS never
> disappears from the USB bus. Even after communication becomes stale it
> is still present in lsusb:
>
>     Bus 001 Device 007: ID 0764:0501 Cyber Power System LE1000DG
>
> There are also no USB disconnects, resets, xHCI errors, or other
> kernel USB errors after the device has initialized.
>
> What makes this especially confusing is that this does not appear to
> be a normal permissions problem. The driver clearly has permission to
> open the device initially=E2=80=94it successfully claims the interface, r=
eads
> the HID report descriptor, and communicates with the UPS for several
> polling cycles before failing. Once it enters this state, however, it
> repeatedly reports "insufficient permissions on everything" until the
> driver is restarted.
>
> Since I can reproduce essentially the same failure across 6.0, 6.18,
> 7.0, and 7.2 kernels, I'm beginning to think the kernel version only
> affects how long the driver remains functional, rather than being the
> underlying cause.
>
> Over the next few days I plan to test the UPS using a dedicated PCIe
> USB controller based on an ASMedia chipset to determine whether the
> behavior is specific to the Intel xHCI controller. I'll report those
> results back to the list once I've completed that testing.
>
> Has anyone seen this pattern before, where usbhid-ups initializes
> successfully, polls normally for a short period, then loses
> communication and repeatedly reports:
>
>     libusb1: Could not open any HID devices: insufficient permissions
> on everything
>
> while the USB device itself remains present and enumerated?
>
> Thanks again for everyone's time and suggestions. I'll follow up once
> I've completed the additional USB controller testing.
>
> On Tue, Aug 4, 2026 at 8:01=E2=80=AFPM Jamie Stephens <jamie.stephens@gma=
il.com> wrote:
> >
> > Hi Lovekesh,
> >
> > I have now tested 02-resume-reset.patch separately on Linux 7.1.5 with
> > the CyberPower device 0764:0501.
> >
> > The patched kernel was active:
> >
> >   7.1.5-ups-reset-resume
> >
> > The device was detected by lsusb, but USB initialization still failed:
> >
> >   usb 1-3: new full-speed USB device number 4 using xhci_hcd
> >   usb 1-3: New USB device found, idVendor=3D0764, idProduct=3D0501
> >   usb 1-3: New USB device strings: Mfr=3D3, Product=3D1, SerialNumber=
=3D2
> >   usb 1-3: can't set config #1, error -71
> >
> > The UPS therefore never attached to hid-generic and NUT could not use i=
t.
> >
> > I then returned the same USB cable and UPS to the PiAware NUT server,
> > where it immediately resumed working normally:
> >
> >   ups.status: OL
> >   battery.charge: 100
> >   input.voltage: 122.0
> >   output.voltage: 122.0
> >   ups.load: 23
> >   driver.version.data: CyberPower HID 0.8
> >
> > Results so far:
> >
> >   01-no-lpm.patch: did not resolve the regression
> >   02-resume-reset.patch: did not resolve the regression
> >
> > I will proceed with the requested git bisection unless you would like
> > any additional targeted logs or tests first.
> >
> > Regards,
> > Jamie Stephens
> >
> > On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM Lovekesh Solanki
> > <lovekeshsolanki00@gmail.com> wrote:
> > >
> > > Thanks for the report,
> > >
> > > On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> > > > sudo lsusb -v -d 0764:0501
> > > >
> > > > reports:
> > > >
> > > > wDescriptorLength     504
> > > >
> > > > Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> > > >
> > > > cannot read device status, Resource temporarily unavailable (11)
> > > >
> > > > As a result, usbhid-ups is unable to reliably communicate with the
> > > > device and NUT cannot reliably monitor UPS status.
> > > The lsusb failure and NUT seem to be seperate, lsusb failure could
> > > simply be device property.
> > >
> > > Few possibilities I can think of worth testing:
> > > 1) It may be related to LPM, the device may be advertising this but m=
ay
> > > not be handling it properly.
> > > 2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired port=
s to power off)
> > > lets acpi managed ports be powered off even if hub does not advertise
> > > power switching. The UPS may be sitting on such port and its power co=
uld
> > > be cycled out and leave it in a stale state.
> > >
> > > I'm attaching two patches to see if they have any effect, please appl=
y
> > > and test them seperatly and let us know the results.
> > > And, as per Thorsten's advice above, run git bisection regardless.
> > >
> > > Regards,
> > > Lovekesh
