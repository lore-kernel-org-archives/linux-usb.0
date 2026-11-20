Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179167;
	b=twSaue2XeyvKfrtkwqasD0Tprot/bFKNjUF7Wpra36ZOFDyVeC/ZRTuZMS4Q5sRd7vTY
	 pQMJFNgc/l2FCbNaJRo5pRSwJkSarJqvlCjCpod3KMT7355odR3Kx/EzlMwxD486pNrbL
	 i+NR4LWCbKa0Oy6xJ8es73KsDs3InpW2NQXybSex1+ClQlWC6HdvVIxBVwuiG9LpksYQe
	 7yDP762GRmxU9o2MdaNqW3NVep3MJ6Db7ELayGOhVeJjwROoG5IxJZmzMd0vUeOhScx2g
	 6eFUFzeqp1lH6cMTLreNcl47uTZDzSSnkEoprNbiR33eTosQFMojo+dTCpO4Mluri7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179167;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YTa99/gQDpgz73/BKE8NpgRyese8EPLHJ7fjfDiIXEQ=;
	b=pGosYH/AJISCpYnGUVtif/lXSjag9SUknigqcoZ/UehkdKWHkOKeS9//NsM9O+S7JIpA
	 AnIEZMxRkBC7Hs+rzNVUL+lllStajyNwL/V3Xe6whNGnCO8Z6pH6bMe/svJQeogw5JLAi
	 UGWLfeehtPpB5nLR+q4gJoHj4/eVpv7ZZQlLx2NomowXBYGllLEsonsseqoEOrVEHsTQL
	 pyYVljp42qWsg3TqwEFtsDIkxk8LNn7mM3Uo1IU6W6o1EqbECviCBFI5/3Bi1y4pgem0m
	 QdbEwdA5t7+OrVXBtcq7ge4mM8DVaRsHUEwTb0p09Mc9KrT0f9Uqew+nGpWYN39N7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEDEMp22;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B7606A32A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEDEMp22
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96BC1F000F0
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795179166;
	bh=YTa99/gQDpgz73/BKE8NpgRyese8EPLHJ7fjfDiIXEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AEDEMp22Gu+k0c/UKkXbC6nZTZP9xlNJF5eAMpFc7UO3N5PXkYJzzAFlDCCAdr3Dr
	 curY0fehQWgiI1SJtwxycfQTLDisLPAsZASMKddezyS1gTPpv1Ufvv5QASDrU7Csf0
	 5GD7r1LJES1bJns64Ivg/okbsEyHjeBjbuI9q0gpib+pDiu/OpjFBYkb+ilxTY2esG
	 3WCWBV8sLUij03xyLBsPodU6EFs5grDXRvL9rX6g42EuuqRvh1aP9gz+YJr/68iV1H
	 EHXIN5ExCon9ApnVfDwCDDxc2qLp2sTEndnfKT/OoIs45NIImDlRtBl0IEX/QDM255
	 C2CiMexmilgpw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adff684a52so6879581fa.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 04:52:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEalbTTunDQq8/vV3kt8wQ0Vc8bKbGmXcdPP7zuDfQ1zn90s2E8opC2awMm8auNt8cBOeW9GK9Ui64=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gnw4UPvnbYElX676gQmeOcX3XPY8UIkW+vm6qrl4dVRrZdhAN
	0FbRI+Ik0YUOxvr7lO5dxZwRvjtOry1cJ6ghZ0pO4VsI7xZ2wsWJodaqdYWnhBalYwYELfOHfg/
	HbQkyKoDjlF/j0SAtB5lpqaSV3pjyuYo=
X-Received: by 2002:a05:651c:54e:b0:3ae:6ed3:a9b7 with SMTP id
 38308e7fff4ca-3ae7b7fc14dmr11474761fa.22.1795179165255; Fri, 20 Nov 2026
 04:52:45 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <3471545.44csPzL39Z@rafael.j.wysocki> <CAJZ5v0gB+ktRht4j8SjSTo-mqmsRR+e5m1sfc6j5gnGop6=BJg@mail.gmail.com>
In-Reply-To: <CAJZ5v0gB+ktRht4j8SjSTo-mqmsRR+e5m1sfc6j5gnGop6=BJg@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 13:52:32 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hUzQ7+NEi8DAgCy=Fx-i+a77Cc2Q_U2zwt=wVqrxcc7w@mail.gmail.com>
X-Gm-Features: Aa3M54p6ev89u-Dya_X8LkTxv_6m4WAMWGfQWDQnspC5qiUwdt1yYxqWfIzI8SA
Message-ID: <CAJZ5v0hUzQ7+NEi8DAgCy=Fx-i+a77Cc2Q_U2zwt=wVqrxcc7w@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] ACPI: glue: Rework ACPI companion lookup related
 to device type
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 5:27=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Wed, Nov 4, 2026 at 10:12=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > Hi All,
> >
> > The ACPI "glue" code is responsible for binding Linux devices (like pla=
tform
> > devices for one example) to their ACPI companions (represented by struc=
t
> > acpi_device objects).  This is done by acpi_device_notify() when the gi=
ven
> > device is registered.
> >
> > If the device's ACPI companion is set already at that point, the bindin=
g
> > simply adds the device to the list of "physical nodes" associated with =
its
> > ACPI companion.  That's the case for PCI devices and platform devices, =
for
> > example.  However, there are cases in which the ACPI companion is not s=
et
> > upfront and it needs to be looked up via "lookup helpers" registered by
> > the subsystems the devices in question belong to.  This series changes
> > the "lookup helpers" representation and handling.
> >
> > Before the changes, the "lookup helpers" are represented by struct
> > acpi_bus_type objects which is doubly confusing because they have nothi=
ng
> > to do with bus types and because the "acpi_bus_type" name is also used
> > elsewhere.  Patch [1/3] renames struct acpi_bus_type to struct acpi_dev=
_type
> > because all of the existing "lookup helpers" operate on device types.
> >
> > Next, the registration and unregistration functions for "lookup helpers=
"
> > are defined to return an int, but all of their existing users effective=
ly
> > discard their return values (they are discarded right away or passed up=
 the
> > call chain and then discarded).  Patch [2/3] changes the return type of
> > those functions to void.
> >
> > Finally, since all of the existing "lookup helpers" match dev->type to
> > a certain device type, they can be rearranged to point to the device
> > types in question and provide a .find_companion() callback, and an
> > additional .setup() callback in one case.  This is done by patch [3/3]
> > and allows all of the affected code to be simplified quite a bit.
>
> In the absence of any feedback I will assume no objections or concerns
> and I'll queue up this lot for 7.5.

And so applied.

Thanks!
