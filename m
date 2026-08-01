Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618F261388
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587401; cv=none; b=lxkDreCnEALEgalAEsDyjmVE6tm8TON+ooyK6CbUlpX8PcaCoaQ1pE1RuxvsrIAMRTEbS3tWR9qrSk036nmcwTLNCMrHCofTfQ8wGOGGubf671j+s7wk4Al1EpV7q6GDl7/CqUV8h5DN0I4KcVEAMuNL3aW9w9bKC+1fv1c4fTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587401; c=relaxed/simple;
	bh=XWT+evDyeLy1CvG7qT+s2Eh+cCd6BaPGI+i6dJwrKE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZaA0EhQNiGXyr4hlZKndkHDmhDavXHMKcJ0HnRPwsyrH8qPN9IyZaev/Q6s0D5AYBrJ+guFnFaJr+p/w0lNSBAhT/1+siQBQqCNB4Ek34b/H44o3L3ud2gxXo0nzUI7FEocKU+mOkLkLoy4UWwBlv9aMnOXB+um8rSWwkhEGnrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNnWIWaI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNnWIWaI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ce98cb8165so19952935ad.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 05:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587399; x=1786192199; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=;
        b=JNnWIWaIxMxBg5gA9oK3Ax0k04F7KBXHc9ac5ht8liBL2QVbL7CkcgXZsz0pA4rXCY
         esFpxqkxTFXmoQ30ZpCC3bCnfHbp4WCjqZ5FVj7rr/pB89OgiRy4MiPZzwhs47s7BJZ/
         TZv2jCj6N/WXaDhKvx+9TAxBWDgy+qMlB4G8MJ6veWsrULZeNn1tbeD9JjJQA3cK3gm6
         IP1w0hosslkbbYafiwDsypzGN0YcehMAyQ7GHuojzLu15Z6f2Mx/HbQkVtxxMtzbvmIq
         9gF1MlFLL0ckNICHZoNAdeKhA38YXJ0Tzv3mjPtZJ7tgaNf8txORwghFIFU89+KdZ1wI
         5rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587399; x=1786192199;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=;
        b=R2skRZaAHy60TdInPU354EtswVF5fq+3EzQJg+MuZenlOn+FuyP32TZFMg23KuPiT8
         k8kn90tam1MB9uQKF/xQDUyroCfrSgoYmY4hj1p+9VGh16gtVlwEpAFxouullJw8VjLy
         JrPyrBJYu0J5n+k037UYJmYzYkUU35RP55mOu5HUZqWRvsE0J+FUnI2WuRROcM65b3G+
         PqeTJRQou+SU27iCdRHX3bRJwZ4g08e3hVi0E2uuvKJ2C2BcIOJu8AjkfSEfXWO7ohGN
         npRPgWvGFHmZm4n1luwQG9Eq86jNfT7qMvCP2nQdfqdZCDOGgQ0fY7htHNKSgh39nwG0
         rqIw==
X-Gm-Message-State: AOJu0YwRZbcvD6KWPR5ZN/osU6x/mnar650teMBbcGzA2Jc8AQRIgDQI
	cPpNHgNcyYgWJtad3JvqMyRp2M8bgq3hMGquc1eDHlbT96P8R5nHzmeS
X-Gm-Gg: AR+sD12ic71IlO8Ld6NGfjvGKle9MITZgkUpl5yd6aK0uTSQsiq4P2XC07G1FHHGalS
	gDiFUcolRj15yA6vr4b8GtGB27mBSm9j1UeVmnZyuOyBe+PaQUAKCuHknnggzr5hmHkeOuNf0S+
	pmkEfNXwLX5d2+2YUHQGI6plGm/lo10E2MSustu+YobfAQMcit7xMLPFZON/NH0YupuC0+1KHkU
	mMElBKx/MmpAdD6RD1aMlPlaC4uVhI1gXYS2DzIiRaLLKSM6k/qQ6QELpUVYq4UZscEp7NjsGw0
	4Gv8AYZuNqgXQfUsxsGc8eQCCQmbY/Hxzu/iIWcSEri4R78TX68gucoVZ+ZMaKdxuNQSKq4sFZK
	qU/EZQCT9kJt6hO6fyS+hFmyxYjUAInCKRyNUqg+I/SBL6Zt0mQO0m2o7Nukk1w1D+Lqsg6vV5s
	Yvyma0y9eNFrOkEHfaogsBaTOiYugh5hUvZzzyTUJArWA9z78QvQmSUvXo2EDN2Y0=
X-Received: by 2002:a17:902:d58b:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d047e39483mr47362455ad.14.1785587399079;
        Sat, 01 Aug 2026 05:29:59 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:29:58 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Subject: [PATCH v2 0/3] usb: Use %pe to print error pointers
Date: Sat, 01 Aug 2026 17:59:49 +0530
Message-Id: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3mbWoC/22NywqDMBBFf0Vm3ZQkaGO78j+KiMaJDtQHkzS0i
 P/eVOiuy3PgnruBRyb0cMs2YIzkaZkT6FMGdmznAQX1iUFLfZFGleLpO7EGbpC5WdtgR49BGFv
 0qshNh2ggTVdGR68je68Tj+TDwu/jJaqv/QWv/4NRCSnKwhmnMXfoumqYWnqc7TJBve/7BwBM2
 Hu4AAAA
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=1843;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=XWT+evDyeLy1CvG7qT+s2Eh+cCd6BaPGI+i6dJwrKE0=;
 b=0f+dwnGYHa4UQ8hP1TjasctdxpWvaBpodGko+alNSS3r7FTk7fgSHNv+UkNuF44cit/1Qe5z1
 lfa5cZCNpZJAUDQW94/1Qjnuq2g/IKzzTddsR2NQSADKcvo6jGCchay
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Replace PTR_ERR() in format strings with 
%pe format specifier across the USB subsystem. %pe prints 
symbolic error names (e.g., -ENOMEM) instead of 
raw numbers (e.g., -12), making error logs more readable. 
These patches fix coccinelle reported warning: "Consider 
using %pe to print PTR_ERR()" in usb subsystem.

The patches are grouped by subsystem:
  1/3 - chipidea
  2/3 - miscellaneous USB drivers
  3/3 - typec

All patches are compile-tested on x86_64. Please let me know if 
any more testing is needed for any patch. 

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
Changes in v2:
- Remove "This patch" phrasing from the commit message body.
- Trim redundant Coccinelle warning outputs in the commit log to keep only one.
- Clean up multi-line dev_err() statements into single lines.
- Link to v1: https://lore.kernel.org/r/20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com

---
Subasri S (3):
      usb: chipidea: Use %pe to print error pointers
      usb: misc: Use %pe to print error pointers
      usb: typec: Use %pe to print error pointers

 drivers/usb/atm/usbatm.c               |  4 ++--
 drivers/usb/chipidea/ci_hdrc_imx.c     | 12 ++++++------
 drivers/usb/chipidea/core.c            |  4 ++--
 drivers/usb/core/hub.c                 |  3 +--
 drivers/usb/dwc2/pci.c                 |  3 +--
 drivers/usb/gadget/function/u_serial.c |  4 ++--
 drivers/usb/misc/usb3503.c             |  3 +--
 drivers/usb/typec/mux/pi3usb30532.c    |  6 ++----
 drivers/usb/typec/tcpm/tcpm.c          |  2 +-
 drivers/usb/typec/wusb3801.c           |  4 ++--
 10 files changed, 20 insertions(+), 25 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260718-usb-ptr_err_patchset-7c5d1547bee7

Best regards,
-- 
Subasri S <subasris1210@gmail.com>

