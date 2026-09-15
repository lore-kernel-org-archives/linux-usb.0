Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191843B6DA
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 17:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494740; cv=pass; b=CEKbnbUkX4bfM7etEEvtbwz/+heif068/2MSXQVypM0wUdHI9mNpgMBjOtFdPWkEiMyR2j2GvTHDfDWNW3BEPJd4p2nPQpcvipAziM52heJDFpD3cgL9zqbGpVdpe46Hs8Z+FmgDWp31BMrXROyNEMEdr9eZoc8JYcFe3XnwOVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494740; c=relaxed/simple;
	bh=Z0yBdYiFaezWRFzQfNNrQ9Wrvfime5uv0hjGNlhdBAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tq1YhVkbmVrEtZiYG3otQOHAadTpiqwBzwDHvIb94CeD2gIcjhBu4Wtsjt7cD+uJNpmrz3rpW/qVng7v8QYg5oLaDTZb3K7DJEig1yJbzWUvYRvCyMS46T26lgZugqhR4sZYoLzvnr+55O8/1gMcISwbGZuQAugwS5w5N9j2L0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fptw1G4H; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fptw1G4H"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47badeb3316so8636fac.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 10:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494737; cv=none;
        d=google.com; s=arc-20260327;
        b=RSQuZqCSUyjjs8UrQnPrfrL2mV5oERhn+3aA/ckWIkyN6llbVR1EnrWlP2XYVSfq4W
         Dxgu5YJeCsGYct5av4loj01649GmP42zCkSpRww9fTdoVRWsDEKLF6GAsb/7oONHsr/0
         4nwLTI0S4XurDDI5zvOAkOvr6dMij6u9CI450dNcyv3ltO3a1sy80uwC72twE/F10cQP
         bJyKgRojxbxzuFENwJaOniFJ43JbPAzkt+ivuik5T2r9a2OUgWF468hqL4MU7NE3ioQ8
         iA+NeLnNWhoGWumLA2s78lR3SSrILGc2ok8Qo/fr/xtHgIerFovnGjjgusu2BpgNuqTB
         7heg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H+XG52H/dC/79X6FaXRTJbHdTY/l6XfRtvT5OYUhCBk=;
        fh=yd5PLntDNhRvbQv51VweFSWvrukTH28gJ1sWKDfrkKw=;
        b=ctZCcDgAWDZpvNktJG+qfhMOsEr4p1gnTrxopAJos5PSjH1FRUdtMBev/Ou7YC1LM6
         8GS+Wcu5G5ioG7TxWKBmYgEGcqC8difjID3pMsLuxBCBvqCQ/Kk5SM3OreIXAWsosSJ1
         Y7GwCRUupcsDVVogoCWxNjzayrlpOV7gr/02zXlir1Pmg7MplkJnypMR3awNwnb84B8A
         YP5OK09Ar0ENHpvZssW3DFNiu4lJU6/HI7SOpnXCB3dWiB0cL5FWXfFOUQD5r+EoA4rs
         HC0M9MS9Nw+/WMp9oYxrex1MOHfGplURlI4Ll3qUv961MmzVxDdUZ3GFoavSi25Yq4ML
         DWSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494737; x=1790099537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+XG52H/dC/79X6FaXRTJbHdTY/l6XfRtvT5OYUhCBk=;
        b=Fptw1G4H1vUrUvzWZucSdjKH6RkQWOQnwd6S3kc9cb6HG9guOotJhaJ5RfxjrRXf0Q
         mwEZfoWuhhoViM625l5QQFWNEA+UkHS9NTqNAFqlJvR6C4HLiNEopMttlGt2M2SL/XI+
         jxCSVnAjgj0YJnlYTHtXfoZSi5pfkodVVYm57SYlbNrel3GeWy7rcPcFp21OiiFVtF7Z
         jgd8H5/EidjIlfddFEWKADb0P7K+zaqzNboW9Dtr6EItqXInWeh1HCccqJdun7mQ6zO3
         Kd9MxTIHEdtCkHvoFzmP7Uf5HAlGlnd+gzBcm20zt5h0CSznlDiv5zeLhoACWcUijtwW
         CB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494737; x=1790099537;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+XG52H/dC/79X6FaXRTJbHdTY/l6XfRtvT5OYUhCBk=;
        b=fS6fmsV7AqJ97XObKXco7n3bzY4bZAMVnum6it9LRwUf21xpNog3ZmoT06EslA+42E
         NPNJ7tmDDzh4v0J2/Y2t3KONamJYv3ISWr+wa2ws32wsMsvXbdabMKKLGYZQlIJOTQDZ
         tvxa28Px9R9/eRktZLvblxZsoo4oq5GknLnYLV2iVgKxo/DSnqUW9geIrsO/u5bPq6dU
         /e4WX2PQL7GvdRvPsvF6vGwGIxHF8VFjkbzgIktuISCJuKw6cTUz1e+P3tnCpfyXFNxN
         FpDqkvq6szsaC5TxX8Gn1+APrO1wR7vEa6wT8CqH8j0C9yPhhNiqCGZdPR75QHB24b7w
         zApA==
X-Forwarded-Encrypted: i=1; AKwUvBzm1Z+3S4ZP/KftUUpVhGp0sf7ciKgrDRk+NOfSpYUI37ie9UeEWugY+UPykeMS3CLNWZHnG6a8AF8=@vger.kernel.org
X-Gm-Message-State: AFuF++mUQEJTHcgyb/Vnzw0TQfcfS+c0qnBwGKFsLrvmDsDKtaMOTCFn
	am57CcaCOUnIihlJMV//maKmCI3wQu80F/RLt1fDTOCE9uv3NAw+oLztG3H38fIDYkbzXExL73a
	9hz8QQqQIVY66h+kYSHQZxHoQKeWMohuJR9jCktSkQg==
X-Gm-Gg: AYBFou0k842isn+eScVEQ0EmYU1XScb8KW5zOd9U1OP9qDhZY/pOxSppGNHiaONtIHa
	++N0AQavAg2REA02fGUQ5V5cFzHKvdYpwokv2f5otPGA5P5eaXjFoaX0zII2YFPlRtGfFPMUoQQ
	3fNTQCwGSDbCM4tVJNv8b1ya8KPw+q43mpGnpxfNF4BQ++FJsG20m1FOs/LGppGnyhSZHkrOTR3
	ry/HgFbw6xslEdig2wNLeQcpJGeKEnHOFN2Em1nn1Mh1d1Jfyg3RbZPKi1sbKCiVm3J21coAFtY
	ik5OOoDrg/Vuc8Nihs7dblCPtjQCCtlcIs7UrNZQzbDju1+zEs7+sVG7e4g/AsAhtjA=
X-Received: by 2002:a05:6808:1514:b0:497:d23f:e621 with SMTP id
 5614622812f47-4c7b44c2854mr4914545b6e.2.1789494737359; Tue, 15 Sep 2026
 10:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
 <c335085d-a824-4632-ad3a-c06715258c81@suse.com> <CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
 <1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
In-Reply-To: <1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
From: djraszit <djraszit@gmail.com>
Date: Tue, 15 Sep 2026 19:52:06 +0200
X-Gm-Features: AcwNN1UUE8CZjfFqPCjBG1q6D5HZW_Dc5vxbalXXs4t3adHYq_DhvaY9o_C6Dks
Message-ID: <CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after host reboot
To: Oliver Neukum <oliver@neukum.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 15 wrz 2026 o 08:50 Oliver Neukum <oliver@neukum.org> napisa=C5=82(a):
>
> On 14.09.26 20:44, djraszit wrote:
> > The most interesting result to me is therefore that, once the problem
> > has been triggered, the same disk and the same JMS578 return different
> > data depending on whether UAS or usb-storage/BOT is used, and
> > switching back to UAS reproduces exactly the same incorrect block
> > contents again.
> >
> > Please let me know if there are any additional traces, usbmon
> > captures, dynamic-debug output, or kernel instrumentation that would
> > be useful. I can reproduce the problem and perform further tests.
>
> Hi,
>
> thank you. You did testing on a very strange bug.
> However I need to request that you please do not remove the list from CC.
> People need to see our reasoning.
>
> Secondly, at this point we need to rule out that the Raspberry
> firmware does things to the enclosure. Could you please
>
> 1. suspend the raspberry with the drive attached
> 2. unplug the drive
> 3. resume the Raspberry
> 4. replug the drive
> 5. test for corruption
>
> in that order? That way we can determine whether the issue happens
> during suspension or resumption.
>
>         Regards
>                 Oliver
>

Hi Oliver,

I performed some additional tests.

Unfortunately I cannot currently perform the suspend test on this
Raspberry Pi 4 because my custom kernel was built without suspend
support:

```
# CONFIG_SUSPEND is not set
```

/sys/power/state is therefore empty.

I can rebuild the kernel with suspend support if this particular test
is still important.

However, I performed several other tests which may be relevant.

First, I tested the same JMS578 enclosure on a Raspberry Pi 5. I
performed several reboots with the enclosure continuously connected
and powered. The data remained correct after every reboot.

I also tested suspend/resume on a Linux laptop with the same enclosure
and the data remained correct there as well.

I additionally tested switching transport modes while the JMS578 was
in a known good state:

```
UAS -> BOT -> UAS
```

The same test block returned the correct hash in all three cases.

This is different from the previously observed state after an affected
Raspberry Pi 4 reboot:

```
UAS -> BAD
BOT -> GOOD
UAS -> BAD
```

so changing between UAS and BOT by itself does not appear to create
the bad state.

I then investigated the Raspberry Pi 4 EEPROM bootloader USB power handling=
.

I tested:

```
USB_MSD_PWR_OFF_TIME=3D0
```

and also:

```
USB_MSD_PWR_OFF_TIME=3D5000
```

With 5000 I could visibly confirm on another USB-powered device that
USB power was actually removed for approximately five seconds during
reboot.

The longer power-off did not fix the incorrect reads.

With USB_MSD_PWR_OFF_TIME=3D0 I also encountered a reboot where the
JMS578 could no longer enumerate at all. Replugging USB twice did not
recover it, and power-cycling the enclosure while USB remained
connected did not recover it either. Only disconnecting USB and
switching off the enclosure, followed by reconnecting/powering it
again, restored communication.

Finally, I explicitly removed USB mass-storage boot from the boot order:

```
BOOT_ORDER=3D0xf1
```

The JMS578 still returned incorrect data after reboot.

So at this point the problem does not appear to require USB-MSD boot
probing, and increasing the configurable USB power-off interval to
five seconds does not prevent it.

The behaviour still appears specific to rebooting this Raspberry Pi 4.
The Raspberry Pi 5 and the Linux laptop do not reproduce it.

Regards,
djraszit
