Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C184025B087
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845442; cv=pass; b=Ok9bN12KZZv/0ByoMtNwl8afpsTrmWVf5uo9zzCYrpiKM/wTBIW3vcobuiqQZ82M3qcSmRATfWMun4c8EXm84dS0tt5zk953Diq6e7vfe2k/buteDUFFrcSRQQllEHoMUl3aRTBdRVB9EFZnUgghCq6iYH5xuWd5S+WWlc4RVEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845442; c=relaxed/simple;
	bh=QNkzcXLrIeA9PGjoW+K17U+l2f1/yAmziuUSvwf3ls4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WVQyCF7rT2QnjKf2CgMki/3XP693w1ZK0dL/Pg9pjB1IRoKmDovMz1AJpiVampv4YeCf1/br+KLz6QIhlxAfDzylBo9/OFLJEXBa/X0NB0+SRLAH7NiV8Pwhr6MTFtAJK922gsh+fpr4tGW8yDbNx0StAwDdVL2r89NErWtpeMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXJ5Y6qO; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXJ5Y6qO"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a2363d4aaso57887137.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 22:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788845439; cv=none;
        d=google.com; s=arc-20260327;
        b=DsRoT544regpVE8mudJijAYFeljXp3n9Ybnb3oeHfhojCw4ksJ405ZtZH+faz+ZmDe
         Djl5kKGVK2wakNYdS5xtsxCKo9KTtBl5SP6eZdt9P43gAVUIKudIuT0uKec5Fk1LGOtX
         SCd6rP5mDsMZkGGw1/h2hfYcrXcDwtGU24HCJEP+GJCuaZl1I7o7O6nOHOch7+4rGxSU
         5KLBBnKihLE2yrzfRNV+LSksdyS9bpmV2vx0khqC27lWnZMRardquNXQPynk9ByuB03y
         Og927lF0hlIf3qqbLvDftNkYir4LwC7YNenBHyOhVEpdQk32gr4+fwAGpxQQv3M+5WQH
         Th3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SslZo4KJYgjxynFL/9PZ+8SOQPYO/z372U1dNjmcOM0=;
        fh=58/meS8eo9AjGxdMXwNr099K5fAicO3f60TlyHWn4wk=;
        b=RNVF9+6+SX2aJhz2d/F/pkqSFvZwXtP0C/TdSDjb8+uUpLMqY8f+AiLqAUn2sbNatR
         ODPkA0CDt5gmCaLb5GYmM17vtmekVQ1+9nUXrRtee9YOlCTjhPgK93AJxEh6mL0tOHSx
         Vi7r7sJHvggXE7i3ze+gBTcjtr8nKeYAtl45oWztNRnLzAoAKRaBI7MyFeSwoi2S9q+s
         kKgUIIFEvksB6Yoak1xw/V0IBQ0rVxCsZjyP0Dpt3y3dWyMhnhI4h9kuf+omXeinDORC
         5Jp8pybkGDXqFSKAA0BEmOT5E4hahXJJIoN/iN3SmaqZmObjICKQboHiPw7B65ZrTbVv
         4goA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845439; x=1789450239; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SslZo4KJYgjxynFL/9PZ+8SOQPYO/z372U1dNjmcOM0=;
        b=HXJ5Y6qOSbBV5WjPg9FeS7up0yeXeKr8ctMdPcz2UrVYkYAkNNoWBG3vuLUVPfRXW4
         4dI+Ye9PNX20iR8UrfBxL0RufNBkW5VfGdXZG1VOBtROlRtlvhNRh1Ku6qbwVw7G9y/5
         qR+zJtLLtUlXTVitudRZKRLY6vIzjpYrxBuTQ02nLskz3+6FlrQ2oAj/RMA2iMqv6Xu9
         g3BdJ2u/AGF1bdPzVVkkP5/m3Nu2Lyu6kNwELPm9t+W41tmd0vHU5WpVspwbsJ31NJL9
         1c4ddcHwSkn8bUbHU08JQBfFHtlR0QUbhe8/C9l4rZX+OfVGP0RSppfd7NUJ2mvfz+0O
         VUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845439; x=1789450239;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SslZo4KJYgjxynFL/9PZ+8SOQPYO/z372U1dNjmcOM0=;
        b=i4TxXi9HznCSxprKfNhr4YtLr+bywJP7b+JHeevgPrYzs4X+s3/UxVcjP4H/oglJm5
         +d70f57b8UDJAncnDlk62LT8P4OiPtzS6GANW9ABqmHiECrvJHyvb43VbP1Rfc6xrPUP
         qy9T3y2ZcIjvRyTviVL8MpRRlPCd/Cwm1zH+IchM9CBtFqECeeyU1ZrOxd9e1Zd26KrO
         qD8BNLfTkDtf1Rai2wjuYJo6wktg4fVZJA1YCuw3gOqP400U1nNkJlqhKMH5p5u89+Uv
         Jc/FT52Bn6iieQjgorGyabjeiQ9eHLl9kaR8OLSsweFmUCpDqEn5WglkW7/ED0Fe2i10
         NR7g==
X-Gm-Message-State: AFuF++nnBrwbFh3KJXEQv849ZQ3sPOaCpAIcIUB3S5Y8obU6sL68zEoN
	lzvB8MxjcWhxiYTzbNLZuDsqXK5Pumk+u8YXi+vwmOhVvO2GN8r5Gxwmp8BZYIpwIpffW7kOnGS
	YtrXJ3hdFJUzvZwYZOavW0zveH3y8/M6SUw==
X-Gm-Gg: AYBFou1vFtOX4UEQ2B7ql3tS9ALUQIwZzheQlcdLs8/VKWC1eUQq81WzkY6GW/vp/zn
	ClX9PyXm3a8UJOuAlTYzmzkZaA7pmj7v6EIkUo20i4IOzugpEBW2nk7btYhCfAMQkuPyShDWUPF
	FSUoJgPI6RrxDy1cbr4kctbagex3KuPTMjmN4LnOsqBfVAi3YeHd5LTQ5leQVzwDECNe+8zo5As
	WX55Shb3yAbqkbudHJzbA7YF0WqLMJPJ3Vv50lj9X76IBvIiUqjI3euKCclsgas5ysb1hIAl4gm
	6on88hLfyCF6OpZ4Uxl3l9dtn4cNjNFijD+54OuLkhM=
X-Received: by 2002:a05:6102:a4a:b0:78a:135e:feb8 with SMTP id
 ada2fe7eead31-78a608afdedmr2340994137.0.1788845439517; Mon, 07 Sep 2026
 22:30:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 00:30:38 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 00:30:38 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
Date: Tue, 8 Sep 2026 00:30:38 -0500
X-Gm-Features: AcwNN1WHUy03EnwPiSfMvWigKYPM8tqaLmNBUA01fCl8DPvue-z8tKSs335aexc
Message-ID: <CAPGafdkBb49YFV+d0rYjbi4QjifCUr1Wos6C5TZtDQzN6-pn+g@mail.gmail.com>
Subject: [BUG] xhci: Acer ANV16S-41 internal USB camera never attaches on AMD 1022:15ba
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"

The internal USB camera on an Acer Nitro ANV16S-41 works under Windows but
does not enumerate under Linux. This is before uvcvideo can bind, not a UVC
probe-control failure.

Hardware and tested software:

- Acer ANV16S-41, board BRZ_SKF, BIOS V1.14 dated 2026-04-02.
- Ryzen 7 260; Arch Linux 7.2.2-arch1-1.
- xHCI PCI 0000:65:00.4, 1022:15ba rev 00, subsystem 1025:1969.
- Camera USB 0408:4035 rev 0004, using Microsoft usbvideo on Windows.
- Controller path \_SB.PCI0.GP17.XHC1; camera under RHUB.PRT1.CAM0.
- Linux USB2 port usb3-port1 is hardwired; companion usb4-port1 is not used.
- Windows USBXHCI version 10.0.26100.8972.

On 2026-09-08, a read-only check also finds no camera USB device or video node
on 7.2.3-arch1-3, with BIOS V1.14 and the same controller IDs. The detailed
controlled boot traces below were recorded on 7.2.2-arch1-1, not 7.2.3.

Linux results:

1. No camera USB device or video node.
2. Resuming the controller/root hub to D0/active does not reveal the camera.
3. Cycling only the empty camera port changes PORTSC from 0x000002a0 to
   0x00000080 and back, with no attachment.
4. Unbinding/rebinding the empty xHCI controller recreates the root hubs but
   does not reveal the camera. Original policies were restored.
5. A separate boot with usbcore.autosuspend=-1 keeps this controller and both
   root hubs continuously active throughout a 42.9-second trace. The camera
   is still absent. The capture contains 121,343 events with no reported
   drops across 16 CPU buffers.

In the no-autosuspend boot, the first camera-port write is PORTSC 0x000002a0
at 0.737260 seconds, followed by the same status at 0.757631 seconds.
No later attachment or enumeration is recorded. PP is set, CCS is clear;
this is not a physical measurement of module voltage.

Successful Windows cold and warm boot traces show standard root-hub
SET_FEATURE(PORT_POWER) for USB2 port 1, approximately 100 ms later a hub
status of 0x0101/change 0x0001, then normal port reset and enumeration.
The unused SuperSpeed port is also powered/disconnected (hub status 0x02a0).
No proprietary USB request enabling the camera before attachment was found.
Raw xHCI PORTSC and USB hub status use different bit layouts.

The Windows ETLs retain USBXHCI/USBHUB3/UCX and ACPI events with embedded
build-specific schemas. Local decoding recovered 13,249 cold-boot and
14,015 warm-boot UCX records. All 5,185 XHCI/HUB3 records match the native
Windows exports on comparable fields and timestamps within 2 microseconds.
Opaque structure fields and UCX/ACPI payload semantics were not independently
validated against native field exports; decoding limits are documented.

ACPI SSDT31 supplies XHC1 power methods, despite their absence from the
DSDT device body. Its platform hooks call M000, whose only definition in the
captured SSDT17 is empty. SSDT9 XHC1 _DSM advertises functions 3/4 and returns
constant buffers. Windows logs method names but not the _DSM arguments or
underlying register operations. No verified camera-enable method was found.

Matching Microsoft public symbols decode the target controller's recorded
flags as 0x00040060000000a4 / 0x0000000044050000. The three
RestoreRyzenFeatureBitsPostControllerReset flags and Needs180msDelayPostHcReset
are not set in any of the ten saved controller snapshots. This is an observed
flag state, not proof of every operation performed before those snapshots.

The unresolved stage is controller/platform initialization before electrical
USB attachment. Maintainer guidance on a targeted xHCI/PCI/ACPI instrumentation
point or a known AMD/board-specific initialization requirement would help
identify a justified patch. There is currently no proposed fix or known-good
Linux version, so this is not being presented as a bisected regression.

A separate same-model/BIOS report describes the same symptom:
https://www.mail-archive.com/ubuntu-bugs@lists.ubuntu.com/msg6302306.html
Its claim that no XHC1 power methods exist does not match this laptop's SSDT31.
