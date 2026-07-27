Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C602C15BB
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 23:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785195209; cv=pass; b=iyXtKNdHTN+LktMK8z/hmBvCPWKSAakIP+6bniQ+jqyraWpjwabKdBZO9LAvNgeWcmijDc/lXuZS9GYUjozeFgtquFttaWzBIYw8uUHRrlDdyyMIgpk9G8OivmJ7xNS3tuvr9pxpXpvY/4iAJjthH3oI3aorrSJKCrNWek2qGnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785195209; c=relaxed/simple;
	bh=ASL3pdkXTh76h6I6prT4idsZ02xcGS18Om+Dw6S4J6g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GyqNIZpOerOpETmPIEvMhPhId7YDxWs7hwxEQP5fES/fiu9/2jSE9MuTs0iOb8pFRkQa9bJoCI/cdqzkyXITf9tjAltI4czcW+uRigt0nQALu6cf9h1Ui5NCDC7NsM2kWHk9Yfs+maqFI/0pspoKvF7kh7ABiWVtGNwfKpowHU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UveCd3MM; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UveCd3MM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2707271f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 16:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785195206; cv=none;
        d=google.com; s=arc-20260327;
        b=SWFaW9+sF8PKrmJD0mbzMfZ0qSyTQTQW6n0viTCCwO0oUTDS6UiwpXdT/smW8DAiKk
         4AAVSTR1f6WX9V/TqF8k+/QUY1sE9Sw5Ac1ZSD/GBs39Ji2/qOYSk6AHDDoTlyyvHdvr
         Sn0Fv4pWFgXx1swFFfoNebTr7kPbQtNdApb9Un/2WGg/fornFzAn+a+GSP8SNI0mg1tA
         0y6PnLLdt2ql8hw2AnCjG4dYfhWoVtr6TB5K3Vsg9n7vQ7zlaG8coCKYpD3wufRma336
         Y7YvhiQLGK9Axtf75OY7FOaEPzoz+wQeB3Aftzgomxhi5SByJmYw+lsKLnvb1Sztup18
         LJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hlXz8qGn7DDeYGOBJD/EUi7jseV2fCX0AGBHp5YSWxg=;
        fh=pZ6/y56X5PXr+DERzwR3hdlUkOkgdGZ9BpgG1mltxqQ=;
        b=Glonb4pm6d6EejyjBLSHCLDZ9JD+7RJf3N3R3kHTjIkj76HDClF+yvanto0o9Wv5bX
         5VYRS5fe/RUwRh7gkDj3we5P3AHAxbfrGoGZIrcVCfMDmAME5fnhVspEovAziRXZkA/A
         Ic9aTXIiSmiCF9tego2+2LgKjBhCN/GTwRXmvL6wCQQ2Tis5YGDNIicdSb3MKCjbjtVI
         iSpmW31eCPQ9SwPHh9GhHZ2jOX7PAHW9eq6TCKFRLlkiezdWoOdqEPKsxb3D4Fb9XInM
         aU2l1Yd3Xy9iw7EzcQt8dvXpkYZAh2+cKkv+gKJUH0MfqdyteL5WoR39ITRzgeGiQRiG
         1x0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785195206; x=1785800006; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hlXz8qGn7DDeYGOBJD/EUi7jseV2fCX0AGBHp5YSWxg=;
        b=UveCd3MMyvLJI0wSV1Gelman4VyK5arwWrTokkIVkiAiLBiakeOzdQSl7h0wlKmBV6
         obxNiV32+fyUYCzw+TH4MMBe2PD8eLjXpu8SRuimB0bFNF13VQA+BPyGEDTdv0hpSgYn
         VldEBpNKQ312My62I+sDTfk7CwULrX7kNOFbfKY+FGTZiBze8p9FfxD0fRi2rdSKFtb+
         OkZXHku0O1trKOY+uorpNv8o/YxsiwUUbEaHcDjaK+CTOGTOsCtv1UON0xnPJE6NqXMI
         jyXSeSPxbMeW/BB2GhdYQoJCxjoZdKHQEScKfP1x5zx04i4mAQjki8p9xpes5OCLKJQV
         ER7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785195206; x=1785800006;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hlXz8qGn7DDeYGOBJD/EUi7jseV2fCX0AGBHp5YSWxg=;
        b=kn/WxUZetmAdttRag2OnSaIavgo+Uj9W5KB/fnE2yhRJYefLS4phDxaGKOd0L5mECw
         d91WlOqc7p9Qhj6FK6tgb1kzkWtuJRIoRP8Xajil2tf+35PzQbm6QwcEuJvsjXbrEjeL
         thrd0/g4sDbXVLnfgv5pe4s89WO1YhTQbnM5pZGYCy+oNLYagjABz+IfgVSSttiVTq4u
         88OyqyHLBnddUEoFGck8H0alQzE3qFox5VjYF0Mc4FF5PSVsXjrVobMnIRBHe2zovfo6
         BKXz8FooFFZlr+B+F84w73pOVf4FmjdqIGJS6SbmENTMti2UqfYjEviy3/I7Qx0g+b4m
         GNUw==
X-Gm-Message-State: AOJu0YxuatilFktwurWs2NYyNh5DCibv28NMiHNtdLEiDZ7uT77IOeJG
	Y7y+KZldjbD88FeqpJsjT1gu72I1LDSU3Jau97FLeNGir5tR9AYdVtKv3PgAdn2UpkRVZ87h1Tc
	bKaGKaYqCWjlr15nwcOB1OM7IRQwbfUzBLI5Ls4M=
X-Gm-Gg: AR+sD13BNQyFIQS5/nhdx6sy8sYfWSpTtYKMcgVmpheCAGKXJWeRHWDjBRtemV4AhB+
	3HdQwWqUOvt7BD1P5O7a0PV0LslngGtSjjWe9zwcnQ/vAWWTDP5z65d4sAjMM0rgiWmVvXCgW66
	DmWW7ILF226GFYIuRAzaMGFZxjzICM9B/ZZba+gRS9YyAJmLFmII8mSH37RtiU5ALTEmsBZPGPc
	TxJTw1/xTLn2uU7lb+m8DpcAtGBGo1rLRsWNCG/wY3W28vhOiHXmqDgxpUbATqBh2jhVa45ht9x
	IpErnrrkevwpx7S1U8tQnfitD+y85AyqUp5ZBa64BrgGSFpFuPbkP8glGZXy1KuG7lgUb6k7MYA
	PjEhsssArxAhNMZI=
X-Received: by 2002:a05:6000:2512:b0:47f:90a5:be77 with SMTP id
 ffacd0b85a97d-47f9fc8c6fdmr13879790f8f.6.1785195206437; Mon, 27 Jul 2026
 16:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 28 Jul 2026 00:33:15 +0100
X-Gm-Features: AUfX_mzhqkInGzup9I0sK_6AbVMVMGjOsjfJc0xqdBnFxQPlwbrvLyXoiS_OkhA
Message-ID: <CALTg27n5YkU34wgsOU8v1ReF5R+Oo+7TLqjg2k8foL0sXLewYg@mail.gmail.com>
Subject: Kernel 7.1-rc1 regression, i2c_hid_acpi i2c-WACF2200:00: device
 returned incorrect report (0 vs 11 expected)
To: linux-usb@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The HID merge for 7.1-rc1, d97e7d7c304f87419921f740743f7baa99f40539,
seems to have caused a regression for my laptop, where I get a new
warning nearly 100% of the time. I haven't seen the warning on
previous kernels or other hardware. Originally noticed when upgrading
from 7.0.10 to 7.1.3, then bisected to 7.1-rc1.

I'm using a Lenovo Yoga 7 Gen 7 AMD 14ARB7, but it also seems to
affect at least one other Lenovo laptop
(https://bbs.archlinux.org/viewtopic.php?id=314168).

It seems to be just a warning and everything works, but I don't know
the hardware well enough to be sure, since I rarely use my touchscreen
/ digitiser.

The warning message:
```
[    1.472817] i2c_hid_acpi i2c-WACF2200:00: device returned incorrect
report (0 vs 11 expected)
[    1.473326] i2c_hid_acpi i2c-WACF2200:00: device returned incorrect
report (0 vs 11 expected)
[    1.473769] i2c_hid_acpi i2c-WACF2200:00: device returned incorrect
report (0 vs 11 expected)
[    1.474639] i2c_hid_acpi i2c-WACF2200:00: device returned incorrect
report (0 vs 11 expected)
[    1.475089] i2c_hid_acpi i2c-WACF2200:00: device returned incorrect
report (0 vs 11 expected)
```

Originally reported at https://bugzilla.kernel.org/show_bug.cgi?id=221766

Thanks,
Stuart
