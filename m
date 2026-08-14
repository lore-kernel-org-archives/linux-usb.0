Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D3A411F96
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710556; cv=none; b=TkJHB6qBfxeX31sC74ko7KRFZ0ADg+T3NdKdqjzHc/xz89iZAap8bVfoIPp2jmSqJY0cPvX+XPfr0Q1nKJK91z74DWvERHyzOgVM03hk0+EPfomEZ8KHpAy1uM9rEf2njJdI/6ZB3pKnGE/Xt+HuoaPGiXnURXkKtE/tqVjNgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710556; c=relaxed/simple;
	bh=EFhEUQzDN1Y8/23mKBEH9DobyUEVzsa/Nm+io8oT7s8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=uLIWYiEyLwM87gebIpCbjgx4eeIOxk2N0smVbW+iW1HzRUTtH9dT+NGznQH5Rc/HqsY8j5XAMQIWuNZmAUFq+f1Q7mAJQAnFT3Tifz5wPdTd8UInqP2D6nFUbwbwr3/Y7fN4EYGc9ZqANnK0kejfHcKNj8+OwY5qOMr5ifOR458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEvSbjT5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEvSbjT5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4994c49f588so7798225e9.0
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 05:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786710553; x=1787315353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11eC1y/W/K91eHAR6XufPheKUWG+n1sOLm6uV2bmmqk=;
        b=lEvSbjT5CIAcNoJtysfuIDvINK48vRwGPLNRG8BhjF7tgx7Zar3THYmvZkWM5+0w7Q
         zey1aad7NZx64yzIjJFAYTQQOdoCMWXC7Itwwg83QgKjqVKZl1TXsH4+Yxj2er95BHFU
         IeHRd80trFgFln0xGF8U0C2pc2yd+gH8zvs5seWkoVIdSavWd+e3z7bS/brabpC/zEPv
         4iLflSHOUPyPPkGFZzojXL5iLg1ZklyYr7Fa6siSikbcO7Tbkd3ulLLzgPPn8Yd/HjY9
         /6xYh9lCs0HqSG8kI8ULrHRwxHOYOHX3F9mZwbbdOpGic34SztGkkHUalscrEwRgjngG
         g9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710553; x=1787315353;
        h=content-transfer-encoding:content-type:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11eC1y/W/K91eHAR6XufPheKUWG+n1sOLm6uV2bmmqk=;
        b=QBqZulM0X9PjoSSHbIWQqNva4jw7buyvQMd3c7cy6JWqAdYMWgy3BDaRumy8xVUKdm
         bXx1PCf5zObBstWPcWVXVZo2SEp40PG+kKQGhOWWahQsEEI53p1oZxEyli4YdpE6unBN
         FZmiZTuOsLzcVXSZdaOWo0e5a3/niExlSYpZE8oyEdJ51eMxMZbTGJ7FX2hPzC/ABT1P
         IJtMdRpQFPxGrAcOlnTc+Ncqp5atRUKOqq67JfX1rv99sHBKHBw9V+K1gVbVYd0mZaEc
         mnbXYtHjm2wHID9vGoHeb1KApOaOKZk8UBG1JZkT2XspQZsbItEy02yn0LmRLZx23n75
         Q9UQ==
X-Gm-Message-State: AOJu0YwlvJ0zuNsYKCe9KtMGlJ0UP3Gy8nMoQsVUAv3PQCNRY10NLYE0
	GeZL8ExyB36p3/NEJadUhY+Vn9fNUZe6mllVuYHnfSZnW2If2Xjd1z+tRCWuCg==
X-Gm-Gg: AR+sD13DepXW0jLVzaxMls47WS8FukrOjWjGd8+txyvzWCSXY3zdBuTZXxlfdcmHi5C
	8Levwj+6RaVocB3ELl6l55EelN0SIZwZTKpee4LobPLzz/wggoqXp1vMU+V/+6Z8hSgFIk2VyDA
	C2rjai5656uKKMk+yIwYwPBTAsY5ciftx0MKOTLRjhJ4F+Hmf3OTvvfNzxAvsNfv95KAgi+i56o
	azvcPIK9IHPZVL6wTJuDB+xFSCLGQ7W7FfifQ/Rk38tVSFxkTSSJvbINnfFhRGnJhEzuRVym7Zt
	ixoHYQ6La3eWFAgFB46XAVf/qCfmF6n7gJnDJvlJImGqcgbgnaPLppbrkYcfkMRF/H7wb6tsfJt
	toM5XvyynH3FjY60+68baHPQti4b/uQPc7fLXx8qPyWzT8g0Qy6e2bfT8Y5MzNldsT/DY2Qr3wS
	KiBgFultfXKwI80KugiqxUUfj8NSi+mthmhI+Jj9hJmMZQghMGVIzuzz5gLhVQ7ycNk3iDXDZxH
	mEK4PIh5tMzjaYIvPXXWCV6QayX5neqaUXrWod46x7n9FEDCkqOuZDlPIoWSiBvPqs4rKKsKmVV
	dnlmwLwKj05qaj7m3g==
X-Received: by 2002:a05:600c:3b90:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49987a4f131mr62891255e9.1.1786710552601;
        Fri, 14 Aug 2026 05:29:12 -0700 (PDT)
Received: from [10.0.0.10] (dynamic-adsl-94-34-135-177.clienti.tiscali.it. [94.34.135.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20051esm8599011f8f.7.2026.08.14.05.29.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:29:12 -0700 (PDT)
Message-ID: <304867f7-f0b9-46b3-b43b-e9d377d5d092@gmail.com>
Date: Fri, 14 Aug 2026 14:29:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fabrizio Pelosi <tesfabpel@gmail.com>
Subject: Minor init annoyance with Logitech G900 Gaming Mouse
To: linux-usb@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, 
I'm having a minor annoyance with my Logitech G900 Gaming Mouse 
since a long time and only now I've decided to report it.

I'm running ArchLinux (amd64) with kernel `7.1.8.arch1-3`.
Mouse firmware is the latest available.

The mouse is a wired / wireless gaming mouse. 
It can work via USB directly or via its own receiver. 
It has a switch on the bottom (the part that touches the flat surface): 
when OFF it doesn't work even via USB.

The issue is that if you switch the mouse ON and wait one second or two before 
putting it down, it works correctly. 
If you happen to put it down too fast, instead, it may happen that you need to 
wait ~31 seconds before it starts to work. 
Also there are differences between the two cases in `dmesg`. You can see them 
in the `g900_journal` section below.
When it works, the mouse is renamed to "Logitech Heat Gaming Mouse G900" 
(with "Heat") and the line "HID++ 4.2 device connected" appears; 
when it doesn't it doesn't get renamed (it remains "Logitech Gaming Mouse G900")
and there's NO line "HID++ 4.2 device connected".

This issue may also happen if the mouse is ON and the PC is rebooted. 
It seems it causes a delay in the initrd with systemd trying to stop 
"Rule-based Manager for Device Events and Files". 
Ultimately it works (but it takes a bit longer than 31 seconds it seems) 
but if I switch the mouse OFF, it seems it exits as soon as I do it.
You can see the `journalctl` log in the `g900_initrd` section below.

I have captured a USB capture with `dumpcap` (the capture is related to 
the `g900_journal` section below). 
I can provide it as an attachment, if needed (it's less than 60 KiB).

These are the steps to try to reproduce the issue:

1. Run `dmesg -w`
2. Pick up the mouse and switch it ON.
3. Put it down on a surface as fast as possible (so that it starts to send 
   pointer events, maybe)
4. Watch `dmesg -w` and see that there's a delay of 31s before the mouse 
   fully works.

I can try to test a patch on the `drivers/hid/hid-logitech-hidpp.c` module, 
if needed (but I can't guarantee I'll be able to since it'll be my 
first time doing it).

Thanks,
Fabrizio.

====== g900_journal ======

ago 13 10:03:36 tesx-pc kernel: usb 7-4: USB disconnect, device number 4

# --- waiting before putting the mouse down after turning it on ---

ago 13 10:03:43 tesx-pc kernel: usb 7-4: new full-speed USB device number 5 using xhci_hcd
ago 13 10:03:43 tesx-pc kernel: usb 7-4: New USB device found, idVendor=046d, idProduct=c081, bcdDevice= 1.03
ago 13 10:03:43 tesx-pc kernel: usb 7-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
ago 13 10:03:43 tesx-pc kernel: usb 7-4: Product: Gaming Mouse G900
ago 13 10:03:43 tesx-pc kernel: usb 7-4: Manufacturer: Logitech
ago 13 10:03:43 tesx-pc kernel: usb 7-4: SerialNumber: 0E6C36503233
ago 13 10:03:43 tesx-pc kernel: input: Logitech Gaming Mouse G900 as /devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4/7-4:1.0/0003:046D:C081.0009/input/input33
ago 13 10:03:43 tesx-pc kernel: logitech-hidpp-device 0003:046D:C081.0009: input,hidraw6: USB HID v1.11 Mouse [Logitech Gaming Mouse G900] on usb-0000:0e:00.3-4/input0
ago 13 10:03:43 tesx-pc kernel: input: Logitech Heat Gaming Mouse G900 as /devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4/7-4:1.1/0003:046D:C081.000A/input/input34
ago 13 10:03:43 tesx-pc kernel: logitech-hidpp-device 0003:046D:C081.000A: input,hiddev99,hidraw7: USB HID v1.11 Keyboard [Logitech Heat Gaming Mouse G900] on usb-0000:0e:00.3-4/input1
ago 13 10:03:43 tesx-pc kernel: logitech-hidpp-device 0003:046D:C081.000A: HID++ 4.2 device connected.
ago 13 10:03:43 tesx-pc mtp-probe[4632]: checking bus 7, device 5: "/sys/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4"
ago 13 10:03:43 tesx-pc mtp-probe[4632]: bus: 7, device: 5 was not an MTP device
ago 13 10:03:43 tesx-pc systemd-logind[983]: Watching system buttons on /dev/input/event28 (Logitech Heat Gaming Mouse G900)
ago 13 10:03:43 tesx-pc mtp-probe[4675]: checking bus 7, device 5: "/sys/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4"
ago 13 10:03:43 tesx-pc mtp-probe[4675]: bus: 7, device: 5 was not an MTP device
ago 13 10:03:47 tesx-pc kernel: usb 7-4: USB disconnect, device number 5

# --- putting the mouse down right after turning it on (it doesn't happen always) ---

ago 13 10:03:50 tesx-pc kernel: usb 7-4: new full-speed USB device number 6 using xhci_hcd
ago 13 10:03:50 tesx-pc kernel: usb 7-4: New USB device found, idVendor=046d, idProduct=c081, bcdDevice= 1.03
ago 13 10:03:50 tesx-pc kernel: usb 7-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
ago 13 10:03:50 tesx-pc kernel: usb 7-4: Product: Gaming Mouse G900
ago 13 10:03:50 tesx-pc kernel: usb 7-4: Manufacturer: Logitech
ago 13 10:03:50 tesx-pc kernel: usb 7-4: SerialNumber: 0E6C36503233
ago 13 10:03:50 tesx-pc kernel: input: Logitech Gaming Mouse G900 as /devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4/7-4:1.0/0003:046D:C081.000B/input/input35
ago 13 10:03:50 tesx-pc kernel: logitech-hidpp-device 0003:046D:C081.000B: input,hidraw6: USB HID v1.11 Mouse [Logitech Gaming Mouse G900] on usb-0000:0e:00.3-4/input0

# 31s later (it seems the delay is fixed)...

ago 13 10:04:21 tesx-pc kernel: input: Logitech Gaming Mouse G900 as /devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4/7-4:1.1/0003:046D:C081.000C/input/input36
ago 13 10:04:21 tesx-pc kernel: logitech-hidpp-device 0003:046D:C081.000C: input,hiddev99,hidraw7: USB HID v1.11 Keyboard [Logitech Gaming Mouse G900] on usb-0000:0e:00.3-4/input1
ago 13 10:04:37 tesx-pc mtp-probe[4724]: checking bus 7, device 6: "/sys/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4"
ago 13 10:04:37 tesx-pc mtp-probe[4724]: bus: 7, device: 6 was not an MTP device
ago 13 10:04:37 tesx-pc systemd-logind[983]: Watching system buttons on /dev/input/event28 (Logitech Gaming Mouse G900)
ago 13 10:04:37 tesx-pc mtp-probe[4767]: checking bus 7, device 6: "/sys/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4"
ago 13 10:04:37 tesx-pc mtp-probe[4767]: bus: 7, device: 6 was not an MTP device

# The line "HID++ 4.2 device connected." is missing
# and the device didn't change name to "Logitech Heat Gaming Mouse G900" ("Heat" is missing)

====== g900_initrd ======

ago 11 12:05:13 archlinux systemd[1]: Stopping Rule-based Manager for Device Events and Files...

[...]

ago 11 12:05:47 archlinux kernel: input: Logitech Gaming Mouse G900 as /devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-4/7-4:1.1/0003:046D:C081.0008/input/input12
ago 11 12:05:47 archlinux kernel: logitech-hidpp-device 0003:046D:C081.0008: input,hiddev99,hidraw7: USB HID v1.11 Keyboard [Logitech Gaming Mouse G900] on usb-0000:0e:00.3-4/input1
ago 11 12:06:00 archlinux kernel: usb 7-4: USB disconnect, device number 4
ago 11 12:06:02 archlinux systemd[1]: systemd-udevd.service: Deactivated successfully.
ago 11 12:06:02 archlinux systemd[1]: Stopped Rule-based Manager for Device Events and Files.
ago 11 12:06:02 archlinux systemd[1]: systemd-udevd.service: Consumed 4.881s CPU time over 50.277s wall clock time, 48.5M memory peak.
ago 11 12:06:02 archlinux systemd[1]: systemd-udevd-control.socket: Deactivated successfully.
ago 11 12:06:02 archlinux systemd[1]: Closed udev Control Socket.
ago 11 12:06:02 archlinux systemd[1]: Starting Cleanup udev Database...
ago 11 12:06:02 archlinux systemd[1]: systemd-tmpfiles-setup-dev.service: Deactivated successfully.
ago 11 12:06:02 archlinux systemd[1]: Stopped Create Static Device Nodes in /dev.
ago 11 12:06:02 archlinux systemd[1]: initrd-udevadm-cleanup-db.service: Deactivated successfully.
ago 11 12:06:02 archlinux systemd[1]: Finished Cleanup udev Database.
ago 11 12:06:02 archlinux systemd[1]: Reached target Switch Root.
ago 11 12:06:02 archlinux systemd[1]: Starting Switch Root...
ago 11 12:06:02 archlinux systemd[1]: Switching root.
