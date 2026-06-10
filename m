Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7E26B971
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081260; cv=none; b=Sx5X2q5S6TwvzGX5krJ96WSS8GYTsz2mOMOT10pMKlL1kj4Lg4YS+5TGYCyKJ/YuyKR2wyMGUZDLvL2GLAKrXejvinUjy0FSeg8RlMjGzTpGBTsfVyLtZ5y7CdIewDHTJ1FoSBnQfXxCmSBqYrfH+JkN1WSlgh22OnQMFMWb46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081260; c=relaxed/simple;
	bh=HK15SMFGqGFB5dy9wkOYSIixsAG+ODoJmMn9s3DCY08=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jd0IZsJQjJMcvj7JcgfWPVqooqWQ6xBjgXbJNHMPAMqqq5V1y5lNbR4KN0A4ws4iXio7CoosCPKL4aRdm/Kd3ClbPS/pA7pshzd/Y0ltTeuqVCcmrPiW7FhihjQmzEYrGxfc6rRq6NOesdb6Md12+ntC2/Kn2ksY8VvfWbZAuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIy88eYr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIy88eYr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46018d6c00aso344760f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081257; x=1781686057; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OERKqt1g2K8cSM2CQc683H+z2iXNM2E/sBMWVP8ew3Q=;
        b=gIy88eYrpImcaDJ+G0nicql1XWrKgTEE7Vb0rQ6xGOzVGZWCebWcba/xjzqe5wVIbN
         YGWPCLuhp7659qZWa+O9zsFQ30Q5w4Ghj4e0Z26ASX0CpyCLl677ejwRC4TxaSHzMOFI
         haSlUrlLj/rhCkZkNlrAKhArwHlqVyr4PUGDZlNhWGl7wAJcasB9BkHPK5dm0fuhrFZP
         v3XpHIeeqgSoaloey/baTIE+7goqhpuB+GJuPfbXEiLJ+sPsrH3hBkpzYAiWTNXdaIQ3
         JtU9Hk3Flsw9C1HtLOc20wtM9rMJtRvUssidzR+mr5l6B+S8VfOZEIs8IBfM6jXacA5z
         DS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081257; x=1781686057;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OERKqt1g2K8cSM2CQc683H+z2iXNM2E/sBMWVP8ew3Q=;
        b=RC2MoZhXg5uUtPxCWwkPf1oF6WHFYbpYaMHCJhFpWW/J+Ky+n2JNo/H8rifKBb08zP
         HyMNbYZ0+ypvhDa+PPEAkRDN3Zt+eF9fnC3Ylqe6lzRp8914gM9U3i0XZX49A5Y26H7x
         HWftVcEA2YqdT2aDaNisi5sUgvSShP88l+9dkdV/3CSKHO/czzfdZ3w+DSHrdwGf/TvG
         CIk1r3o1GkPiHI7866lzUnOVefrmQqFHI0PJQlLU8qu8sHu4gGoPgSDoISEn/EyqFDik
         QR31UlnBQry3n5nDFVmZBxa3ayCW6tfksXowOYDq+I26AUXziytUrV2NyvIcFPTemYOA
         GYYA==
X-Gm-Message-State: AOJu0Yzy3H0f1dxQhTkyL8kiVXJ6nJQwKS4A9e8TX8tYGwcK1uerMCBb
	8+cpjXWBVjDKfwajufoGRetW85UZQwlYc/+BJ1j5MFqZN7Jh8C66yeM6Dxdi5RsoybQS
X-Gm-Gg: Acq92OGahpviY7itixUkAEVh4nAOhRtgZiVGd6s6TDbq6fz72HzrnQS8iKN2UcpiDkG
	/vMB5kRUmwb9dDT9NPqKENw0I1YE0PCzArscZbBSvm2FMTmPGRKv9XS+os48NiEBtxWCaD/S8G1
	pmKv0iQI9VWmmwpGR6luCYvMMer9hOW3XWafVDuDX7uEKvyAdRYfP1DNdkD95LyiXyd/NpMg2Ht
	bhEaUaRTniCoWNH3hZ9tempuwJ8FLTB8OcScScnEZvXAwOQuCw1f692sZ9kKWydwhEjiqnWOGNo
	SdJWiBFyYGc3pu1ya+yWAjrWR0ZTVp6kPJnBEM052cISBHusRecVLquylVnK/vbHUcp5dSaeQOj
	QbY+krBmwIPtx+P5xCnf5U3B9G4Ba3QjayD22gAT41YNbLkNBik0k/MhUDKF6AUyigQ2N8IGy7r
	YwBcCImwzWUuW7n3eq/34UI2B1ckX8kKhR3v4PMrSD7mW2SuMvTijB4JRNzUJ0+EQSAeWrxYFWf
	HA=
X-Received: by 2002:a05:6000:2388:b0:451:51d6:5e24 with SMTP id ffacd0b85a97d-460566e8604mr3700520f8f.6.1781081256237;
        Wed, 10 Jun 2026 01:47:36 -0700 (PDT)
Received: from localhost (32.red-80-39-29.staticip.rima-tde.net. [80.39.29.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm123273485f8f.27.2026.06.10.01.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:47:35 -0700 (PDT)
Message-ID: <d6c10dd0-daff-424e-bde4-8f47a036a8a0@gmail.com>
Date: Wed, 10 Jun 2026 10:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, en-GB, es-ES
To: Mario Limonciello <superm1@kernel.org>
Cc: linux-usb@vger.kernel.org, SOUND ML <linux-sound@vger.kernel.org>,
 SCSI ML <linux-scsi@vger.kernel.org>, NETDEV ML <netdev@vger.kernel.org>,
 linux-media@vger.kernel.org, KERNEL ML <linux-kernel@vger.kernel.org>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [FYI] Several firmware files removed from linux-firmware.git (affects
 multiple drivers)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

In commit 1e6faaf837aea079582214c9c1382e5476175576 [1] of the
linux-firmware.git repo, the following files were removed due
to unknown licenses:

acenic/tg1.bin
acenic/tg2.bin
emi62/bitstream.fw
emi62/loader.fw
emi62/midi.fw
emi62/spdif.fw
ess/maestro3_assp_kernel.fw
ess/maestro3_assp_minisrc.fw
korg/k1212.dsp
lgs8g75.fw
mts_mt9234mu.fw
mts_mt9234zba.fw
myricom/lanai.bin
qlogic/isp1000.bin
sun/cassini.bin
ttusb-budget/dspbootcode.bin
vicam/firmware.fw
yam/1200.bin
yam/9600.bin
yamaha/ds1_ctrl.fw
yamaha/ds1_dsp.fw
yamaha/ds1e_ctrl.fw


This affects, at least, the following drivers:

drivers/media/dvb-frontends/lgs8gxx.c:#define LGS8GXX_FIRMWARE "lgs8g75.fw"
drivers/media/usb/gspca/vicam.c:#define VICAM_FIRMWARE "vicam/firmware.fw"
drivers/media/usb/gspca/vicam.c:                pr_err("Failed to load \"vicam/firmware.fw\": %d\n", ret);
drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:      err = request_firmware(&fw, "ttusb-budget/dspbootcode.bin",
drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:MODULE_FIRMWARE("ttusb-budget/dspbootcode.bin");
drivers/net/ethernet/sun/cassini.c:     const char fw_name[] = "sun/cassini.bin";
drivers/net/ethernet/sun/cassini.c:MODULE_FIRMWARE("sun/cassini.bin");
drivers/scsi/qlogicpti.c:       const char fwname[] = "qlogic/isp1000.bin";
drivers/scsi/qlogicpti.c:MODULE_FIRMWARE("qlogic/isp1000.bin");
drivers/usb/misc/emi62.c:#define FIRMWARE_FW "emi62/midi.fw"
drivers/usb/misc/emi62.c:#define FIRMWARE_FW "emi62/spdif.fw"
drivers/usb/misc/emi62.c:       err = request_ihex_firmware(&bitstream_fw, "emi62/bitstream.fw",
drivers/usb/misc/emi62.c:       err = request_ihex_firmware(&loader_fw, "emi62/loader.fw", &dev->dev);
drivers/usb/misc/emi62.c:MODULE_FIRMWARE("emi62/bitstream.fw");
drivers/usb/misc/emi62.c:MODULE_FIRMWARE("emi62/loader.fw");
drivers/usb/serial/ti_usb_3410_5052.c:MODULE_FIRMWARE("mts_mt9234mu.fw");
drivers/usb/serial/ti_usb_3410_5052.c:MODULE_FIRMWARE("mts_mt9234zba.fw");
drivers/usb/serial/ti_usb_3410_5052.c:                          strscpy(buf, "mts_mt9234mu.fw");
drivers/usb/serial/ti_usb_3410_5052.c:                          strscpy(buf, "mts_mt9234zba.fw");
drivers/usb/serial/ti_usb_3410_5052.c:                          strscpy(buf, "mts_mt9234zba.fw");
sound/pci/korg1212/korg1212.c:  err = request_firmware(&dsp_code, "korg/k1212.dsp", &pci->dev);
sound/pci/korg1212/korg1212.c:MODULE_FIRMWARE("korg/k1212.dsp");
sound/pci/maestro3.c:                          "ess/maestro3_assp_kernel.fw", &pci->dev);
sound/pci/maestro3.c:                          "ess/maestro3_assp_minisrc.fw", &pci->dev);
sound/pci/maestro3.c:MODULE_FIRMWARE("ess/maestro3_assp_kernel.fw");
sound/pci/maestro3.c:MODULE_FIRMWARE("ess/maestro3_assp_minisrc.fw");
sound/pci/ymfpci/ymfpci_main.c: err = request_firmware(&chip->dsp_microcode, "yamaha/ds1_dsp.fw",
sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1_ctrl.fw");
sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1_dsp.fw");
sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1e_ctrl.fw");
sound/pci/ymfpci/ymfpci_main.c: name = is_1e ? "yamaha/ds1e_ctrl.fw" : "yamaha/ds1_ctrl.fw";
sound/pci/ymfpci/ymfpci_main.c: name = is_1e ? "yamaha/ds1e_ctrl.fw" : "yamaha/ds1_ctrl.fw";


[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=1e6faaf837aea079582214c9c1382e5476175576
