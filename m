Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E13DE440
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 17:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581414; cv=pass; b=ALT6IF5N/h0MA/J5h1JYSzZMI6bEn3p6eCEUijrTeDOgFujJzJldjeW8zpRt0HZnQ2ObfZ868WC6zr9+CmdW3bdxLNBGCZs6mF4Xps/V2YxbWI48yAt79mAcrbn5K5LkRcEkLfGSRA9Wygnr1nTqb6fo0NGS5E7mbCs9xp7DVNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581414; c=relaxed/simple;
	bh=pI++wm/4uwN+AR/4qfoavqe/XGuBJ2gh68sX+zWaAe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAr7s57PHFO1Q08YRXvNVK7XMkktcfegPgeDhxfdnPq6d776Zwo6q/9VOxfQFI7jbLLEWAiu6ca3fXRavOdOjtICLTnpnbG3OMMIlJXHa40P/zoshqb/f3u4JPijkVDBrjRYl4nhgGV2mm1aYAE5kHh+KaXHsH7sE5kAKbr1CZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jC0jqgWD; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jC0jqgWD"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b375b957e0so64177b6e.2
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 10:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789581396; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTIQNSOuleE5L9fMlxkDd6HAlslbHRWbWcg+8COt1HRlA7wy0xwmEC9f44192klRJw
         g91x4D7QL/J+EKqKO3WfI8G7GTvDx2ncYT7oJcaQvj9hjxyivpVf/W9cqjlrBFT7KZ9+
         bshr3UDvHjkMyDkXqyy3MGfgoD/a0ko4lE3ZDkIrrBXOaqubH4wssRp4pIQ4s2jZHiIj
         RBLno+j6Gk9OKOTxHwFERvcrTsSvFRR/VypVPhC7Mpvd+5gCyaYcGRDJFFuVVa5SW/Ny
         3YdujLOkjVAiqPoWT6m+nOUYUpq/CGq7L95THCDbS+CrgGtYDskY3mO2LPJrJxsu3qOz
         MhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XSG+LfPoqDAo8z5BJEH/0UmvJNbKlpg21KVGrnuzFWc=;
        fh=ttWoJezXwlBflNtWBfI9v94eShESXveQjb1b14nKSAs=;
        b=YrJtUIogZJJl3hicNMEF66EBPNBt3FwP+kOndPR1AQjIQwB7mXHlEflbpy5RkYyyLm
         Y1hgaHgPGyRx04ZWqIqFy91c+/ga3Zwr7RtHJFIU/VPL36Jvyhfbo6pwdsalK/TCAuWH
         qAJMLXYxjc6ZGFoESP/Jysg2V6k+FFwKNVnYXJJc5/xb3jpyMaah7VEZQeDsJe17fMZ6
         DJVMC6EfW1UFCkngVzlQsOL9mYWbpE7VD8eWPavUrnF5SrijKQA1cqs1NBiIU/55wpms
         +InndV90En1AO4aRoNK6na8Fz41+9bSBkPIU6O4g4+GE4ib13JuGCXqu9CPDEpCVNwCC
         CTbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581396; x=1790186196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XSG+LfPoqDAo8z5BJEH/0UmvJNbKlpg21KVGrnuzFWc=;
        b=jC0jqgWDV1uFnsXpCPEhF73WnJLJrxE4cpnDxxpguRls4sIElzCQ1TEdWKIoHU0zpI
         jES7Xu/l1W9i+1Pq2nBah+6qzacxKesee3CveXb116KwtaGO7lAcarAhTXV8Hf3IvWEg
         dNkFjfbt+Bk1sbvf/wzmM28yyWfOiJe9zCntIxF3Sjan8zMeO6V98KBfADp2YfvekCLw
         KswKgwRLwheJ5w3afAckmTIcQgGjHdbP6/CUodoYYz5J1NTG862s8QWFVBl3mPngidhp
         CLyOh02PqKVePy+XkFcNeuu4wcAqXIp5l+vF+gtvPLwHFVAYPSnrk+sbqzP2V7PUvkxK
         3CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581396; x=1790186196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSG+LfPoqDAo8z5BJEH/0UmvJNbKlpg21KVGrnuzFWc=;
        b=QlbSjrW2DLJp5X1CstCFUEybrLMEiWg+ClYMvqRvgDXcOFtiks8Qv/frDWrjuZtcPa
         0wJOMD6wjxocuZsZ9URzrb0PeBwDEjBYoRYFZBeJCP/Y/8Kb/Ulc+bHLyWP46L2SatBh
         CN1Mz6uKfFJ25CqwaE3KaqtMkKZe0Jvn4jmxzolkkiPD6NO6CphkzhGhd6QwF04mCH8R
         GmzHRxaCL0IfMr89P48mwOqMQO+bJSKev95ua4fGgOb2UJ1aFiECWkME6MMkN2JOV9m6
         F04gQzs4rDFYz3OwdaMYEbZfwHT7JgsqQhVJ3SeUg3Hkf1Zli/OJqL/cLa2Surz655I5
         kOsw==
X-Forwarded-Encrypted: i=1; AKwUvBz8kuUsWLR5iZAWF80yFWwAsWsAMFIMarygtLSHgT3Mljq/OrPBgNjbh8YmsDRJkLU/9AcTDP+77nU=@vger.kernel.org
X-Gm-Message-State: AFuF++lA4GEY5LarNlVK3/zVQppYkoVQ3myJbL4NjY/GqEMEgr2/vqOL
	ukMk5dx6R/CK3k/ReQYFkrLZ80pYAok2KuVk+twneoOkPT/aj4B8fhkC/E2mNJEVQVshukDy8OC
	S04n6MUkK8C8ciO1QSenI67z/Vr5xMTE=
X-Gm-Gg: AYBFou2H6TcsyzLlXCZzCKvR1xXlrITMQVYVL4r4egeRWfGSk8UBfdX/gZAobgIrqbD
	qW7dIKE3HTJt1yEliLoeASE8jk8xhYZug1J3G2ws7ggGuxnsZLAcTFchewN1MHNRlukWzjgN3wV
	x2hw8ru8JGhjZHGYpG1MOBv6W/wXDCRZJjrdYSVyY08McFVemW7UXCqc0IKaO13SlKQIRpELsSW
	uTuex8Y0NMYBWd6/xNDhIiBpW84GB+WXefgGbGb69biO6sRAqOtF4lJinL6+9c39I4ZzQ2CaZbS
	gVotSoiE0TArey5dRQs6kWaSGT64Ykjkw5NSj8TWQe0/d8PY6jSSp+5HXhZ4+ANmthc=
X-Received: by 2002:a05:6808:1a24:b0:495:d9fc:238a with SMTP id
 5614622812f47-4ca4d911f64mr3473858b6e.3.1789581396449; Wed, 16 Sep 2026
 10:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
 <c335085d-a824-4632-ad3a-c06715258c81@suse.com> <CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
 <1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org> <CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
 <20260915233818.5881ad97.michal.pecio@gmail.com>
In-Reply-To: <20260915233818.5881ad97.michal.pecio@gmail.com>
From: djraszit <djraszit@gmail.com>
Date: Wed, 16 Sep 2026 19:56:25 +0200
X-Gm-Features: AcwNN1Voh3059Pog29v63YAMQiaaG6ARtNCtPnnmLRj4ikAVRDSA5XKwQY54ICE
Message-ID: <CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after host reboot
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Oliver Neukum <oliver@neukum.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have done several more tests and I think I need to correct one of my
earlier assumptions. Initially I suspected that UAS itself might be
involved, but the new results show that UAS alone is not sufficient to
reproduce the problem. The failure appears to be much more
specifically related to the Raspberry Pi 4 SuperSpeed USB path, or to
an interaction between it and these JMicron bridges.

First, I tested the original enclosure (0080:a001, apparently JMS578)
connected to a USB 2.0 port of the Raspberry Pi 4.

Interestingly, it still uses UAS:

```
Class=3DMass Storage, Driver=3Duas, 480M
```

I performed multiple reboots in this configuration. I did not get the
"Alternate GPT is invalid" message and the known test block remained
correct:

```
6b716692a9eecccf9ab693a6419dc7325b3072c6ecf8499ffa2a1e4bd126b483
```

This seems important because the same enclosure connected through USB
3.0/SuperSpeed with UAS can return reproducibly incorrect data after a
Raspberry Pi 4 reboot, whereas UAS over USB 2.0 remains correct.

I had also previously tested USB 3.0/SuperSpeed with BOT forced via:

```
usb-storage.quirks=3D0080:a001:u
```

In that configuration the enclosure used usb-storage instead of UAS
and the data remained correct after reboot.

So the combinations tested so far are approximately:

```
RPi4 + USB3/SuperSpeed + UAS  -> BAD after reboot
RPi4 + USB3/SuperSpeed + BOT  -> GOOD
RPi4 + USB2/480M       + UAS  -> GOOD
```

There is also the earlier result from dynamically switching transport
after a bad state had already been triggered:

```
UAS -> BAD
BOT -> GOOD
UAS -> the same BAD data again
```

Therefore neither UAS alone nor SuperSpeed alone appears sufficient to
explain all of the observations.

I also measured USB VBUS during reboot with an oscilloscope.

With:

```
USB_MSD_PWR_OFF_TIME=3D0
```

VBUS disappears for approximately 3.17 seconds during reboot.

During a normal cold start after "shutdown now", removal of Raspberry
Pi power, and subsequent application of power, I did not observe any
unusual spikes on VBUS. The USB voltage simply appeared after a delay.

As a control test, while the original enclosure was in a known-good
state I manually disconnected its USB cable for approximately three
seconds and reconnected it. This did NOT trigger the bad state.

I also tested a complete Raspberry Pi 4 power cycle:

```
enclosure in GOOD state
-> shutdown Raspberry Pi 4
-> remove Raspberry Pi power completely
-> wait several seconds
-> apply Raspberry Pi power
-> wait for complete boot
-> test data
```

The enclosure remained powered and physically connected to the
Raspberry Pi during this test.

The result was BAD.

So the problem is not specific to a warm reboot. Starting a completely
power-cycled Raspberry Pi 4 while the already-powered enclosure
remains connected can also trigger the problem.

In contrast, I performed the test suggested by Michal:

```
enclosure in GOOD state
-> disconnect USB
-> reboot Raspberry Pi 4
-> wait until the Pi has completely booted
-> reconnect USB
```

The result was GOOD. There was no "Alternate GPT is invalid" message
and the test block had the correct hash.

I also tried removing the SCSI device before reboot with:

```
echo 1 > /sys/block/sdX/device/delete
```

while leaving the USB device physically connected.

This did not prevent the problem. After reboot the original enclosure
again produced "Alternate GPT is invalid" and incorrect data.

I then tested a second, different docking station which also uses a
JMicron bridge:

```
152d:0578
Product: USB3.0 HDD DOCK
Manufacturer: JMicron
```

This device shows a different failure mode, but it is also affected by
Raspberry Pi 4 reboots on USB 3.0/SuperSpeed.

After recovering the docking station it enumerated normally as SuperSpeed/U=
AS:

```
JMicron USB3.0 HDD DOCK
152d:0578
Driver=3Duas, 5000M
```

The disk was detected correctly, there were no GPT errors, and the
known test block returned the correct hash:

```
6b716692a9eecccf9ab693a6419dc7325b3072c6ecf8499ffa2a1e4bd126b483
```

After another Raspberry Pi 4 reboot, however, this second JMicron
device could no longer enumerate on the SuperSpeed bus. The kernel
repeatedly reported:

```
usb usb2-port1: Cannot enable. Maybe the USB cable is bad?
usb usb2-port1: Cannot enable. Maybe the USB cable is bad?
usb usb2-port1: Cannot enable. Maybe the USB cable is bad?
usb usb2-port1: Cannot enable. Maybe the USB cable is bad?
usb usb2-port1: Cannot enable. Maybe the USB cable is bad?
```

The device was completely absent from lsusb and no block device was created=
.

I recovered the docking station, verified that it again worked
normally and returned the correct hash, and repeated the reboot test.
The failure occurred again.

I have now also performed Michal's test with this second 152d:0578
dock while it was in that failed state.

Without switching off or otherwise power-cycling the dock, I
disconnected only its USB cable from the Raspberry Pi 4 and connected
it to a Linux laptop.

There was no USB activity at all on the laptop: no new messages
appeared in dmesg and the device did not enumerate.

I then disconnected it from the laptop and connected it back to the
Raspberry Pi 4, still without power-cycling the dock.

Again there was no USB activity at all and no new dmesg messages.

Therefore, in this case the failed state follows the JMicron dock to
another host and survives USB disconnection/reconnection. It is not
simply a bad state retained by the Raspberry Pi 4 USB controller.

This is similar to what I had already observed with the original
0080:a001 enclosure, although its failure mode is different.

With the original enclosure, after the bad state had been triggered by
a Raspberry Pi 4 reboot, I disconnected its USB cable and connected it
to another Linux computer without power-cycling the enclosure. The
device could still be accessed there, but it returned the same
incorrect data.

For both JMicron devices there is also an interesting recovery behaviour.

Simply disconnecting and reconnecting USB does not recover them.

Switching the enclosure/dock off and on while the USB cable remains
connected does not recover them either.

Recovery requires both:

```
disconnect USB
+ switch off the enclosure/dock
```

followed by powering it again and reconnecting USB.

This suggests that the failure state persists somewhere in the device
while either side is still providing enough power to retain that
state.

Finally, I also tested the original enclosure on a Raspberry Pi 5. I
performed several reboots with it connected and could not reproduce
the corruption.

I also tested suspend/resume with the enclosure on a Linux laptop and
the reads remained correct.

So the current observations can be summarized as:

```
Original 0080:a001 enclosure:

RPi4 + USB3/SuperSpeed + UAS
    -> reboot/cold boot can cause incorrect reads
    -> "Alternate GPT is invalid"
    -> incorrect block contents

RPi4 + USB3/SuperSpeed + BOT
    -> GOOD

RPi4 + USB2/480M + UAS
    -> multiple reboots tested
    -> GOOD

RPi4 reboot while enclosure is physically disconnected,
followed by connection after Linux has booted
    -> GOOD

Bad state -> move enclosure to another Linux host
without power-cycling
    -> same incorrect data on the other host


Second JMicron 152d:0578 dock:

RPi4 + USB3/SuperSpeed + UAS
    -> reboot can leave the device unable to enumerate
    -> repeated "Cannot enable. Maybe the USB cable is bad?"

Bad state -> move dock to another Linux host
without power-cycling
    -> still completely unresponsive
    -> no USB event on the other host


Other tests:

Original enclosure + RPi5 USB3
    -> several reboots
    -> GOOD

Original enclosure + laptop suspend/resume
    -> GOOD

approximately 3 seconds manual USB disconnect/reconnect
    -> does not create the bad state

SCSI device/delete before RPi4 reboot
    -> does not prevent the bad state

complete RPi4 power-off/cold boot while the powered
enclosure remains connected
    -> can still produce BAD
```

The new results therefore change my earlier interpretation. UAS by
itself does not appear to be the cause, because the original enclosure
operates correctly with UAS at 480M and survives multiple Raspberry Pi
4 reboots.

At the same time, the fact that the failed state follows both JMicron
devices to another host indicates that the persistent failed state is
in the enclosure/dock rather than being only a retained state of the
Raspberry Pi USB controller.

What I still cannot determine is what initially puts the JMicron
bridges into that state. At present it appears to require some
interaction with the Raspberry Pi 4 SuperSpeed USB path during
boot/reboot. I do not know whether the root cause is on the Raspberry
Pi 4/VL805 side, in the JMicron firmware, or in the interaction
between the two.

Please let me know what additional traces or tests would be most useful.

Regards,
djraszit

wt., 15 wrz 2026 o 23:38 Michal Pecio <michal.pecio@gmail.com> napisa=C5=82=
(a):
>
> Hi,
>
> This looks bizarre and it isn't even obvious which device to blame.
> Have you tried any of these things?
>
> Disconnect the USB cable and connect it back, without powering down
> the disk or the Pi. Can this fix it? Can this break it when good?
>
> In good state: disconnect, reboot the Pi, connect. Does this break?
>
> In bad state: disconnect and connect it to another machine without
> power cycling. Still broken?
>
> Regards,
> Michal
>
