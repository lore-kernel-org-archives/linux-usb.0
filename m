Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D03EDE7C
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310411; cv=pass; b=MnOjVtO542eQ7lqekOTbLlPDOVO+Ou8eaMw5YFCT8Wy8UvOzmkFEkXExXGmgpn74dhEx94UlaEMcHFsdaR5B22ZU6fdkIyADIoRIv148/J7nTDJDpTPD447XcvugXVmvekjtMmWTaNg0XCHda7A2GayKoQvs1BumWAdpXesI8Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310411; c=relaxed/simple;
	bh=+qPJBWzmRKC9+OxVY9yN0s31Cu3tbv+EQeFTM5R4zPg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=parElzJKcM0frOQSeQTdFxMTJNjmwYFBeFr7f2Ifv7DOxdxsqvpniPsRbIMLglW7Cen8xRgWijZAgdBT/B7NWMSNLRf9LJ0ZzKLlkrjVOWGF5T1xBK3+wI4z80V01hot+SwqI70QOcGCMN08PFdupcOlScFveZc6B8WW8ViJsvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GK7ktkDk; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GK7ktkDk"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c44339c557so152949b6e.2
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 07:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789310409; cv=none;
        d=google.com; s=arc-20260327;
        b=Yivo4uanKAqFGNOouC/LhRAZGkkF38pdbnBxU3bmw1VhI4N73Xk6GpsG4CjrrOl+VK
         DrUGAgKZ0jDNqN7mFGdZ7zD52bvtDhwBI6N4n8xWjOgt/W0BZ/pxGeNI43/DTc8B+Ycw
         IWZHhqylzfALXjN4YZOytpAALaPCQZ3Y39KktVht6Gb7u/QOKgDE2oc7j+QCNBrE3KYB
         FeUqiSfVa40hOP/EkukZ8xsXosYqwoSwuxlf0aJM3J7sLg9V5r8ppWWakUlavbKxZZwn
         dEl+1PPv0I2ldSssOvVgXeS8Lj1Ti5Dk6Euf8IvMAqsXQ9gL9ezNide8+XExwRJQuetJ
         eS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zqwZJGRl9Z45mEENuDDK/4UzwWu29byY1aWcLUyk39U=;
        fh=U3KQxwBvsBQ/FK+vnM5rOX0pG2fYBJlIOBmPgSGhRrg=;
        b=WMiMlclPI3zVxUd7UGzVD47Pg9+jXLMy82YsqJnRNo+/Ev68fgc+Ji+u17Y0EXFyFz
         6MTWu/aRpEh2ZDBOZn9YCrBph4weLAvJSZlq6CN4n5Btg6p5IeKJ1a0m7yyPi6IuZtlW
         AeIriIN9nBbvMfzRzcCo8g8HLfTC19ce/g/UK5I2L1hDgWYGBzreSNzxpEsamJbPSUK8
         DQUtmKbHnE8Oz4hYIkhOFe5BvNgxJezQwhgxzYX/7C5B09q0khInO51Y4auraaQP0+bo
         mYRa8sytv5XEPCIno0O9b17SdlMcyAlfNbgMY45KCvY8PUlUIVxV/IlVfQ5PYF1ebSGj
         2lvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310409; x=1789915209; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zqwZJGRl9Z45mEENuDDK/4UzwWu29byY1aWcLUyk39U=;
        b=GK7ktkDkYYgeYyUR/lX8cMBh9vFB7nL4/9S46s7eWrGqO19okkyCAJ9Rd566oBb/R8
         Zmmj541OzAh/IHdEaESA7DrARHjm+w/u6uQefVt2rZ2GODCEvIUtDTMtX+hPnaVqIpDE
         ID8ioK9nG6spBN3G69J2scur2Tr8dYbAd5Qlkvaz0ZjiK0tAcKnLx5XKl1ncay0GE6Bc
         7VTa4d2dBWdJd+RZLFWYX/xJOFxtE4STfToKaGcQdAEIYM0dFX2dRu+cXhEXHD8ezLil
         8DnARvw4iDVVgAM+grMi3P5pIuYLLXK8ePQ5X9X395w0hvGOghgRU5RBzydPKbm+1qvy
         GRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310409; x=1789915209;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqwZJGRl9Z45mEENuDDK/4UzwWu29byY1aWcLUyk39U=;
        b=n2b7YGYBYGR00qbLstk0UWqQOS7ZJT8B4DyjgqIbp1dgg2331VTMxV/d3CM8Q8aGlF
         ZfDSLZOqjSlZr3mgn2CMB/0dMhFgcBZKJ2gazmuN6V+9gasLZ6tvTNIOaaFR/3xwKcGZ
         u6UftMkO4nD9x85lAAL/TCt8y+L3qld3xv+vwI8FfqbD4VeeumzoZ8fCnB3CQrf078E0
         q+58VOZC0PFiUMMT/rYqvk9/Hu6CBqatC3R4iyBQg2XxzI1RY7FMZvUCKZCuk6GrJKeN
         qvo2G0a6YyTn2nAqRkhEk0pnYUHyhfBebPuJI49e5bKw3k1b3AkbS0Il+cEH7wr7HwwU
         Mnuw==
X-Forwarded-Encrypted: i=1; AKwUvBwtL8qBmnK2rEg/zQFhgJTxLzALZV4ZPg4SSfGsjocmavy9I6av839RX2eDHSxiAFI6ftCr2w4mFUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nzbbVYkSF0a/wxteqpCq+ydsqh5khdHzkouZuDlYD+G4VYcs16
	ATgtVeIA9Mg7qW8ZpclkIGZF29ILMZJlABfqOd1sy1DwnW+rIvIhDGyw4EWLMHMFiLlGriQ5KAv
	zj2aul5c8e4vyr7BOu0v7HyMQJtovj2A=
X-Gm-Gg: AYBFou1CFHAK7BiNXV+RLChmKIJcRiYE5PrUrZPhpswY8h4XrLT9d/6R6hf8gGYI2lI
	kvB+0GHXi0YxAv0JFvXgvov4fuvu1zY9pQmXw+UhJK99ZLs7d4NxZtDAX7DVErLJ4uVpiJN91ZN
	vJB41z9t2SkytzMMj1/YXV8Zjg05+Jk4JothD3UncOmBH5Vlv3Vy8D6wIZNi1dUqYe9lN2+oYKG
	AO8t+F4KqN4fpTkeXi4K05I/k9E7aX56jbNGj4S+qIyxJpu8OYktLrc8e3x6vROz49A0q3nOlpR
	4RdQ2zyMbvP97ze7HjFY4j4vm/bRkvHOXgh2JMzl3uhxNEF/CMadXJC4O8r0xEVdyC8=
X-Received: by 2002:a05:6808:d4e:b0:4bd:c8be:1e07 with SMTP id
 5614622812f47-4c31953a9c1mr7372154b6e.1.1789310409260; Sun, 13 Sep 2026
 07:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: djraszit <djraszit@gmail.com>
Date: Sun, 13 Sep 2026 16:39:58 +0200
X-Gm-Features: AcwNN1VwoT2VUWhe17bgbZOfmp9_1oOxXNbRnbuULJgSCMaRgXdFdPqFLeAj_XQ
Message-ID: <CAFKhL9fbUj0ToFRTB2_yujEK8zo81GTGAeXPWpC=fF3DO8H98Q@mail.gmail.com>
Subject: [BUG] uas: JMS578 returns reproducibly incorrect data after host reboot
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Subject: JMS578 USB-SATA bridge returns reproducibly incorrect data
with UAS after host reboot

Hello,

I would like to report a possible issue involving the Linux UAS driver
and a JMS578-based USB-to-SATA bridge. I am not yet sure whether the
root cause is in the UAS driver, xHCI interaction, or the JMS578
firmware, but I have been able to reproduce the problem and isolate it
to UAS operation.

Hardware / system

Host:

Raspberry Pi 4

Linux 6.18.45-v8_1khz+

aarch64 kernel, 32-bit armhf userspace

USB-SATA bridge:

Bus 002 Device 005: ID 0080:a001 Unknown JMS578 based SATA bridge

The device identifies itself as:

Product: External USB 3.0
Manufacturer: TOSHIBA
SerialNumber: 2015033100081

It is connected through a Realtek USB 3.0 hub:

0bda:0411 Realtek Semiconductor Corp. Hub

The SATA disk contains a LUKS2 container with an ext4 filesystem. The
enclosure has its own external power supply and remains powered during
a reboot of the Raspberry Pi.

Problem

When the Raspberry Pi is rebooted while the USB-SATA enclosure remains
powered, the disk is detected normally using UAS:

scsi host2: uas
sd 2:0:0:0: [sdc] 1953525168 512-byte logical blocks
sd 2:0:0:0: [sdc] 4096-byte physical blocks

There are no obvious I/O errors, but some sectors are read with
incorrect contents.

This initially appeared to be severe ext4 filesystem corruption. For example:

EXT4-fs error (device dm-3): ext4_find_extent:944:
inode #8: comm mount: pblk 121667583 bad header/extent:
invalid magic - magic 7426, entries 15446, max 59087(0), depth 39757(0)

jbd2_journal_init_inode: Cannot locate journal superblock
EXT4-fs (dm-3): Could not load journal inode

However, the filesystem itself is not corrupted.

Reproducible block test

I opened the LUKS device read-only and repeatedly read ext4 block 121667583:

cryptsetup open --readonly /dev/disk/by-label/MP3_FILMY MP3_FILMY_encrypted

dd if=/dev/mapper/MP3_FILMY_encrypted \
   bs=4096 skip=121667583 count=1 status=none | sha256sum

With UAS after a Raspberry Pi reboot, the result is consistently:

66c32ba5b97394b491efb79e11fcfeae2a9040aa237beb51e09afee342903dc2

I repeated this read many times and always received exactly the same
incorrect hash. Therefore this does not appear to be random USB
transmission corruption.

After physically powering the USB-SATA enclosure off and back on, the
same block reads as:

6b716692a9eecccf9ab693a6419dc7325b3072c6ecf8499ffa2a1e4bd126b483

This is the correct value.

The same correct value is also obtained when the enclosure and disk
are connected to another Linux computer.

USB resets do not recover the device

I tested a USB device reset. The kernel reported:

usb 2-2.2: reset SuperSpeed USB device number 9 using xhci_hcd

but the block still returned the incorrect hash:

66c32ba5b97394b491efb79e11fcfeae2a9040aa237beb51e09afee342903dc2

I also used per-port power switching with uhubctl. The kernel
performed a complete USB disconnect and re-enumeration:

usb 2-2.2: USB disconnect, device number 5
...
usb 2-2.2: new SuperSpeed USB device number 9 using xhci_hcd
...
scsi host2: uas
...
sd 2:0:0:0: [sdc] Attached SCSI disk

but the incorrect block contents remained.

Because the enclosure is externally powered, the JMS578 itself
apparently remains powered during these USB-side resets.

Only physically removing power from the enclosure restored correct
reads while UAS was in use.

Disabling UAS fixes the problem

I then disabled UAS specifically for this bridge using:

usb-storage.quirks=0080:a001:u

After rebooting the Raspberry Pi, while leaving the enclosure
continuously powered, lsusb -t showed:

Class=Mass Storage, Driver=usb-storage, 5000M

instead of:

Class=Mass Storage, Driver=uas, 5000M

I then repeated exactly the same LUKS block test.

The result was immediately correct:

6b716692a9eecccf9ab693a6419dc7325b3072c6ecf8499ffa2a1e4bd126b483

I also ran a complete read-only ext4 check:

e2fsck -fn /dev/mapper/MP3_FILMY_encrypted

It successfully completed all five passes without filesystem errors:

Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information

MP3_FILMY: 18368/61046784 files (19.3% non-contiguous),
71945629/244186289 blocks

The only messages were several harmless suggestions that extent trees
"could be shorter".

Summary

The behaviour is therefore reproducible as follows:

JMS578 enclosure is externally powered and remains powered.

Linux uses the uas driver.

Reboot the Raspberry Pi without power-cycling the enclosure.

The disk is detected normally, but at least some reads return
reproducibly incorrect data.

USB reset does not fix it.

USB disconnect/re-enumeration does not fix it.

Physically power-cycling the JMS578 enclosure fixes it.

Disabling UAS with usb-storage.quirks=0080:a001:u also fixes it, even
without power-cycling the enclosure.

This is particularly dangerous because the problem does not
necessarily produce an I/O error. Valid but incorrect data is returned
to the block layer, causing higher layers such as dm-crypt and ext4 to
interpret the filesystem as corrupted.

I would be happy to perform additional tests, enable UAS/SCSI/xHCI
debugging, collect usbmon traces, provide kernel logs, or test a patch
if that would help determine whether this is a Linux UAS issue or a
firmware quirk in this JMS578 implementation.

Regards
