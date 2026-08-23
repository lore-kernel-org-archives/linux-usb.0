Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26EA38398E
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787480149; cv=pass; b=n0xlNwy4k8Yq+P3EOkPTxVIpHNCjNnBnKpWHIKlWvq93ax9oxaDq3L6Yk55I0DJtFCJg/eghP8VQSztirx5JhAkGNBKXDjuZghwfK1Pi3fj9athqxXVQ51dvpZEWUgECSgH0Eruij4ycqpenXMPBeYtSxLhOb/GUtx7vTM0z0Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787480149; c=relaxed/simple;
	bh=/WFGToPs7ReJSEZ0GKnj64NuWJixl2fcvs628SkhzvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=imOLk8Ywkri3Gt4AA6ooeB0/38FjeD+TSjQLzjAzsaO0ArZ7U5Z5wOFXq4kWMMOrljhEZCDllpfn0vBUvthUmbGMXfN+jefE8vvye/A62unxP3/Prq1DGr7NpT4I0o2G7uui9KaouRe6qU3AGsdzFYXrgAvDnGf6L3KKZWPnkvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDobOhdI; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDobOhdI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso23175055e9.3
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 03:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787480146; cv=none;
        d=google.com; s=arc-20260327;
        b=hjNqnoYm8HW9wanB1sxFq/9vdaLZKWIY/nTgn9L1egO3+cfmx8pemiyM/5T+Ju53jN
         8gSAn5hU90tq6badxUQhw3xNwD8ABjLDrII5OQ4BgO2wIFoBGivJ2rI8VUyX+CK9LTK3
         8xkjYSFyuBOA6Q6NXUEHE2V+L5I7ydZa/uexTgi1ZkUQ2YjSz3UGbs0AN5foXfAU5jqp
         BOAZrOQh2o2Vz0AuaVLK9rs8gt/Wgzb7/U0Qvti+T7bYBO9VGSH0PCqXkmlwESd1TJ+3
         XEHqx+FkeTF3fpDUf9qNbOCxuS1rW0g3kWzEM8FUCcjxHQ0ol/KykRu6FKiKjbU3f92o
         TAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJq5kyHwd93Xq/XFR89sWGF7bn8n9oEOuoRkGKW5cGg=;
        fh=xCCWZvu0JQeXWOUixVDnihwgdlWnUsNX9JJpMS7AUIM=;
        b=mA0bw7fWSYZGTJXkXComRJklnqUlus8vnrBInb05iB4XvR97HJHrlxXjmW7qnGyvnE
         8XolcedRaLSzr2a06qeztQqCL6k0nD9TNN2web1Q2HWrVEtQ2C0q3TfAO51kElc+8S6Z
         SKzMJyD1uknGmlyiif86j5Y2j3MPi7NtSDWEfp2JDSyT3k3/z6nsIXZa2E8IF5tJng96
         3z1Galhyx2k3jN2ncz7SNZzGal8BF7vOq4glAeLxykb1QI1iFecB9h5i5bVfnQ4kady8
         zStnvCVRfoNnxxQtVAMHg4O0lArIMV1xT89PboimgCiJFHy2Il/iNn1+XwudUPuvzFM9
         EPSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787480146; x=1788084946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJq5kyHwd93Xq/XFR89sWGF7bn8n9oEOuoRkGKW5cGg=;
        b=UDobOhdIho73+z3ZezL24czN9uGjdUrv1MdQiRL62PyGlr65scsTLBaPtU+ZhhITql
         fYzAXhrtQdtFF7BYVWsPRQY+5EXYvXkGGNL+/Uhks8TWJldoWtdm74gPIEWfNFxoT7/O
         jRSFmEVEd/UVC9KbY6B+DkVyJAlOn3M+Et6KtmMdY/ULWsK2So8Jl92I38vXW+6qqiXk
         ExUhVkuTz6QOHn5FuHafXirdADveU+re40pHFjO64PxKXYoivUqNytrrMGNzKNstRlhH
         CjW9E4e807AK2jnm0xCfSBGWIgg2/hX8GN3Q+0oGuIOhqXZOr4k3Hlmr/eptX0auujDu
         b9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787480146; x=1788084946;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJq5kyHwd93Xq/XFR89sWGF7bn8n9oEOuoRkGKW5cGg=;
        b=ivM4JnCPsx3bQXAJpoDySue5qT8YfpAKUM/0LckJY7C+yh1LArDHR/7hrbwpNFBwuG
         X80WfGftt6BzxqMa6V7F3jfqiO2RvLhB6nauPCR9ZfBuuVijPgdHFqO2S99ZSj1Cdtz2
         AKkuKHicKXs8kHn8kCqZGzIN4nlo4AnDxL4HAv8PSZUt/XLCD7WfX9rxl/tBWHikq2mM
         xcnX+jB6dE1B54k4zsB8P7Kkk85VOGUV+RthptZ5ydLR9HP+DzJ2NDXVNjhSq8OMUswN
         V2o3srI4wgLltl9TI0Bx6ZD8dGA5ZDF4UcGipLjnh696pQ1kLQLcnYX9//6XSXbecIPF
         zElg==
X-Gm-Message-State: AFuF++mGmQ2EXS8d3fucRpqe/Fim0cUE8Y5ZfS3ppM9b6Aqg+m6ZJEHw
	Ldyybe4wJCjPKHQoSpKfbre1fxJAL3n32nXVPq9DWzHdFG/gbfXerZZX0YjLBpvMDBjmCnXVqeG
	+xP8dVep0avMi7Vc//HDrqBF07O2hd1VEdRxr
X-Gm-Gg: AR+sD12Fe+L1Um491MI/ioy11X1WbkgiaUyLenQ4NXoprZn0BD1Dpng3MBhJeH4qRl5
	s22PxVCcC8OO+Pso1Rye4GfaOUz1ciEZvALuBlQlrGG5VCiskfgGD8pJtcKwZ7gLck3CO12dJuu
	Y8YxwmXMOKuIAcEYURbSnOgxu/cuseJq7Mx/aVdS1TIyRnHxSmGizXMh4GhHUzCAprRX+iPrEun
	mbW6e8Pj3AZ2+cBBNjIk6/sS6RBVFG8RE4F2z81UcBwjYu4o/Y6Y1gnvfdKgBFeblkqL4io5nGI
	dzpjd+BGviwfLtStQec+8ruoaRv2m27aMrAsMemkuFrXh/VbCBceVYwjFByYBSubtMGWzTIGlzx
	9
X-Received: by 2002:a05:600c:3b08:b0:499:b402:6c0 with SMTP id
 5b1f17b1804b1-499b830d671mt189448145e9.3.1787480145826; Sun, 23 Aug 2026
 03:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
In-Reply-To: <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Sun, 23 Aug 2026 12:15:34 +0200
X-Gm-Features: AcwNN1V1oG2cu4NWfRebpU30ZtTx3WE-Q-hBzvM3B7iY1NVjSwXXyCs_7TzDQfQ
Message-ID: <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
Subject: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work triggers >
 uncorrected MCE / data fabric sync flood on Threadripper 7970X > (bisected to aec11e5f9c45)
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 12:12=E2=80=AFPM Mathieu Fluhr <mathieu.fluhr@gmail=
.com> wrote:
>
> [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work triggers
> uncorrected MCE / data fabric sync flood on Threadripper 7970X
> (bisected to aec11e5f9c45)
>
> .... this time with the correct subject too.
> (apologies for that stupid mistake)
>
> On Sun, Aug 23, 2026 at 11:55=E2=80=AFAM Mathieu Fluhr <mathieu.fluhr@gma=
il.com> wrote:
> >
> > Hi all,
> >
> > I'm reporting a regression that causes a hard platform reset on my work=
station,
> > But, before digging into the technical details, I would like to first r=
e-trace
> > how I came to this particular commit.
> >
> > As an AOSP developer I am compiling daily different versions of AOSP on=
 it,
> > mostly building an Android (Automotive) emulator for quick "code-build-=
test"
> > runs. I use Ubuntu 24.04 LTS for that, updating to the latest HWE kerne=
ls that
> > Ubuntu provide there (6.8, 6.11, 6.14 etc. until 7.0 recently), with no=
 manual
> > modifications applied.
> >
> > 3 weeks ago, I needed to analyze and issue happening inside Android 11,
> > building an emulator for a simple Android phone [1]. But when I started=
 using
> > this emulator, first with the latest 7.0 kernel I noticed several hard =
crashes,
> > sometimes just freezing my workstation (with fans full on, but sometime=
s fans
> > full off), but also sometimes automatically rebooting it.
> >
> > After a few days of deep investigations (To be honest, I first suspecte=
d an
> > issue with the nivida driver), I found out that a pattern to reproduce =
this
> > quickly was to let the computer idle with the emulator running. The cra=
sh was
> > always occurring under 20/25 minutes, most of the time letting it idle =
for less
> > than 10 was even sufficient.
> >
> > This made me a bit curious, and looking a bit deeper (and with a little=
 help
> > of AI) I was able to find a workaround. forbidding my CPU to enter C2 s=
tate,
> > using "processor.max_cstate=3D1" argument. Using this, I was not able t=
o
> > reproduce the crash for more than an hour, but I did not pursue there v=
ery
> > much: As a developer I hate workarounds :)
> >
> > I instead started to get "back in time" on a clean and up-to-date fresh=
 Ubuntu
> > 24.04 install, reverting back to "good old" kernel versions, since I co=
uld not
> > convince myself that first my CPU was dying and second that the issue h=
as always
> > been there. I confirmed that 6.8 and 6.11 (again Ubuntu HWE packages) w=
ork
> > fine, but the crash was reproducible using 6.14 and above.
> >
> > I then got my hands dirty, and started to test different mainline kerne=
l
> > prebuilt packages up to a point where I confirmed that 6.12.35 worked f=
ine, but
> > 6.12.40 not. I then bisected both versions, ensuring a good case meant =
the
> > emulator was idling without any crash for 1 hour minimum. This lead at =
the end
> > to the following commit:
> >
> >   aec11e5f9c452ef64e2c113637ab89a67a5ceb62
> >   ("usb: hub: fix detection of high tier USB3 devices behind suspended =
hubs")
> >   [mainline: 8f5b7e2bec1c36578fdaa74a6951833541103e27]
> >
> > Being quite astonished that something related to C2 state was triggered=
 by an
> > USB patch, I then tested the latest 7.0 kernel, this time using the
> > "usbcore.autosuspend=3D-1" argument instead. To my surprise, I could no=
t
> > reproduce the crash, even with the exact same emulator idling for 2 hou=
rs.
> >
> > Also, something very astonishing, that I still cannot fully understand =
today:
> >  1. "priming" my system with a 30 seconds (!) run of a modern Android
> >      emulator [2] cleared the issue: After closing the 15 emulator and =
starting
> >      the 11, I could let it idle for again more than an hour. It seems =
even not
> >      be related to the 'kvm' kernel modules, since removing the module =
and
> >      re-inserting it between both emulator did not change a thing.
> >  2. A few times (I did not really invest debugging this TBH), the crash=
 even
> >     occurred shortly (2-3 minutes) after I closed the Android 11 emulat=
or.
> >
> > Now, the technical details of my setup...
> >
> > Hardware / software
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > CPU:        AMD Ryzen Threadripper 7970X (Storm Peak, family 19h)
> > Microcode:  0x0a10810c
> > Board:      ASUS Pro WS TRX50-SAGE WIFI, BIOS 1203 and 1317 (both affec=
ted)
> > Memory:     128 GB DDR5 ECC RDIMM @ 4800 MT/s (JEDEC, no XMP/EXPO)
> > GPU:        NVIDIA RTX 3080 Ti (also reproduced with RTX 5080)
> > Distro:     Ubuntu 24.04 and 26.04 with 595-open NVIDIA driver
> > USB:        8 onboard xHCI controllers; only a USB keyboard and mouse
> >             attached
> >
> > Error signature
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > On the boot following each crash I could always see the following lines=
 in
> > the dmesg logs:
> > ---8<------------------------------------------------------------------=
-------
> >   x86/amd: Previous system reset reason [0x88000800]: an uncorrected
> >            error caused a data fabric sync flood event
> >   x86/amd: Previous system reset reason [0x88000800]: a software sync
> >            flood event occurred
> > ---8<------------------------------------------------------------------=
-------
> >
> > When I was fortunate enough and had an automatic reboot, this was also =
inside:
> > ---8<------------------------------------------------------------------=
-------
> >   [Hardware Error]: event severity: fatal
> >   [Hardware Error]:   section_type: IA32/X64 processor error
> >   [Hardware Error]:    Error Structure Type: cache error
> >   [Hardware Error]:    Check Information: 0x000000000602001f
> >   [Hardware Error]:     Transaction Type: 2, Generic
> >   [Hardware Error]:     Level: 0
> >   [Hardware Error]:     Processor Context Corrupt: true
> >   [Hardware Error]:     Uncorrected: true
> >   mce: [Hardware Error]: CPU 34: Machine Check: 0 Bank 5: aea0000000000=
108
> >   mce: [Hardware Error]: TSC 0 ADDR 1ffffff98e8ee38 MISC d0150fff000000=
00
> >        SYND 4d000000 IPID 500b020049b00
> > ---8<------------------------------------------------------------------=
-------
> >
> > The signature is bit-identical across every occurrence except for the
> > reporting CPU, which varies (observed on CPUs 1, 3, 7, 16, 32, 34, 35).
> >
> >
> > Reproducer
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > 1. Boot an affected kernel with default idle settings (C2 available,
> >    no max_cstate restriction).
> > 2. Start an old and/or 32/64-bit Android emulator (QEMU/KVM guest) and =
leave it
> >    idle on the launcher screen. Nothing else running.
> > 3. System hard-resets within 20 minutes.
> >
> > Under sustained CPU load the fault never occurs; it requires the system=
 to be
> > idle. turbostat confirms ~99% C2 residency across all cores in the cras=
hing
> > condition.
> >
> >
> > Bisection
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > ---8<------------------------------------------------------------------=
-------
> > git bisect start
> > # status: waiting for both good and bad commits
> > # good: [783cd2c3dca8b6c434e955b84c20c8940588dc68] Linux 6.12.35
> > git bisect good 783cd2c3dca8b6c434e955b84c20c8940588dc68
> > # status: waiting for bad commit, 1 good commit known
> > # bad: [d90ecb2b1308b3e362ec4c21ff7cf0a051b445df] Linux 6.12.40
> > git bisect bad d90ecb2b1308b3e362ec4c21ff7cf0a051b445df
> > # good: [3ce57d493dd81ecc27033c7a918cc0d0ddaa8edc] ata: libata-acpi:
> > Do not assume 40 wire cable if no devices are enabled
> > git bisect good 3ce57d493dd81ecc27033c7a918cc0d0ddaa8edc
> > # good: [bbd385b65f9e56cab1243e753510a99a59110083] net/mlx5e: Add new
> > prio for promiscuous mode
> > git bisect good bbd385b65f9e56cab1243e753510a99a59110083
> > # good: [2a76bc2b24ed889a689fb1c9015307bf16aafb5b] smb: client: fix
> > use-after-free in crypt_message when using async crypto
> > git bisect good 2a76bc2b24ed889a689fb1c9015307bf16aafb5b
> > # good: [95a13b0a6b042ac5333b67f59af1dffe7b71137b] riscv:
> > traps_misaligned: properly sign extend value in misaligned load
> > handler
> > git bisect good 95a13b0a6b042ac5333b67f59af1dffe7b71137b
> > # good: [40b5b4ba8ed87c0bfb6268c10589777652ebde4c] drm/mediatek: Add
> > wait_event_timeout when disabling plane
> > git bisect good 40b5b4ba8ed87c0bfb6268c10589777652ebde4c
> > # bad: [affb46db59f908474a211f23953c3b9109f0d647] net: libwx: fix
> > multicast packets received count
> > git bisect bad affb46db59f908474a211f23953c3b9109f0d647
> > # good: [ee56da95f8962b86fec4ef93f866e64c8d025a58] btrfs: fix block
> > group refcount race in btrfs_create_pending_block_groups()
> > git bisect good ee56da95f8962b86fec4ef93f866e64c8d025a58
> > # bad: [bf71baa3cfe754c6e99ad62711b9fb3e3da33517] usb: hub: Fix
> > flushing of delayed work used for post resume purposes
> > git bisect bad bf71baa3cfe754c6e99ad62711b9fb3e3da33517
> > # bad: [e11359640090ab26e4153cce583f50e0b8979f0d] usb: hub: Fix
> > flushing and scheduling of delayed work that tunes runtime pm
> > git bisect bad e11359640090ab26e4153cce583f50e0b8979f0d
> > # bad: [aec11e5f9c452ef64e2c113637ab89a67a5ceb62] usb: hub: fix
> > detection of high tier USB3 devices behind suspended hubs
> > git bisect bad aec11e5f9c452ef64e2c113637ab89a67a5ceb62
> > # first bad commit: [aec11e5f9c452ef64e2c113637ab89a67a5ceb62] usb:
> > hub: fix detection of high tier USB3 devices behind suspended hubs
> > ---8<------------------------------------------------------------------=
-------
> >
> > (Please note that I did not perform a full "revert test", since the aec=
11e5f9c45
> > commit could not be cleanly reverted on both 6.12.40 and 7.0.0)
> >
> >
> > Workarounds
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Either of these prevents the crash on an affected kernel:
> >   usbcore.autosuspend=3D-1     (disables USB runtime PM)
> >   processor.max_cstate=3D1     (prevents C2 entry)
> >
> >
> > Ruled out
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - GPU/driver: reproduced with RTX 5080 (595-open module) and RTX 3080 T=
i
> >               (both 595-open and 595 proprietary modules)
> > - ASUS USB4 PCIe add-in card: reproduces in ~5 min with the card physic=
ally
> >                               removed
> > - AVIC: kvm_amd avic=3DN on both good and bad kernels
> > - TSA mitigation: tsa=3Doff verified applied
> >   (/sys/devices/system/cpu/vulnerabilities/tsa =3D "Vulnerable"), still=
 crashes
> > - Memory: stock JEDEC 4800, no XMP/EXPO, no ECC errors logged
> >   (ras-mc-ctl reports zero CE/UE)
> > - Thermal/power: ~47-50 C at time of crash, system idle; 1600W Seasonic=
 PSU
> > - Hardware health: multi-hour AOSP compiles (all 64 threads, heavy cach=
e
> >   load) and repeated GPU stress runs complete without error
> >
> >
> > I hope this gives you enough details to start looking at what could cau=
se this
> > weird behavior. Just FYI, when asked about hardware damage, AI suggeste=
d more
> > something like "a CPU-level microcode erratum in the deep-idle path on =
this
> > platform", but being old-school, I tend to always triple-check what AI =
tells
> > before claiming it myself :)
> >
> > Thanks and Kind Regards,
> > Mathieu
> >
> > ------
> > [1] using android-11.0.0_r46 release tag and "sdk_phone_x86_64" as lunc=
h target
> > [3] using android-15.0.0_r32 release tag and "sdk_phone64_x86_64" as lu=
nch
> >     target this time, since Google only releases 64-bit only today
