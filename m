Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E6595739
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660936; cv=pass; b=la2WV+ydLEgJugLRGFR8uUMOdGdY5FHI1DrzTVL3sBLyyQqST3ft4gajaA6WlHqErA6MWjKooxXwvJGjkJF8LtgAr7f5YkY6CUt+Gybo5q5pAx4GQvgMwf4JUjlJmWwEF89MBixjGy6JYVStKq8RaMb1u0E3gqUpLP7E6GWdXtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660936; c=relaxed/simple;
	bh=i4K+5KhGBGJWLxBIyIr7wJw9x6n50uvQZnOpxd2u9YY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ju5ZJRnyw+25G4s4G7Zb7m+98ep6Zp3Ufar/JJ3FqCF7giIFgtKedkMZjYlrJF1hxNhrC+wiDMbARG5mZdozA3RCE6zqoJiztyngEtC+I7fTxCdt/uF+S0KvenMkHpwHDq+M7knpe0UB87yo75NTP6r8FPZuhKb419kdOjzmyUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WI/iH9eR; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WI/iH9eR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39da614ab21so143225a91.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 09:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789660933; cv=none;
        d=google.com; s=arc-20260327;
        b=K5uhsmeGbT99AmBJnOnFPYNEwA2qVLoiF0iPy8r7AijKGpbOMWQ8adkgqYwsf9Sw4I
         CUN070OwshNKcbjVb6KVBPn6Uti3+g4JOKAjBxA05m+ej0uwRipGrWCA99VnlgGQaOuH
         97mZqUOlSmjWdaX7HMIIt23fer5MzkuSwMOcv4kgbzmXZLep/HK8WCkE62EfWu7TeDOR
         pN+vv1bGvQ/9J+ZVT6JOONAWolJdrUB8eAwNh9PIxYHVmL7gMwRz4GLmECioLLduhS4a
         h511ZEf0RcBvk8PXMocE7j4DAQzEcm4l8W25bCjH9PuEgv655lY0ibs/SOzrNY+If2uW
         A2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5op0DI6glq/fYPn+RYqD1t4s04bhJa1IYdAG6JQXKT4=;
        fh=BMqoJBOPb2LCTbbKSaNO28Kf830zE994tQjdmiDQacA=;
        b=GKabMS925xoj+p0HCBYGL/8gLRCG5POCC10kwLg9enrNAWJKr04cVrfXQz8HZPxPWM
         bkWcVZ6545t2jyB0KhQRNqr2EPQNN8yFfNqFbn1KBYSEvV9n/Yg1HUMt9xjUSmhjyap4
         /m8jywelSxYxN2oXr2HmyEhsvjxjEBwRT2Sj+z3VU4jnqcest3jCf4o3se7vvzsh6kGj
         viOv4TlFYGQTPvFa5E1/baoQyY4ZBF3VdKGyI8KUbu7oXhSsG91BJVqfVsYVeXHXBON3
         cXzGHuLzB3dA9YVdxpRodOs/ugmjLYIXauBj9JdZHLmBUps9OCCoU6/2GVZk12RfRJgt
         mS8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789660933; x=1790265733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5op0DI6glq/fYPn+RYqD1t4s04bhJa1IYdAG6JQXKT4=;
        b=WI/iH9eRc3nS7qk7dwV/WyeQYLZPyo4gH2Vpb7N9eEafSxm6P9O0Tfsq+NxhyPpn5r
         KyCw9WKvCeOhKgkbYmfc/h+8pvz9RRbF/Lchd+ZPfs7ICzpJt9SKPIN6BWf0IHZIKzFT
         kq4YSk8DQyduuYw6fwFd8xkrKyswCjFYkgsx99T8av7D78x5Ai6QB48XrML+Ypywy/zW
         9EyhWAQsAOFp2TcmBMIh8ZXjo748TrBQb8lPVfVV5w6E8V4nV3b09hadl1MBkci7Gy9h
         g8AqfzLUFjb0tZgoMizof3RMaJioHz/qDF/GkugW91dWY6M+3EucH9JWJ2Jf22+lvOeg
         ytPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660933; x=1790265733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5op0DI6glq/fYPn+RYqD1t4s04bhJa1IYdAG6JQXKT4=;
        b=aOZuzUSaGRRY7sQ7yt4WxHl8j/obr//0UTbD7UljXYSNHnSI3DUj8gNOi7cX1h/b82
         i0NonSwdWkv/ayHJacoYiahsNgQAegOiZ4Q7rrfSr9z30ihW/VX8t4GAVd0f+5NEP34V
         /Q4QnLPIh7cS2XwPj+LHAhJvtQTLgpn4LktuEL6Y+tifDHnX3n4GlBrFZxecmsWljERm
         GhVdDQEbCDU2VI6fwBYVA5UNO3HmbJttRicKY0eBJilGNIQSmZc+tyIBUBpjCIDa8yrv
         17PWELjtwoZTF3+99D4wG7Slk3fwN3fl6LF0IkJZqTygp1NRAXG2FPD6E9K8n6dFnOxc
         drrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfaKePshXjMuLtnNHuFJYNk6H9ERfWwLNcRR6SnduOl4iWyDLeSzhiPipkl3clhN7l6lWwy99eaD8=@vger.kernel.org
X-Gm-Message-State: AFuF++n447NTypl8fXpDhskQuBE2eUKUiJXdFRYy/U7GXS8lve0hn2LP
	niMhBAUiPBiU5E+tigXJ1zF9V2TLGfD0/HBXQEkJSoeHTiQGE+BGM4LXlwSzVMC6Zlu2VvdqjWz
	Ats6HJsOmUuf7JHvHeDQcg2oBnNAg0g0=
X-Gm-Gg: AYBFou3NQJJadkyWL5LB2K94bpjYAm40cJsQA4lFSiNBxbKuFxFyUHsrDgHkUrpXW/J
	i/KgbJRMa+zmbtuz0hWaEsesVKwpqcZxGj3XIv1G8jxUW0V0OUarpiAE3FK4WhU2UVpDouPwLcR
	+Hq8zwogg3zPoSD2pZ1j5xgVJLArquVOC+SHdC072LNIRc/xGT7UdFA/Pw0AnzSUlKbh9YTsZJR
	Op3d0IZJz6scmV/yHa0cel8w3XJ7TbEw6wucGeBN2PAk2nL2ITNiv4zSe51ALLvIs5tHOjni7Qs
	e+rOiirUoi9hGOJPCLs4WjLeZpRL+r1efIzB3D7wM791rQlT1cJ5TRf5isjFVxnIicMf
X-Received: by 2002:a17:90a:281:b0:39e:2f57:67c0 with SMTP id
 98e67ed59e1d1-39e2f58489bmr5447407a91.0.1789660933213; Thu, 17 Sep 2026
 09:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
 <c335085d-a824-4632-ad3a-c06715258c81@suse.com> <CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
 <1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org> <CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
 <20260915233818.5881ad97.michal.pecio@gmail.com> <CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
 <20260916204713.22c4f575.michal.pecio@gmail.com> <6041fdad-78b9-4310-a86b-f9931563de19@suse.com>
In-Reply-To: <6041fdad-78b9-4310-a86b-f9931563de19@suse.com>
From: djraszit <djraszit@gmail.com>
Date: Thu, 17 Sep 2026 18:02:02 +0200
X-Gm-Features: AcwNN1VnwTEA9sNUOyKxD60uTHpvM859aFoRCQViZh5E58kNvu3w-RtmTNPul_o
Message-ID: <CAFKhL9dmR1KDaBQGta=X5xDCGirzJ8t7u0rH4HUgBoFqN152DA@mail.gmail.com>
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after host reboot
To: Oliver Neukum <oneukum@suse.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Oliver Neukum <oliver@neukum.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal, Oliver,

I performed the two shutdown/boot separation tests suggested by
Michal. All tests started with the enclosure in a known GOOD state.

First:

shutdown Pi with the enclosure connected
-> disconnect USB after shutdown
-> boot the Pi without the enclosure
-> wait for Linux to boot completely
-> reconnect USB

I repeated this three times. All three tests were GOOD: no "Alternate
GPT is invalid" message and the test block had the correct hash.

Then I tested:

disconnect USB while the Pi is running
-> shutdown the Pi
-> connect USB while the Pi is off
-> boot

The first attempt was GOOD. On the second attempt the enclosure failed
during USB initialization with:

Cannot enable. Maybe the USB cable is bad?

I also tested consecutive normal reboots with the enclosure connected.
This was repeatable: the first reboot was GOOD, while the second
reboot resulted in "Cannot enable".

There is another interesting and repeatable difference depending on
the Raspberry Pi bootloader setting USB_MSD_PWR_OFF_TIME.

With:

USB_MSD_PWR_OFF_TIME=3D0

I do not currently reproduce the state where the enclosure enumerates
successfully but returns incorrect data. Instead, after consecutive
reboots I reproducibly get the "Cannot enable" failure described
above.

After changing it back to:

USB_MSD_PWR_OFF_TIME=3D1000

I repeated the test twice, starting from a known GOOD state each time.
A reboot reproducibly resulted in the enclosure enumerating normally,
but:

Alternate GPT is invalid, using primary GPT.

and the previously tested block returned the BAD hash.

Interestingly, in this BAD-data state it is sufficient to switch the
enclosure off and on using its power switch, with USB still connected.
After that, the data are correct again.

I also observed the USB VBUS during reboot with an oscilloscope. With
USB_MSD_PWR_OFF_TIME=3D1000, the VBUS sequence is not simply an off
period followed by power being restored. During reboot I observe
approximately:

VBUS off for several seconds
-> VBUS on for about 130 ms
-> VBUS off again for about 1 second
-> VBUS on

The timings are approximate oscilloscope measurements, but the short
~130 ms VBUS-on interval between the two off periods is clearly
visible and repeatable.

I do not know whether this sequence is related to the JMS578 failure,
but it may be relevant given that changing USB_MSD_PWR_OFF_TIME
changes the failure mode reproducibly.

So at the moment I appear to have at least two reproducible failure modes:

USB_MSD_PWR_OFF_TIME=3D0
-> after consecutive reboots: USB enumeration failure ("Cannot enable")

USB_MSD_PWR_OFF_TIME=3D1000
-> enclosure enumerates, but UAS reads incorrect data
(invalid alternate GPT and BAD hash)

The tests where the enclosure participated in shutdown but was absent
during the subsequent boot were consistently GOOD (3/3). Conversely,
it can fail when it was disconnected before shutdown but connected
again before boot. This seems to make the boot sequence more
suspicious than the shutdown sequence.

Regarding Oliver's suggestion to abruptly remove power from the
running Pi: I would prefer not to perform that test on this particular
system at the moment. This Raspberry Pi 4 is also my router and file
server and has several other disks attached, so an uncontrolled power
loss would introduce a risk of filesystem damage to the system or the
other storage devices. If this test turns out to be important, I can
consider preparing a separate/minimal setup for it rather than doing
it on the production system.

Regarding the Raspberry Pi 5 test: yes, the enclosure was connected to
USB 3.0/SuperSpeed. The Pi 5 uses the RP1 southbridge rather than the
VL805 used by the Pi 4. On my Pi 5 Linux exposes two xHCI controllers,
xhci-hcd.0 and xhci-hcd.1, each with a SuperSpeed bus at 5000M. I can
reconnect the enclosure and provide the exact lsusb -t output with the
JMS578 attached if useful.

Regards,
djraszit

czw., 17 wrz 2026 o 12:23 Oliver Neukum <oneukum@suse.com> napisa=C5=82(a):
>
>
>
> On 16.09.26 20:47, Michal Pecio wrote:
> > On Wed, 16 Sep 2026 19:56:25 +0200, djraszit wrote:
>
> > Looks like JMS578 doesn't like being connected to a booting Pi 4.
> >
> > Or maybe it's shutdown? What happens if you:
> >
> > - disconnect, shutdown, connect, boot
> > - shutdown, disconnect, boot, connect
>
> Maybe it would be worthwhile to shut the RPi down the hard
> way, that is by suddenly depriving it of power.
>
> > If the problem is boot (second case works, first case fails), then
> > I wonder if it's the firmware or the kernel. Maybe you could plug
>
> But then why does it work at all? You'd have to assume that
> the second boot crashes the device.
>
> > the disk after the kernel beigns booting, but before xhci_hcd loads?
> > You could blacklist it if it's a module, or bind pci-stub to VL805
> > to prevent automatic xhci_hcd activation and widen the time window.
>
>         Regards
>                 Oliver
>
