Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794667414;
	b=quSVyOPyhNN7QFHrVqNUTJliZNmLP4uUk4+QKyHe1EcalCNhlBnNVU7nJhoYrx9U2OkZ
	 d7thf4DjKxZGcmbIe85aexElS/xZ4KCevHFu5UmU12iEmXlt8qwUdKX1okdFzBjnMJxB2
	 hH9rngBrQaxLQZO1cpBY4UMJFOk4QX3nCl0XBaiQvrJ0/xqdkLpyPmNNK97g4nkmb9NYL
	 Iof0XYvosCzitWAKKNvALohi3x/irZntQrdUE64GV1joruquxhGwMjKMoiJDdiuZn46bJ
	 qbiChDIRFlAoGyaemfpYgyo18+6tPq22+MKcRxaQaac0X2Fhc3HK3F3+nWulQGxeG9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=n8d3nIcc4KHUleuVPZa5wOWAwMuLh2Id+cG8KGWlQSE=;
	b=2DeS64o0Wc2RCFq73N90tcH9aovd7nOI67kXVxHApqveIqx7G+tvXl3IobV1VNO2md5n
	 0jo+UtW/VGPrGbwnJwUTOd914mLhoSXudJ7VrIH/1P8flx+lUVXNSvoY94xvKIzZjnGNh
	 sE+H4wxTGvoTlhmXlrxlIcv+sE9Ceo2G/O6XxXeaKhSTEgxv3GIpNgYn1+JoHSOC2VVc5
	 ossim0YcKZH3U93YVQHXuYb6/Ojkkm/C/fdCMgfLerXxgrb8t5yFKKr2kGutclWahK9A6
	 17ISbDO7DZbHgp/wU0ZPrtnHWJE1QQs2SOJTDnVD+m6MtpvPIbslUV9ObENePPQUkVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MANz07a1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99B0606A32E
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 14:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99B0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MANz07a1
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so396527066b.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 06:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794667412; cv=none;
        d=google.com; s=arc-20260327;
        b=bZeKjUprX+kX27P4AHg3BMJHi83y+lepTr0P0shXPUL7K65ysR6E/8Yz+FiYc32rV3
         Dm4pjrpDN7CdPZoAt4IQ2FisZRSJ37TESCHeqm6zIRRsNGold+pmVdPvGFooPLdbFOqi
         URcmaSmUg1UaDITutxZTFB+jcxp9bc+AjOqLNwKTF22yHt/9ihwS+n66f3YSxxctYfS1
         7Dn+cR4+UKEz5ovBCvGiQW0jV1M1LqwB8USSxPawebUQWtKDRi4GzJgIT61Dm9kOgIAs
         bOVsx7zqM5c0DXxBULxN+Z62Gz7fyXBwSa34ttUyWFf3TQovU4Xx+qFst5pHxJwatpi5
         efuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=n8d3nIcc4KHUleuVPZa5wOWAwMuLh2Id+cG8KGWlQSE=;
        fh=hQmpw9XWzOkLlyHlKv3ocAocmcRPCzQVia8yT1Jl6u4=;
        b=T5olW/+9W4yud3v13D6Ojsiu4UCUjv4fzK0/luTfo2WUJjBRyPeEupDptvovR4t5qG
         rLdxd7PpLGi7yrxEQYmAPMbDNgil/LrbaEKMd4NTR76ClMPMoNYyo4VLV7rtPpcERMvI
         F87TqStBFbHrnemCUDfqeUtPORZTG7INdlBMTvjAAf0vk/EaJJsw1Qob0oGHlB2wwW0v
         SxiuqIXIXvsyNtIlay6c1MU9mRDPBE6DwT2Ny4xYDxTFyxjAVhaZERcQuyX5aQ+Es84O
         pdbxQ+r0fewI7U37t6+c4Aj2SnADieruJssl+E8i7AkC/pc1xqJEqxOzt6CWSm+7/3mI
         gcFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667412; x=1795272212; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n8d3nIcc4KHUleuVPZa5wOWAwMuLh2Id+cG8KGWlQSE=;
        b=MANz07a1fFswjmwmyEXFYHIuyRAiyfxnjRpMy+E15UetaxiNwf2lMFMxyv48pC2oz6
         /kHcUUNxKhky+lZ5ix2K9Yl9W9vwOc2CI452pDOjIEy1+4eBSiI5UxLr2KyDViZ5ZufM
         NByVbeOLol7Ly538A7/Yj+OB1Oa3iZRuFmpC1Lur+qxJIM5rkXPM2DTLT2zkMgJHDM2O
         1UVzxPTvIQHRnNfdNKXErt/DaJGLrFrDbKDAIDXXDShAd6/2w0eOvX+KUYybnNSakT4d
         Z5g33M9neB/U9jZW/W9vGYVAMG1solcabnkFQAw/f185VTvQGh4yVcGZvwWxPCmXnFCN
         E1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667412; x=1795272212;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8d3nIcc4KHUleuVPZa5wOWAwMuLh2Id+cG8KGWlQSE=;
        b=eyAeFyFhri/i36+e5T732Rpx0/Q8vShNH1VZdoHeBCMnNvrpjyvWPK2RCBSvalNu51
         aIOvxC9PAXotVzC1HvNFDb8Zd2R1xhIkf6w0KgHu5dVVtszhwdQeYckODzCLEjD0tVAc
         nHVODW+r6UPj2C9MWqxk8oMSrypj35l5hg5pPUwOGNiU2xWNVR4I+6f3Vi8Y/+m+QjhZ
         I0L+jORAuf8VEWc+G90txcqO/E38FWUz1aiH+amIAuc+qViOY2P2XGlDPMTZc6rtyxeh
         MCKMe099jlRgzwo4BohIo9+tJSwqsq2SIc2OlK16ILP2o/3h49ozJgIBni5Aj55QkYQK
         GS6A==
X-Gm-Message-State: APuU4Z/O7R/DPm9aWhI4oDBOeSrTKWxCumDXDmMFbu9uolW+X7xkLIrJ
	Y1TV2uw4UtXUM4EC1lb7/kBbZyAZ0uh1LbvkLorVHMUVzXbd5x+KaRG1euS05OhZ6IiYbjVjKW+
	dlY8v9Ool1SAgxgC8mSQBXU2G62BwPSCgLJnSv4g=
X-Gm-Gg: AYBFou3sVdS29amPfsFIg985JVNK0pzAqhZ7hDUH1pgcZ5qR4oDB/pxtrxjAn+BmlXE
	praXt/kX+yOt0YB1/3eCqsltLzketuGPgfRvgoJeBmWHRHm7dJoMuFzYjexWaVkPuhHpKWF9uyr
	9ZMVmbB0PDp0gJk8m3Ayg0yePmx4Uou8SA2z5pPLUG8Fy5T/bCqIPlyN3JNSn+J7I8BPvo73Hjl
	Fto/y+gQ5EtsZU2BAkd2mDeEL3/O2pareyVskwfRIsS3RwjEs8vSx+q1cIqopE8uxg6Rux6i5c3
	mC8jBLpjHAAxShjGv5xBWkCSEiUNAORrIbqWhyepQurT3xZY0o/M3aB9bjQxWZSmNV01gY/U9dl
	5TKXm3/v8vLPJ1k1E4ta36h6H4bpzlsH0lQk7h0zWdYTKRVt/Lv9VgsWgVbY=
X-Received: by 2002:a17:907:ea8e:b0:c50:750a:6a1b with SMTP id
 a640c23a62f3a-c50963777ddmr523167366b.29.1794667412109; Sat, 14 Nov 2026
 06:43:32 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?0JjQu9GM0Y8g0KHQvtC60L7Qu9C+0LI=?= <im.ilya.sokolov@gmail.com>
Date: Sat, 14 Nov 2026 17:43:20 +0300
X-Gm-Features: AclHuK8WL8o1vDo2MyOTKI4TD_8M9d76f_0F6nff3oTZTubSLlcNrztQvHOdjhI
Message-ID: <CAPb_5oevfY_4c0x2AUJQm5_7A6=kfPJFdVfksNM_dxeX1ZMc8g@mail.gmail.com>
Subject: [BUG] usb: typec: ucsi: Lenovo ThinkPad E14 Gen 5 AMD reports UCSI
 version 0
To: linux-usb@vger.kernel.org, linux-usb+owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Resending in plain text because the original message was rejected by
the mailing list.

Hello,

I would like to report a UCSI firmware/driver initialization issue on
the Lenovo ThinkPad E14 Gen 5 AMD.

The issue appears similar to the recently reported UCSI zero-version
problem on the ThinkPad T14 Gen 2a, for which a workaround was
proposed:

https://lore.kernel.org/linux-usb/20261103-ucsi-lenovo-t14g2a-v2-0-e85c659b56a2@resetko.pl/

System information

    Device: Lenovo ThinkPad E14 Gen 5 AMD
    DMI board vendor: LENOVO
    DMI board name: 21JSS0Y500
    BIOS: R2CET50W (1.32)
    CPU: AMD Ryzen 7 7730U
    OS: Ubuntu 24.04 LTS
    Kernel: 7.0.0-43-generic
    Driver: ucsi_acpi

Problem

The UCSI ACPI device is detected, but the ucsi_acpi driver fails to bind to it.

The device exposes the following ACPI identifiers:

HID: USBC000
CID: PNP0CA0
Status: 15

The driver matches the device but initialization fails:

platform USBC000:00: __driver_probe_device:
    matched device with driver ucsi_acpi

platform USBC000:00: really_probe:
    probing driver ucsi_acpi with device

ucsi_acpi USBC000:00:
    probe with driver ucsi_acpi rejects match -19

As a result, /sys/class/typec/ remains empty.

I used the kernel function graph tracer to investigate the failure.
The relevant results were:

ucsi_acpi_dsm()          ret=0
ucsi_acpi_read_version() ret=0
ucsi_register()          ret=-19
ucsi_acpi_probe()        ret=-19

This suggests that the firmware returns UCSI VERSION = 0, causing
ucsi_register() to return -ENODEV.

Experimental workaround

I built a modified ucsi_acpi module using the source corresponding to
Ubuntu kernel 7.0.0-43.

I added a DMI entry matching:

DMI_BOARD_VENDOR = "LENOVO"
DMI_BOARD_NAME   = "21JSS0Y500"

The entry reuses the existing ucsi_acer_ops, which assumes UCSI 1.2
when the firmware reports a zero version.

After loading the modified module, the kernel reported:

ucsi_acpi USBC000:00:
    UCSI version is zero, assuming 1.2

typec port0: bound usb1-port1
typec port0: bound usb2-port1

The driver successfully bound to USBC000:00, and
/sys/class/typec/port0 appeared.

Connecting a USB-C device also created:

port0-cable
port0-partner

This confirms that the zero-version workaround allows the UCSI
controller to register successfully.

However, only one logical UCSI port was registered, although the
laptop has two physical USB-C connectors.

DisplayPort issue

I initially investigated this because native USB-C-to-DisplayPort
output does not work on this ThinkPad.

The AMDGPU driver repeatedly reports:

DP AUX transfer fail:3

AMDGPU DM aux hw bus 3:
    Too many retries, giving up.
    First error: -110

wake_up_aux_channel: Failed to power up sink

Both USB-C ports work with an active USB-C-to-HDMI adapter.

The USB-C-to-DisplayPort cable and monitor work correctly at
2560x1440@200Hz on another AMD laptop under both Windows 10 and Fedora
Linux.

Unfortunately, the UCSI zero-version workaround does not resolve the
DisplayPort problem on the E14 Gen 5.

With the modified driver, UCSI detects the cable and partner, but the
monitor remains disconnected. The kernel also occasionally reports:

ucsi_acpi USBC000:00:
    GET_CURRENT_CAM command failed

Neither the working USB-C-to-HDMI adapter nor the native DisplayPort
cable exposes registered alternate modes through the UCSI sysfs
interface.

Therefore, I cannot confirm that the two issues are directly related.

Questions:
    1. Would extending the existing UCSI zero-version DMI quirk to the
ThinkPad E14 Gen 5 AMD be appropriate?
    2. Is there any additional testing needed to verify that assuming
UCSI 1.2 is safe for this platform?
    3. Could the failure to initialize UCSI be related to the native
DisplayPort AUX timeouts, even though registering the UCSI controller
does not resolve them?

I can provide the function graph trace, kernel logs, ACPI tables, and
the experimental patch if needed.

Thank you for your time.

Best regards,
Ilya Sokolov
