Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778D30E0D6
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785974918; cv=pass; b=E04Vn5wZQOMhgGTg0QEhyouO0Jgp3TfSYuw6Vr/gpD2ZUETMfAJ//RLavurh9ryX3/mRdM3HKCreoGxlU7Yw4hNXxynQ08hp8QmKwLbu09fagVmBpFvwUEVd9FgTiw2g1H+9otEV4KGssvsWi2HNU8+9u8sG+br9tf/hBLH1vpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785974918; c=relaxed/simple;
	bh=1iu5d+I5/K4BVPrMkCaJZCHy0u+IaD5kCta9cXPqI9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBQXyBj7bIGxRSouGyw150nSf8/AkhuEnva3aVlNmxzgDBQuAj4R8+IkUUHU6PFRdzKpTvw2e4EvvMdYO14nQ+jkDi4S/9qJ3AWf/6YOg6M62qELvvl/hVlPjd3xgBlrLK34uKOPJ8RWzQ9At4jCgCmdoaE11+1NEdbSFnbxwh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svtDcUcn; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svtDcUcn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1909668a91.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 17:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785974912; cv=none;
        d=google.com; s=arc-20260327;
        b=WGxdBAwB3fg3q4/5rH6dHk8273qQnTkBY0IC3JlLl7eXZLV5LR3TaZ6CudfJUO8jKy
         rdJKfTgz9FmTb4wCIDaK8IrUlNPcdUVIrXkSTvhpxCsAxGhQj6+UNYDdmnSEoLKHt1bS
         IV1A++3WvzaY3pHzu5MC0FRyNYdBaMnos327Yoan1xaC1o0IAmV2Mi3ak5p8p32JrxAk
         FfLiEWh2T1v/4azhJ4c3VyqDUpvV3TsQGjj7YeCBGHexX1KXbKccgXUERIfnduPSMSec
         RF8IhAv+aORNxIqqQZ7EtLufjrJLOKh9d70smjlF3pxLsLPsOZmjVb/KquuVFn4W6Air
         L/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5vW05tTD3g3Q72ERS87XMCcMXQMeuaxyt2ovrslKYZ4=;
        fh=yO1UMIfX3Vs1Mnt7O6wRJv913geuM23r8YeTxY8gYPk=;
        b=VHHuYfrVur0lMtxRP5i8saGmW7ZWxRmVajwWJ+mpINhsvwHyv/Levrj99+Gw713YJZ
         xVQ2g4YQhdm1AUT67irRflf59jI1m7Sr4BIigyAvEvMFFkxbhk2vCaXQ/V5EQfD61suq
         SG5HAE+j/CMmVN6ZxK+VK0j1GvHfGpUuHDBcqCuQ9EuHgoWnHj3HlFjRtxfBLzkYf54f
         TJMzl1z1AI3/LVPe5M8oJmjir+Soa7dIBdpTG3HQBUnDUgB4jIycn0y0aW+aiJuA+Vtq
         KHXj9KzgajHwsMwj/pfMBekclbmBhbgFHnK0aAbJvaSGjAdW36e3EQspFo34PdSR8dg7
         Lr3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785974912; x=1786579712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vW05tTD3g3Q72ERS87XMCcMXQMeuaxyt2ovrslKYZ4=;
        b=svtDcUcnrW6iP4cDqc+Pp2KlIvFKw7TVFMRP7v0NtQxQPK9+pfi+iK/wLtvXEaSCVa
         dtD79TNKXy1xzGfBz8PWj6i9vcZ72ABzuVpLQHFfPC4YmXdasdL2BfW8XcFfauqAJrUW
         FN9korxrdzDXJHZaDvzgZ3hzNkZMorVj+WqU/9p+HDeW9pc0xGwLdVhm7kjPW+TFjw/i
         SanzT6jUSgD9ujBKt0ALo+ei/1T+YJEr7GT5zQ1rIbjsXBPxAoOUaSuLlgEmJcvEFg9f
         xd3YR2+0NDdzkAuOh+A1Fb3AEbiXtvB7pwA8KJ4mn5a7l8WjNudl9+3eoo7s2nSRMEal
         Svig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785974912; x=1786579712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vW05tTD3g3Q72ERS87XMCcMXQMeuaxyt2ovrslKYZ4=;
        b=Rqc/RJlbA/JQX0OoJ3iu5MqbKn+9mnekKo4BrlZACNKh9ZJAY6mnsNJQgjQ+CofKtg
         r+EPdIbMkcFBPRO5aCd28cT6wFt4gc15FNi485DuRzPmqZvJUahIrB7jFyL425LHBCSG
         e2u2dWuFhtDQwfxadEkwiNw6VSKv5cc8SAWh4ZnV+jIMf10Jyzy4PvV1sSdrOrBuDUfN
         mESE+tmuxFqwXX1bI4IL3c+syAp0YKCfSwWI8iVSm+Wd0BidEr3lFWCr/rJLYsGj9Tly
         FbMQDIESzyeo9koB1vPziPbq7lkniCr4oY9cufg3AENdbvQS7ztWV6dNznpQwOGOYuax
         9ZYw==
X-Forwarded-Encrypted: i=1; AHgh+RoptZ/SRNq1raFEVLzw6vzDNf1QYI48ez6ngrWO8DCH8dtRPojA7Ip0Ywk2BWobLLmuIqOkvwurH9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/pOhrTEgath60nyup+SuZ1TNx6NLfEdviX13xNCn+hh3l6o+
	kwhFOjpHgZcFfc+eM/MBzgeph7CmIikn1l0mC570g+zxJsX1H+PHopfxP2bffxS0KhgAD83mqGm
	B4oLXzCq75222uFTD5/Yt7Ws3DjhZzFLDl7wQ
X-Gm-Gg: AR+sD11v3vVO4jJdC3PZNJFbOcU05oH1rvEnM3P7yV+hOEy5NKc3UlBO0MZHLNnx3w4
	bWGr+TUrqPWxEHE+N33dzanNGsR8440VCO3PZ4vtBi4r2TQyGJJL+N/Rjr+G9c25G8zn4gDFnH6
	KY1QU4nt0m5cSbfnWIuJOFNciZlO5AeVpfihbcdZxMbUjYhwvB4rmgrMLXwVqDcGlUo6Z9TeYeg
	IMqq1/W+n279dBljP/GGo1kqQBscfQj08i75zO+jaUG27fxJRoN8CLuF6thHwrjeoxoSeLqHmXq
	BuYOCIpwt077K1Mo8adqtHAa+66WR136xIjmITg6zAAsPlgief4XJG+x+gs8eeF4kYH0FP1UfzI
	6anGaOlAPtVFyR1Qed06AWU+Gasf6v9RSQwjaz9iyo9gFPJvBiDapIkMIFjI=
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-3903c5b9f70mr9408859a91.13.1785974911569; Wed, 05 Aug 2026
 17:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
 <anIhyHL4Kl-DX2G_@eggarch> <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
In-Reply-To: <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Wed, 5 Aug 2026 20:08:19 -0400
X-Gm-Features: AUfX_mzWccQa-XGJ0eOY4WMfNWGqgAW-Qd5A9IgdUUwdNC3nZgowQzhwzISJkns
Message-ID: <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks again for all of the suggestions. I wanted to provide an update
after spending some more time testing.

At this point I'm no longer convinced this is simply a kernel regression.

I've now tested the UPS across multiple kernel generations, including:

- 6.0.x

- 6.18.40

- 7.0.2-6

- 7.0.14-8

- 7.2.x

The behavior varies somewhat between versions=E2=80=947.0.2-6 gets the
farthest=E2=80=94but none of them provide stable long-term communication wi=
th
the UPS.

On 7.0.2-6, the driver successfully:

- Claims interface 0

- Reads the HID report descriptor

- Detects the UPS correctly as a CyberPower LE1000DG (VID:PID 0764:0501)

- Retrieves battery charge, runtime, voltage, load, and other values

- Completes several successful polling/update cycles

Eventually communication stops. At that point the running driver
repeatedly logs:

    libusb1: Could not open any HID devices: insufficient permissions
on everything

and upsd reports:

    Data for UPS [ups] is stale - check driver

One thing I find particularly interesting is that the UPS never
disappears from the USB bus. Even after communication becomes stale it
is still present in lsusb:

    Bus 001 Device 007: ID 0764:0501 Cyber Power System LE1000DG

There are also no USB disconnects, resets, xHCI errors, or other
kernel USB errors after the device has initialized.

What makes this especially confusing is that this does not appear to
be a normal permissions problem. The driver clearly has permission to
open the device initially=E2=80=94it successfully claims the interface, rea=
ds
the HID report descriptor, and communicates with the UPS for several
polling cycles before failing. Once it enters this state, however, it
repeatedly reports "insufficient permissions on everything" until the
driver is restarted.

Since I can reproduce essentially the same failure across 6.0, 6.18,
7.0, and 7.2 kernels, I'm beginning to think the kernel version only
affects how long the driver remains functional, rather than being the
underlying cause.

Over the next few days I plan to test the UPS using a dedicated PCIe
USB controller based on an ASMedia chipset to determine whether the
behavior is specific to the Intel xHCI controller. I'll report those
results back to the list once I've completed that testing.

Has anyone seen this pattern before, where usbhid-ups initializes
successfully, polls normally for a short period, then loses
communication and repeatedly reports:

    libusb1: Could not open any HID devices: insufficient permissions
on everything

while the USB device itself remains present and enumerated?

Thanks again for everyone's time and suggestions. I'll follow up once
I've completed the additional USB controller testing.

On Tue, Aug 4, 2026 at 8:01=E2=80=AFPM Jamie Stephens <jamie.stephens@gmail=
.com> wrote:
>
> Hi Lovekesh,
>
> I have now tested 02-resume-reset.patch separately on Linux 7.1.5 with
> the CyberPower device 0764:0501.
>
> The patched kernel was active:
>
>   7.1.5-ups-reset-resume
>
> The device was detected by lsusb, but USB initialization still failed:
>
>   usb 1-3: new full-speed USB device number 4 using xhci_hcd
>   usb 1-3: New USB device found, idVendor=3D0764, idProduct=3D0501
>   usb 1-3: New USB device strings: Mfr=3D3, Product=3D1, SerialNumber=3D2
>   usb 1-3: can't set config #1, error -71
>
> The UPS therefore never attached to hid-generic and NUT could not use it.
>
> I then returned the same USB cable and UPS to the PiAware NUT server,
> where it immediately resumed working normally:
>
>   ups.status: OL
>   battery.charge: 100
>   input.voltage: 122.0
>   output.voltage: 122.0
>   ups.load: 23
>   driver.version.data: CyberPower HID 0.8
>
> Results so far:
>
>   01-no-lpm.patch: did not resolve the regression
>   02-resume-reset.patch: did not resolve the regression
>
> I will proceed with the requested git bisection unless you would like
> any additional targeted logs or tests first.
>
> Regards,
> Jamie Stephens
>
> On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM Lovekesh Solanki
> <lovekeshsolanki00@gmail.com> wrote:
> >
> > Thanks for the report,
> >
> > On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> > > sudo lsusb -v -d 0764:0501
> > >
> > > reports:
> > >
> > > wDescriptorLength     504
> > >
> > > Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> > >
> > > cannot read device status, Resource temporarily unavailable (11)
> > >
> > > As a result, usbhid-ups is unable to reliably communicate with the
> > > device and NUT cannot reliably monitor UPS status.
> > The lsusb failure and NUT seem to be seperate, lsusb failure could
> > simply be device property.
> >
> > Few possibilities I can think of worth testing:
> > 1) It may be related to LPM, the device may be advertising this but may
> > not be handling it properly.
> > 2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired ports =
to power off)
> > lets acpi managed ports be powered off even if hub does not advertise
> > power switching. The UPS may be sitting on such port and its power coul=
d
> > be cycled out and leave it in a stale state.
> >
> > I'm attaching two patches to see if they have any effect, please apply
> > and test them seperatly and let us know the results.
> > And, as per Thorsten's advice above, run git bisection regardless.
> >
> > Regards,
> > Lovekesh
