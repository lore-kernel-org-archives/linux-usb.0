Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7482376A02
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205675; cv=pass; b=sMkX4XAAu1zhanRRVlj2Ru6ommd91yqCfhrt+XUaDmEMQ2SnvjU0FzY2pSP9g0/Ca6VP5lYJaW2momTzpGgY6KErB5E00n2uRow69kcMcspKcBEIH3Y0xGU/PUsPgK8oN9ej3gXATmUQcREmsLw6nlR2p/eeu+N3P1YSebh2Tnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205675; c=relaxed/simple;
	bh=ytCcTTAesC0KddsmsXhnC9l757XoB5dPRDntVmfatC4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ClygL0GoPftl7DGa/x7G0V3ueETGEbH7vWr9JQPDQRBUSRiBYgGjhLfIq3w8SsEqxZ9XNGkPBue49FdPmxky39cSd6F77avjif5mm+7A8PxJCS0HAIXV4+HW+yRQxfka3oDqXmiziLLyhWC03rmIX4PWILzYYGGdvcso2izl/ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mztkwwxg; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mztkwwxg"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d9004f39d3so22192135ad.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 12:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788205673; cv=none;
        d=google.com; s=arc-20260327;
        b=afTqfc7eoio+Xg28krRrVpRSRcny1qBoKR87/VQxbMLQKUaw9OqFwvXpRP5xS7D2M4
         o61uaMnrLeJIQcNwv0DLXCEUiwxSJHLoolJStXucZ0AeF+JZhSyhOzfeLJIW9PAwhst8
         Q1FHP1p3k1tHtobL0OYkTwIdQpkbqn5Be5dlFCyozlecNiAvioiVEhqXx2sVi/JAvvSy
         VAwF4PdNAlysfnAd0xkjT/BoYHWfIEI0E0nH+nZXtv1RB6reDwJ/LvaBodYxJaOG1Wpf
         S09H2O+prvw3UKbGopEsKXkaHBWHYF589PTDbEl4QOOk0vYxu6aCdowB1tFOFg/UQfJb
         qCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nxOzsTK3muTKHjTGZ8xy6J9THmLYTN5UYn7IoE/pri8=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=rMJhUUWvtwIYJ4Yjdv68tM4KhHTui1mKjpNDsZ2bPLcDzmwjb9ItiUFIaKomBahWCt
         AR5YrpVMdx/kPL4wjT0M1RlPPaSMOosY8zoOI58Ikso8tqP0vJP4c0MiVrrnKzO93swH
         5PkJ4OYT70KgtLnmMJukFBkBd4IKulnxS/+rI5LOD/Wqz/UeQpt89JgkRqYqmVUSIgje
         ruSHuSLvARFGtsPLw2TdqQ7+hqwVfdjgTiZTz4Iv4AulbrzxjAOf0vmvc0JCMxKyr2TU
         euiZ7VawxObOmi/qiOMydVseklnfkQc0piz3Otx3tLlLOFeIFvR/aosKqrKaGwXkkVKX
         HF9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788205673; x=1788810473; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nxOzsTK3muTKHjTGZ8xy6J9THmLYTN5UYn7IoE/pri8=;
        b=MztkwwxgfRa0oxsjG4fWdGgIiIT4clX6g032INehkhuqqBqEsUV7KmbT4gorclohaR
         zzQVSm1iSR/sIjaoq8BV97Ww4IxgJi6KRqzjZFgfZwdS43d6wVVroTBSWNuyGw5VFoG4
         g9frTxl7eLkvWDTCz5Pzg4vjgorWguiw9QkJuR7dqpcHx/FvV/lW0q/ZoS1/J9B2EkTp
         wu5q+e/5RKvKZYSOhfDrxbTIpJaEMsfu3urxk8QkXMlXqYVyFhpFrw8deoPzfrCka18b
         jzZ6JsF4VrPgb+u/O6wpy8+zygLOPED5lKrbJHOiGLSN8hBlUXSh8TVN6J0ErZWbWP3e
         oalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205673; x=1788810473;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxOzsTK3muTKHjTGZ8xy6J9THmLYTN5UYn7IoE/pri8=;
        b=Iwhl3UGm9dVd+mSjOkIF8gfmJMb/UuY2e3pn0IA6N1RozINq6h3G01zFBTpZ90+z6k
         Jo5Aqbe7ytq3UZtS8jXF/yiApI8ISOCeC/+b50nbKysdE4E2MhbzLjs8zsxRzfVHEN0c
         fzXOgAPPN76etPd5gykSdJjqRPIgBum/NjfRC0WTBml6Gkf9ZN/FKbjyGXWgCSBgtgND
         ++bQ6RVhP5BA4TsX+qHKzBoYOGpAFDhjB0FJyxDnSHlyg61zrGxP4R011DhziMlcyzEz
         BGxiBRGJadD07yRsTrZqF3Qd7epKnL/Lu51m7JI4dhlFbj+4t1f0wNgGt1h54O7wa46S
         UV/Q==
X-Gm-Message-State: AFuF++maJ2lRWeQPNyFcsAbQ69zOIdjB8rUSiWumWtIVQZ2K8rW1bTwV
	KBUyOdz45lc1JcI+CKJLVX31Fwu64+YZFhx3bkDBnx8n2slzmR2k5yKvbXyrVEE+OYmdyBJiFGA
	LXBHWbr1/VqnUBppqJHvgvY4ZkTNzjBesVFp8
X-Gm-Gg: AYBFou07hz1I2Z/CSfJSmpBQZNmHd1YCm7ZuxXHAOGuyU2hN4QRgSG4KefQK7Spu05y
	Dt3pIWy19NAqfsM3XXTXgZXwzdplCLVoyTCldNRXtSnbhRp7gVTl3qZ7uZ0Q4Xi7dDTuicaGW7f
	ydqY8UA6yiEMN+uKahade9ng1xold3wyBPCC0wkv+jOrWb76cDm+R2Eyglr31OJy5pjrTl5kToh
	UE0exug6ZSzTIvOxEa2/WuXywY79bqlRcKiuCyRpleUVoKNd5czYF38r1XjhlO7SY5PmvOm9C4t
	WLcnYyFiW6U2WpuzGzsun9CcKo4F4HaPliN/ray34WGuHYdtfJzWVTrpn8Dwk5Ax0sYfx/DxGOq
	t8EDXCh50PkKu7TUrDKkiQsxAZtHqxsi5G661zKn8NdeiL7p7bCJ2kiPPb64=
X-Received: by 2002:a17:903:1967:b0:2d6:3c2f:6a5 with SMTP id
 d9443c01a7336-2d94a8f4578mr38215115ad.14.1788205672937; Mon, 31 Aug 2026
 12:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dana Goyette <danagoyette@gmail.com>
Date: Mon, 31 Aug 2026 12:47:17 -0700
X-Gm-Features: AcwNN1XeX7cilutrAQgVdJ18TH2F3pi-ZHlgpwD_9IVxJv6srFCOZZWihM4igKM
Message-ID: <CABS_1wFcX0J_0fH9kdmXbTpGkQNJ=zKXNQKqYJUxO_HEt2zwVw@mail.gmail.com>
Subject: Getting Thunderbolt stack to work on Redwood Ridge, just for the heck
 of it?
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I recently got back my old Supermicro X10SAT (Haswell C226)
motherboard that has a Redwood Ridge Thunderbolt (DSL4410) controller.
It seems like the Linux Thunderbolt stack doesn't support this
controller.

0d:00.0 System peripheral [0880]: Intel Corporation DSL4410
Thunderbolt NHI [Redwood Ridge 2C 2013] [8086:1566]
        Subsystem: Device [2222:1111]

The Windows tools say the NVM version is 18.70, and the UEFI setup
interface says:
Intel Thunderbolt Specification Version: 1.0
Intel Sample Code Version: 1.7
Thunderbolt Host Chip: Redwood Ridge

Thunderbolt devices connect automatically in Legacy (SL0) mode, but
putting it in Unique ID (SL1) or One Time Shared Key (SL2) mode
results in the inability to approve devices from Linux, because the
NHI driver lacks the PCI IDs.

Here's a bug report I filed way back before I gave the machine to a friend:
https://github.com/intel/thunderbolt-software-user-space/issues/67

Even in Windows (using Windows 7 for testing), the device seems poorly
supported.  In SL0, the Thunderbolt tools for Windows don't show the
attached devices even though they're working.  In SL1 or SL2, I had to
install an old version of the Thunderbolt driver and application to
get device approval to work.

If anyone finds it interesting, I'm happy to collect logs and test
patches, or even send the board + CPU + RAM to a developer if that
would help.  In the long-term, I'll end up replacing the board with
something newer anyway.
